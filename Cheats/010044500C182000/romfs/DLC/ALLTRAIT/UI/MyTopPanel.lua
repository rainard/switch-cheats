include( "TopPanel" );

QueryChanges = 0;
QueryCache = {};

function CachedQuery(sql, arg1, arg2, arg3, arg4)

	-- If the database has been updated.  Invalidate the cache.
	local changes = DB.ConfigurationChanges();
	if(changes ~= QueryChanges) then
		QueryCache = {};
		QueryChanges = changes;
	end

	-- Is there a cached entry for this?
	local cache = QueryCache[sql];
	if(cache == nil) then
		cache = {};
		QueryCache[sql] = cache;
	end

	-- Obtain the cached results.
	local results;
	for i, v in ipairs(cache) do
		if(v[1] == arg1 and v[2] == arg2 and v[3] == arg3 and v[4] == arg4) then
			results = v[0];
			break;
		end
	end

	-- Otherwise query ourselves.
	if(results == nil) then
		local entry = {arg1, arg2, arg3, arg4};
		results = DB.ConfigurationQuery(sql, arg1, arg2, arg3, arg4);
		entry[0] = results;
		table.insert(cache, entry);
	end

	return results;
end

function ReadMapSettings()	
	local MapSet ={};
	table.insert(MapSet, {"WorldAge", MapConfiguration.GetValue("world_age"), "地图没有这项设置"});
	table.insert(MapSet, {"Temperature", MapConfiguration.GetValue("temperature"), "地图没有这项设置"});
	table.insert(MapSet, {"Rainfall", MapConfiguration.GetValue("rainfall"), "地图没有这项设置"});
	table.insert(MapSet, {"SeaLevel", MapConfiguration.GetValue("sea_level"), "地图没有这项设置"});
	table.insert(MapSet, {"Resources", MapConfiguration.GetValue("resources"), "地图没有这项设置"});
	table.insert(MapSet, {"StartPosition", MapConfiguration.GetValue("start"), "地图没有这项设置"});
	
	for i, row in ipairs(CachedQuery("SELECT * FROM DomainValues")) do
		for i=1,6 do
			if row.Domain == MapSet[i][1] and row.Value == MapSet[i][2] then
				MapSet[i][3] = Locale.Lookup(row.Name) .. "--" .. Locale.Lookup(row.Description);
			end
		end
	end
	local MYtempseed = GameConfiguration.GetValue("GAME_SYNC_RANDOM_SEED");
	local MYtempMapseed = MapConfiguration.GetValue("RANDOM_SEED");
	
	local Mytemp:string = "[COLOR_RED]地图信息如下[ENDCOLOR]";
	Mytemp = Mytemp .. "[NEWLINE]规则种子：" .. MYtempseed;
	Mytemp = Mytemp .. "[NEWLINE]地图种子：" .. MYtempMapseed;
	Mytemp = Mytemp .. "[NEWLINE]世界纪元：" .. MapSet[1][3];
	Mytemp = Mytemp .. "[NEWLINE]温度：    " .. MapSet[2][3];
	Mytemp = Mytemp .. "[NEWLINE]降雨量：  " .. MapSet[3][3];
	Mytemp = Mytemp .. "[NEWLINE]海平面：  " .. MapSet[4][3];
	Mytemp = Mytemp .. "[NEWLINE]资源：    " .. MapSet[5][3];
	Mytemp = Mytemp .. "[NEWLINE]启动位置：" .. MapSet[6][3];
	
	Controls.MenuButton:SetToolTipString(Mytemp);
	print("进入游戏时间：" .. os.date("%H:%M"));
	Mytemp = string.gsub(Mytemp, "[%[%]]", "");
	print(string.gsub(Mytemp, "NEWLINE", "\n"));	
	--lua文件地址：%USERPROFILE%\Documents\My Games\Sid Meier's Civilization VI\logs
end

