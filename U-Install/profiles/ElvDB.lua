local E, L, C = unpack(select(2, ...))

local name, ace3 = "ElvDB", true
local profile = {
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
				["valuecolor"] = {
					["a"] = 1,
					["b"] = 1,
					["g"] = 0.611764705882353,
					["r"] = 0.1019607843137255,
				},
				["reputation"] = {
					["width"] = 162,
				},
				["autoRoll"] = true,
				["castNoInterrupt"] = {
				},
				["experience"] = {
					["height"] = 11,
					["width"] = 352,
				},
				["topPanel"] = false,
				["castColor"] = {
				},
				["BUFFS"] = {
				},
				["bottomPanel"] = false,
				["health"] = {
				},
			},
			["movers"] = {
				["BottomBarMover"] = "BOTTOMElvUIParentBOTTOM01",
				["PetAB"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-86167",
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
				["VehicleSeatMover"] = "TOPLEFTElvUIParentTOPLEFT169-4",
				["TempEnchantMover"] = "TOPLEFTElvUIParentTOPLEFT4-201",
				["ElvUF_TargetMover"] = "BOTTOMElvUIParentBOTTOM181160",
				["WatchFrameMover"] = "TOPRIGHTElvUIParentTOPRIGHT-40-275",
				["BNETMover"] = "TOPElvUIParentTOP0-23",
				["ShiftAB"] = "BOTTOMElvUIParentBOTTOM096",
				["ElvUF_PetMover"] = "BOTTOMElvUIParentBOTTOM0186",
				["ElvUF_PlayerCastbarMover"] = "BOTTOMElvUIParentBOTTOM066",
				["ElvUF_TargetCastbarMover"] = "BOTTOMElvUIParentBOTTOM181138",
				["TooltipMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-4-10",
				["ElvUF_TankMover"] = "TOPLEFTElvUIParentTOPLEFT4-341",
				["BossHeaderMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-166270",
				["TotemBarMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT3574",
				["ElvUF_PlayerMover"] = "BOTTOMElvUIParentBOTTOM-181160",
				["ArenaHeaderMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-132270",
				["AlertFrameMover"] = "TOPElvUIParentTOP0-469",
				["ReputationBarMover"] = "TOPLEFTElvUIParentTOPLEFT5-189",
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
				["panelHeight"] = 164,
				["tabFont"] = "Oswald Regular",
				["tabFontOutline"] = "OUTLINE",
				["tabFontSize"] = 11,
				["panelWidth"] = 352,
				["panelTabBackdrop"] = false,
			},
			["unitframe"] = {
				["fontSize"] = 15,
				["units"] = {
					["tank"] = {
						["enable"] = false,
					},
					["assist"] = {
						["enable"] = false,
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
					["targettarget"] = {
						["power"] = {
							["offset"] = 5,
						},
						["width"] = 110,
						["height"] = 33,
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
							["height"] = 7,
							["fill"] = "spaced",
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
							["width"] = 358,
							["displayTarget"] = true,
							["height"] = 22,
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
					["boss"] = {
						["debuffs"] = {
							["xOffset"] = 1,
							["yOffset"] = 13,
							["anchorPoint"] = "RIGHT",
							["perrow"] = 7,
						},
						["portrait"] = {
							["overlay"] = true,
						},
						["power"] = {
							["offset"] = 6,
							["text_format"] = "",
						},
						["width"] = 191,
						["name"] = {
							["text_format"] = "[name:medium]",
							["position"] = "TOPLEFT",
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
						["castbar"] = {
							["width"] = 191,
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
					["pet"] = {
						["power"] = {
							["offset"] = 5,
						},
						["width"] = 110,
						["height"] = 33,
					},
				},
				["OORAlpha"] = 0.25,
				["statusbar"] = "Normal",
				["colors"] = {
					["auraBarBuff"] = {
						["b"] = 0.1176470588235294,
						["g"] = 0.1176470588235294,
						["r"] = 0.1176470588235294,
					},
					["colorhealthbyvalue"] = false,
					["customhealthbackdrop"] = true,
					["health_backdrop"] = {
						["b"] = 0.1882352941176471,
						["g"] = 0.1882352941176471,
						["r"] = 0.1882352941176471,
					},
					["castColor"] = {
						["b"] = 0.1019607843137255,
						["g"] = 0.1019607843137255,
						["r"] = 0.1019607843137255,
					},
					["castNoInterrupt"] = {
						["r"] = 0.7803921568627451,
						["g"] = 0.2509803921568627,
						["b"] = 0.2509803921568627,
					},
					["health"] = {
						["b"] = 0.09019607843137255,
						["g"] = 0.09019607843137255,
						["r"] = 0.09411764705882353,
					},
					["auraBarDebuff"] = {
						["b"] = 0.2509803921568627,
						["g"] = 0.2509803921568627,
						["r"] = 0.7803921568627451,
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
					["LeftChatTab_Datatext_Panel"] = "Spec Switch",
					["Bottom_Datatext_Panel"] = {
						["right"] = "Gold",
						["left"] = "System",
						["middle"] = "Time",
					},
					["RightChatTab_Datatext_Panel"] = "",
					["RightChatTab_Datatext_Panel2"] = "",
					["LeftChatDataPanel"] = {
						["right"] = "Guild",
						["left"] = "Friends",
						["middle"] = "System",
					},
				},
				["bottomSize"] = 22,
				["ldbTwoWidth"] = 88,
				["ldbTwoMouseover"] = false,
				["topCenter"] = false,
				["enableTop"] = false,
				["ldbTwoDataPanel"] = 1,
				["ldbOneWidth"] = 88,
				["fontSize"] = 11,
				["bottomBar"] = true,
				["ldbThreeDataPanel"] = 3,
				["chatOffset"] = 4,
				["ldbThree"] = false,
				["topWidth"] = 350,
				["font"] = "Oswald Regular",
				["moveChats"] = false,
				["ldbOneMouseover"] = false,
				["ldbTwo"] = true,
				["ldbOne"] = true,
				["ldbOneDataPanel"] = 1,
				["xpRep"] = false,
				["leftChat"] = true,
				["ldbThreeMouseover"] = false,
				["enableBottom"] = false,
				["rightChat"] = false,
			},
			["loclite"] = {
				["dig"] = false,
				["lpwidth"] = 100,
				["dtheight"] = 18,
				["customCoordsColor"] = 2,
				["locpanel"] = false,
			},
			["layoutSet"] = "dpsMelee",
			["auras"] = {
				["fontSize"] = 12,
				["font"] = "Oswald Regular",
				["fontOutline"] = "OUTLINE",
				["consolidatedBuffs"] = {
					["font"] = "Oswald Regular",
					["filter"] = false,
					["enable"] = false,
					["fontSize"] = 12,
					["durations"] = false,
					["fontOutline"] = "OUTLINE",
				},
			},
			["actionbar"] = {
				["bar3"] = {
					["buttonsPerRow"] = 3,
					["buttonsize"] = 28,
				},
				["fontSize"] = 12,
				["noRangeColor"] = {
					["g"] = 0.1019607843137255,
					["b"] = 0.1019607843137255,
				},
				["microbar"] = {
					["enabled"] = true,
					["mouseover"] = true,
				},
				["bar2"] = {
					["enabled"] = true,
					["heightMult"] = 2,
					["buttonsize"] = 28,
				},
				["bar1"] = {
					["buttonsize"] = 28,
				},
				["bar5"] = {
					["buttonsPerRow"] = 3,
					["buttonsize"] = 28,
				},
				["font"] = "Oswald Regular",
				["fontOutline"] = "OUTLINE",
				["macrotext"] = true,
				["showGrid"] = false,
				["stanceBar"] = {
					["buttonspacing"] = 1,
					["buttonsize"] = 23,
				},
				["barPet"] = {
					["backdrop"] = false,
					["buttonsPerRow"] = 10,
					["buttonsize"] = 25,
				},
				["bar4"] = {
					["mouseover"] = true,
					["buttonsPerRow"] = 2,
					["buttonsize"] = 25,
					["backdrop"] = false,
				},
			},
}

E:RegisterProfile(name, profile, ace3)
