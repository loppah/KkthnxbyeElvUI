-------------------------------------------------------------------------------
-- ElvUI Chat Tweaks By Lockslap (US, Bleeding Hollow)
-- <Borderline Amazing>, http://ba-guild.com
-- Based on functionality provided by Prat and/or Chatter
-------------------------------------------------------------------------------
local Module = ElvUI_ChatTweaks:NewModule("Timestamps", "AceHook-3.0", "AceEvent-3.0", "AceConsole-3.0")
local L = ElvUI_ChatTweaks.L
Module.name = L["Timestamps"]
Module.namespace = string.gsub(Module.name, " ", "")

local format = string.format

local tsFormat
local tsColor

local db
local options
local defaults = {
	profile = {
		format = "%X",
		color = { r = 0.45, g = 0.45, b = 0.45 },
		frames = {
			[1] = true,
			[3] = true,
			[4] = true,
			[5] = true,
			[6] = true,
			[7] = true,
		}
	}
}

function Module:AddMessage(frame, text, ...)
	local id = frame:GetID()
	if id and db.frames[id] and not(CHAT_TIMESTAMP_FORMAT) then
		if not text then 
			return self.hooks[frame].AddMessage(frame, text, ...)
		end
		if db.colorByChannel then
			text = date(tsFormat) .. " " .. text
		else
			text = "|cff" .. tsColor .. date(tsFormat) .. "|r " .. text
		end
	end
	return self.hooks[frame].AddMessage(frame, text, ...)
end

function Module:Decorate(frame)
	if not self:IsHooked(frame, "AddMesage") then
		self:RawHook(frame, "AddMessage", true)
	end
end

function Module:OnInitialize()
	self.db = ElvUI_ChatTweaks.db:RegisterNamespace(Module.namespace, defaults)
	db = self.db.profile
	self.debug = ElvUI_ChatTweaks.db.profile.debugging
end

function Module:OnEnable()
	tsFormat = db.customFormat or "[" .. db.format .. "]"
	tsColor = ("%02x%02x%02x"):format(db.color.r * 255, db.color.g * 255, db.color.b * 255)
	for i = 1, NUM_CHAT_WINDOWS do
		local cf = _G[format("ChatFrame%d", i)]
		if cf ~= COMBATLOG then
			self:RawHook(cf, "AddMessage", true)
		end
	end
	for _, frame in ipairs(self.TempChatFrames) do
		self:RawHook(_G[frame], "AddMessage", true)
	end
	
	-- disable blizzard's default timestamps
	if GetCVar("showTimestamps") ~= "none" then
		SetCVar("showTimestamps", "none")
	end
end

function Module:OnDisable()
	for i = 1, NUM_CHAT_WINDOWS do
		local cf = _G[format("ChatFrame%d", i)]
		if cf ~= COMBATLOG and self:IsHooked(cf, "AddMessage") then
			self:Unhook(cf, "AddMessage")
		end
	end
	for _, frame in ipairs(self.TempChatFrames) do
		local cf = _G[frame]
		if self:IsHooked(cf, "AddMessage") then
			self:Unhook(cf, "AddMessage")
		end
	end
end

function Module:Info()
	return L["Adds a timestamp to each line of text."]
end

function Module:GetOptions()
	if not options then
		options = {
			format = {
				type = "select",
				name = L["Timestamp format"],
				desc = L["Timestamp format"],
				values = {
					["%I:%M:%S %p"]	= L["HH:MM:SS AM (12-hour)"],
					["%I:%M:S"]		= L["HH:MM (12-hour)"],
					["%X"]			= L["HH:MM:SS (24-hour)"],
					["%I:%M"]		= L["HH:MM (12-hour)"],
					["%H:%M"]		= L["HH:MM (24-hour)"],
					["%M:%S"]		= L["MM:SS"],
				},
				get = function() return db.format end,
				set = function(info, v)
					db.format = v
					tsFormat = ("[" .. v .. "]")
				end,
				order = 13,
			},
			customFormat = {
				type = "input",
				name = L["Custom format (advanced)"],
				desc = L["Enter a custom time format. See http://www.lua.org/pil/22.1.html for a list of valid formatting symbols."],
				get = function() return db.customFormat end,
				set = function(info, v)
					if #v == 0 then v = nil end
					db.customFormat = v
					tsFormat = v
				end,
				order = 14,		
			},
			color = {
				type = "color",
				name = L["Timestamp color"],
				desc = L["Timestamp color"],
				get = function()
					local c = db.color
					return c.r, c.g, c.b
				end,
				set = function(info, r, g, b, a)
					local c = db.color
					c.r, c.g, c.b = r, g, b
					tsColor = ("%02x%02x%02x"):format(r * 255, g * 255, b * 255)
				end,
				disabled = function() return db.colorByChannel end,
				order = 16,
			},
			useChannelColor = {
				type = "toggle",
				name = L["Use channel color"],
				desc = L["Color timestamps the same as the channel they appear in."],
				get = function()
					return db.colorByChannel
				end,
				set = function(info, v)
					db.colorByChannel = v
				end,
				order = 15,
			},
			frames = {
				type = "multiselect",
				name = L["Chat Frame Settings"],
				desc = L["Choose which chat frames display timestamps"],
				values = function()
					local frameStr, display = "ChatFrame%d", L["ChatFrame %d"]
					local frames = {}
					for i = 1, 18 do
						local cf = _G[frameStr:format(i)]
						if cf and cf ~= COMBATLOG then
							frames[i] = display:format(i)
						end
					end
					return frames
				end,
				get = function(info, k) return db.frames[k] end,
				set = function(info, k, v) db.frames[k] = v end,
				order = 100,
			},
		}
	end
	return options
end