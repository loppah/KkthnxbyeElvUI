--[[
-- ElvUI Location Lite --
a plugin for ElvUI, that adds player location and coords

- Info, requests, bugs: 
----------------------------------------------------------------------------------


]]--

local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local LLB = E:NewModule('LocationLite');
local LSM = LibStub("LibSharedMedia-3.0");

local COORDS_WIDTH = 30 -- Coord panels width
local classColor = RAID_CLASS_COLORS[E.myclass] -- for text coloring

LLB.version = GetAddOnMetadata("ElvUI_LocLite", "Version")
LLB.name = GetAddOnMetadata("ElvUI_LocLite", "Title")

-- Hide in combat, after fade function ends
local function LocPanelOnFade()
	LocationLitePanel:Hide()
end

-- AutoColoring
local function AutoColoring()
	local pvpType = GetZonePVPInfo()
	
	if (pvpType == "sanctuary") then
		return 0.41, 0.8, 0.94
	elseif(pvpType == "arena") then
		return 1, 0.1, 0.1
	elseif(pvpType == "friendly") then
		return 0.1, 1, 0.1
	elseif(pvpType == "hostile") then
		return 1, 0.1, 0.1
	elseif(pvpType == "contested") then
		return 1, 0.7, 0.10
	elseif(pvpType == "combat" ) then
		return 1, 0.1, 0.1
	else
		return 1, 0.7, 0.10
	end
end

-- clicking the location panel
local function LocPanel_OnClick(self, btn)
	zoneText = GetRealZoneText() or UNKNOWN;
	if btn == "LeftButton" then	
		if IsShiftKeyDown() then
			local edit_box = ChatEdit_ChooseBoxForSend()
			local x, y = GetPlayerMapPosition("player")
			local dig
			if E.db.loclite.dig then
				dig = 2
			else
				dig = 0
			end
			x = tonumber(E:Round(100 * x, dig))
			y = tonumber(E:Round(100 * y, dig))
			local message
			local coords = x..", "..y
				if zoneText ~= GetSubZoneText() then
					message = string.format("%s: %s (%s)", zoneText, GetSubZoneText(), coords)
				else
					message = string.format("%s (%s)", zoneText, coords)
				end
			ChatEdit_ActivateChat(edit_box)
			edit_box:Insert(message) 
		else
			ToggleFrame(WorldMapFrame)
		end
	end
	if btn == "RightButton" then
		E:ToggleConfig()
	end
end

-- Custom text color. Credits: Edoc
local color = { r = 1, g = 1, b = 1 }
local function unpackColor(color)
	return color.r, color.g, color.b
end

-- Location panel
function LLB:CreateMainLocPanel()
	local loc_panel = CreateFrame('Frame', 'LocationLitePanel', E.UIParent)
	loc_panel:Width(E.db.loclite.lpwidth)
	loc_panel:SetHeight(E.db.loclite.dtheight)
	loc_panel:Point('TOP', E.UIParent, 'TOP', 0, -E.mult -22)
	loc_panel:SetFrameStrata('LOW')
	loc_panel:EnableMouse(true)
	loc_panel:SetScript('OnMouseUp', LocPanel_OnClick)

	-- Location Text
	loc_panel.Text = LocationLitePanel:CreateFontString(nil, "LOW")
	loc_panel.Text:Point("CENTER", 0, 0)
	
	loc_panel:SetScript("OnUpdate", function(self,event,...)
		local subZoneText = GetMinimapZoneText() or ""
		local zoneText = GetRealZoneText() or UNKNOWN;
		local displayLine
		
		-- zone and subzone
		if E.db.loclite.both then
			if (subZoneText ~= "") and (subZoneText ~= zoneText) then
				displayLine = zoneText .. ": " .. subZoneText
			else
				displayLine = subZoneText
			end
		else
			displayLine = subZoneText
		end
		
		self.Text:SetText(displayLine)
		
		if displayLine ~= "" then
			if E.db.loclite.customColor == 1 then
				self.Text:SetTextColor(AutoColoring())
			elseif E.db.loclite.customColor == 2 then
				self.Text:SetTextColor(classColor.r, classColor.g, classColor.b)
			else
				self.Text:SetTextColor(unpackColor(E.db.loclite.userColor))
			end
		end
		
		local fixedwidth = (E.db.loclite.lpwidth + 18)
		local autowidth = (LocationLitePanel.Text:GetWidth() + 18)
			
		if E.db.loclite.lpauto or autowidth > fixedwidth then
			self:SetWidth(autowidth)
		else
			self:SetWidth(fixedwidth)
		end
	end)
	
	-- Hide in combat/Pet battle
	loc_panel:SetScript("OnEvent",function(self, event)
		if event == "PET_BATTLE_OPENING_START" then
			UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
			self.fadeInfo.finishedFunc = LocPanelOnFade
		elseif event == "PET_BATTLE_CLOSE" then
			UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
			self:Show()
		elseif E.db.loclite.combat then
			if event == "PLAYER_REGEN_DISABLED" then
				UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
				self.fadeInfo.finishedFunc = LocPanelOnFade
			elseif event == "PLAYER_REGEN_ENABLED" then
				UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
				self:Show()
			end
		end
	end)

	-- Mover
	E:CreateMover(LocationLitePanel, "LocationLiteMover", L["Location Lite"])
