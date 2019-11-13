local function AddGreatGeneral(iPlayer, szGeneralName)
	local class = nil;
	local era = nil;
	for row in GameInfo.GreatPersonIndividuals() do
		if row.GreatPersonIndividualType == szGeneralName then
			class = GameInfo.GreatPersonClasses[row.GreatPersonClassType].Hash;
			era = GameInfo.Eras[row.EraType].Hash;
		end
	end
	local individual = GameInfo.GreatPersonIndividuals[szGeneralName].Hash;
	local cost = 0;
	Game.GetGreatPeople():GrantPerson(individual, class, era, cost, iPlayer, false);
end

function SetFullDisplayofmap()
--设置地图全显
	local ExploreMapSwitch = GameInfo.MySpecialSetting["自动探索全地图"].Retain;
	if ExploreMapSwitch =="要" then
		local aPlayers = PlayerManager.GetAliveMajors();
		for _, pPlayer in ipairs(aPlayers) do
			-- Reveal the map to all players.
			local pCurPlayerVisibility = PlayersVisibility[pPlayer:GetID()];
			if(pCurPlayerVisibility ~= nil) then
				pCurPlayerVisibility:RevealAllPlots();
			end
		end
	end
end

function SetRelationship()
	local currentTurn = Game.GetCurrentGameTurn();
	local aPlayers = PlayerManager.GetAlive();
	local MyPlayer = 0;
	for loop, pPlayer in ipairs(aPlayers) do
		if pPlayer:IsHuman() then
			MyPlayer = pPlayer:GetID();
			break;
		end
	end
	Players[MyPlayer]:GetDiplomacy():RecheckVisibilityOnAll();
	for loop, pPlayer in ipairs(aPlayers) do
		local iPlayer = pPlayer:GetID();
		if pPlayer:IsMajor() and currentTurn == 1 and iPlayer ~= MyPlayer then
			Players[MyPlayer]:GetDiplomacy():SetHasMet(iPlayer);
			Players[MyPlayer]:GetDiplomacy():SetHasDelegationAt(iPlayer, true);
			Players[iPlayer]:GetDiplomacy():RecheckVisibilityOnAll();
			-- Players[1]:GetDiplomacy():DeclareWarOn(2);
			-- Players[0]:GetDiplomacy():SetPermanentAlliance(2);
		end
		if (not pPlayer:IsMajor()) and iPlayer ~= MyPlayer then
			--Players[MyPlayer]:GetDiplomacy():SetHasMet(iPlayer);
		end
	end
end
--GameEvents.OnGameTurnStarted.Add(SetRelationship);

function MySettingGameData()
	local aPlayers = PlayerManager.GetAlive();
	local OneAddBeliefs = 0;
	local PlayerAddDate = false;
	local ExploreMapSwitch = GameInfo.MySpecialSetting["属性对敌人生效"].Retain;

	for loop, pPlayer in ipairs(aPlayers) do
		PlayerAddDate = false
		if pPlayer:IsHuman() or ExploreMapSwitch == "要" then
			PlayerAddDate = true;
		end

		local iPlayer = pPlayer:GetID();
		local pDiplomacy:table = pPlayer:GetDiplomacy();
		local pCulture:table = pPlayer:GetCulture();
		local pScience:table = pPlayer:GetTechs();
		local pReligion:table = pPlayer:GetReligion();
		local pGameReligion:table = Game.GetReligion();
		local config = PlayerConfigurations[iPlayer];
		for row in GameInfo.MyLeaderSetting() do
			if row.LeaderType == config:GetLeaderTypeName() and PlayerAddDate == true then			
				--添加市政和科技
				for row in GameInfo.AAMyInitialActivationCivicsTech() do
					if row.Type == "科技" then
						pScience:SetTech(GameInfo.Technologies[row.TypeType].Index, true);
					elseif row.Type == "市政" then
						pCulture:SetCivic(GameInfo.Civics[row.TypeType].Index, true);
					else
						print("错误");
					end
				end
				if pPlayer:IsHuman() then
					--添加万神殿
					if GameInfo.MySpecialSetting["自动添加万神殿"].Retain == "要" then	
						pGameReligion:FoundPantheonHash(iPlayer, GameInfo.Beliefs[GameInfo.MySpecialSetting["自动添加万神殿"].parameter1].Hash);
					end
					--添加伟人
					for row in GameInfo.AAMyInitialActivationGreatPerson() do
						if row.TypeType ~= nil then
							AddGreatGeneral(iPlayer, row.TypeType);
						end
					end
				end 
			end
			-- Players[0]:GetDiplomacy():SetHasMet(1);
			-- Players[0]:GetDiplomacy():SetHasDelegationAt(1, true);
			-- Players[0]:GetDiplomacy():RecheckVisibilityOnAll();
			-- Players[1]:GetDiplomacy():DeclareWarOn(2);
			-- Players[0]:GetDiplomacy():SetPermanentAlliance(2);
		end
	end
end

function MyPrintErrorLog()
-- 打印错误设置日志
	local TempBugText:string = "\n当前版本缺少:\n";
	for row in GameInfo.AAMyModifiersTemp() do
		if (row.CheckExistence ~= nil) and (row.Text ~= nil) then
			TempBugText = TempBugText .. row.Text .. "\n"
		end
	end
	for row in GameInfo.AAMyErrSet() do
		if (row.Type ~= nil) and (row.Retain == "要") then
			TempBugText = TempBugText .. row.Type .. row.Name .. "\n"
		end
	end
	if TempBugText ~= "\n当前版本缺少:\n" then 
		print(TempBugText);
	end
end
LuaEvents.NewGameInitialized.Add(MySettingGameData);

function Initialize()
	SetFullDisplayofmap();
	--MyPrintErrorLog();
end
Initialize();