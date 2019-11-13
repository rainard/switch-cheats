---------------------------------------文明领袖特性--------------------------------------------------------------------------------------
INSERT INTO MyTraits(TypeType, TraitType) SELECT LeaderType, TraitType FROM LeaderTraits
WHERE LeaderType IN (SELECT LeaderType FROM Leaders WHERE SceneLayers =4)
OR LeaderType IN (SELECT LeaderType FROM Leaders WHERE InheritFrom ='LEADER_MINOR_CIV_DEFAULT')
OR LeaderType IN (SELECT LeaderType FROM Leaders WHERE InheritFrom IN (SELECT LeaderType FROM Leaders WHERE InheritFrom ='LEADER_MINOR_CIV_DEFAULT'));

INSERT INTO MyTraits(TypeType, TraitType) SELECT CivilizationType, TraitType FROM CivilizationTraits
WHERE CivilizationType IN (SELECT CivilizationType FROM Civilizations WHERE RandomCityNameDepth > 1);

--去除特性建筑、改良、兵种
DELETE FROM MyTraits WHERE TraitType LIKE '%UNIT%' OR TraitType LIKE '%BUILDING%' OR TraitType LIKE '%IMPROVEMENT%' OR TraitType IN (SELECT TraitType FROM AAMyTraitSetting WHERE Retain = '不要');

--领袖、文明属性化
INSERT INTO MyTraitModifiers(TraitType,ModifierId) SELECT TraitType,ModifierId FROM TraitModifiers
WHERE TraitType IN (SELECT TraitType FROM MyTraits) AND TraitType NOT IN (SELECT TraitType FROM MyExcluded) AND ModifierId NOT IN (SELECT ModifierId FROM MyExcluded);

