util.AddNetworkString( "givemoneyonetime" )
util.AddNetworkString( "nlfadminpanel" )
util.AddNetworkString( "deleteonebot" )
util.AddNetworkString( "deleteonedataclient" )
util.AddNetworkString( "deleteallbot" )
util.AddNetworkString( "deletealldataclient" )
util.AddNetworkString( "findclientdata" )
util.AddNetworkString( "findofflineclientdata" )
util.AddNetworkString( "showclientdata" )
util.AddNetworkString( "spawnbotpanel" )
util.AddNetworkString( "findbotdata" )
util.AddNetworkString( "sendbotdata" )
util.AddNetworkString( "deletebotshowdata" )
util.AddNetworkString( "savenpcposs" )

local loc =  nlf.bot.config.llanguage.LocalLang
--------------------------------------------------
local function SpawnNLFbot()
    timer.Simple(1, function()
	
        for _, v in pairs(ents.FindByClass("nlf_npc")) do v:Remove() end

        if not file.IsDir("nlf", "DATA") then
            file.CreateDir("nlf", "DATA")
        end

        if not file.IsDir("nlf/" .. string.lower(game.GetMap()) .. "", "DATA") then
            file.CreateDir("nlf/" .. string.lower(game.GetMap()) .. "", "DATA")
        end

        for k, v in pairs(file.Find("nlf/" .. string.lower(game.GetMap()) .. "/*.txt", "DATA")) do
            local vaultPosFile = file.Read("nlf/" .. string.lower(game.GetMap()) .. "/" .. v, "DATA")
            local spawnNumber = string.Explode(" ", vaultPosFile)
            local NPCINFO = ents.Create("nlf_npc")
            NPCINFO:SetPos(Vector(spawnNumber[1], spawnNumber[2], spawnNumber[3]))
            NPCINFO:SetAngles(Angle(tonumber(spawnNumber[4]), spawnNumber[5], spawnNumber[6]))
            NPCINFO:Spawn()
        end
    end)
end

hook.Add("InitPostEntity", "SpawnNLFNPCInit", SpawnNLFbot) -- Après l'apparition des entités au démarrage du serveur, la fonction se déclenchera.
hook.Add("PostCleanupMap", "SpawnNLFNPCCleanup", SpawnNLFbot)

local  function savenpcposs(ply)
	if !table.HasValue(nlf.bot.config.adminpanel.access, ply:GetUserGroup()) then ply:ChatPrint( nlf.bot.config.llanguage[loc].nlfbotl1 .. " " .. nlf.bot.config.llanguage[loc].nlfbotl6 ) return  end
	if not file.IsDir("nlf/" .. string.lower(game.GetMap()), "DATA") then return end
	for _, ent in pairs(ents.FindByClass("nlf_npc")) do

		local pos, ang = ent:GetPos(), ent:GetAngles()
		file.Write("nlf/" .. string.lower(game.GetMap()) .. "/npc_" .. _ .. ".txt", pos.x .. " " .. pos.y .. " " .. pos.z .. " " .. ang.p .. " " .. ang.y .. " " .. ang.r)
	end
	SpawnNLFbot()
end

concommand.Add("nlf_bot_spawn", function(ply, cmd, args)
    if !table.HasValue(nlf.bot.config.adminpanel.access, ply:GetUserGroup()) then ply:ChatPrint( nlf.bot.config.llanguage[loc].nlfbotl1 .. " " .. nlf.bot.config.llanguage[loc].nlfbotl6 ) return  end
        local filenpcName = args[1]

        if not filenpcName then
			ply:ChatPrint( nlf.bot.config.llanguage[loc].nlfbotl1 .. " " .. nlf.bot.config.llanguage[loc].nlfbotl2 )
            return
        end

        if file.Exists("nlf/" .. string.lower(game.GetMap()) .. "/npc_" .. filenpcName .. ".txt", "DATA") then
			ply:ChatPrint( nlf.bot.config.llanguage[loc].nlfbotl1 .. " " ..nlf.bot.config.llanguage[loc].nlfbotl3 .." ".. filenpcName .. nlf.bot.config.llanguage[loc].nlfbotl4 )
            return
        end

        local npcVector = string.Explode(" ", tostring(ply:GetEyeTrace().HitPos))
        local npcAngles = string.Explode(" ", tostring(ply:GetAngles() + Angle(0, -180, 0)))
        file.Write("nlf/" .. string.lower(game.GetMap()) .. "/npc_" .. filenpcName .. ".txt", "" .. npcVector[1] .. " " .. npcVector[2] .. " " .. npcVector[3] .. " " .. npcAngles[1] .. " " .. npcAngles[2] .. " " .. npcAngles[3] .. "", "DATA")
		ply:ChatPrint(nlf.bot.config.llanguage[loc].nlfbotl1.." " .. nlf.bot.config.llanguage[loc].nlfbotl5)
		SpawnNLFbot()
  
end)


