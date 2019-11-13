--测试属性区
-- INSERT INTO AAMyModifiersTemp
			-- (OutPutType, 	ModifierId, ModifierType,										RunOnce,Permanent,SubjectRequirementSetId,	Name1,		Value1,			Extra1,	Name2,	Value2,	Name3,	Value3) 
-- SELECT 			'是',		'MT_TEST',	'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_MAX_LEVEL',			0,		0,				NULL,			NULL,		NULL,			NULL,	NULL,	NULL,	NULL,	NULL;

--自定义属性		
INSERT INTO	AAMyModifiersTemp
		(Text,							OutPutType, ModifierId, 								ModifierType,											RunOnce,Permanent,SubjectRequirementSetId,	Name1,					Value1,						Extra1,	Name2,			Value2,				Name3,			Value3				)
VALUES	('增加城市房屋',				'是',		'MYCHEAT_ADD_HOUSING',						'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING',				0,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('增加城市人口',				'是',		'MYCHEAT_ADD_POPULATION',					'MODIFIER_PLAYER_CITIES_ADD_POPULATION',					0,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('增加城市宜居',				'是',		'MYCHEAT_ADD_POLICY_AMENITY',				'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_AMENITY',				0,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('增加城市忠诚',				'是',		'MYCHEAT_ADD_IDENTITY_PER_TURN',			'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN',			0,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('增加城市地块魅力',			'是',		'MYCHEAT_ADD_APPEAL',						'MODIFIER_PLAYER_CITIES_ADJUST_CITY_APPEAL',				0,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('增加初始地块',				'是',		'MYCHEAT_INCREASED_TILES_MAX',				'MODIFIER_PLAYER_ADJUST_CITY_TILES',						0,		0,		'ACT_ON_X_TURNS',		'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('增加城市地块食物',			'是',		'MY_ADD_YIELD_FOOD',						'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						0,		0,		NULL,					'Amount',				'待输入',					NULL,	'YieldType',	'YIELD_FOOD',		NULL,			NULL				),
		('增加城市地块金钱',			'是',		'MY_ADD_YIELD_GOLD',						'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						0,		0,		NULL,					'Amount',				'待输入',					NULL,	'YieldType',	'YIELD_GOLD',		NULL,			NULL				),
		('增加城市地块信仰',			'是',		'MY_ADD_YIELD_FAITH',						'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						0,		0,		NULL,					'Amount',				'待输入',					NULL,	'YieldType',	'YIELD_FAITH',		NULL,			NULL				),
		('增加城市地块生产力',			'是',		'MY_ADD_YIELD_PRODUCTION',					'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						0,		0,		NULL,					'Amount',				'待输入',					NULL,	'YieldType',	'YIELD_PRODUCTION',	NULL,			NULL				),
		('增加城市地块科技',			'是',		'MY_ADD_YIELD_SCIENCE',						'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						0,		0,		NULL,					'Amount',				'待输入',					NULL,	'YieldType',	'YIELD_SCIENCE',	NULL,			NULL				),
		('增加城市地块文化',			'是',		'MY_ADD_YIELD_CULTURE',						'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						0,		0,		NULL,					'Amount',				'待输入',					NULL,	'YieldType',	'YIELD_CULTURE',	NULL,			NULL				),
		('旅游业绩增加',				'是',		'MYCHEAT_BOOST_ALL_TOURISM',				'MODIFIER_PLAYER_ADJUST_TOURISM',							0,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('增加贸易路线',				'是',		'MYCHEAT_EXTRA_TRADE_ROUTE_CAPACITY',		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',				0,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('无视人口建造区域',			'是',		'MYCHEAT_EXTRA_DISTRICT_EACH_CITY',			'MODIFIER_PLAYER_CITIES_EXTRA_DISTRICT',					0,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('购买地块费用衰减',			'是',		'MYCHEAT_LANDSURVEYORS_PLOTPURCHASECOST',	'MODIFIER_PLAYER_CITIES_ADJUST_PLOT_PURCHASE_COST',			0,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('市政加速',					'是',		'MYCHEAT_CIVIC_BOOST',						'MODIFIER_PLAYER_ADJUST_CIVIC_BOOST',						0,		0,		'ACT_ON_X_TURNS',		'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('科技加速',					'是',		'MYCHEAT_TECHNOLOGY_BOOST',					'MODIFIER_PLAYER_ADJUST_TECHNOLOGY_BOOST',					0,		0,		'ACT_ON_X_TURNS',		'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('随机获得时代范围内的市政提升','改良',		'MY_CHEAT_RANDOM_CIVIC0',					'MODIFIER_PLAYER_GRANT_RANDOM_CIVIC_BOOST_BY_ERA',			1,		0,		'ACT_ON_X_TURNS',		'Amount',				70,							NULL,	'StartEraType',	'ERA_ANCIENT',		'EndEraType',	'ERA_INFORMATION'	),
		('随机获得市政提升',			'改良',		'MY_CHEAT_RANDOM_CIVIC1',					'MODIFIER_PLAYER_GRANT_RANDOM_CIVIC',						0,		0,		NULL,					'Amount',				20,							NULL,	NULL,			NULL,				NULL,			NULL				),
		('所有时代范围内科技获得提升',	'改良',		'MY_CHEAT_RANDOM_TECHNOLOGY0',				'MODIFIER_PLAYER_GRANT_ALL_TECHNOLOGY_BOOST_BY_ERA',		1,		0,		'ACT_ON_X_TURNS',		'StartEraType',			'ERA_ANCIENT',				NULL,	'EndEraType',	'ERA_INFORMATION',	NULL,			NULL				),
		('随机获得科技提升',			'改良',		'MY_CHEAT_RANDOM_TECHNOLOGY1',				'MODIFIER_PLAYER_GRANT_RANDOM_TECHNOLOGY',					0,		0,		NULL,					'Amount',				6,							NULL,	NULL,			NULL,				NULL,			NULL				),
		('增加金钱',					'是改良',	'MYCHEAT_GET_GOLD',							'MODIFIER_PLAYER_GRANT_YIELD',								0,		0,		NULL,					'Amount',				'待输入',					NULL,	'YieldType',	'YIELD_GOLD',		NULL,			NULL				),
		('增加金钱倍数',				'是',		'MYCHEAT_GET_GOLDRATE',						'MODIFIER_PLAYER_MULTIPLY_TREASURY',						1,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('增加信仰',					'是改良',	'MYCHEAT_GET_FAITH',						'MODIFIER_PLAYER_GRANT_YIELD',								0,		0,		NULL,					'Amount',				'待输入',					NULL,	'YieldType',	'YIELD_FAITH',		NULL,			NULL				),
		('每回合获得大量生产力',		'城市',		'MYCHEAT_GET_PRODUCTION',					'MODIFIER_SINGLE_CITY_GRANT_PRODUCTION_IN_CITY',			0,		0,		'ON_TURN_STARTED',		'Amount',				'待输入',					NULL,	'KeepOverflow',	0,					NULL,			NULL				),
		('增加使者',					'是',		'MYCHEAT_GET_INFLUENCE',					'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN',					0,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('加快同盟点获取',				'是',		'MYCHEAT_INCREASE_ALLIANCEPOINTS',			'MODIFIER_PLAYER_ADJUST_ALLIANCE_POINTS',					0,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('获得总督头衔',				'是',		'MYCHEAT_GOVERNOR_POINTS',					'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS',					0,		0,		NULL,					'Delta',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('可获得第1个额外的通配槽位',	'是',		'MYCHEAT_WILDCARD_GOVERNMENT_SLOT1',		'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER',	0,		0,		NULL,					'GovernmentSlotType',	'SLOT_WILDCARD',			NULL,	NULL,			NULL,				NULL,			NULL				),
		('可获得第2个额外的通配槽位',	'是',		'MYCHEAT_WILDCARD_GOVERNMENT_SLOT2',		'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER',	0,		0,		NULL,					'GovernmentSlotType',	'SLOT_WILDCARD',			NULL,	NULL,			NULL,				NULL,			NULL				),
		('可获得第3个额外的通配槽位',	'是',		'MYCHEAT_WILDCARD_GOVERNMENT_SLOT3',		'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER',	0,		0,		NULL,					'GovernmentSlotType',	'SLOT_WILDCARD',			NULL,	NULL,			NULL,				NULL,			NULL				),
		('可获得第1个额外的经济槽位',	'是',		'MYCHEAT_ECONOMIC_GOVERNMENT_SLOT1',		'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER',	0,		0,		NULL,					'GovernmentSlotType',	'SLOT_ECONOMIC',			NULL,	NULL,			NULL,				NULL,			NULL				),
		('可获得第2个额外的经济槽位',	'是',		'MYCHEAT_ECONOMIC_GOVERNMENT_SLOT2',		'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER',	0,		0,		NULL,					'GovernmentSlotType',	'SLOT_ECONOMIC',			NULL,	NULL,			NULL,				NULL,			NULL				),
		('可获得第3个额外的经济槽位',	'是',		'MYCHEAT_ECONOMIC_GOVERNMENT_SLOT3',		'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER',	0,		0,		NULL,					'GovernmentSlotType',	'SLOT_ECONOMIC',			NULL,	NULL,			NULL,				NULL,			NULL				),
		('可获得第1个额外的军事槽位',	'是',		'MYCHEAT_MILITARY_GOVERNMENT_SLOT1',		'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER',	0,		0,		NULL,					'GovernmentSlotType',	'SLOT_MILITARY',			NULL,	NULL,			NULL,				NULL,			NULL				),
		('可获得第2个额外的军事槽位',	'是',		'MYCHEAT_MILITARY_GOVERNMENT_SLOT2',		'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER',	0,		0,		NULL,					'GovernmentSlotType',	'SLOT_MILITARY',			NULL,	NULL,			NULL,				NULL,			NULL				),
		('可获得第3个额外的军事槽位',	'是',		'MYCHEAT_MILITARY_GOVERNMENT_SLOT3',		'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER',	0,		0,		NULL,					'GovernmentSlotType',	'SLOT_MILITARY',			NULL,	NULL,			NULL,				NULL,			NULL				),
		('工人可加速奇迹',				'是',		'MYCHEAT_BUILDER_WONDER_PERCENT',			'MODIFIER_PLAYER_ADJUST_UNIT_WONDER_PERCENT',				0,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('工人可加速区域',				'是',		'MYCHEAT_BUILDER_DISTRICT_PERCENT',			'MODIFIER_PLAYER_ADJUST_UNIT_DISTRICT_PERCENT',				0,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('调整间谍进攻等级',			'是',		'MYCHEAT_CRYPTOGRAPHY_OFFENSE',				'MODIFIER_PLAYER_ADJUST_SPY_BONUS',							0,		0,		NULL,					'Amount',				'待输入',					NULL,	'Offense',		-1,					NULL,			NULL				),
		('调整间谍防守等级',			'是',		'MYCHEAT_CRYPTOGRAPHY_DEFENSE',				'MODIFIER_PLAYER_ADJUST_SPY_BONUS',							0,		0,		NULL,					'Amount',				'待输入',					NULL,	'Offense',		1,					NULL,			NULL				),
		('间谍部署无需时间',			'是',		'MYCHEAT_SPY_ESTABLISH_TIME',				'MODIFIER_MY_UNITS_ADJUST_SPY_ESTABLISH_TIME',				0,		0,		'ACT_ON_UNIT_SPY',		'ReductionPercent',		100,						NULL,	NULL,			NULL,				NULL,			NULL				),
		('全单位每回合升1级',			'是',		'MYCHEAT_LEVEL_UP_UNITS',					'MODIFIER_PLAYER_UNITS_ADJUST_GRANT_EXPERIENCE',			0,		0,		'ON_TURN_STARTED',		'Amount',				-1,							NULL,	NULL,			NULL,				NULL,			NULL				),
		('使徒升级',					'是',		'MYCHEAT_CARDINAL_PATRON_SAINT_PROMOTION',	'MODIFIER_SINGLE_CITY_RELIGION_EXTRA_PROMOTIONS_SCENARIO',	0,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('传教次数增加',				'是',		'MYCHEAT_RELIGIOUS_CHARGES',				'MODIFIER_PLAYER_UNITS_ADJUST_SPREAD_CHARGES',				0,		0,		'ACT_ON_IS_RELIGIOUS',	'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('使徒升级所有技能可选',		'是',		'MYCHEAT_APOSTLE_PROMOTION_BONUS',			'MODIFIER_PLAYER_UNIT_GRANT_UNLIMITED_PROMOTION_CHOICES',	0,		0,		NULL,					'UnitType',				'UNIT_APOSTLE',				NULL,	NULL,			NULL,				NULL,			NULL				),
		('间谍升级所有技能可选',		'是',		'MYCHEAT_SPY_PROMOTION_BONUS',				'MODIFIER_PLAYER_UNIT_GRANT_UNLIMITED_PROMOTION_CHOICES',	0,		0,		NULL,					'UnitType',				'UNIT_SPY',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('移动力增加',					'是',		'MYCHEAT_ADDITIONAL_MOVEMENT',				'MODIFIER_PLAYER_UNITS_ADJUST_MOVEMENT',					0,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('攻击距离增加',				'是',		'MYCHEAT_LONG_RANGE_ESCORT_BONUS_RANGE',	'MODIFIER_PLAYER_UNITS_ADJUST_ATTACK_RANGE',				0,		0,		'ACT_ON_RANGE_UNITYS',	'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('攻击以后可再攻击',			'能力',		'MYCHEAT_ADDITIONAL_ATTACK_SUBEFFECT',		'MODIFIER_UNIT_ADJUST_NUM_ATTACKS',							0,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('视野增加',					'能力',		'MYCHEAT_SPYGLASS_BONUS_SIGHT_SUBEFFECT',	'MODIFIER_PLAYER_UNIT_ADJUST_SIGHT',						0,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('战斗力增加',					'是',		'MYCHEAT_INCREASED_COMBAT_STRENGTH',		'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH',				0,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('直接攻击支援单位',			'能力',		'ATTACK_BYPASS_COMBAT_UNIT',				NULL,														0,		0,		NULL,					NULL,					NULL,						NULL,	NULL,			NULL,				NULL,			NULL				),
		('掠夺只消耗1个移动力',			'能力',		'DEPREDATION_BONUS_ADVANCED_PILLAGING',		NULL,														0,		0,		NULL,					NULL,					NULL,						NULL,	NULL,			NULL,				NULL,			NULL				),
		('占领城市后强制信仰本国宗教',	'是',		'CONQUISTADOR_CITY_RELIGION_COMBAT',		NULL,														0,		0,		NULL,					NULL,					NULL,						NULL,	NULL,			NULL,				NULL,			NULL				),
		('击败敌方将宗教传播到附近的城','否',		'DISCIPLES_LAND_VICTORY_SPREAD',			NULL,														0,		0,		NULL,					NULL,					NULL,						NULL,	NULL,			NULL,				NULL,			NULL				),
		('中立地区恢复',				'能力',		'SUPPLY_FLEET_NEUTRAL_TERRITORY_HEAL',		NULL,														0,		0,		NULL,					NULL,					NULL,						NULL,	NULL,			NULL,				NULL,			NULL				),
		('敌对地区恢复',				'能力',		'SUPPLY_FLEET_ENEMY_TERRITORY_HEAL',		NULL,														0,		0,		NULL,					NULL,					NULL,						NULL,	NULL,			NULL,				NULL,			NULL				),
		('击败对手后恢复',				'是',		'MYCHEAT_HEAL_AFTER_DEFEATING_UNIT',		'MODIFIER_PLAYER_UNITS_ADJUST_HEAL_FROM_COMBAT',			0,		0,		NULL,					'Amount',				'待输入',					NULL,	NULL,			NULL,				NULL,			NULL				),
		('编队单位获得相同移动力',		'能力',		'ESCORT_MOBILITY_SHARED_MOVEMENT',			NULL,														0,		0,		NULL,					NULL,					NULL,						NULL,	NULL,			NULL,				NULL,			NULL				),
		('反隐形',						'能力',		'UNIT_SEE_HIDDEN',							NULL,														0,		0,		NULL,					NULL,					NULL,						NULL,	NULL,			NULL,				NULL,			NULL				),
		('攻击后仍可移动',				'能力',		'COSSACK_MOVE_AND_ATTACK',					NULL,														0,		0,		NULL,					NULL,					NULL,						NULL,	NULL,			NULL,				NULL,			NULL				),
		('忽略地形移动力影响',			'能力',		'MOD_IGNORE_TERRAIN_COST',					NULL,														0,		0,		NULL,					NULL,					NULL,						NULL,	NULL,			NULL,				NULL,			NULL				),
		('忽略河流移动力影响',			'能力',		'MOD_IGNORE_CROSSING_RIVERS_COST',			NULL,														0,		0,		NULL,					NULL,					NULL,						NULL,	NULL,			NULL,				NULL,			NULL				),
		('忽略登船移动力影响',			'能力',		'REDCOAT_DISEMBARK',						NULL,														0,		0,		NULL,					NULL,					NULL,						NULL,	NULL,			NULL,				NULL,			NULL				),
		('可攀登悬崖城墙',				'能力',		'COMMANDO_BONUS_IGNORE_CLIFF_WALLS',		NULL,														0,		0,		NULL,					NULL,					NULL,						NULL,	NULL,			NULL,				NULL,			NULL				),
		('在移动或战斗后，依然能治愈',	'能力',		'MAMLUK_HEAL_EVERY_MOVE',					NULL,														0,		0,		NULL,					NULL,					NULL,						NULL,	NULL,			NULL,				NULL,			NULL				),
		('没被地形阻碍的视野范围',		'能力',		'UNOBSTRUCTED_VIEW',						NULL,														0,		0,		NULL,					NULL,					NULL,						NULL,	NULL,			NULL,				NULL,			NULL				),
		('不受敌人控制区影响',			'能力',		'IGNOREZOC_IGNORE_ZOC',						NULL,														0,		0,		NULL,					NULL,					NULL,						NULL,	NULL,			NULL,				NULL,			NULL				),
		('学会区域控制',				'能力',		'SUPPRESSION_BONUS_EXERT_ZOC',				NULL,														0,		0,		NULL,					NULL,					NULL,						NULL,	NULL,			NULL,				NULL,			NULL				),
		('可以进入外国领土',			'能力',		'MOD_ENTER_FOREIGN_LANDS',					NULL,														0,		0,		NULL,					NULL,					NULL,						NULL,	NULL,			NULL,				NULL,			NULL				),
		('陆运路线无法被掠夺',			'商人',		'MYCHEAT_PLUNDER_IMMUNITY_LAND',			'MODIFIER_PLAYER_UNIT_ADJUST_TRADE_ROUTE_PLUNDER_IMMUNITY',	0,		0,		NULL,					'DomainType',			'DOMAIN_LAND',				NULL,	NULL,			NULL,				NULL,			NULL				),
		('海运路线无法被掠夺',			'商人',		'MYCHEAT_PLUNDER_IMMUNITY_SEA',				'MODIFIER_PLAYER_UNIT_ADJUST_TRADE_ROUTE_PLUNDER_IMMUNITY',	0,		0,		NULL,					'DomainType',			'DOMAIN_SEA',				NULL,	NULL,			NULL,				NULL,			NULL				),
		(NULL,							'是',		'MYCHEAT_CLASS_ALLCHEAT_TRADER',			'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',						0,		0,		'ACT_ON_UNIT_TRADER',	'AbilityType',			'CLASS_ALLCHEAT_TRADER',	NULL,	NULL,			NULL,				NULL,			NULL				),
		(NULL,							'是',		'MYCHEAT_CLASS_ALLCHEAT_UNITYS',			'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',						0,		0,		NULL,					'AbilityType',			'CLASS_ALLCHEAT_UNITYS',	NULL,	NULL,			NULL,				NULL,			NULL				);


INSERT INTO AAMyModifiersTemp
		(Text,			 OutPutType,ModifierId, 								ModifierType,										SubjectRequirementSetId,Name1,			Value1,				Name2,				Value2)
SELECT	'全资源获取',		'城市',	'MY_ADD_' || ResourceType, 					'MODIFIER_SINGLE_CITY_GRANT_RESOURCE_IN_CITY',		NULL,					'Amount',		'待输入',			'ResourceType',		ResourceType	FROM Resources WHERE ResourceClassType <> 'RESOURCECLASS_ARTIFACT' AND ((SELECT parameter2 FROM MySpecialSetting WHERE Name = '全资源获取') ='ALL' OR (SELECT parameter2 FROM MySpecialSetting WHERE Name = '全资源获取') LIKE '%' || ResourceType || '%') Union
--SELECT	'增加城市地块加成',	'是', 	'MY_ADD_' || YieldType, 					'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',				NULL,					'Amount',		'待输入',			'YieldType',		YieldType		FROM Yields WHERE (SELECT parameter2 FROM MySpecialSetting WHERE Name = '增加城市地块加成') = 'ALL' OR (SELECT parameter2 FROM MySpecialSetting WHERE Name = '增加城市地块加成') LIKE '%' || YieldType || '%' Union
--SELECT	'添加初始科技',		'是',	'MY_ACT_' || TechnologyType, 				'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',		NULL,					'TechType',		TechnologyType,		NULL,				NULL			FROM Technologies WHERE TechnologyType IN (SELECT TypeType FROM AAMyInitialActivationCivicsTech) Union
SELECT	'添加初始兵种',		'是',	'MY_ACT_' || UnitType, 						'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL',			NULL,					'UnitType', 	UnitType,			'Amount',			'待输入'		FROM Units WHERE UnitType IN (SELECT TypeType FROM AAMyInitialActivationUnits) Union
SELECT	'建造次数增加',		'是',	'MY_' || UnitType || '_CHARGES',			'MODIFIER_PLAYER_UNITS_ADJUST_BUILDER_CHARGES',		'ACT_ON_' || UnitType,	'Amount',		'待输入',			NULL,				NULL 			FROM Units WHERE BuildCharges > 0 Union
SELECT	'间谍获得全晋升',	'是', 	'MY_GRANT_PROMOTION_' || UnitPromotionType,	'MODIFIER_PLAYER_UNITS_GRANT_PROMOTION',			'ACT_ON_UNIT_SPY',		'PromotionType',UnitPromotionType,	NULL,				NULL 		 	FROM UnitPromotions WHERE 'UNIT_SPY' IN (SELECT UnitType FROM Units) AND PromotionClass ='PROMOTION_CLASS_SPY' Union
SELECT	'使徒获得全晋升',	'是', 	'MY_GRANT_PROMOTION_' || UnitPromotionType,	'MODIFIER_PLAYER_UNITS_GRANT_PROMOTION',			'ACT_ON_UNIT_APOSTLE',	'PromotionType',UnitPromotionType,	NULL,				NULL 		 	FROM UnitPromotions WHERE 'UNIT_APOSTLE' IN (SELECT UnitType FROM Units) AND PromotionClass ='PROMOTION_CLASS_APOSTLE' Union
SELECT	'间谍进攻1回合',	'是',	'MY_SPY_ACT_TIMES_' || OperationType, 		'MODIFIER_PLAYER_UNITS_ADJUST_SPY_OPERATION_TIME',	'ACT_ON_UNIT_SPY',		'OperationType',OperationType,		'ReductionPercent',	100 			FROM UnitOperations WHERE CategoryInUI = 'OFFENSIVESPY' AND 'UNIT_SPY' IN (SELECT UnitType FROM Units);

--挂载城市类属性
INSERT INTO AAMyModifiersTemp
		(Text,OutPutType,ModifierId,ModifierType,Name1,Value1) 
SELECT	Text,'是',ModifierId || '_MODIFIER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER','ModifierId',ModifierId FROM AAMyModifiersTemp WHERE OutPutType = '城市';
--输入数值
UPDATE AAMyModifiersTemp SET Value1 = (SELECT parameter1 FROM MySpecialSetting WHERE Name = Text) 			WHERE Value1 ='待输入';
UPDATE AAMyModifiersTemp SET Value2 = (SELECT Num FROM AAMyInitialActivationUnits WHERE TypeType = Value1)	WHERE Text ='添加初始兵种';

--设置部分属性生效回合
UPDATE RequirementArguments SET Value = (SELECT parameter1 FROM MySpecialSetting WHERE Name = '设置部分属性生效回合') WHERE RequirementId ='REQUIREMENT_BEFORE_X_TURNS';
UPDATE AAMyModifiersTemp 	SET SubjectRequirementSetId = NULL WHERE (SELECT Retain FROM MySpecialSetting WHERE Name = '设置部分属性生效回合') <> '要' AND SubjectRequirementSetId = 'ACT_ON_X_TURNS';

--检查AAMyModifiersTemp
UPDATE AAMyModifiersTemp SET OutPutType ='否',CheckExistence='错误' WHERE (Name1='UnitType' OR Name1='AbilityType' OR  Name1='YieldType' OR  Name1='TechType') AND Value1 NOT IN (SELECT Type FROM Types);
UPDATE AAMyModifiersTemp SET OutPutType ='否',CheckExistence='错误' WHERE SubjectRequirementSetId NOT IN (SELECT RequirementSetId FROM RequirementSetRequirements);
UPDATE AAMyModifiersTemp SET OutPutType ='否',CheckExistence='错误' WHERE ModifierType NOT IN (SELECT ModifierType FROM DynamicModifiers);
UPDATE AAMyModifiersTemp SET OutPutType ='待用'						WHERE (SELECT Retain FROM MySpecialSetting WHERE Name = Text) <> '要';
