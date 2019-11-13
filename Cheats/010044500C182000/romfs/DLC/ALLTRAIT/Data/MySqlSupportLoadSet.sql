--排除设置表中不要的部分
INSERT INTO	 AAMyErrSet
	  (Name, Retain, CheckExistence,Type)
SELECT Name, Retain, '错误',		'MyLeaderSetting'					FROM MyLeaderSetting					WHERE LeaderType NOT IN (SELECT LeaderType FROM Leaders)Union
SELECT Name, Retain, '错误',		'AAMyTraitSetting'					FROM AAMyTraitSetting					WHERE TraitType NOT IN (SELECT TraitType FROM Traits) Union
SELECT Name, Retain, '错误',		'AAMyTraitElementSetting'			FROM AAMyTraitElementSetting			WHERE TraitType NOT IN (SELECT TraitType FROM Traits) Union
SELECT Name, Retain, '错误',		'MyCommemorationSetting'			FROM MyCommemorationSetting				WHERE CommemorationType NOT IN (SELECT CommemorationType FROM CommemorationModifiers) Union
SELECT Name, Retain, '错误',		'MyGovernorPromotionSetting'		FROM MyGovernorPromotionSetting			WHERE GovernorPromotionType NOT IN (SELECT GovernorPromotionType FROM GovernorPromotionModifiers) Union
SELECT Name, Retain, '错误',		'AAMyInitialActivationCivicsTech'	FROM AAMyInitialActivationCivicsTech	WHERE TypeType NOT IN (SELECT TechnologyType FROM Technologies) AND TypeType NOT IN (SELECT CivicType FROM Civics) Union
SELECT Name, Retain, '错误',		'AAMyInitialActivationUnits'		FROM AAMyInitialActivationUnits			WHERE TypeType NOT IN (SELECT UnitType FROM Units) Union
SELECT Name, Retain, '错误',		'AAMyInitialActivationGreatPerson'	FROM AAMyInitialActivationGreatPerson	WHERE TypeType NOT IN (SELECT GreatPersonIndividualType FROM GreatPersonIndividuals) Union
SELECT Name, Retain, '错误',		'AAMyPromotionSetting'				FROM AAMyPromotionSetting				WHERE UnitPromotionType NOT IN (SELECT UnitPromotionType FROM UnitPromotionModifiers) Union
SELECT Name, Retain, '错误',		'AAMyAbilitiesSetting'				FROM AAMyAbilitiesSetting				WHERE UnitAbilityType NOT IN (SELECT UnitAbilityType FROM UnitAbilityModifiers);

DELETE FROM MyLeaderSetting 					WHERE Retain <> '要'	OR LeaderType NOT IN (SELECT LeaderType FROM Leaders);
DELETE FROM AAMyTraitSetting 					WHERE 					   TraitType NOT IN (SELECT TraitType FROM Traits);
DELETE FROM AAMyTraitElementSetting 			WHERE Retain <> '要'	OR TraitType NOT IN (SELECT TraitType FROM Traits);
DELETE FROM MyCommemorationSetting 				WHERE Retain <> '要'	OR CommemorationType NOT IN (SELECT CommemorationType FROM CommemorationModifiers);
DELETE FROM MyGovernorPromotionSetting 			WHERE Retain <> '要'	OR GovernorPromotionType NOT IN (SELECT GovernorPromotionType FROM GovernorPromotionModifiers);
DELETE FROM AAMyInitialActivationCivicsTech 	WHERE Retain <> '要'	OR (TypeType NOT IN (SELECT TechnologyType FROM Technologies) AND TypeType NOT IN (SELECT CivicType FROM Civics));
DELETE FROM AAMyInitialActivationUnits 			WHERE Retain <> '要' 	OR TypeType NOT IN (SELECT UnitType FROM Units);
DELETE FROM AAMyInitialActivationGreatPerson 	WHERE Retain <> '要'	OR TypeType NOT IN (SELECT GreatPersonIndividualType FROM GreatPersonIndividuals);
DELETE FROM AAMyPromotionSetting 				WHERE Retain <> '要'	OR UnitPromotionType NOT IN (SELECT UnitPromotionType FROM UnitPromotionModifiers);
DELETE FROM AAMyAbilitiesSetting 				WHERE Retain <> '要'	OR UnitAbilityType NOT IN (SELECT UnitAbilityType FROM UnitAbilityModifiers);