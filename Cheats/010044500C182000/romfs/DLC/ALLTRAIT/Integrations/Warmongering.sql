UPDATE Eras SET WarmongerPoints = (SELECT parameter1 FROM MySpecialSetting WHERE parameter3 = EraType)
WHERE EraType IN (SELECT parameter3 FROM MySpecialSetting WHERE parameter2 = '时代战狂' AND Retain = '要');

UPDATE DiplomaticActions SET WarmongerPercent = (SELECT parameter1 FROM MySpecialSetting WHERE parameter3 = DiplomaticActionType)
WHERE DiplomaticActionType IN (SELECT parameter3 FROM MySpecialSetting WHERE parameter2 = '战狂修正' AND Retain = '要');

UPDATE GlobalParameters SET Value = (SELECT parameter1 FROM MySpecialSetting WHERE parameter3 = GlobalParameters.Name)
WHERE Name IN (SELECT parameter3 FROM MySpecialSetting WHERE parameter2 = '战狂全局' AND Retain = '要');
