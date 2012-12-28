local E, L, C = unpack(select(2, ...))

local name, ace3 = "ElvDB", true
local profile = {
			["nameplate"] = {
				["enhancethreat"] = false,
				["fontSize"] = 9,
				["combat"] = true,
				["auraFont"] = "Oswald Bold",
				["width"] = 100,
				["font"] = "Oswald Bold",
				["fontOutline"] = "OUTLINE",
				["height"] = 9,
				["auraFontOutline"] = "OUTLINE",
			},
			["currentTutorial"] = 1,
			["general"] = {
				["totems"] = {
					["size"] = 37,
					["spacing"] = 3,
				},
				["topPanel"] = false,
				["castColor"] = {
				},
				["autoRoll"] = true,
				["DEBUFFS"] = {
				},
				["minimap"] = {
					["locationText"] = "HIDE",
					["size"] = 160,
				},
				["castNoInterrupt"] = {
				},
				["health_backdrop"] = {
				},
				["health"] = {
				},
				["reputation"] = {
					["width"] = 162,
				},
				["valuecolor"] = {
					["a"] = 1,
					["r"] = 0.1019607843137255,
					["g"] = 0.611764705882353,
					["b"] = 1,
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
				["ReputationBarMover"] = "TOPLEFTElvUIParentTOPLEFT5-189",
				["ElvUF_PlayerCastbarMover"] = "BOTTOMElvUIParentBOTTOM066",
				["BNETMover"] = "TOPElvUIParentTOP0-23",
				["ShiftAB"] = "BOTTOMElvUIParentBOTTOM096",
				["ElvUF_TargetCastbarMover"] = "BOTTOMElvUIParentBOTTOM181138",
				["TotemBarMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT3574",
				["ArenaHeaderMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-132270",
				["TooltipMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-4-10",
				["ElvUF_TankMover"] = "TOPLEFTElvUIParentTOPLEFT4-341",
				["BossHeaderMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-166270",
				["ElvUF_PetMover"] = "BOTTOMElvUIParentBOTTOM0186",
				["ElvUF_PlayerMover"] = "BOTTOMElvUIParentBOTTOM-181160",
				["WatchFrameMover"] = "TOPRIGHTElvUIParentTOPRIGHT-40-275",
				["AlertFrameMover"] = "TOPElvUIParentTOP0-469",
				["ElvUF_TargetMover"] = "BOTTOMElvUIParentBOTTOM181160",
				["MinimapMover"] = "TOPLEFTElvUIParentTOPLEFT4-4",
			},
			["tooltip"] = {
				["count"] = false,
				["combathide"] = true,
			},
			["hideTutorial"] = 1,
			["chat"] = {
				["chatHistory"] = false,
				["panelTabBackdrop"] = false,
				["tabFontOutline"] = "OUTLINE",
				["fontOutline"] = "OUTLINE",
				["tabFont"] = "Oswald Regular",
				["panelHeight"] = 164,
				["tabFontSize"] = 11,
				["panelWidth"] = 352,
			},
			["unitframe"] = {
				["OORAlpha"] = 0.25,
				["fontSize"] = 15,
				["colors"] = {
					["customhealthbackdrop"] = true,
					["auraBarBuff"] = {
						["r"] = 0.1176470588235294,
						["g"] = 0.1176470588235294,
						["b"] = 0.1176470588235294,
					},
					["health"] = {
						["r"] = 0.1176470588235294,
						["g"] = 0.1176470588235294,
						["b"] = 0.1176470588235294,
					},
					["castNoInterrupt"] = {
						["b"] = 0.2509803921568627,
						["g"] = 0.2509803921568627,
						["r"] = 0.7803921568627451,
					},
					["castColor"] = {
						["r"] = 0.1019607843137255,
						["g"] = 0.1019607843137255,
						["b"] = 0.1019607843137255,
					},
					["auraBarDebuff"] = {
						["r"] = 0.7803921568627451,
						["g"] = 0.2509803921568627,
						["b"] = 0.2509803921568627,
					},
					["colorhealthbyvalue"] = false,
					["health_backdrop"] = {
						["r"] = 0.1882352941176471,
						["g"] = 0.1882352941176471,
						["b"] = 0.1882352941176471,
					},
				},
				["fontOutline"] = "OUTLINE",
				["font"] = "BigNoodleTitling",
				["statusbar"] = "Normal",
				["units"] = {
					["tank"] = {
						["enable"] = false,
					},
					["targettarget"] = {
						["height"] = 33,
						["width"] = 110,
						["power"] = {
							["offset"] = 5,
						},
					},
					["raid10"] = {
						["width"] = 68,
						["health"] = {
							["text_format"] = "[health:deficit]",
						},
						["power"] = {
							["offset"] = 5,
						},
					},
					["focustarget"] = {
						["power"] = {
							["offset"] = 7,
						},
					},
					["pet"] = {
						["height"] = 33,
						["width"] = 110,
						["power"] = {
							["offset"] = 5,
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
						["height"] = 45,
						["buffs"] = {
							["numrows"] = 2,
							["perrow"] = 7,
							["yOffset"] = 8,
						},
						["health"] = {
							["text_format"] = "[healthcolor][health:current-percent]",
						},
						["castbar"] = {
							["width"] = 191,
						},
					},
					["target"] = {
						["combobar"] = {
							["height"] = 8,
							["fill"] = "spaced",
						},
						["debuffs"] = {
							["yOffset"] = 1,
							["sizeOverride"] = 25,
						},
						["portrait"] = {
							["overlay"] = true,
							["camDistanceScale"] = 1.3,
							["enable"] = true,
						},
						["power"] = {
							["offset"] = 7,
							["hideonnpc"] = false,
							["text_format"] = "",
							["position"] = "BOTTOMLEFT",
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
							["yOffset"] = 1,
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
						["roleIcon"] = {
							["position"] = "BOTTOMLEFT",
						},
						["debuffs"] = {
							["xOffset"] = 1,
							["sizeOverride"] = 30,
							["initialAnchor"] = "TOPLEFT",
							["yOffset"] = 4,
						},
						["name"] = {
							["text_format"] = "[namecolor][name:medium]",
							["position"] = "TOPLEFT",
						},
						["power"] = {
							["offset"] = 6,
							["text_format"] = "",
						},
						["height"] = 45,
						["healPrediction"] = true,
						["petsGroup"] = {
							["initialAnchor"] = "BOTTOM",
						},
						["targetsGroup"] = {
							["initialAnchor"] = "BOTTOM",
						},
					},
					["raid40"] = {
						["height"] = 33,
						["width"] = 68,
						["health"] = {
							["text"] = true,
						},
						["power"] = {
							["offset"] = 5,
							["enable"] = true,
						},
					},
					["focus"] = {
						["name"] = {
							["text_format"] = "[name:medium]",
						},
						["castbar"] = {
							["width"] = 115,
						},
						["raidicon"] = {
							["enable"] = false,
						},
						["power"] = {
							["offset"] = 4,
						},
						["width"] = 115,
					},
					["raid25"] = {
						["width"] = 68,
						["health"] = {
							["text_format"] = "[health:deficit]",
						},
						["power"] = {
							["offset"] = 5,
						},
					},
					["arena"] = {
						["health"] = {
							["text_format"] = "[healthcolor][health:current-percent]",
						},
						["castbar"] = {
							["width"] = 225,
						},
						["height"] = 45,
						["power"] = {
							["offset"] = 7,
						},
						["width"] = 225,
					},
					["player"] = {
						["restIcon"] = false,
						["debuffs"] = {
							["attachTo"] = "BUFFS",
							["sizeOverride"] = 25,
							["yOffset"] = 1,
						},
						["portrait"] = {
							["overlay"] = true,
							["camDistanceScale"] = 1.3,
							["enable"] = true,
						},
						["castbar"] = {
							["height"] = 22,
							["displayTarget"] = true,
							["width"] = 358,
						},
						["customTexts"] = {
						},
						["healPrediction"] = false,
						["width"] = 235,
						["power"] = {
							["offset"] = 7,
							["text_format"] = "",
							["position"] = "BOTTOMRIGHT",
						},
						["name"] = {
							["text_format"] = "[namecolor][name:medium] [difficultycolor][level]",
							["position"] = "TOPLEFT",
						},
						["health"] = {
							["position"] = "TOPRIGHT",
						},
						["height"] = 50,
						["buffs"] = {
							["attachTo"] = "FRAME",
							["sizeOverride"] = 25,
							["enable"] = true,
							["noDuration"] = false,
							["yOffset"] = 1,
						},
						["classbar"] = {
							["height"] = 7,
							["fill"] = "spaced",
						},
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["assist"] = {
						["enable"] = false,
					},
				},
			},
			["datatexts"] = {
				["ldbOneWidth"] = 88,
				["topSize"] = 22,
				["bottomBar"] = true,
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
				["ldbThreeDataPanel"] = 3,
				["fontSize"] = 11,
				["ldbThreeWidth"] = 330,
				["chatOffset"] = 4,
				["bottomSize"] = 22,
				["ldbTwoMouseover"] = false,
				["ldbOneDataPanel"] = 1,
				["ldbTwoWidth"] = 88,
				["topWidth"] = 350,
				["leftChat"] = true,
				["ldbOneMouseover"] = false,
				["moveChats"] = false,
				["ldbThree"] = false,
				["topCenter"] = false,
				["ldbTwo"] = true,
				["ldbOne"] = true,
				["font"] = "Oswald Regular",
				["xpRep"] = false,
				["enableTop"] = false,
				["ldbThreeMouseover"] = false,
				["enableBottom"] = false,
				["rightChat"] = false,
				["ldbTwoDataPanel"] = 1,
			},
			["loclite"] = {
				["lpwidth"] = 100,
				["customCoordsColor"] = 2,
				["dig"] = false,
				["locpanel"] = false,
				["dtheight"] = 18,
			},
			["layoutSet"] = "dpsMelee",
			["actionbar"] = {
				["bar3"] = {
					["buttonsize"] = 28,
					["buttonsPerRow"] = 3,
				},
				["fontSize"] = 12,
				["bar2"] = {
					["enabled"] = true,
					["buttonsize"] = 28,
					["heightMult"] = 2,
				},
				["bar1"] = {
					["buttonsize"] = 28,
				},
				["bar5"] = {
					["buttonsize"] = 28,
					["buttonsPerRow"] = 3,
				},
				["noRangeColor"] = {
					["g"] = 0.1019607843137255,
					["b"] = 0.1019607843137255,
				},
				["barPet"] = {
					["buttonsPerRow"] = 10,
					["backdrop"] = false,
					["buttonsize"] = 25,
				},
				["font"] = "Oswald Regular",
				["showGrid"] = false,
				["fontOutline"] = "OUTLINE",
				["macrotext"] = true,
				["stanceBar"] = {
					["buttonspacing"] = 1,
					["buttonsize"] = 23,
				},
				["microbar"] = {
					["enabled"] = true,
					["mouseover"] = true,
				},
				["bar4"] = {
					["backdrop"] = false,
					["buttonsPerRow"] = 2,
					["buttonsize"] = 25,
					["mouseover"] = true,
				},
			},
			["auras"] = {
				["consolidatedBuffs"] = {
					["font"] = "Oswald Regular",
					["filter"] = false,
					["enable"] = false,
					["fontOutline"] = "OUTLINE",
					["durations"] = false,
					["fontSize"] = 12,
				},
				["fontSize"] = 12,
				["font"] = "Oswald Regular",
				["fontOutline"] = "OUTLINE",
				},
			},
}

E:RegisterProfile(name, profile, ace3)