end

-- all panels height
function LiteDTHeight()
	if E.db.loclite.ht then
		LocationLitePanel:SetHeight((E.db.loclite.dtheight)+6)
	else
		LocationLitePanel:SetHeight(E.db.loclite.dtheight)
	end
	
	XCoordsPanel:SetHeight(E.db.loclite.dtheight)
	YCoordsPanel:SetHeight(E.db.loclite.dtheight)
end

-- Fonts
function LLB:LocCoordPanelFont()

	E["media"].lpFont = LSM:Fetch("font", E.db.loclite.lpfont)

	local panelsToFont = {LocationLitePanel, XCoordsPanel, YCoordsPanel}
	for _, frame in pairs(panelsToFont) do
		frame.Text:FontTemplate(E["media"].lpFont, E.db.loclite.lpfontsize, E.db.loclite.lpfontflags)
	end	

end

-- Toggle transparency
function LiteTransparent()
	local panelsToAddTrans = {LocationLitePanel, XCoordsPanel, YCoordsPanel}
	
	for _, frame in pairs(panelsToAddTrans) do
		frame:StripTextures(frame)
		if not E.db.loclite.noback then
			E.db.loclite.shadow = false
			E.db.loclite.asphyxia = false
			E.db.loclite.locpanel = false
		elseif E.db.loclite.trans then
			frame:SetTemplate('Transparent')
		else
			frame:SetTemplate('Default', true)
		end
	end

end

-- Enable/Disable shadows
function LiteShadow()
	local panelsToAddShadow = {LocationLitePanel, XCoordsPanel, YCoordsPanel}
	
	for _, frame in pairs(panelsToAddShadow) do
	frame:CreateShadow('Default')
		if E.db.loclite.shadow then
			frame.shadow:Show()
		else
			frame.shadow:Hide()
		end
	end

	local SPACING
	
	if E.db.loclite.shadow then
		SPACING = 2
	elseif E.db.loclite.asphyxia then
		SPACING = -4
	else
		SPACING = 1
	end
	
	XCoordsPanel:Point('RIGHT', LocationLitePanel, 'LEFT', -SPACING, 0)
	YCoordsPanel:Point('LEFT', LocationLitePanel, 'RIGHT', SPACING, 0)
end

function LocAsphyxia()
	local SPACING
	
	if E.db.loclite.asphyxia then
		SPACING = -4
		XCoordsPanel:SetFrameLevel(LocationLitePanel:GetFrameLevel()-1)
		YCoordsPanel:SetFrameLevel(LocationLitePanel:GetFrameLevel()-1)
		XCoordsPanel.Text:SetPoint("CENTER", 0, 0)
		YCoordsPanel.Text:SetPoint("CENTER", 2, 0)
		E.db.loclite.ht = true
		E.db.loclite.shadow = true
	else
		SPACING = 1
		XCoordsPanel.Text:SetPoint("CENTER", 1, 0)
		YCoordsPanel.Text:SetPoint("CENTER", 1, 0)
		E.db.loclite.ht = false
		E.db.loclite.shadow = false
	end

	LiteShadow()
	LiteDTHeight()
	
	XCoordsPanel:Point('RIGHT', LocationLitePanel, 'LEFT', -SPACING, 0)
	YCoordsPanel:Point('LEFT', LocationLitePanel, 'RIGHT', SPACING, 0)
end

