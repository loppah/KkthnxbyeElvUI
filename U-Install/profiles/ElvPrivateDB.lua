local E, L, C = unpack(select(2, ...))

local name = "ElvPrivateDB"
local profile = {
  ["profileKeys"] = {
    [UnitName("player").." - "..GetRealmName()] = "Default",
  },
	["profiles"] = {
		["Default"] = {
			["skins"] = {
				["addons"] = {
					["EmbedSkada"] = true,
					["AlwaysTrue"] = true,
				},
			},
			["install_complete"] = "5.1",
		},
  },
}

E:RegisterProfile(name, profile)
