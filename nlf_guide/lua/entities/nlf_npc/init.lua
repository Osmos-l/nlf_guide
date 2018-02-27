AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");
include("shared.lua");
util.AddNetworkString( "nlfbotpanel" )

local loc =  nlf.bot.config.llanguage.LocalLang

function ENT:Initialize()
	self:SetModel(nlf.bot.config.skin);
	self:SetHullType(HULL_HUMAN);
	self:SetHullSizeNormal();
	self:SetNPCState(NPC_STATE_SCRIPT);
	self:SetSolid(SOLID_BBOX);
	self:SetUseType(SIMPLE_USE);
	self:SetBloodColor(BLOOD_COLOR_RED);
	
end;


function ENT:AcceptInput(name, activator, caller)	
	if (!self.nextUse or CurTime() >= self.nextUse) then
		if (name == "Use" and caller:IsPlayer()) then
				caller:SendLua("local tab={Color(255,255,255),[[".. nlf.bot.config.llanguage[loc].nlfbotl24 .."]],Color(0,75,255),[["..caller:Nick().."]],Color(255,255,255),[[!]]}chat.AddText(unpack(tab))");
	net.Start( "nlfbotpanel" )
		net.Send(caller) 
					else
				self:EmitSound("vo/npc/male01/sorry0"..math.random(1, 3)..".wav", 70, 100);
				caller:SendLua("local tab={Color(255,255,255),[["..nlf.bot.config.llanguage[loc].nlfbotl25 .."]]}chat.AddText(unpack(tab))");
			end;
		end;
		self.nextUse = CurTime() + 1;
	end;