local E, L, C = unpack(select(2, ...))

local name = "ElvDB"
local profile = {
  ["profileKeys"] = {
    [UnitName("player").." - "..GetRealmName()] = "Default",
  },
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
		},
	},
	["profiles"] = {
		["Default"] = {
			["nameplate"] = {
				["fontSize"] = 9,
				["auraFontOutline"] = "OUTLINE",
				["fontOutline"] = "OUTLINE",
				["enhancethreat"] = false,
				["auraFont"] = "Oswald Bold",
				["combat"] = true,
				["font"] = "Oswald Bold",
				["height"] = 9,
				["width"] = 100,
			},
			["currentTutorial"] = 1,
			["general"] = {
				["totems"] = {
					["spacing"] = 3,
					["size"] = 37,
				},
				["minimap"] = {
					["locationText"] = "HIDE",
					["size"] = 160,
				},
				["health_backdrop"] = {
				},
				["DEBUFFS"] = {
				},
				["backdropfadecolor"] = {
					["a"] = 0.8200000077486038,
					["b"] = 0.05882352941176471,
					["g"] = 0.05882352941176471,
					["r"] = 0.05882352941176471,
				},
				["valuecolor"] = {
					["a"] = 1,
					["r"] = 0.05882352941176471,
					["g"] = 0.5137254901960784,
					["b"] = 0.9372549019607843,
				},
				["reputation"] = {
					["width"] = 162,
				},
				["autoRoll"] = true,
				["castNoInterrupt"] = {
				},
				["health"] = {
				},
				["topPanel"] = false,
				["castColor"] = {
				},
				["BUFFS"] = {
				},
				["bottomPanel"] = false,
				["experience"] = {
					["height"] = 11,
					["width"] = 352,
				},
			},
			["movers"] = {
				["BottomBarMover"] = "BOTTOMElvUIParentBOTTOM01",
				["PetAB"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-84169",
				["LocationLiteMover"] = "TOPElvUIParentTOP0-4",
				["GMMover"] = "TOPLEFTElvUIParentTOPLEFT169-4",
				["BossButton"] = "BOTTOMElvUIParentBOTTOM0355",
				["LootFrameMover"] = "BOTTOMElvUIParentBOTTOM0465",
				["AurasMover"] = "TOPRIGHTElvUIParentTOPRIGHT-4-4",
				["ElvUF_FocusMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT503284",
				["ExtraOneMover"] = "BOTTOMElvUIParentBOTTOM2271",
				["MicrobarMover"] = "TOPElvUIParentTOP0-23",
				["ExtraTwoMover"] = "BOTTOMElvUIParentBOTTOM-2271",
				["ExperienceBarMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT4169",
				["ElvUF_TargetTargetMover"] = "BOTTOMElvUIParentBOTTOM0151",
				["LossControlMover"] = "TOPElvUIParentTOP0-492",
				["ElvAB_1"] = "BOTTOMElvUIParentBOTTOM034",
				["ElvAB_2"] = "BOTTOMElvUIParentBOTTOM04",
				["ElvAB_4"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-3574",
				["AltPowerBarMover"] = "BOTTOMElvUIParentBOTTOM0280",
				["ElvAB_3"] = "BOTTOMElvUIParentBOTTOM2304",
				["ElvAB_5"] = "BOTTOMElvUIParentBOTTOM-2304",
				["TempEnchantMover"] = "TOPLEFTElvUIParentTOPLEFT4-201",
				["VehicleSeatMover"] = "TOPLEFTElvUIParentTOPLEFT169-4",
				["ReputationBarMover"] = "TOPLEFTElvUIParentTOPLEFT5-189",
				["BNETMover"] = "TOPElvUIParentTOP0-23",
				["ShiftAB"] = "BOTTOMElvUIParentBOTTOM096",
				["TotemBarMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT3574",
				["WatchFrameMover"] = "TOPRIGHTElvUIParentTOPRIGHT-40-275",
				["ArenaHeaderMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-132270",
				["TooltipMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-4-10",
				["ElvUF_TankMover"] = "TOPLEFTElvUIParentTOPLEFT4-341",
				["BossHeaderMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-166270",
				["ElvUF_PlayerMover"] = "BOTTOMElvUIParentBOTTOM-181160",
				["ElvUF_PlayerCastbarMover"] = "BOTTOMElvUIParentBOTTOM067",
				["ElvUF_PetMover"] = "BOTTOMElvUIParentBOTTOM0186",
				["AlertFrameMover"] = "TOPElvUIParentTOP0-469",
				["ElvUF_TargetMover"] = "BOTTOMElvUIParentBOTTOM181160",
				["MinimapMover"] = "TOPLEFTElvUIParentTOPLEFT4-4",
			},
			["tooltip"] = {
				["combathide"] = true,
				["count"] = false,
			},
			["hideTutorial"] = 1,
			["chat"] = {
				["fontOutline"] = "OUTLINE",
				["chatHistory"] = false,
				["tabFontOutline"] = "OUTLINE",
				["tabFont"] = "Oswald Regular",
				["tabFontSize"] = 11,
				["panelHeight"] = 164,
				["panelWidth"] = 352,
			},
			["unitframe"] = {
				["fontSize"] = 15,
				["units"] = {
					["tank"] = {
						["enable"] = false,
					},
					["targettarget"] = {
						["power"] = {
							["offset"] = 5,
						},
						["width"] = 110,
						["height"] = 33,
					},
					["raid10"] = {
						["power"] = {
							["offset"] = 5,
						},
						["width"] = 68,
						["health"] = {
							["text_format"] = "[health:deficit]",
						},
					},
					["focustarget"] = {
						["power"] = {
							["offset"] = 7,
						},
					},
					["pet"] = {
						["power"] = {
							["offset"] = 5,
						},
						["width"] = 110,
						["height"] = 33,
					},
					["boss"] = {
						["debuffs"] = {
							["xOffset"] = 1,
							["perrow"] = 7,
							["anchorPoint"] = "RIGHT",
							["yOffset"] = 13,
						},
						["portrait"] = {
							["overlay"] = true,
						},
						["power"] = {
							["offset"] = 6,
							["text_format"] = "",
						},
						["width"] = 191,
						["castbar"] = {
							["width"] = 191,
						},
						["health"] = {
							["text_format"] = "[healthcolor][health:current-percent]",
						},
						["height"] = 45,
						["buffs"] = {
							["yOffset"] = 8,
							["numrows"] = 2,
							["perrow"] = 7,
						},
						["name"] = {
							["text_format"] = "[name:medium]",
							["position"] = "TOPLEFT",
						},
					},
					["target"] = {
						["combobar"] = {
							["height"] = 8,
							["fill"] = "spaced",
						},
						["debuffs"] = {
							["sizeOverride"] = 25,
						},
						["portrait"] = {
							["overlay"] = true,
							["enable"] = true,
							["camDistanceScale"] = 1.3,
						},
						["power"] = {
							["offset"] = 7,
							["position"] = "BOTTOMLEFT",
							["hideonnpc"] = false,
							["text_format"] = "",
						},
						["customTexts"] = {
						},
						["healPrediction"] = false,
						["width"] = 235,
						["health"] = {
							["position"] = "TOPLEFT",
						},
						["castbar"] = {
							["width"] = 235,
						},
						["height"] = 50,
						["buffs"] = {
							["sizeOverride"] = 25,
						},
						["name"] = {
							["text_format"] = "[namecolor][name:medium] [difficultycolor][level][shortclassification]",
							["position"] = "TOPRIGHT",
						},
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["party"] = {
						["debuffs"] = {
							["sizeOverride"] = 30,
							["yOffset"] = 4,
							["initialAnchor"] = "TOPLEFT",
							["xOffset"] = 1,
						},
						["roleIcon"] = {
							["position"] = "BOTTOMLEFT",
						},
						["targetsGroup"] = {
							["initialAnchor"] = "BOTTOM",
						},
						["power"] = {
							["offset"] = 6,
							["text_format"] = "",
						},
						["healPrediction"] = true,
						["name"] = {
							["text_format"] = "[namecolor][name:medium]",
							["position"] = "TOPLEFT",
						},
						["height"] = 45,
						["petsGroup"] = {
							["initialAnchor"] = "BOTTOM",
						},
					},
					["raid40"] = {
						["power"] = {
							["offset"] = 5,
							["enable"] = true,
						},
						["width"] = 68,
						["health"] = {
							["text"] = true,
						},
						["height"] = 33,
					},
					["focus"] = {
						["power"] = {
							["offset"] = 4,
						},
						["width"] = 115,
						["name"] = {
							["text_format"] = "[name:medium]",
						},
						["castbar"] = {
							["width"] = 115,
						},
						["raidicon"] = {
							["enable"] = false,
						},
					},
					["raid25"] = {
						["power"] = {
							["offset"] = 5,
						},
						["width"] = 68,
						["health"] = {
							["text_format"] = "[health:deficit]",
						},
					},
					["arena"] = {
						["power"] = {
							["offset"] = 7,
						},
						["width"] = 225,
						["health"] = {
							["text_format"] = "[healthcolor][health:current-percent]",
						},
						["height"] = 45,
						["castbar"] = {
							["width"] = 225,
						},
					},
					["player"] = {
						["debuffs"] = {
							["sizeOverride"] = 25,
							["attachTo"] = "BUFFS",
						},
						["portrait"] = {
							["overlay"] = true,
							["enable"] = true,
							["camDistanceScale"] = 1.3,
						},
						["classbar"] = {
							["height"] = 5,
							["fill"] = "filled",
						},
						["aurabar"] = {
							["enable"] = false,
						},
						["restIcon"] = false,
						["power"] = {
							["offset"] = 7,
							["position"] = "BOTTOMRIGHT",
							["text_format"] = "",
						},
						["customTexts"] = {
						},
						["healPrediction"] = false,
						["width"] = 235,
						["health"] = {
							["position"] = "TOPRIGHT",
						},
						["name"] = {
							["text_format"] = "[namecolor][name:medium] [difficultycolor][level]",
							["position"] = "TOPLEFT",
						},
						["height"] = 50,
						["buffs"] = {
							["sizeOverride"] = 25,
							["enable"] = true,
							["noDuration"] = false,
							["attachTo"] = "FRAME",
						},
						["castbar"] = {
							["width"] = 362,
							["displayTarget"] = true,
							["height"] = 21,
						},
					},
					["assist"] = {
						["enable"] = false,
					},
				},
				["OORAlpha"] = 0.25,
				["statusbar"] = "Flatt",
				["colors"] = {
					["auraBarBuff"] = {
						["r"] = 0.1176470588235294,
						["g"] = 0.1176470588235294,
						["b"] = 0.1176470588235294,
					},
					["colorhealthbyvalue"] = false,
					["customhealthbackdrop"] = true,
					["health_backdrop"] = {
						["r"] = 0.1882352941176471,
						["g"] = 0.1882352941176471,
						["b"] = 0.1882352941176471,
					},
					["castColor"] = {
						["r"] = 0.1019607843137255,
						["g"] = 0.1019607843137255,
						["b"] = 0.1019607843137255,
					},
					["castNoInterrupt"] = {
						["b"] = 0.2509803921568627,
						["g"] = 0.2509803921568627,
						["r"] = 0.7803921568627451,
					},
					["health"] = {
						["r"] = 0.09411764705882353,
						["g"] = 0.09019607843137255,
						["b"] = 0.09019607843137255,
					},
					["auraBarDebuff"] = {
						["r"] = 0.7803921568627451,
						["g"] = 0.2509803921568627,
						["b"] = 0.2509803921568627,
					},
				},
				["fontOutline"] = "OUTLINE",
				["font"] = "BigNoodleTitling",
			},
			["datatexts"] = {
				["ldbThreeWidth"] = 330,
				["topSize"] = 22,
				["bottomWidth"] = 358,
				["expMouseover"] = false,
				["panels"] = {
					["LeftMiniPanel"] = "Spec Switch",
					["RightChatDataPanel"] = {
						["right"] = "Durability",
						["left"] = "Skada",
						["middle"] = "Gold",
					},
					["LDB_One"] = {
						["left"] = "Bags",
						["middle"] = "Bags",
					},
					["LDB_Two"] = {
						["left"] = "Spec Switch",
						["middle"] = "Spec Switch",
					},
					["RightMiniPanel"] = "Time",
					["LeftChatDataPanel"] = {
						["right"] = "Guild",
						["left"] = "Friends",
						["middle"] = "System",
					},
					["RightChatTab_Datatext_Panel"] = "",
					["Bottom_Datatext_Panel"] = {
						["right"] = "Gold",
						["left"] = "System",
						["middle"] = "Time",
					},
					["RightChatTab_Datatext_Panel2"] = "",
					["LeftChatTab_Datatext_Panel"] = "Spec Switch",
				},
				["bottomSize"] = 22,
				["ldbTwoWidth"] = 88,
				["ldbOneDataPanel"] = 1,
				["font"] = "Oswald Regular",
				["enableTop"] = false,
				["ldbTwoDataPanel"] = 1,
				["ldbOneWidth"] = 88,
				["fontSize"] = 11,
				["bottomBar"] = true,
				["ldbThreeDataPanel"] = 3,
				["chatOffset"] = 4,
				["ldbTwoMouseover"] = false,
				["topWidth"] = 350,
				["topCenter"] = false,
				["moveChats"] = false,
				["ldbOneMouseover"] = false,
				["ldbTwo"] = true,
				["ldbOne"] = true,
				["ldbThree"] = false,
				["xpRep"] = false,
				["leftChat"] = true,
				["ldbThreeMouseover"] = false,
				["enableBottom"] = false,
				["rightChat"] = false,
			},
			["loclite"] = {
				["dtheight"] = 18,
				["lpwidth"] = 100,
				["dig"] = false,
				["customCoordsColor"] = 2,
				["locpanel"] = false,
			},
			["layoutSet"] = "dpsMelee",
			["actionbar"] = {
				["bar3"] = {
					["backdrop"] = true,
					["buttonsPerRow"] = 3,
					["buttonsize"] = 28,
				},
				["fontSize"] = 12,
				["fontOutline"] = "OUTLINE",
				["microbar"] = {
					["enabled"] = true,
					["mouseover"] = true,
				},
				["bar2"] = {
					["enabled"] = true,
					["backdrop"] = true,
					["heightMult"] = 2,
					["buttonsize"] = 28,
				},
				["bar1"] = {
					["backdrop"] = true,
					["buttonsize"] = 28,
				},
				["bar5"] = {
					["backdrop"] = true,
					["buttonsPerRow"] = 3,
					["buttonsize"] = 28,
				},
				["font"] = "Oswald Regular",
				["noRangeColor"] = {
					["g"] = 0.1019607843137255,
					["b"] = 0.1019607843137255,
				},
				["macrotext"] = true,
				["stanceBar"] = {
					["buttonspacing"] = 1,
					["backdrop"] = true,
					["buttonsize"] = 23,
				},
				["barPet"] = {
					["buttonsPerRow"] = 10,
					["buttonsize"] = 25,
				},
				["bar4"] = {
					["mouseover"] = true,
					["buttonsPerRow"] = 2,
					["buttonsize"] = 25,
				},
			},
			["auras"] = {
				["fontSize"] = 12,
				["font"] = "Oswald Regular",
				["fontOutline"] = "OUTLINE",
				["consolidatedBuffs"] = {
					["font"] = "Oswald Regular",
					["filter"] = false,
					["enable"] = false,
					["fontOutline"] = "OUTLINE",
					["durations"] = false,
					["fontSize"] = 12,
				},
			},
		},
	},
}

E:RegisterProfile(name, profile)