-- Coord panels
function LLB:CreateLocCoordPanels()

	-- X Coord panel
	local coordsX = CreateFrame('Frame', "XCoordsPanel", LocationLitePanel)
	coordsX:Width(COORDS_WIDTH)
	coordsX:SetHeight(E.db.loclite.dtheight)
	coordsX.Text = XCoordsPanel:CreateFontString(nil, "LOW")

	-- Y Coord panel
	local coordsY = CreateFrame('Frame', "YCoordsPanel", LocationLitePanel)
	coordsY:Width(COORDS_WIDTH)
	coordsY:SetHeight(E.db.loclite.dtheight)
	coordsY.Text = YCoordsPanel:CreateFontString(nil, "LOW")
	
	LCoordsColor()

	local ela = 0

	local cUpdate = function(self,t)
		ela = ela - t
		if ela > 0 then return end
			local x,y = GetPlayerMapPosition("player")
			local xt,yt
			local dig
			if E.db.loclite.dig then
				dig = 2
			else
				dig = 0
			end
			x = tonumber(E:Round(100 * x, dig))
			y = tonumber(E:Round(100 * y, dig))
				if x == 0 and y == 0 then
					coordsX.Text:SetText("-")
					coordsY.Text:SetText("-")
				else
				if x < 10 then
					xt = "0"..x
				else
					xt = x
				end
			if y < 10 then
				yt = "0"..y
			else
				yt = y
			end
			coordsX.Text:SetText(xt)
			coordsY.Text:SetText(yt)
		end
	end
	ela = .2

	XCoordsPanel:SetScript("OnUpdate", cUpdate)

end

-- Coord panels width
function LCoordsDig()
	if E.db.loclite.dig then
		XCoordsPanel:SetWidth(COORDS_WIDTH*1.5)
		YCoordsPanel:SetWidth(COORDS_WIDTH*1.5)
	else
		XCoordsPanel:SetWidth(COORDS_WIDTH)
		YCoordsPanel:SetWidth(COORDS_WIDTH)
	end
end

function LCoordsColor()
	if E.db.loclite.customCoordsColor == 1 then
		XCoordsPanel.Text:SetTextColor(unpackColor(E.db.loclite.userColor))
		YCoordsPanel.Text:SetTextColor(unpackColor(E.db.loclite.userColor))			
	elseif E.db.loclite.customCoordsColor == 2 then
		XCoordsPanel.Text:SetTextColor(classColor.r, classColor.g, classColor.b)
		YCoordsPanel.Text:SetTextColor(classColor.r, classColor.g, classColor.b)
	else
		XCoordsPanel.Text:SetTextColor(unpackColor(E.db.loclite.userCoordsColor))
		YCoordsPanel.Text:SetTextColor(unpackColor(E.db.loclite.userCoordsColor))
	end
end

-- Update changes
function LLB:LocLiteUpdate()
	LiteTransparent()
	LiteShadow()
	LCoordsDig()
	LCoordsColor()
	LocAsphyxia()
end

function LLB:LocDefault()
	if E.db.loclite.lpwidth == nil then
		E.db.loclite.lpwidth = 200
	end	
	
	if E.db.loclite.dtheight == nil then
		E.db.loclite.dtheight = 21
	end	
end

function LLB:Initialize()
	if IsAddOnLoaded("ElvUI_LocPlus") then StaticPopup_Show("PlusLite") end
	LLB:LocDefault()
	LLB:CreateMainLocPanel()
	LLB:CreateLocCoordPanels()
	LLB:LocLiteUpdate()
	LLB:LocCoordPanelFont()
	LocationLitePanel:RegisterEvent("PLAYER_REGEN_DISABLED")
	LocationLitePanel:RegisterEvent("PLAYER_REGEN_ENABLED")
	LocationLitePanel:RegisterEvent("PET_BATTLE_CLOSE")
	LocationLitePanel:RegisterEvent("PET_BATTLE_OPENING_START")
	print(LLB.name..format(" v|cff33ffff%s|r",LLB.version)..L[" is loaded. Thank you for using it."])
end

E:RegisterModule(LLB:GetName())

StaticPopupDialogs["PlusLite"] = {
	text = L[".:: LocationPlus - LocationLite ::.\nIt's not wise to use both Plus and Lite versions."]..format("|cffff0000%s|r",L["\nPlease choose which one to disable."]),
	button1 = L['Location Lite'],
	button2 = L['LocationPlus'],
	OnAccept = function() DisableAddOn("ElvUI_LocLite");ReloadUI() end,
	OnCancel = function() DisableAddOn("ElvUI_LocPlus");ReloadUI() end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = false,
	preferredIndex = 3,
}
