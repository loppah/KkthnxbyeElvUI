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
				["interruptAnnounce"] = "PARTY",
				["minimap"] = {
					["locationText"] = "SHOW",
					["size"] = 160,
				},
				["health_backdrop"] = {
				},
				["DEBUFFS"] = {
				},
				["valuecolor"] = {
					["a"] = 1,
					["b"] = 0.9529411764705882,
					["g"] = 0.596078431372549,
					["r"] = 0.09411764705882353,
				},
				["loginmessage"] = false,
				["backdropcolor"] = {
					["b"] = 0.1333333333333333,
					["g"] = 0.1333333333333333,
					["r"] = 0.1333333333333333,
				},
				["topPanel"] = false,
				["autoRoll"] = true,
				["castNoInterrupt"] = {
				},
				["health"] = {
				},
				["experience"] = {
					["height"] = 8,
					["width"] = 352,
				},
				["reputation"] = {
					["height"] = 8,
					["width"] = 162,
				},
				["BUFFS"] = {
				},
				["castColor"] = {
				},
				["bottomPanel"] = false,
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
				["MicrobarMover"] = "TOPElvUIParentTOP0-4",
				["ExtraTwoMover"] = "BOTTOMElvUIParentBOTTOM-2271",
				["ExperienceBarMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT4169",
				["ElvUF_TargetTargetMover"] = "BOTTOMElvUIParentBOTTOM0147",
				["LossControlMover"] = "TOPElvUIParentTOP0-492",
				["ElvAB_1"] = "BOTTOMElvUIParentBOTTOM04",
				["ElvAB_2"] = "BOTTOMElvUIParentBOTTOM031",
				["ElvAB_4"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-3574",
				["MinimapButtonAnchor"] = "TOPLEFTElvUIParentTOPLEFT169-7",
				["AltPowerBarMover"] = "BOTTOMElvUIParentBOTTOM0280",
				["ElvAB_3"] = "BOTTOMElvUIParentBOTTOM2084",
				["ElvAB_5"] = "BOTTOMElvUIParentBOTTOM-2074",
				["ElvUF_TargetMover"] = "BOTTOMElvUIParentBOTTOM178160",
				["TempEnchantMover"] = "TOPLEFTElvUIParentTOPLEFT4-201",
				["ReputationBarMover"] = "TOPLEFTElvUIParentTOPLEFT5-189",
				["ElvUF_PlayerMover"] = "BOTTOMElvUIParentBOTTOM-178160",
				["BNETMover"] = "TOPElvUIParentTOP0-4",
				["ShiftAB"] = "BOTTOMElvUIParentBOTTOM060",
				["TotemBarMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT3574",
				["WatchFrameMover"] = "TOPRIGHTElvUIParentTOPRIGHT-40-275",
				["ArenaHeaderMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-223221",
				["TooltipMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-4-10",
				["ElvUF_TankMover"] = "TOPLEFTElvUIParentTOPLEFT4-341",
				["BossHeaderMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-259298",
				["ElvUF_PetMover"] = "BOTTOMElvUIParentBOTTOM0178",
				["ElvUF_TargetCastbarMover"] = "BOTTOMElvUIParentBOTTOM179140",
				["ElvUF_PlayerCastbarMover"] = "BOTTOMElvUIParentBOTTOM-178140",
				["AlertFrameMover"] = "TOPElvUIParentTOP0-469",
				["VehicleSeatMover"] = "TOPLEFTElvUIParentTOPLEFT169-4",
				["MinimapMover"] = "TOPLEFTElvUIParentTOPLEFT4-4",
			},
			["bags"] = {
				["yOffset"] = 143,
				["bankSize"] = 28,
				["bagSize"] = 28,
				["sortInverted"] = false,
			},
			["hideTutorial"] = 1,
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
			["unitframe"] = {
				["fontSize"] = 14,
				["units"] = {
					["tank"] = {
						["enable"] = false,
					},
					["raid25"] = {
						["power"] = {
							["height"] = 5,
						},
						["width"] = 68,
						["health"] = {
							["text_format"] = "[health:deficit]",
						},
					},
					["raid10"] = {
						["power"] = {
							["height"] = 5,
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
							["height"] = 5,
							["width"] = "spaced",
						},
						["width"] = 110,
						["height"] = 28,
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
							["enable"] = true,
						},
						["power"] = {
							["height"] = 5,
							["text_format"] = "",
						},
						["width"] = 170,
						["name"] = {
							["text_format"] = "[name:medium]",
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
						["castbar"] = {
							["width"] = 170,
						},
					},
					["assist"] = {
						["enable"] = false,
					},
					["party"] = {
						["debuffs"] = {
							["sizeOverride"] = 25,
							["yOffset"] = 4,
							["initialAnchor"] = "TOPLEFT",
							["xOffset"] = 1,
						},
						["health"] = {
							["text_format"] = "",
							["position"] = "RIGHT",
						},
						["roleIcon"] = {
							["position"] = "TOPRIGHT",
						},
						["targetsGroup"] = {
							["initialAnchor"] = "BOTTOM",
						},
						["power"] = {
							["height"] = 5,
							["text_format"] = "",
						},
						["healPrediction"] = true,
						["width"] = 170,
						["name"] = {
							["text_format"] = "[namecolor][name:medium]",
						},
						["height"] = 32,
						["petsGroup"] = {
							["initialAnchor"] = "BOTTOM",
						},
					},
					["raid40"] = {
						["power"] = {
							["enable"] = true,
							["height"] = 4,
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
							["position"] = "BOTTOMLEFT",
							["height"] = 6,
							["hideonnpc"] = false,
							["text_format"] = "",
						},
						["customTexts"] = {
						},
						["width"] = 230,
						["health"] = {
							["position"] = "LEFT",
						},
						["castbar"] = {
							["height"] = 16,
							["width"] = 230,
						},
						["height"] = 40,
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
					["arena"] = {
						["power"] = {
							["height"] = 6,
							["text_format"] = "",
						},
						["width"] = 215,
						["health"] = {
							["text_format"] = "[healthcolor][health:current-percent]",
							["position"] = "RIGHT",
						},
						["height"] = 40,
						["castbar"] = {
							["width"] = 215,
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
							["height"] = 6,
							["text_format"] = "",
						},
						["customTexts"] = {
						},
						["width"] = 230,
						["health"] = {
							["position"] = "RIGHT",
						},
						["castbar"] = {
							["width"] = 230,
							["displayTarget"] = true,
							["height"] = 16,
						},
						["height"] = 40,
						["buffs"] = {
							["sizeOverride"] = 25,
							["enable"] = true,
							["yOffset"] = 2,
							["noDuration"] = false,
							["attachTo"] = "FRAME",
						},
						["name"] = {
							["text_format"] = "[namecolor][name:medium] [difficultycolor][level]",
							["position"] = "LEFT",
						},
						["pvp"] = {
							["text_format"] = "||cFFFFFFFF[pvptimer][mouseover]||r",
						},
					},
					["targettarget"] = {
						["power"] = {
							["height"] = 5,
							["width"] = "spaced",
						},
						["width"] = 110,
						["height"] = 28,
					},
				},
				["OORAlpha"] = 0.25,
				["statusbar"] = "Flatt",
				["colors"] = {
					["auraBarBuff"] = {
						["b"] = 0.1176470588235294,
						["g"] = 0.1176470588235294,
						["r"] = 0.1176470588235294,
					},
					["colorhealthbyvalue"] = false,
					["customhealthbackdrop"] = true,
					["health_backdrop"] = {
						["b"] = 0.2823529411764706,
						["g"] = 0.3098039215686275,
						["r"] = 0.4627450980392157,
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
						["b"] = 0.1176470588235294,
						["g"] = 0.1176470588235294,
						["r"] = 0.1176470588235294,
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
				["fontOutline"] = "OUTLINE",
				["bottomSize"] = 22,
				["ldbTwoWidth"] = 88,
				["ldbOneDataPanel"] = 1,
				["topCenter"] = false,
				["enableTop"] = false,
				["ldbTwoDataPanel"] = 1,
				["ldbOneWidth"] = 88,
				["fontSize"] = 11,
				["bottomBar"] = true,
				["ldbThreeDataPanel"] = 3,
				["chatOffset"] = 4,
				["ldbTwoMouseover"] = false,
				["topWidth"] = 350,
				["moveChats"] = false,
				["ldbOneMouseover"] = false,
				["font"] = "Oswald Regular",
				["ldbTwo"] = true,
				["ldbOne"] = true,
				["ldbThree"] = false,
				["xpRep"] = false,
				["leftChat"] = true,
				["ldbThreeMouseover"] = false,
				["enableBottom"] = false,
				["rightChat"] = false,
			},
			["actionbar"] = {
				["bar3"] = {
					["backdrop"] = true,
					["buttonsPerRow"] = 3,
					["buttonsize"] = 25,
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
				["fontOutline"] = "OUTLINE",
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
			["layoutSet"] = "dpsMelee",
			["chat"] = {
				["tabFontOutline"] = "OUTLINE",
				["fontOutline"] = "OUTLINE",
				["chatHistory"] = false,
				["tabFont"] = "Oswald Regular",
				["panelHeight"] = 164,
				["panelWidth"] = 352,
			},
			["tooltip"] = {
				["combathide"] = true,
				["count"] = false,
			},	
}
	
E:RegisterProfile(name, profile, ace3)