--将城邦属性的壳去掉
UPDATE MyTraitModifiers SET ModifierId = (SELECT Value FROM ModifierArguments WHERE ModifierId = MyTraitModifiers.ModifierId) 
WHERE ModifierId IN (SELECT ModifierId FROM Modifiers WHERE ModifierType = 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER');

---------------------------------------总督特性区域--------------------------------------------------------------------------------------
INSERT INTO AAMyModifiersTemp(OutPutType,ModifierId,ModifierType,Name1,Value1) 
SELECT '是Governor','MY_XP1_' || ModifierId, 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER','ModifierId',ModifierId FROM GovernorPromotionModifiers 
WHERE GovernorPromotionType IN (SELECT GovernorPromotionType FROM MyGovernorPromotionSetting);

---------------------------------------时代特性区域--------------------------------------------------------------------------------------
INSERT INTO AAMyModifiersTemp(OutPutType,ModifierId,Name1,Type1,Value1,ModifierType) 
SELECT '是Commemoration','MY_XP1_' || Modifiers.ModifierId,Name,Type,Value,ModifierType FROM Modifiers INNER JOIN ModifierArguments ON Modifiers.ModifierId = ModifierArguments.ModifierId
WHERE Modifiers.ModifierId IN (SELECT ModifierId FROM CommemorationModifiers WHERE CommemorationType IN (SELECT CommemorationType FROM MyCommemorationSetting));

---------------------------------------提交自定属性--------------------------------------------------------------------------------------
UPDATE AAMyModifiersTemp SET OwnerRequirementSetId = 'PLAYER_IS_HUMAN' WHERE(SELECT Retain FROM MySpecialSetting WHERE Name = '属性对敌人生效') <> '要';
INSERT INTO Modifiers 
			   (ModifierId, ModifierType,OwnerRequirementSetId,RunOnce,Permanent,SubjectRequirementSetId)
SELECT DISTINCT ModifierId, ModifierType,OwnerRequirementSetId,RunOnce,Permanent,SubjectRequirementSetId FROM AAMyModifiersTemp
WHERE ModifierType IN(SELECT ModifierType FROM DynamicModifiers) AND ModifierType NOT NULL AND OutPutType <> '否';

INSERT INTO ModifierArguments
	  (ModifierId, Name, Value, Extra, Type) 
SELECT ModifierId, Name1,Value1,Extra1,'ARGTYPE_IDENTITY' FROM AAMyModifiersTemp WHERE ModifierId IN (SELECT ModifierId FROM Modifiers) AND Name1 NOT NULL Union
SELECT ModifierId, Name2,Value2,Extra2,'ARGTYPE_IDENTITY' FROM AAMyModifiersTemp WHERE ModifierId IN (SELECT ModifierId FROM Modifiers) AND Name2 NOT NULL Union
SELECT ModifierId, Name3,Value3,Extra3,'ARGTYPE_IDENTITY' FROM AAMyModifiersTemp WHERE ModifierId IN (SELECT ModifierId FROM Modifiers) AND Name3 NOT NULL Union
SELECT ModifierId, Name4,Value4,Extra4,'ARGTYPE_IDENTITY' FROM AAMyModifiersTemp WHERE ModifierId IN (SELECT ModifierId FROM Modifiers) AND Name4 NOT NULL;

INSERT INTO UnitAbilityModifiers 
		(UnitAbilityType,		ModifierId) 
SELECT 'CLASS_ALLCHEAT_UNITYS',	ModifierId FROM UnitPromotionModifiers	WHERE UnitPromotionType IN (SELECT UnitPromotionType FROM AAMyPromotionSetting) Union
SELECT 'CLASS_ALLCHEAT_UNITYS',	ModifierId FROM UnitAbilityModifiers 	WHERE UnitAbilityType 	IN (SELECT UnitAbilityType	 FROM AAMyAbilitiesSetting) Union
SELECT 'CLASS_ALLCHEAT_UNITYS',	ModifierId FROM AAMyModifiersTemp		WHERE OutPutType = '能力' AND ModifierId IN (SELECT ModifierId FROM Modifiers) Union
SELECT 'CLASS_ALLCHEAT_TRADER',	ModifierId FROM AAMyModifiersTemp		WHERE OutPutType = '商人' AND ModifierId IN (SELECT ModifierId FROM Modifiers);

INSERT OR IGNORE INTO	ModifierStrings
		(Context,  ModifierId, Text)
SELECT	'Summary', ModifierId, Text FROM AAMyModifiersTemp WHERE Text NOT NULL AND ModifierId IN (SELECT ModifierId FROM Modifiers);

---------------------------------------打包特性输出--------------------------------------------------------------------------------------
INSERT INTO MyTraitModifiers (TraitType,ModifierId) SELECT DISTINCT 'MY_TRAIT_CIVILIZATION',ModifierId FROM AAMyModifiersTemp 
WHERE ModifierId IN (SELECT ModifierId FROM Modifiers) AND OutPutType LIKE '%是%';
INSERT INTO TraitModifiers(TraitType, ModifierId) SELECT DISTINCT 'MY_TRAIT_CIVILIZATION', ModifierId FROM MyTraitModifiers ;
INSERT INTO LeaderTraits(LeaderType, TraitType) SELECT DISTINCT LeaderType, 'MY_TRAIT_CIVILIZATION' FROM CivilizationLeaders 
WHERE LeaderType IN (SELECT LeaderType FROM MyLeaderSetting);
INSERT INTO CivilizationTraits(CivilizationType, TraitType) SELECT DISTINCT CivilizationType, 'MY_TRAIT_CIVILIZATION_FEATURES' FROM CivilizationLeaders 
WHERE LeaderType IN (SELECT LeaderType FROM MyLeaderSetting);
DELETE FROM CivilizationTraits WHERE TraitType = 'MY_TRAIT_CIVILIZATION_FEATURES';
---------------------------------------特性单位区域---------------------------------------------------------------------------------------
--删除不该存在的单位
DELETE FROM AAMyTraitElementSetting WHERE (Type = '建筑' AND ROWID NOT IN (SELECT MAX(ROWID) FROM AAMyTraitElementSetting GROUP BY ReplacesTypeType)) OR TraitType NOT IN (SELECT TraitType FROM Traits);

--删除特性兵种与常规兵种的互斥
DELETE FROM UnitReplaces WHERE CivUniqueUnitType IN (SELECT TypeType FROM AAMyTraitElementSetting);

--将配置好的单位特性提交
INSERT OR IGNORE INTO CivilizationTraits
	  (CivilizationType, TraitType)
SELECT CivilizationType, TraitType FROM CivilizationLeaders CROSS JOIN AAMyTraitElementSetting WHERE LeaderType IN (SELECT LeaderType FROM MyLeaderSetting);


--检查情况
UPDATE	AAMyModifiersTemp SET CheckExistence='错误' WHERE ModifierId NOT IN (SELECT ModifierId FROM Modifiers) AND OutPutType	NOT LIKE '%否%';

--清除临时表
--Drop table 'MyTraits';
--Drop table 'MyTraitModifiers';
--Drop table 'MyExcluded';

--为验证不同的设置是否正常启用，暂时不清除设置表
/* --清除设置表
Drop table 'MyLeaderSetting';
Drop table 'AAMyTraitSetting';
Drop table 'AAMyTraitElementSetting'; */