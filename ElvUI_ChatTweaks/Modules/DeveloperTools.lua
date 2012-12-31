-------------------------------------------------------------------------------
-- ElvUI Chat Tweaks By Lockslap (US, Bleeding Hollow)
-- <Borderline Amazing>, http://ba-guild.com
-- Based on functionality provided by Prat and/or Chatter
-------------------------------------------------------------------------------
local Module = ElvUI_ChatTweaks:NewModule("Developer Tools", "AceConsole-3.0")
local L = ElvUI_ChatTweaks.L
Module.name = L["Developer Tools"]
Module.namespace = string.gsub(Module.name, " ", "")

local db, options
local defaults = {
	profile = {
		chatEvents = {
			enable = true,
			watch = {
				["GUILD"] = false,
				["OFFICER"] = false,
				["CHANNEL"] = true,
				["SAY"] = false,
				["YELL"] = false,
				["RAID"] = false,
				["PARTY"] = false,
			},
			frame = "ChatFrame4",
		},
	}
}

local function MonitorChat(self, event, message, ...)
	if not db.chatEvents.enable then return false end
	local cf = _G[db.chatEvents.frame]
	local chan = event:match("CHAT_MSG_(.+)")
	if cf then
		cf:AddMessage(("|cff00ff96%s:|r |cffffffff%s|r"):format(chan, message))
	end
	return false
end

function Module:UpdateChannels()
	for index, value in pairs(db.chatEvents.watch) do
		local channel = ("CHAT_MSG_%s"):format(index:upper())
		if not value then
			ChatFrame_RemoveMessageEventFilter(channel, MonitorChat)
		else
			ChatFrame_AddMessageEventFilter(channel, MonitorChat)
		end
	end
end

function Module:OnEnable()
	self:RegisterChatCommand("ctdev", function(args)
		local command = self:GetArgs(args)
		
		if command == "version" then
			Module:Print((L["Version: |cff1784d1%s|r"]):format(select(1, GetBuildInfo())))
		elseif command == "build" then
			Module:Print((L["Build: |cff1784d1%s|r"]):format(select(2, GetBuildInfo())))
		elseif command == "date" then
			Module:Print((L["Build Date: |cff1784d1%s|r"]):format(select(3, GetBuildInfo())))
		elseif command == "interface" then
			Module:Print((L["TOC Version: |cff1784d1%s|r"]):format(select(4, GetBuildInfo())))
		elseif command == "locale" then
			Module:Print((L["Client Locale: |cff1784d1%s|r"]):format(GetLocale()))
		else
			Module:Print(L["Available parameters are |cff1784d1version|r, |cff1784d1build|r, |cff1784d1date|r, |cff1784d1interface|r, |cff1784d1locale|r."])
		end
	end)
	
	self:UpdateChannels()
end

function Module:OnDisable()
	self:UnregisterChatCommand("ctdev")
	
	for channel, _ in pairs(db.chatEvents.watch) do
		ChatFrame_RemoveMessageEventFilter(("CHAT_MSG_%s"):format(channel:upper()), MonitorChat)
	end
end

function Module:OnInitialize()
	self.db = ElvUI_ChatTweaks.db:RegisterNamespace(self.namespace, defaults)
	db = self.db.profile
	self.debug = ElvUI_ChatTweaks.db.profile.debugging
end

function Module:GetOptions()
	if not options then
		options = {
			chatEvents = {
				type = "group",
				order = 50,
				name = L["Chat Events"],
				args = {
					enable = {
						type = "toggle",
						order = 1,
						name = L["Monitor Chat Events"],
						desc = L["Toggle the monitoring of chat events."],
						get = function() return db.chatEvents.enable end,
						set = function(_, value) db.chatEvents.enable = value end,
					},
					frame = {
						type = "select",
						order = 2,
						name = L["Output Frame"],
						desc = L["Frame to output the messages to."],
						disabled = function() return not db.chatEvents.enable end,
						values = function()
							local frames = {}
							for i = 1, 18 do
								local cf = _G[("ChatFrame%d"):format(i)]
								if cf and cf ~= COMBATLOG then
									frames[("ChatFrame%d"):format(i)] = ("Chat Frame %d"):format(i)
								end
							end
							return frames
						end,
						get = function() return db.chatEvents.frame end,
						set = function(_, value) db.chatEvents.frame = value end,
					},
					watch = {
						type = "multiselect",
						order = 2,
						name = L["Channels to Watch"],
						desc = L["Select the channels you want to monitor."],
						disabled = function() return not db.chatEvents.enable end,
						values = {
							["GUILD"] = CHAT_MSG_GUILD,
							["OFFICER"] = CHAT_MSG_OFFICER,
							["CHANNEL"] = L["Num Channels"],
							["SAY"] = CHAT_MSG_SAY,
							["YELL"] = CHAT_MSG_YELL,
							["RAID"] = CHAT_MSG_RAID,
							["PARTY"] = CHAT_MSG_PARTY,
						},
						get = function(_, key) return db.chatEvents.watch[key] end,
						set = function(_, key, value) db.chatEvents.watch[key] = value; Module:UpdateChannels(); end,
					},
				},
			},
		}
	end
	return options
end

function Module:Info()
	return L["Provides a few tools to help me (Lockslap), develop this addon as well as diagnose and fix any errors that are reported.\n\n|cff00ff00You can leave this addon disabled unless I (Lockslap) ask you to enable it for some debugging.|r"]
end