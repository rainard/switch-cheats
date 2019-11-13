------------------------------------设置表------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MyLeaderSetting					('Name' TEXT,'Retain' TEXT,'LeaderType' TEXT);
CREATE TABLE IF NOT EXISTS MySpecialSetting					('Name' TEXT,'Retain' TEXT,'parameter1' TEXT,'parameter2' TEXT,'parameter3' TEXT,'parameter4' TEXT, PRIMARY KEY('Name'));
CREATE TABLE IF NOT EXISTS AAMyTraitSetting					('Name' TEXT,'Retain' TEXT,'TraitType' TEXT);	
CREATE TABLE IF NOT EXISTS AAMyTraitElementSetting			('Name' TEXT,'Retain' TEXT,'ReplacesName' TEXT,'TraitType' TEXT,'Type' TEXT,'TypeType' TEXT,'ReplacesTypeType' TEXT);
CREATE TABLE IF NOT EXISTS MyCommemorationSetting		 	('Name' TEXT,'Retain' TEXT,'CommemorationType' TEXT);
CREATE TABLE IF NOT EXISTS MyGovernorPromotionSetting		('Name' TEXT,'Retain' TEXT,'GovernorPromotionType' TEXT);
CREATE TABLE IF NOT EXISTS AAMyPromotionSetting				('Name' TEXT,'Retain' TEXT,'Description' TEXT,'UnitPromotionType' TEXT);
CREATE TABLE IF NOT EXISTS AAMyAbilitiesSetting				('Name' TEXT,'Retain' TEXT,'Description' TEXT,'UnitAbilityType' TEXT);
CREATE TABLE IF NOT EXISTS AAMyInitialActivationCivicsTech	('Name' TEXT,'Retain' TEXT,'TypeType' TEXT,'Type' TEXT);
CREATE TABLE IF NOT EXISTS AAMyInitialActivationUnits		('Name' TEXT,'Retain' TEXT,'TypeType' TEXT,'Num' TEXT);
CREATE TABLE IF NOT EXISTS AAMyInitialActivationGreatPerson	('Name' TEXT,'Retain' TEXT,'TypeType' TEXT);
CREATE TABLE IF NOT EXISTS MyShieldedInformation			('Name' TEXT,'Retain' TEXT,'GossipType' TEXT);
CREATE TABLE IF NOT EXISTS AAMyErrSet						('Name' TEXT,'Retain' TEXT,'CheckExistence' TEXT,'Type' TEXT);


------------------------------------特性临时表--------------------------------------------------------
CREATE TABLE IF NOT EXISTS AAMyModifiersTemp				('OutPutType' TEXT,'Text' TEXT,'CheckExistence' TEXT,'ModifierId' TEXT,'ModifierType' TEXT,'RunOnce' BOOLEAN NOT NULL CHECK (RunOnce IN (0,1)) DEFAULT 0,'NewOnly' BOOLEAN NOT NULL CHECK (NewOnly IN (0,1)) DEFAULT 0,'Permanent' BOOLEAN NOT NULL CHECK (Permanent IN (0,1)) DEFAULT 0,'OwnerRequirementSetId' TEXT,'SubjectRequirementSetId' TEXT,'OwnerStackLimit' INTEGER,'SubjectStackLimit' INTEGER,'Name1' TEXT,'Type1' TEXT,'Value1' TEXT,'Extra1' TEXT,'SecondExtra1' TEXT,'Name2' TEXT,'Type2' TEXT,'Value2' TEXT,'Extra2' TEXT,'SecondExtra2' TEXT,'Name3' TEXT,'Type3' TEXT,'Value3' TEXT,'Extra3' TEXT,'SecondExtra3' TEXT,'Name4' TEXT,'Type4' TEXT,'Value4' TEXT,'Extra4' TEXT,'SecondExtra4' TEXT);
CREATE TABLE IF NOT EXISTS MyTraits							('TypeType' TEXT,'TraitType' TEXT);
CREATE TABLE IF NOT EXISTS MyTraitModifiers					('TraitType' TEXT,'ModifierId' TEXT);	

