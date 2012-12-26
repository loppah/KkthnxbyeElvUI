local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local LLB = E:GetModule('LocationLite')

-- Defaults
P['loclite'] = {
-- Options
	['both'] = true,
	['combat'] = false,
	['dig'] = true,
-- Layout
	['asphyxia'] = false,
	['shadow'] = false,
	['trans'] = false,
	['noback'] = true,
	['ht'] = false,
	['lpwidth'] = 200,
	['dtheight'] = 21,
	['lpauto'] = true,
	['userColor'] = { r = 1, g = 1, b = 1 },
	['customColor'] = 1,
	['userCoordsColor'] = { r = 1, g = 1, b = 1 },
	['customCoordsColor'] = 3,
-- Fonts
	['lpfont'] = E.db.general.font,
	['lpfontsize'] = 12,
	['lpfontflags'] = "NONE",
}

E.Options.args.loclite = {
	order = 9000,
	type = 'group',
	name = L["Location Lite"],
	args = {
		name = {
			order = 1,
			type = "header",
			name = LLB.name..format(" v|cff33ffff%s|r",LLB.version)..L[" by Benik (EU-Emerald Dream)"],
		},		
		desc = {
			order = 2,
			type = "description",
			name = L["LocationLite adds a movable player location panel"],
		},
		spacer1 = {
			order = 3,
			type = "description",
			name = "",
		},		
		toptop = {
			order = 4,
			type = "group",
			name = L["General"],
			guiInline = true,
			args = {
				combat = {
					order = 1,
					name = L["Combat Hide"],
					desc = L["Show/Hide all panels when in combat"],
					type = 'toggle',
					get = function(info) return E.db.loclite[ info[#info] ] end,
					set = function(info, value) E.db.loclite[ info[#info] ] = value; end,					
				},
			},
		},
		general = {
			order = 5,
			type = "group",
			name = SHOW,
			guiInline = true,
			args = {
				both = {
					order = 1,
					name = L["Zone and Subzone"],
					desc = L["Displays the main zone and the subzone in the location panel"],
					type = 'toggle',
					width = "full",	
					get = function(info) return E.db.loclite[ info[#info] ] end,
					set = function(info, value) E.db.loclite[ info[#info] ] = value; end,					
				},
				dig = {
					order = 2,
					name = L["Detailed Coords"],
					desc = L["Adds 2 digits in the coords"],
					type = 'toggle',
					width = "full",	
					get = function(info) return E.db.loclite[ info[#info] ] end,
					set = function(info, value) E.db.loclite[ info[#info] ] = value; LCoordsDig() end,					
				},
			},
		},
		layout = {
			order = 6,
			type = "group",
			name = L["Layout"],
			args = {
				lp_lo = {
					order = 1,
					type = "group",
					name = L["Layout"],
					guiInline = true,
					args = {	
						asphyxia = {
							order = 1,
							name = L["AsphyxiaUI Style"],
							type = 'toggle',
							disabled = function() return not E.db.loclite.noback end,
							get = function(info) return E.db.loclite[ info[#info] ] end,
							set = function(info, value) E.db.loclite[ info[#info] ] = value; LocAsphyxia(); end,					
						},
						shadow = {
							order = 2,
							name = L["Shadows"],
							desc = L["Enable/Disable layout with shadows."],
							type = 'toggle',
							disabled = function() return not E.db.loclite.noback end,
							get = function(info) return E.db.loclite[ info[#info] ] end,
							set = function(info, value) E.db.loclite[ info[#info] ] = value; LiteShadow(); end,					
						},
						trans = {
							order = 3,
							name = L["Transparent"],
							desc = L["Enable/Disable transparent layout."],
							type = 'toggle',
							disabled = function() return not E.db.loclite.noback end,
							get = function(info) return E.db.loclite[ info[#info] ] end,
							set = function(info, value) E.db.loclite[ info[#info] ] = value; LiteTransparent(); E:StaticPopup_Show("PRIVATE_RL"); end,	
						},
						noback = {
							order = 4,
							name = L["Backdrop"],
							desc = L["Hides all panels background so you can place them on ElvUI's top or bottom panel."],
							type = 'toggle',
							get = function(info) return E.db.loclite[ info[#info] ] end,
							set = function(info, value) E.db.loclite[ info[#info] ] = value; LLB:LocLiteUpdate(); end,
						},							
					},
				},
				locpanel = {
					order = 2,
					type = "group",
					name = L["Location Panel"],
					guiInline = true,
					args = {
						ht = {
							order = 1,
							name = L["Larger Location Panel"],
							desc = L["Adds 6 pixels at the Main Location Panel height."],
							type = 'toggle',
							disabled = function() return not E.db.loclite.noback end,
							get = function(info) return E.db.loclite[ info[#info] ] end,
							set = function(info, value) E.db.loclite[ info[#info] ] = value; LiteDTHeight() end,	
						},
						lpauto = {
							order = 2,
							type = "toggle",
							name = L["Auto width"],
							desc = L["Auto resized Location Panel."],
							get = function(info) return E.db.loclite[ info[#info] ] end,
							set = function(info, value) E.db.loclite[ info[#info] ] = value; end,
						},	
						lpwidth = {
							order = 3,
							type = "range",
							name = L["Width"],
							desc = L["Adjust the Location Panel Width."],
							min = 100, max = 300, step = 1,
							disabled = function() return E.db.loclite.lpauto end,
							get = function(info) return E.db.loclite[ info[#info] ] end,
							set = function(info, value) E.db.loclite[ info[#info] ] = value; end,
						},
						customColor = {
							order = 4,
							type = "select",
							name = COLOR,
							values = {
								[1] = L["Auto Colorize"],
								[2] = CLASS_COLORS,
								[3] = CUSTOM,
							},
							get = function(info) return E.db.loclite[ info[#info] ] end,
							set = function(info, value) E.db.loclite[ info[#info] ] = value; end,
						},
						userColor = {
							order = 5,
							type = "color",
							name = COLOR_PICKER,
							disabled = function() return E.db.loclite.customColor == 1 or E.db.loclite.customColor == 2 end,
							get = function(info)
								local t = E.db.loclite[ info[#info] ]
								return t.r, t.g, t.b, t.a
								end,
							set = function(info, r, g, b)
								local t = E.db.loclite[ info[#info] ]
								t.r, t.g, t.b = r, g, b
								LCoordsColor()
							end,
						},

					},
				},
				coords = {
					order = 3,
					type = "group",
					name = L["Coordinates"],
					guiInline = true,
					args = {
						customCoordsColor = {
							order = 1,
							type = "select",
							name = COLOR,
							values = {
								[1] = L["Use Custom Location Color"],
								[2] = CLASS_COLORS,
								[3] = CUSTOM,
							},
							get = function(info) return E.db.loclite[ info[#info] ] end,
							set = function(info, value) E.db.loclite[ info[#info] ] = value; LCoordsColor() end,
						},
						userCoordsColor = {
							order = 2,
							type = "color",
							name = COLOR_PICKER,
							disabled = function() return E.db.loclite.customCoordsColor == 1 or E.db.loclite.customCoordsColor == 2 end,
							get = function(info)
								local t = E.db.loclite[ info[#info] ]
								return t.r, t.g, t.b, t.a
								end,
							set = function(info, r, g, b)
								local t = E.db.loclite[ info[#info] ]
								t.r, t.g, t.b = r, g, b
								LCoordsColor() 
							end,
						},
						dig = {
							order = 3,
							name = L["Detailed Coords"],
							desc = L["Adds 2 digits in the coords"],
							type = 'toggle',
							get = function(info) return E.db.loclite[ info[#info] ] end,
							set = function(info, value) E.db.loclite[ info[#info] ] = value; LCoordsDig() end,					
						},
					},
				},
				panels = {
					order = 4,
					type = "group",
					name = L["Size"],
					guiInline = true,
					args = {
						dtheight = {
							order = 2,
							type = "range",
							name = L["All Panels Height"],
							desc = L["Adjust All Panels Height."],
							min = 18, max = 32, step = 1,
							get = function(info) return E.db.loclite[ info[#info] ] end,
							set = function(info, value) E.db.loclite[ info[#info] ] = value; LiteDTHeight() end,
						},		
					},
				},
				font = {
					order = 5,
					type = "group",
					name = L["Fonts"],
					guiInline = true,
					get = function(info) return E.db.loclite[ info[#info] ] end,
					set = function(info, value) E.db.loclite[ info[#info] ] = value; LLB:LocCoordPanelFont(); end,
					args = {
						lpfont = {
							type = "select", dialogControl = 'LSM30_Font',
							order = 1,
							name = L["Font"],
							desc = L["Choose font for the Location and Coords panels."],
							values = AceGUIWidgetLSMlists.font,	
						},
						lpfontsize = {
							order = 2,
							name = L["Font Size"],
							desc = L["Set the font size."],
							type = "range",
							min = 6, max = 22, step = 1,
						},
						lpfontflags = {
							order = 3,
							name = L["Font Outline"],
							type = 'select',
							values = {
								['NONE'] = L['None'],
								['OUTLINE'] = 'OUTLINE',
								['MONOCHROME'] = 'MONOCHROME',
								['MONOCHROMEOUTLINE'] = 'MONOCROMEOUTLINE',
								['THICKOUTLINE'] = 'THICKOUTLINE',
							},
						},
					},
				},
			},
		},
	},					
}