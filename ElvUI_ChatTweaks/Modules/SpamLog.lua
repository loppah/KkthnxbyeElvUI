-------------------------------------------------------------------------------
-- ElvUI Chat Tweaks By Lockslap (US, Bleeding Hollow)
-- <Borderline Amazing>, http://ba-guild.com
-- Based on functionality provided by Prat and/or Chatter
-------------------------------------------------------------------------------
local Module = ElvUI_ChatTweaks:NewModule("Spam Log", "AceConsole-3.0")
local L = ElvUI_ChatTweaks.L
Module.name = L["Spam Log"]
Module.namespace = string.gsub(Module.name, " ", "")

local db, options
local defaults = {
	profile = {
		notice = true,
		maxLines = 50,
		crap = {},
		guild = {},
		spam = {},
		whisper = {},
	}
}

-- get the config for each spam module
local configs, objects = {}, {}

local modules = {
	crap = L["Crap Cleaner"],
	guild = L["Guild Spam"],
	spam = L["Spam Filter"],
	whisper = L["Whisper Filter"],
}

function Module:AddToLog(name, event, player, message)
	local channel = event:match("CHAT_MSG_(.+)")
	if not name or not db[name] or not event or not player or not message then return end
	local dump = ("[%s][%s][%s]: %s"):format(date("%Y-%m-%d %H:%M:%S"), channel or event, player, message)
	tinsert(db[name], dump)
end

function Module:ClearLog(name)
	if db[name] and #db[name] > 0 then
		db[name] = {}
		self:Print((L["Cleared log of %s%s|r module."]):format(ElvUI_ChatTweaks.hexColor, modules[name]))
	else
		self:Print(L["Module doesn't exist, or log is empty."])
	end
end