--为了解决资料片结构不存在的创建
CREATE TABLE IF NOT EXISTS GovernorPromotionModifiers	('GovernorPromotionType' TEXT,'ModifierId' TEXT);
CREATE TABLE IF NOT EXISTS CommemorationModifiers		('CommemorationType' TEXT,	  'ModifierId' TEXT);

------------------------------------地形表------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MyTerrainsTemp				 ('TerrainType' TEXT NOT NULL,'Name' TEXT NOT NULL);
INSERT INTO MyTerrainsTemp (TerrainType, Name) SELECT TerrainType, Name FROM Terrains WHERE TerrainType <> 'TERRAIN_COAST' AND TerrainType <> 'TERRAIN_OCEAN' AND TerrainType NOT LIKE '%MOUNTAIN%';

------------------------------------过滤表------------------------------------------------------------
CREATE TABLE IF NOT EXISTS MyExcluded ('LeaderType' TEXT,'CivilizationType' TEXT,'TraitType' TEXT,'ModifierId' TEXT);	
INSERT INTO  MyExcluded
		(TraitType,				  	ModifierId							)
VALUES	('TRAIT_LEADER_MAJOR_CIV',	'MINOR_CIV_PRODUCTION_PENALTY'		),
		('MINOR_CIV_DEFAULT_TRAIT',	'MINOR_CIV_PRODUCTION_PENALTY'		);

------------------------------------特性创建----------------------------------------------------------
INSERT INTO	 Types
		(Type,											Kind			)
VALUES	('MY_TRAIT_CIVILIZATION',						'KIND_TRAIT'	),
		('MY_TRAIT_CIVILIZATION_FEATURES',				'KIND_TRAIT'	),
		('CLASS_ALLCHEAT_UNITYS',						'KIND_ABILITY'	),
		('MODIFIER_MY_UNITS_ADJUST_SPY_ESTABLISH_TIME',	'KIND_MODIFIER'	),
		('CLASS_ALLCHEAT_TRADER',						'KIND_ABILITY'	);

INSERT INTO Traits
		(TraitType, 						Name,		Description,																												InternalOnly)
VALUES	('MY_TRAIT_CIVILIZATION',			'至尊王朝',	'全文明特性，全领袖特性，全宗主国特性。[NEWLINE]提供全部特性兵种、区域、改良建筑。[NEWLINE]提供全部总督、时代特性。[NEWLINE]提供全部兵种特性。',		0	),
		('MY_TRAIT_CIVILIZATION_FEATURES',	'至尊王朝',	'全文明特性，全领袖特性，全宗主国特性。[NEWLINE]提供全部特性兵种、区域、改良建筑。[NEWLINE]提供全部总督、时代特性。[NEWLINE]提供全部兵种特性。',		1	);

INSERT INTO	 Tags
		(Tag,						Vocabulary)
VALUES	('CLASS_ALLCHEAT_UNITYS',	'ABILITY_CLASS'),
		('CLASS_MELEE_UNITYS',		'ABILITY_CLASS'),
		('CLASS_RANGE_UNITYS',		'ABILITY_CLASS');

--添加自定义ModifierType
INSERT INTO	 DynamicModifiers
	  (ModifierType,									CollectionType,				EffectType)
SELECT 'MODIFIER_MY_UNITS_ADJUST_SPY_ESTABLISH_TIME', 	'COLLECTION_PLAYER_UNITS',	'EFFECT_ADJUST_UNIT_SPY_ESTABLISH_TIME';

--添加自定义UnitAbilityType
INSERT INTO	 UnitAbilities
		(UnitAbilityType,			Name,		Description,						Inactive)
VALUES	('CLASS_ALLCHEAT_UNITYS',	'兵种增强', '极大地增强所有兵种的属性以及能力',		1	),
		('CLASS_ALLCHEAT_TRADER',	'商队增强', '免疫掠夺',								1	);