concommand.Add("nlf_bot_remove", function(ply, cmd, args)
    if !table.HasValue(nlf.bot.config.adminpanel.access, ply:GetUserGroup()) then ply:ChatPrint( nlf.bot.config.llanguage[loc].nlfbotl1 .. " " .. nlf.bot.config.llanguage[loc].nlfbotl9 ) return  end
        local fileVaultName = args[1]

        if not fileVaultName then
			ply:ChatPrint( nlf.bot.config.llanguage[loc].nlfbotl1 .. " " .. nlf.bot.config.llanguage[loc].nlfbotl7 )
            return
        end

        if file.Exists("nlf/" .. string.lower(game.GetMap()) .. "/npc_" .. fileVaultName .. ".txt", "DATA") then
            file.Delete("nlf/" .. string.lower(game.GetMap()) .. "/npc_" .. fileVaultName .. ".txt")
			ply:ChatPrint( nlf.bot.config.llanguage[loc].nlfbotl1 .. " " .. nlf.bot.config.llanguage[loc].nlfbotl8 )
			SpawnNLFbot()
            return
        end
end)

--------------------------------------------------
function NLF_GUIDE_ConvertSteamID( id ) -- --ALL CREDIT FOR THIS COMMAND GOES TO |G4P| Mr.President. https://www.gmodstore.com/users/view/76561197971242755
    id = string.upper(string.Trim( id ))
    if string.sub( id, 1, 6 ) == 'STEAM_' then
        local parts = string.Explode( ':', string.sub(id,7) )
        local id_64 = (1197960265728 + tonumber(parts[2])) + (tonumber(parts[3]) * 2)
        local str = string.format('%f',id_64)
        return '7656'..string.sub( str, 1, string.find(str,'.',1,true)-1 )
    else
        if tonumber( id ) ~= nil then
          local id_64 = tonumber( id:sub(2) )
          local a = id_64 % 2 == 0 and 0 or  1
          local b = math.abs(6561197960265728 - id_64 - a) / 2
          local sid = "STEAM_0:" .. a .. ":" .. (a == 1 and b -1 or b)
          return sid
        end
    end
end

--ALL CREDIT FOR THIS COMMAND GOES TO THE ULX TEAM. I PULLED THIS OUT SO THAT I COULD NOT HAVE TO RELY ON ULIB FOR A SINGLE FUNCTION.
function nlf_getUser( target )
	if not target then return false end

	local players = player.GetAll()
	target = target:lower()

	local plyMatch

	-- First, do a full name match in case someone's trying to exploit our target system
	for _, player in ipairs( players ) do
		if target == player:Nick():lower() then
			if not plyMatch then
				return player
			else
				return false
			end
		end
	end

	for _, player in ipairs( players ) do
		local nameMatch
		if player:Nick():lower():find( target, 1, true ) then -- No patterns
			nameMatch = player
		end

		if plyMatch and nameMatch then -- Already have one
			return false
		end
		if nameMatch then
			plyMatch = nameMatch
		end
	end

	if not plyMatch then
		return false
	end

	return plyMatch
end