function MyReadLog()	
	
	local Mytemp:string = "[COLOR_RED]启用修改的领袖：[ENDCOLOR][NEWLINE]";
	print("启用修改的领袖：");
	local Mynum = 0;
	Mynum = 0;
	for row in GameInfo.MyLeaderSetting() do
		if row.Name ~= nil then
			Mytemp = Mytemp .. row.Name .. "[NEWLINE]";
			print(row.Name);
			Mynum = Mynum + 1;
		end
	end
	if Mynum == 0 then Mytemp = Mytemp .. "没有开启[NEWLINE]"; end
		
	Mynum = 0;
	Mytemp = Mytemp .. "[COLOR_RED]当前模式不存在的特性：[ENDCOLOR][NEWLINE]";
	print("当前模式不存在的特性：");
	for row in GameInfo.AAMyErrSet() do
		if row.Name ~= nil and row.Retain == "要" then
			Mytemp = Mytemp .. row.Type .. row.Name .. "[NEWLINE]";
			print(row.Type .. row.Name);
			Mynum = Mynum + 1;
		end
	end
	for row in GameInfo.AAMyModifiersTemp() do
		if row.CheckExistence ~= nil and row.Text ~= nil then
			Mytemp = Mytemp .. row.Text .. "[NEWLINE]";
			print(row.Text);
			Mynum = Mynum + 1;
		end
	end
	if Mynum == 0 then Mytemp = Mytemp .. "没有错误效果[NEWLINE]"; end
	
	Mynum = 0;
	Mytemp = Mytemp .. "[COLOR_RED]使用中的文明领袖特性：[ENDCOLOR][NEWLINE]";
	print("使用中的文明领袖特性：");
	for row in GameInfo.AAMyTraitSetting() do
		if row.Name ~= nil and row.Retain == "要" then
			Mytemp = Mytemp .. row.Name .. "[NEWLINE]";
			print(row.Name);
			Mynum = Mynum + 1;
		end
	end
	if Mynum == 0 then Mytemp = Mytemp .. "没有开启[NEWLINE]"; end
	
	Mynum = 0;
	Mytemp = Mytemp .. "[COLOR_RED]使用中的时代特性：[ENDCOLOR][NEWLINE]";
	print("使用中的时代特性：");
	for row in GameInfo.MyCommemorationSetting() do
		if row.Name ~= nil then
			Mytemp = Mytemp .. row.Name .. "[NEWLINE]";
			print(row.Name);
			Mynum = Mynum + 1;
		end
	end
	if Mynum == 0 then Mytemp = Mytemp .. "没有开启[NEWLINE]"; end
	
	Mynum = 0;
	Mytemp = Mytemp .. "[COLOR_RED]使用中的总督特性：[ENDCOLOR][NEWLINE]";
	print("使用中的总督特性：");
	for row in GameInfo.MyGovernorPromotionSetting() do
		if row.Name ~= nil then
			Mytemp = Mytemp .. row.Name .. "[NEWLINE]";
			print(row.Name);
			Mynum = Mynum + 1;
		end
	end
	if Mynum == 0 then Mytemp = Mytemp .. "没有开启[NEWLINE]"; end
	
	Mynum = 0;
	Mytemp = Mytemp .. "[COLOR_RED]使用中的强化特性：[ENDCOLOR][NEWLINE]";
	print("使用中的强化特性：");
	for row in GameInfo.AAMyPromotionSetting() do
		if row.Name ~= nil then
			Mytemp = Mytemp .. row.Name .. "[NEWLINE]";
			print(row.Name);
			Mynum = Mynum + 1;
		end
	end
	if Mynum == 0 then Mytemp = Mytemp .. "没有开启[NEWLINE]"; end
	
	Mynum = 0;
	Mytemp = Mytemp .. "[COLOR_RED]使用中的被动特性：[ENDCOLOR][NEWLINE]";
	print("使用中的被动特性：");
	for row in GameInfo.AAMyAbilitiesSetting() do
		if row.Name ~= nil then
			Mytemp = Mytemp .. row.Name .. "[NEWLINE]";
			print(row.Name);
			Mynum = Mynum + 1;
		end
	end
	if Mynum == 0 then Mytemp = Mytemp .. "没有开启[NEWLINE]"; end
	
	Controls.CivpediaButton:SetToolTipString(Mytemp);
	--lua文件地址：%USERPROFILE%\Documents\My Games\Sid Meier's Civilization VI\logs
end

if GameInfo.MySpecialSetting["地图信息"].Retain == "要" then
	ReadMapSettings();
end
if GameInfo.MySpecialSetting["输出日志"].Retain == "要" then
	MyReadLog();
end
