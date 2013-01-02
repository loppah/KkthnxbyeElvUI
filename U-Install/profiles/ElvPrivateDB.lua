local E, L, C = unpack(select(2, ...))

local name, ace3 = "ElvPrivateDB", true
local profile = {
   		["general"] = {
			["normTex"] = "Flatt",
			["glossTex"] = "Flatt",
		},
		['auras'] = {
			['enable'] = true,
			['size'] = 28,
		},	
		["skins"] = {
			["addons"] = {
				["EmbedRight"] = true,
				["EmbedRecount"] = true,
				["EmbedSkada"] = true,
				["AlwaysTrue"] = true,
				["EmbedOoC"] = true,
			},
		},
		["install_complete"] = "5.1",
	}

E:RegisterProfile(name, profile, ace3)