net.Receive("spawnbotpanel", function(len, pl)
	if !table.HasValue(nlf.bot.config.adminpanel.access, pl:GetUserGroup()) then return false end
    local filenpcName = net.ReadString()

    if not filenpcName then
		DarkRP.notify( pl, 1, 4, nlf.bot.config.llanguage[loc].nlfbotl1 .. " " .. nlf.bot.config.llanguage[loc].nlfbotl2 )
        return
    end

    if file.Exists("nlf/" .. string.lower(game.GetMap()) .. "/npc_" .. filenpcName .. ".txt", "DATA") then
	DarkRP.notify( pl, 1, 4,nlf.bot.config.llanguage[loc].nlfbotl1 .. " " .. nlf.bot.config.llanguage[loc].nlfbotl3 .. " " .. filenpcName .. nlf.bot.config.llanguage[loc].nlfbotl4)
        return
    end

    local npcVector = string.Explode(" ", tostring(pl:GetEyeTrace().HitPos))
    local npcAngles = string.Explode(" ", tostring(pl:GetAngles() + Angle(0, -180, 0)))
    file.Write("nlf/" .. string.lower(game.GetMap()) .. "/npc_" .. filenpcName .. ".txt", "" .. npcVector[1] .. " " .. npcVector[2] .. " " .. npcVector[3] .. " " .. npcAngles[1] .. " " .. npcAngles[2] .. " " .. npcAngles[3] .. "", "DATA")
	DarkRP.notify( pl, 3, 4, nlf.bot.config.llanguage[loc].nlfbotl1 .. " " .. nlf.bot.config.llanguage[loc].nlfbotl5)
	SpawnNLFbot()
end)

net.Receive("nlfadminpanel", function(len, pl)
	   		net.Start( "nlfadminpanel" )
		net.Send(pl) 
end)


net.Receive("givemoneyonetime",function(len, pl)
    local LocalSteamID64 = pl:SteamID64()
    local LocalName = pl:Name()
	local LocalSteamID = pl:SteamID()
	local LocalMoney = nlf.bot.config.button[ net.ReadUInt(16) ].text

    if not file.IsDir("nlf", "DATA") then
        file.CreateDir("nlf")
    end
	
	    if not file.IsDir("nlf/givemoneyonetime", "DATA") then
        file.CreateDir("nlf/givemoneyonetime")
    end

    if not file.Exists("nlf/givemoneyonetime/"..LocalSteamID64..".txt", "DATA") then

			
      file.Write("nlf/givemoneyonetime/"..LocalSteamID64..".txt" , "SteamID: "..LocalSteamID .. " Amount: ".. LocalMoney .." Name: ".. LocalName)
		pl:addMoney( LocalMoney )
		DarkRP.notify( pl, 3, 4, nlf.bot.config.llanguage[loc].nlfbotl27 .. LocalMoney .. nlf.bot.config.llanguage[loc].nlfbotl28)
		else 
		DarkRP.notify( pl, 1, 4, nlf.bot.config.llanguage[loc].nlfbotl29)
		end
end)

hook.Add( "PlayerSay", "nlf_botcommand", function( ply, text, team )
	if  table.HasValue(nlf.bot.config.adminpanel.access, ply:GetUserGroup()) and text == nlf.bot.config.adminpanel.command then
		net.Start( "nlfadminpanel" )
		net.Send(ply) 
		
		return ""
		
	end
	
	if  table.HasValue(nlf.bot.config.adminpanel.access, ply:GetUserGroup()) and text == nlf.bot.config.adminpanel.saveposs then
		savenpcposs(ply)
		
		return ""
		
	end
end)