--单位挂载Tag
INSERT INTO TypeTags (Type, Tag) SELECT DISTINCT UnitType, 'CLASS_ALLCHEAT_UNITYS' FROM Units;
INSERT INTO TypeTags (Type, Tag) SELECT DISTINCT 'CLASS_ALLCHEAT_UNITYS', 'CLASS_ALLCHEAT_UNITYS';
INSERT INTO TypeTags (Type, Tag) SELECT DISTINCT UnitType, 'CLASS_RANGE_UNITYS' FROM Units WHERE Range > 0;
INSERT INTO TypeTags (Type, Tag) SELECT DISTINCT 'CLASS_ALLCHEAT_TRADER', 'CLASS_TRADER';

--添加属性生效条件
INSERT INTO	 Requirements
	  (RequirementId,								RequirementType,						Inverse,Triggered)
SELECT 'REQUIREMENT_UNIT_IS_' || UnitType, 			'REQUIREMENT_UNIT_TYPE_MATCHES',		0,		0 FROM Units Union
SELECT 'REQUIREMENT_UNIT_IS_CLASS_RANGE_UNITYS', 	'REQUIREMENT_UNIT_TAG_MATCHES',			0, 		0 Union
SELECT 'REQUIREMENT_BEFORE_X_TURNS', 				'REQUIREMENT_GAME_TURN_ATLEAST',		1,		0 Union
SELECT 'REQUIREMENT_AFTER_X_TURNS', 				'REQUIREMENT_GAME_TURN_ATLEAST',		0,		0;
INSERT INTO	 RequirementArguments
	  (RequirementId,								Name,			Value)
SELECT 'REQUIREMENT_UNIT_IS_' || UnitType, 			'UnitType',		UnitType FROM Units Union
SELECT 'REQUIREMENT_UNIT_IS_CLASS_RANGE_UNITYS', 	'Tag',			'CLASS_RANGE_UNITYS' Union
SELECT 'REQUIREMENT_BEFORE_X_TURNS', 				'MinGameTurn',	5 Union
SELECT 'REQUIREMENT_AFTER_X_TURNS', 				'MinGameTurn',	1;
INSERT INTO	 RequirementSets
	  (RequirementSetId,		RequirementSetType)
SELECT 'ACT_ON_' || UnitType, 	'REQUIREMENTSET_TEST_ALL' FROM Units Union
SELECT 'ACT_ON_RANGE_UNITYS', 	'REQUIREMENTSET_TEST_ALL' Union
SELECT 'ACT_ON_HAS_CAPITAL', 	'REQUIREMENTSET_TEST_ALL' Union
SELECT 'ACT_ON_IS_RELIGIOUS', 	'REQUIREMENTSET_TEST_ALL' Union
SELECT 'ACT_ON_X_TURNS', 		'REQUIREMENTSET_TEST_ALL' Union
SELECT 'ACT_NO_X_TURNS', 		'REQUIREMENTSET_TEST_ALL';
INSERT INTO	 RequirementSetRequirements
	  (RequirementSetId,	  RequirementId)
SELECT 'ACT_ON_' || UnitType, 'REQUIREMENT_UNIT_IS_' || UnitType FROM Units Union
SELECT 'ACT_ON_RANGE_UNITYS', 'REQUIREMENT_UNIT_IS_CLASS_RANGE_UNITYS' Union
SELECT 'ACT_ON_HAS_CAPITAL',  'REQUIRES_CAPITAL_CITY' Union
SELECT 'ACT_ON_IS_RELIGIOUS', 'REQUIRES_UNIT_IS_RELIGIOUS_ALL' Union
SELECT 'ACT_ON_X_TURNS',      'REQUIREMENT_BEFORE_X_TURNS' Union
SELECT 'ACT_NO_X_TURNS',      'REQUIREMENT_AFTER_X_TURNS';

--修正官方错误
UPDATE ModifierStrings SET Text='LOC_ABILITY_RELIGIOUS_ENTER_FOREIGN_LANDS_DESCRIPTION' WHERE ModifierId='MOD_ENTER_FOREIGN_LANDS';