function Module:OnEnable()
	-- trim the tables to max lines
	if #db.crap > db.maxLines then
		for i = 1, (#db.crap - db.maxLines) do
			tremove(db.crap, 1)
		end
	end
	
	if #db.guild > db.maxLines then
		for i = 1, (#db.guild - db.maxLines) do
			tremove(db.guild, 1)
		end
	end
	
	if #db.spam > db.maxLines then
		for i = 1, (#db.spam - db.maxLines) do
			tremove(db.spam, 1)
		end
	end
	
	if #db.whisper > db.maxLines then
		for i = 1, (#db.whisper - db.maxLines) do
			tremove(db.whisper, 1)
		end
	end
	
	-- get the modules in case we need the defaults
	objects = {
		crap = ElvUI_ChatTweaks:GetModule("Crap Cleaner"),
		guild = ElvUI_ChatTweaks:GetModule("Guild Spam"),
		spam = ElvUI_ChatTweaks:GetModule("Spam Filter"),
		whisper = ElvUI_ChatTweaks:GetModule("Whisper Filter"),
	}
	
	-- load the configs from the spam modules
	configs = {
		crap = ElvUI_ChatTweaks.db:GetNamespace(objects.crap.namespace) or objects.crap:GetDefaults(),
		guild = ElvUI_ChatTweaks.db:GetNamespace(objects.guild.namespace) or objects.guild:GetDefaults(),
		spam = ElvUI_ChatTweaks.db:GetNamespace(objects.spam.namespace) or objects.spam:GetDefaults(),
		whisper = ElvUI_ChatTweaks.db:GetNamespace(objects.whisper.namespace) or objects.whisper:GetDefaults(),
	}
end

function Module:OnInitialize()
	self.db = ElvUI_ChatTweaks.db:RegisterNamespace(Module.namespace, defaults)
	db = self.db.profile
	Module.debug = ElvUI_ChatTweaks.db.profile.debugging
end

function Module:TableToString(tbl)
	if #tbl == 0 then return false end
	local out = ""
	for i = 1, #tbl do
		if tbl[i]:trim() ~= "" and tbl[i]:trim() ~= nil then
			out = out .. ("%s\n"):format(tbl[i])
		end
	end
	return out
end

function Module:StringToTable(str)
	if str:trim() == "" or str:trim() == nil then return false end
	local tbl, lines = {}, {str.split("\n")}
	for _, line in ipairs(lines) do
		if line:trim() ~= "" and line:trim() ~= nil then
			tbl[#tbl + 1] = line
		end
	end
	return tbl
end

function Module:GetOptions()
	if not options then
		options = {
			notice = {
				type = "toggle",
				order = 13,
				name = L["Log Notice"],
				desc = L["Send a notice when something is added to the log."],
				get = function() return db.notice end,
				set = function(_, value) db.notice = value end,
			},
			maxLines = {
				type = "range",
				order = 14,
				name = L["Maximum Lines"],
				desc = L["Maximum number of lines to keep."],
				min = 25, max = 100, step = 5,
				get = function() return db.maxLines end,
				set = function(_, value) db.maxLines = value end,
			},
			dummy = {
				type = "description",
				order = 15,
				width = "full",
				name = "",
			},
			clearAll = {
				type = "execute",
				order = 16,
				width = "double",
				name = L["Clear All Logs"],
				func = function()
					db.crap = {}
					db.guild = {}
					db.spam = {}
					db.whisper = {}
					Module:Print(L["All spam logs were cleared."])
				end,
			},
			crap = {
				type = "group",
				order = 98,
				name = L["Crap Cleaner"],
				disabled = function() return not configs.crap.profile.logging or true end,
				args = {
					about = {
						type = "description",
						order = 1,
						name = (L["This will contain the lines that were filtered by the |cff00ff96%s|r module.  You must have the logging setting enabled in the module's config."]):format(L["Crap Cleaner"]),
						width = "full",
					},
					clear = {
						type = "execute",
						order = 2,
						name = L["Clear Log"],
						func = function() Module:ClearLog("crap") end,
					},
					lines = {
						type = "input",
						order = 3,
						multiline = 25,
						width = "full",
						name = L["Log Lines"],
						get = function() return Module:TableToString(db.crap) or L["Log is empty."] end,
						set = function(_, value) db.crap = Module:StringToTable(value) end,
					},
				},
			},
			guild = {
				type = "group",
				order = 99,
				name = L["Guild Spam"],
				disabled = function() return not configs.guild.profile.logging or true end,
				args = {
					about = {
						type = "description",
						order = 1,
						name = (L["This will contain the lines that were filtered by the |cff00ff96%s|r module.  You must have the logging setting enabled in the module's config."]):format(L["Guild Spam"]),
						width = "full",
					},
					clear = {
						type = "execute",
						order = 2,
						name = L["Clear Log"],
						func = function() Module:ClearLog("guild") end,
					},
					lines = {
						type = "input",
						order = 3,
						width = "full",
						multiline = 25,
						name = L["Log Lines"],
						get = function() return Module:TableToString(db.guild) or L["Log is empty."] end,
						set = function(_, value) db.guild = Module:StringToTable(value) end,
					},
				},
			},
			spam = {
				type = "group",
				order = 100,
				name = L["Spam Filter"],
				disabled = function() return not configs.spam.profile.logging or true end,
				args = {
					about = {
						type = "description",
						order = 1,
						name = (L["This will contain the lines that were filtered by the |cff00ff96%s|r module.  You must have the logging setting enabled in the module's config."]):format(L["Spam Filter"]),
						width = "full",
					},
					clear = {
						type = "execute",
						order = 2,
						name = L["Clear Log"],
						func = function() Module:ClearLog("spam") end,
					},
					lines = {
						type = "input",
						order = 3,
						width = "full",
						multiline = 25,
						name = L["Log Lines"],
						get = function() return Module:TableToString(db.spam) or L["Log is empty."] end,
						set = function(_, value) db.spam = Module:StringToTable(value) end,
					},
				},
			},
			whisper = {
				type = "group",
				order = 101,
				name = L["Whisper Filter"],
				disabled = function() return not configs.whisper.profile.logging or true end,
				args = {
					about = {
						type = "description",
						order = 1,
						name = (L["This will contain the lines that were filtered by the |cff00ff96%s|r module.  You must have the logging setting enabled in the module's config."]):format(L["Whisper Filter"]),
						width = "full",
					},
					clear = {
						type = "execute",
						order = 2,
						name = L["Clear Log"],
						func = function() Module:ClearLog("whisper") end,
					},
					lines = {
						type = "input",
						order = 3,
						width = "full",
						multiline = 25,
						name = L["Log Lines"],
						get = function() return Module:TableToString(db.whisper) or L["Log is empty."] end,
						set = function(_, value) db.whisper = Module:StringToTable(value) end,
					},
				},
			},
		}
	end
	return options
end

function Module:Info()
	return (L["Logs the lines that are filtered by the |cff00ff96%s|r, |cff00ff96%s|r, |cff00ff96%s|r, and |cff00ff96%s|r modules."]):format(L["Crap Cleaner"], L["Guild Spam"], L["Spam Filter"], L["Whisper Filter"])
end