net.Receive("deleteonebot", function(len, pl)
	if !table.HasValue(nlf.bot.config.adminpanel.access, pl:GetUserGroup()) then return false end
    local LocalName = pl:Name()
    local LocalNameBot = net.ReadString()

    if file.Exists("nlf/" .. string.lower(game.GetMap()) .. "/npc_" .. LocalNameBot .. ".txt", "DATA") then
        file.Delete("nlf/" .. string.lower(game.GetMap()) .. "/npc_" .. LocalNameBot .. ".txt")
		SpawnNLFbot()
        DarkRP.notify(pl, 3, 4, nlf.bot.config.llanguage[loc].nlfbotl30 .. LocalNameBot .. nlf.bot.config.llanguage[loc].nlfbotl31)
		MsgC(Color(137, 222, 255), nlf.bot.config.llanguage[loc].nlfbotl1, Color(0, 0, 0), LocalName .. nlf.bot.config.llanguage[loc].nlfbotl32 ..LocalNameBot, "\n")
    else
        DarkRP.notify(pl, 1, 4, nlf.bot.config.llanguage[loc].nlfbotl33 .. LocalNameBot .. nlf.bot.config.llanguage[loc].nlfbotl34)
		MsgC(Color(137, 222, 255), nlf.bot.config.llanguage[loc].nlfbotl1, Color(0, 0, 0), LocalName .. nlf.bot.config.llanguage[loc].nlfbotl35 ..LocalNameBot, "\n")
    end
end)

net.Receive("deleteonedataclient", function(len, pl)
	if !table.HasValue(nlf.bot.config.adminpanel.access, pl:GetUserGroup()) then return false end
    local LocalName = pl:Name()
    local LocalClientID = net.ReadString()
	if string.find(LocalClientID, "STEAM_") then 
		local LocalClientID64 = NLF_GUIDE_ConvertSteamID( LocalClientID )

		if file.Exists("nlf/givemoneyonetime/" .. LocalClientID64 .. ".txt", "DATA") then
			file.Delete("nlf/givemoneyonetime/" .. LocalClientID64 .. ".txt")
			DarkRP.notify(pl, 3, 4, nlf.bot.config.llanguage[loc].nlfbotl36 .. LocalClientID .. nlf.bot.config.llanguage[loc].nlfbotl37)
			MsgC(Color(137, 222, 255), nlf.bot.config.llanguage[loc].nlfbotl1, Color(0, 0, 0), LocalName .. nlf.bot.config.llanguage[loc].nlfbotl40.. LocalClientID, "\n")
		else
			DarkRP.notify(pl, 1, 4, nlf.bot.config.llanguage[loc].nlfbotl38 .. LocalClientID .. nlf.bot.config.llanguage[loc].nlfbotl39)
			MsgC(Color(137, 222, 255), nlf.bot.config.llanguage[loc].nlfbotl1, Color(0, 0, 0), LocalName .. nlf.bot.config.llanguage[loc].nlfbotl41.. LocalClientID, "\n")
		end
	else
	DarkRP.notify(pl, 1, 4, LocalClientID .. nlf.bot.config.llanguage[loc].nlfbotl42)	
	end
end)

net.Receive("deleteallbot", function(len, pl)
	if !table.HasValue(nlf.bot.config.adminpanel.access, pl:GetUserGroup()) then return false end
    local LocalName = pl:Name()

    for k, v in pairs(file.Find("nlf/" .. string.lower(game.GetMap()) .. "/*.txt", "DATA")) do
            file.Delete("nlf/" .. string.lower(game.GetMap()) .. "/" .. v)
			SpawnNLFbot()
            DarkRP.notify(pl, 3, 4, nlf.bot.config.llanguage[loc].nlfbotl43)
            MsgC(Color(137, 222, 255), nlf.bot.config.llanguage[loc].nlfbotl1, Color(0, 0, 0), LocalName ..  nlf.bot.config.llanguage[loc].nlfbotl45, "\n")
    end
end)

net.Receive("deletealldataclient", function(len, pl)
	if !table.HasValue(nlf.bot.config.adminpanel.access, pl:GetUserGroup()) then return false end
    local LocalName = pl:Name()

    for k, v in pairs(file.Find("nlf/givemoneyonetime/*.txt", "DATA")) do
            file.Delete("nlf/givemoneyonetime/" .. v)
            DarkRP.notify(pl, 3, 4, nlf.bot.config.llanguage[loc].nlfbotl46)
            MsgC(Color(137, 222, 255), nlf.bot.config.llanguage[loc].nlfbotl1, Color(0, 0, 0), LocalName .. nlf.bot.config.llanguage[loc].nlfbotl47, "\n")
    end
end)

