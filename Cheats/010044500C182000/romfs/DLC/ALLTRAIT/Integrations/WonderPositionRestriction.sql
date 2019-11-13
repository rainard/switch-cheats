---------------------------------------去除奇迹位置限制----------------------------------------------------------------------------------------
UPDATE Buildings SET AdjacentDistrict = null, MustBeAdjacentLand = 0, AdjacentToMountain = 0, AdjacentCapital = 0, AdjacentResource = null, AdjacentImprovement = null, RequiresRiver = 0,Coast = null  WHERE IsWonder = 1 AND (SELECT Retain FROM MySpecialSetting WHERE Name = '去除奇迹位置限制') = "要";
INSERT OR IGNORE INTO Building_ValidTerrains
		(BuildingType,								TerrainType)
SELECT	"BUILDING_MONT_ST_MICHEL", 					TerrainType FROM MyTerrainsTemp WHERE EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType = "BUILDING_MONT_ST_MICHEL")				  AND (SELECT Retain FROM MySpecialSetting WHERE Name = '去除奇迹位置限制') = "要" Union
SELECT	'BUILDING_MAHABODHI_TEMPLE', 				TerrainType FROM MyTerrainsTemp WHERE EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType = 'BUILDING_MAHABODHI_TEMPLE')				  AND (SELECT Retain FROM MySpecialSetting WHERE Name = '去除奇迹位置限制') = "要" Union
SELECT	"BUILDING_AMUNDSEN_SCOTT_RESEARCH_STATION", TerrainType FROM MyTerrainsTemp WHERE EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType = "BUILDING_AMUNDSEN_SCOTT_RESEARCH_STATION") AND (SELECT Retain FROM MySpecialSetting WHERE Name = '去除奇迹位置限制') = "要";
DELETE FROM Building_RequiredFeatures WHERE BuildingType='BUILDING_MAHABODHI_TEMPLE'	AND EXISTS (SELECT BuildingType FROM Building_ValidTerrains WHERE BuildingType = 'BUILDING_MAHABODHI_TEMPLE') AND (SELECT Retain FROM MySpecialSetting WHERE Name = '去除奇迹位置限制') = "要";
DELETE FROM Building_RequiredFeatures WHERE BuildingType='BUILDING_MONT_ST_MICHEL'		AND EXISTS (SELECT BuildingType FROM Building_ValidTerrains WHERE BuildingType = 'BUILDING_MONT_ST_MICHEL'	) AND (SELECT Retain FROM MySpecialSetting WHERE Name = '去除奇迹位置限制') = "要";

---------------------------------------新增可移除地形------------------------------------------------------------------------------------------
UPDATE Features SET Removable = 1 WHERE FeatureType = 'FEATURE_REEF' OR FeatureType = 'FEATURE_FLOODPLAINS' OR FeatureType = 'FEATURE_OASIS';-- 可删除礁石\泛滥平原\绿洲