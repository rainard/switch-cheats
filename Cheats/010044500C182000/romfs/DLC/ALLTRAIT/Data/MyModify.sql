---------------------------------------杂项修改--------------------------------------------------------------------------------------------
--加速奇观能力可用时代
UPDATE UnitCommands SET MaxEra = 10 WHERE CommandType = 'UNITCOMMAND_WONDER_PRODUCTION'
AND (SELECT Retain FROM MySpecialSetting WHERE Name = '工人可加速奇迹') = '要';
--屏蔽小道消息
UPDATE DiplomaticVisibilitySources SET GossipString = ""
WHERE (SELECT Retain FROM MySpecialSetting WHERE Name = '取消小道消息前缀') = '要';
--UPDATE Gossips SET Message ="" WHERE GossipType IN (SELECT GossipType FROM MyShieldedInformation WHERE Retain = "不要");
--AI开拓者取消
DELETE FROM MajorStartingUnits WHERE Unit='UNIT_SETTLER'  AND AiOnly = 1
AND (SELECT Retain FROM MySpecialSetting WHERE Name = '取消高难度AI额外开拓者') = '要';

---------------------------------------修改各种设置--------------------------------------------------------------------------------------
UPDATE GlobalParameters SET Value = (SELECT parameter1 FROM MySpecialSetting WHERE parameter3 = GlobalParameters.Name)
WHERE Name IN (SELECT parameter3 FROM MySpecialSetting WHERE parameter2 = '设置选项' AND Retain = '要');

---------------------------------------伟人隐退次数修改--------------------------------------------------------------------------------------
UPDATE GreatPersonIndividuals SET ActionCharges = (SELECT parameter1 FROM MySpecialSetting WHERE parameter3 = GreatPersonIndividualType)
WHERE GreatPersonIndividualType IN (SELECT parameter3 FROM MySpecialSetting WHERE parameter2 = '伟人隐退' AND Retain = '要');

---------------------------------------个人需要调整槽位--------------------------------------------------------------------------------------
INSERT INTO Building_GreatWorks
		(BuildingType, GreatWorkSlotType, NumSlots)
SELECT	'BUILDING_FORBIDDEN_CITY', 'GREATWORKSLOT_PALACE', (SELECT parameter1 FROM MySpecialSetting WHERE Name = '紫禁城增加槽位') 
WHERE 'BUILDING_FORBIDDEN_CITY' IN (SELECT BuildingType FROM Buildings) AND (SELECT Retain FROM MySpecialSetting WHERE Name = '紫禁城增加槽位') = '要';

UPDATE Building_GreatWorks SET NumSlots = NumSlots + (SELECT parameter1 FROM MySpecialSetting WHERE Name = "通用调整槽位")
WHERE (SELECT Retain FROM MySpecialSetting WHERE Name = '通用调整槽位') = '要';

UPDATE Building_GreatWorks SET NumSlots = (SELECT parameter1 FROM MySpecialSetting WHERE parameter3 = BuildingType AND parameter4 = GreatWorkSlotType)
WHERE (SELECT parameter1 FROM MySpecialSetting WHERE parameter3 = BuildingType AND parameter4 = GreatWorkSlotType AND Retain = '要') NOT NULL;