net.Receive("findclientdata", function(len, pl)
	if !table.HasValue(nlf.bot.config.adminpanel.access, pl:GetUserGroup()) then return false end
	local player_type = net.ReadString()
	local LocalClientname = net.ReadString()
	
	if player_type == "playername" then
	
	local target_ply = nlf_getUser( LocalClientname )
	local LocalClientID64 = target_ply:SteamID64()
	
		if file.Exists("nlf/givemoneyonetime/" .. LocalClientID64 .. ".txt", "DATA") then
	 
		local Fileclientdata = file.Read("nlf/givemoneyonetime/" .. LocalClientID64 .. ".txt", "DATA")
		local Data = string.Explode(" ", Fileclientdata)
		net.Start( "showclientdata" )
		net.WriteString(Data[2])
		net.WriteString(LocalClientname)
		net.WriteString(Data[4])
		net.Send(pl) 
		end 
	end 
end)

net.Receive("findofflineclientdata", function(len, pl)
	if !table.HasValue(nlf.bot.config.adminpanel.access, pl:GetUserGroup()) then return false end
    local LocalClientID = net.ReadString()
	if string.find(LocalClientID, "STEAM_") then
	local LocalClientID64 = NLF_GUIDE_ConvertSteamID( LocalClientID )

		if file.Exists("nlf/givemoneyonetime/" .. LocalClientID64 .. ".txt", "DATA") then
		local Fileclientdata = file.Read("nlf/givemoneyonetime/" .. LocalClientID64 .. ".txt", "DATA")
			local Data = string.Explode(" ", Fileclientdata)
			net.Start( "showclientdata" )
			net.WriteString(Data[2])
			net.WriteString(Data[6])
			net.WriteString(Data[4])
			net.Send(pl)
		end
	else 
	DarkRP.notify(pl, 1, 4, LocalClientID ..  nlf.bot.config.llanguage[loc].nlfbotl42)
	end 
end)

net.Receive("findbotdata", function(len, pl)
	if !table.HasValue(nlf.bot.config.adminpanel.access, pl:GetUserGroup()) then return false end
local test = file.Find("nlf/" .. string.lower(game.GetMap()) .. "/npc_*.txt", "DATA")
        net.Start( "sendbotdata" )
        net.WriteTable(test)
        net.Send(pl)
end)

net.Receive("deletebotshowdata", function(len, pl) -- I add this function because LocalNameBotShowData = "NPC_XX.txt" not "XX"
	if !table.HasValue(nlf.bot.config.adminpanel.access, pl:GetUserGroup()) then return false end
    local LocalName = pl:Name()
    local LocalNameBotShowData = net.ReadString()

    if file.Exists("nlf/" .. string.lower(game.GetMap()) .. "/" .. LocalNameBotShowData, "DATA") then
        file.Delete("nlf/" .. string.lower(game.GetMap()) .. "/" .. LocalNameBotShowData )
        DarkRP.notify(pl, 3, 4, nlf.bot.config.llanguage[loc].nlfbotl30 .. LocalNameBotShowData .. nlf.bot.config.llanguage[loc].nlfbotl31)
		MsgC(Color(137, 222, 255), nlf.bot.config.llanguage[loc].nlfbotl1, Color(0, 0, 0), LocalName .. nlf.bot.config.llanguage[loc].nlfbotl32 ..LocalNameBotShowData, "\n")
		SpawnNLFbot()
    else
        DarkRP.notify(pl, 1, 4, nlf.bot.config.llanguage[loc].nlfbotl33 .. LocalNameBotShowData .. nlf.bot.config.llanguage[loc].nlfbotl34)
		MsgC(Color(137, 222, 255), nlf.bot.config.llanguage[loc].nlfbotl1, Color(0, 0, 0), LocalName .. nlf.bot.config.llanguage[loc].nlfbotl35 ..LocalNameBotShowData, "\n")
    end
end)

local function howuse()
	if file.Exists("nlf/" .. string.lower(game.GetMap()) .. "/howuse.txt", "DATA") then
			local fileuse = file.Read("nlf/" .. string.lower(game.GetMap()) .. "/howuse.txt", "DATA")
			local nomberuse = string.Explode(" ", fileuse)
			print( nomberuse[1])
		else
	end

end 

