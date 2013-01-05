local E, L, C = unpack(select(2, ...))

local name, ace3 = "ElvDB", true
local profile = {
			["nameplate"] = {
				["fontSize"] = 9,
				["auraFontOutline"] = "OUTLINE",
				["fontOutline"] = "OUTLINE",
				["combat"] = true,
				["width"] = 100,
				["enhancethreat"] = false,
				["auraFont"] = "Oswald Bold",
				["font"] = "Oswald Bold",
				["height"] = 9,
			},
			["currentTutorial"] = 1,
			["general"] = {
				["totems"] = {
					["spacing"] = 2,
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
					["r"] = 0.09411764705882353,
					["g"] = 0.596078431372549,
					["b"] = 0.9529411764705882,
				},
				["backdropcolor"] = {
					["r"] = 0.1333333333333333,
					["g"] = 0.1333333333333333,
					["b"] = 0.1333333333333333,
				},
				["topPanel"] = false,
				["autoRoll"] = true,
				["castNoInterrupt"] = {
				},
				["health"] = {
				},
				["castColor"] = {
				},
				["reputation"] = {
					["height"] = 8,
					["width"] = 162,
				},
				["BUFFS"] = {
				},
				["bottomPanel"] = false,
				["experience"] = {
					["height"] = 8,
					["width"] = 352,
				},
			},
			["movers"] = {
				["BottomBarMover"] = "BOTTOMElvUIParentBOTTOM01",
				["PetAB"] = "TOPRIGHTElvUIParentTOPRIGHT-4-404",
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
				["ElvUF_TargetTargetMover"] = "BOTTOMElvUIParentBOTTOM0146",
				["LossControlMover"] = "TOPElvUIParentTOP0-492",
				["ElvAB_1"] = "BOTTOMElvUIParentBOTTOM04",
				["ElvAB_2"] = "BOTTOMElvUIParentBOTTOM031",
				["ElvAB_4"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-3574",
				["MinimapButtonAnchor"] = "TOPLEFTElvUIParentTOPLEFT173-5",
				["AltPowerBarMover"] = "BOTTOMElvUIParentBOTTOM0280",
				["ElvAB_3"] = "BOTTOMElvUIParentBOTTOM2084",
				["ElvAB_5"] = "BOTTOMElvUIParentBOTTOM-2084",
				["VehicleSeatMover"] = "TOPLEFTElvUIParentTOPLEFT169-4",
				["TempEnchantMover"] = "TOPLEFTElvUIParentTOPLEFT4-201",
				["ReputationBarMover"] = "TOPLEFTElvUIParentTOPLEFT5-189",
				["ElvUF_PlayerCastbarMover"] = "BOTTOMElvUIParentBOTTOM-178140",
				["BNETMover"] = "TOPElvUIParentTOP0-23",
				["ShiftAB"] = "BOTTOMElvUIParentBOTTOM060",
				["ElvUF_TargetCastbarMover"] = "BOTTOMElvUIParentBOTTOM179140",
				["ElvUF_PetMover"] = "BOTTOMElvUIParentBOTTOM0179",
				["ArenaHeaderMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-223221",
				["TooltipMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-4-10",
				["ElvUF_TankMover"] = "TOPLEFTElvUIParentTOPLEFT4-341",
				["BossHeaderMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-259298",
				["TotemBarMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT3574",
				["ElvUF_PlayerMover"] = "BOTTOMElvUIParentBOTTOM-178160",
				["WatchFrameMover"] = "TOPRIGHTElvUIParentTOPRIGHT-40-275",
				["AlertFrameMover"] = "TOPElvUIParentTOP0-469",
				["ElvUF_TargetMover"] = "BOTTOMElvUIParentBOTTOM179160",
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
				["tabFontOutline"] = "OUTLINE",
				["tabFont"] = "Oswald Regular",
				["panelTabBackdrop"] = false,
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
							["offset"] = 4,
						},
						["width"] = 110,
						["height"] = 30,
					},
					["raid10"] = {
						["power"] = {
							["offset"] = 4,
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
							["offset"] = 4,
						},
						["width"] = 110,
						["height"] = 30,
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
							["offset"] = 5,
							["text_format"] = "",
						},
						["width"] = 180,
						["castbar"] = {
							["width"] = 180,
						},
						["health"] = {
							["text_format"] = "[healthcolor][health:current-percent]",
							["position"] = "RIGHT",
						},
						["height"] = 38,
						["buffs"] = {
							["yOffset"] = 8,
							["numrows"] = 2,
							["perrow"] = 7,
						},
						["name"] = {
							["text_format"] = "[name:medium]",
						},
					},
					["target"] = {
						["combobar"] = {
							["height"] = 7,
							["fill"] = "spaced",
						},
						["debuffs"] = {
							["sizeOverride"] = 25,
							["yOffset"] = 2,
						},
						["portrait"] = {
							["overlay"] = true,
							["enable"] = true,
							["camDistanceScale"] = 1.3,
						},
						["power"] = {
							["offset"] = 5,
							["position"] = "BOTTOMLEFT",
							["hideonnpc"] = false,
							["text_format"] = "",
						},
						["customTexts"] = {
						},
						["width"] = 235,
						["health"] = {
							["position"] = "LEFT",
						},
						["castbar"] = {
							["height"] = 16,
							["width"] = 235,
						},
						["height"] = 38,
						["buffs"] = {
							["yOffset"] = 2,
							["sizeOverride"] = 25,
						},
						["name"] = {
							["text_format"] = "[namecolor][name:medium] [difficultycolor][level][shortclassification]",
							["position"] = "RIGHT",
						},
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["party"] = {
						["debuffs"] = {
							["sizeOverride"] = 25,
							["yOffset"] = 4,
							["initialAnchor"] = "TOPLEFT",
							["xOffset"] = 1,
						},
						["targetsGroup"] = {
							["initialAnchor"] = "BOTTOM",
						},
						["health"] = {
							["position"] = "RIGHT",
						},
						["power"] = {
							["offset"] = 5,
							["text_format"] = "",
						},
						["healPrediction"] = true,
						["width"] = 182,
						["name"] = {
							["text_format"] = "[namecolor][name:short]",
						},
						["height"] = 38,
						["petsGroup"] = {
							["initialAnchor"] = "BOTTOM",
						},
					},
					["raid40"] = {
						["power"] = {
							["offset"] = 4,
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
							["offset"] = 4,
						},
						["width"] = 68,
						["health"] = {
							["text_format"] = "[health:deficit]",
						},
					},
					["arena"] = {
						["power"] = {
							["offset"] = 5,
						},
						["width"] = 220,
						["health"] = {
							["text_format"] = "[healthcolor][health:current-percent]",
							["position"] = "RIGHT",
						},
						["height"] = 40,
						["castbar"] = {
							["width"] = 220,
						},
					},
					["player"] = {
						["debuffs"] = {
							["yOffset"] = 2,
							["attachTo"] = "BUFFS",
							["sizeOverride"] = 25,
						},
						["portrait"] = {
							["overlay"] = true,
							["enable"] = true,
							["camDistanceScale"] = 1.3,
						},
						["classbar"] = {
							["height"] = 6,
							["fill"] = "spaced",
						},
						["aurabar"] = {
							["enable"] = false,
						},
						["restIcon"] = false,
						["power"] = {
							["offset"] = 5,
							["text_format"] = "",
						},
						["customTexts"] = {
						},
						["width"] = 235,
						["health"] = {
							["position"] = "RIGHT",
						},
						["name"] = {
							["text_format"] = "[namecolor][name:medium] [difficultycolor][level]",
							["position"] = "LEFT",
						},
						["height"] = 38,
						["buffs"] = {
							["sizeOverride"] = 25,
							["enable"] = true,
							["yOffset"] = 2,
							["noDuration"] = false,
							["attachTo"] = "FRAME",
						},
						["castbar"] = {
							["width"] = 235,
							["displayTarget"] = true,
							["height"] = 16,
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
						["r"] = 0.4627450980392157,
						["g"] = 0.3098039215686275,
						["b"] = 0.2823529411764706,
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
						["r"] = 0.1176470588235294,
						["g"] = 0.1176470588235294,
						["b"] = 0.1176470588235294,
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
						["left"] = "Bags",
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
				["fontOutline"] = "OUTLINE",
				["bottomSize"] = 22,
				["ldbTwoWidth"] = 88,
				["ldbTwoMouseover"] = false,
				["font"] = "Oswald Regular",
				["enableTop"] = false,
				["ldbTwoDataPanel"] = 1,
				["ldbOneWidth"] = 88,
				["fontSize"] = 11,
				["bottomBar"] = true,
				["ldbThreeDataPanel"] = 3,
				["chatOffset"] = 4,
				["ldbThree"] = false,
				["topWidth"] = 350,
				["moveChats"] = false,
				["ldbOneMouseover"] = false,
				["topCenter"] = false,
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
				["customCoordsColor"] = 2,
				["lpwidth"] = 100,
				["dtheight"] = 18,
				["locpanel"] = false,
				["dig"] = false,
			},
			["layoutSet"] = "dpsMelee",
			["actionbar"] = {
				["bar3"] = {
					["backdrop"] = true,
					["buttonsPerRow"] = 3,
					["buttonsize"] = 25,
				},
				["fontSize"] = 12,
				["fontOutline"] = "OUTLINE",
				["microbar"] = {
					["enabled"] = true,
					["mouseover"] = true,
				},
				["noPowerColor"] = {
					["g"] = 0.5764705882352941,
					["r"] = 0.3803921568627451,
				},
				["bar2"] = {
					["enabled"] = true,
					["buttonsize"] = 25,
				},
				["bar1"] = {
					["backdrop"] = true,
					["heightMult"] = 2,
					["buttonsize"] = 25,
				},
				["bar5"] = {
					["backdrop"] = true,
					["buttonsPerRow"] = 3,
					["buttonsize"] = 25,
				},
				["font"] = "Oswald Regular",
				["noRangeColor"] = {
					["g"] = 0.1019607843137255,
					["b"] = 0.1019607843137255,
				},
				["macrotext"] = true,
				["stanceBar"] = {
					["buttonspacing"] = 1,
					["buttonsize"] = 22,
				},
				["barPet"] = {
					["point"] = "BOTTOMRIGHT",
					["buttonsize"] = 26,
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
			["bags"] = {
				["yOffset"] = 143,
				["bankSize"] = 28,
				["bagSize"] = 28,
				["sortInverted"] = false,
				},
}

E:RegisterProfile(name, profile, ace3)
