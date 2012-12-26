local E, L, V, P, G, _ = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local A = E:GetModule('Auras');
local VAT = E:NewModule('VisualAuraTimers')

if E.private.auras.enable ~= true then return end

function VAT:UpdateAuras(header, button)
	if not button.Holder then
		-- Border
		local BarHolder = CreateFrame("Frame", nil, button)
		BarHolder:Size(button:GetWidth() + (E.PixelMode and 2 or 4), (E.PixelMode and 5 or 7))
		BarHolder:Point("TOP", button, "BOTTOM", 0, -(E.PixelMode and 2 or 5))
		BarHolder:SetTemplate("Default")
		button.Holder = BarHolder

		-- Statusbar
		local Bar = CreateFrame("StatusBar", nil, BarHolder)
		Bar:SetInside(BarHolder)
		Bar:SetStatusBarTexture(E["media"].blankTex)
		Bar:SetStatusBarColor(0, 0.8, 0)
		button.Bar = Bar
	end

	local name, _, _, _, dtype, duration, expiration = UnitAura(header:GetAttribute("unit"), button:GetID(), header:GetAttribute("filter"))
	if(name) then
		local isDebuff
		if name == select(1,UnitBuff("player",name)) then
			isDebuff = false
		elseif name == select(1,UnitDebuff("player",name)) then
			isDebuff = true
		end
		button.isDebuff = isDebuff
		button.auraDur = duration
	
		if(header:GetAttribute("filter") == "HARMFUL") then
			local color = DebuffTypeColor[dtype] or DebuffTypeColor.none
			-- Match color of statusbar border to color of the border of the debuff aura
			button.Holder:SetBackdropBorderColor(color.r * 3/5, color.g * 3/5, color.b * 3/5)
		end

		-- Set min / max values
		if (button.Bar and button.auraDur > 0 and expiration) then
			button.Bar:SetMinMaxValues(0, button.auraDur)
		else
			-- Make sure a full statusbar is shown if aura has no duration
			local min, max  = button.Bar:GetMinMaxValues()
			button.Bar:SetValue(max)
			button.Bar:SetStatusBarColor(0, 0.8, 0)
		end
	end	
end

function VAT:UpdateTime(elapsed)
local enable = E.db.auras.visualtimer.enable
local tEnable = E.db.auras.visualtimer.tenable
local noduration = E.db.auras.visualtimer.noduration
local buffs = E.db.auras.visualtimer.threshold.buffs
local debuffs = E.db.auras.visualtimer.threshold.debuffs
local buffsvalue = E.db.auras.visualtimer.threshold.buffsvalue
local debuffsvalue = E.db.auras.visualtimer.threshold.debuffsvalue

	-- Toggle Visual Timer vs. Text Timer
	-- For auras with no duration
	if(self.expiration <= 0) then
		-- If enabled then toggle to visual timer
		if enable then
			-- If "No Duration" is disabled then toggle to text on auras with no duration
			if not noduration then
				self.Holder:Hide()
				self.time:Show()
			else
				self.Holder:Show()
				self.time:Hide()
			end
		-- Else toggle to text
		else
			self.Holder:Hide()
			self.time:Show()
		end
	-- For auras with a duration
	else
		-- If enabled then toggle to visual timer
		if enable then
			-- If aura duration goes below threshold then toggle to text
			if tEnable then
				-- Buffs
				if buffs and self.expiration <= buffsvalue and self.auraDur > 0 and self.isDebuff == false then
					self.Holder:Hide()
					self.time:Show()
				-- Debuffs
				elseif debuffs and self.expiration <= debuffsvalue and self.auraDur > 0 and self.isDebuff == true then
					self.Holder:Hide()
					self.time:Show()
				else
					self.Holder:Show()
					self.time:Hide()
				end
			end
		-- Else toggle to text
		else
			self.Holder:Hide()
			self.time:Show()
		end

		-- Set color and value of statusbar
		local r, g, b = ElvUF.ColorGradient(self.expiration, self.auraDur, 0.8,0,0,0.8,0.8,0,0,0.8,0)
		self.Bar:SetValue(self.expiration)
		self.Bar:SetStatusBarColor(r, g, b)
	end
end

function VAT:UpdateWeapon(button)
	-- If the statusbar doesn't exist then create it
	if not button.Holder then
		-- Border
		local BarHolder = CreateFrame("Frame", nil, button)
		BarHolder:Size(button:GetWidth(), (E.PixelMode and 5 or 7))
		BarHolder:Point("TOP", button, "BOTTOM", 0, -(E.PixelMode and 1 or 3))
		BarHolder:SetTemplate("Default")
		button.Holder = BarHolder

		-- Statusbar
		local Bar = CreateFrame("StatusBar", nil, BarHolder)
		Bar:SetInside(BarHolder)
		Bar:SetStatusBarTexture(E["media"].blankTex)
		Bar:SetStatusBarColor(0, 0.8, 0)
		button.Bar = Bar
	end

	-- Here we try to figure out the maximum duration of the weapon enchant
	local duration
	local expiration
	local expire = select(2, GetWeaponEnchantInfo())
	if(expire) then
		-- expire returns time to expiration in miliseconds, turn it into seconds
		expiration = expire / 1000

		-- If less than 1 hour and higher than 30 minutes set max duration to 1 hour
		if expiration <= 3600.5 and expiration > 1800.5 then
			duration = 3600

		-- if less than 30 minutes and higher than 10 minutes set max duration to 30 minutes
		elseif expiration <= 1800.5 and expiration > 600.5 then
			duration = 1800

		--if less than 10 minutes and higher than 0 seconds set max duration to 10 minutes
		elseif expiration <= 600.5 and expiration > 0 then
			duration = 600
		end
	end
	button.weaponDur = duration

	-- Set min / max values
	if (button.Bar and button.weaponDur) then
		button.Bar:SetMinMaxValues(0, button.weaponDur)
	end
end

function VAT:UpdateWeaponText(auraButton, timeLeft)
local enable = E.db.auras.visualtimer.enable
local tEnable = E.db.auras.visualtimer.tenable
local tempenchants = E.db.auras.visualtimer.threshold.tempenchants
local tempenchantsvalue = E.db.auras.visualtimer.threshold.tempenchantsvalue

	-- Apparently "totems" are calling updates here, prevent errors by checking if holder is created
	if auraButton.Holder then
		if(timeLeft) then
			if(timeLeft > 0) then
				-- Toggle Visual Timer vs. Text Timer
				-- If enabled then toggle to visual timer
				if enable then
					-- If aura duration goes below threshold then toggle to text
					if tEnable and tempenchants and timeLeft <= tempenchantsvalue then
						auraButton.Holder:Hide()
						auraButton.time:Show()
					else
						auraButton.Holder:Show()
						auraButton.time:Hide()
					end
				-- Else toggle to text
				else
					auraButton.Holder:Hide()
					auraButton.time:Show()
				end
				
				-- When applying temporary weapon enchant, GetWeaponEnchantInfo() returns nil for a short amount of time.
				-- In case no max duration is set yet we calculate it here aswell
				if not auraButton.weaponDur then
					local duration
					local expire = select(2, GetWeaponEnchantInfo())
					-- expire returns time to expiration in miliseconds, turn it into seconds
					local expiration = expire / 1000

					if(expire) then
						-- If less than 1 hour and higher than 30 minutes set max duration to 1 hour (most weapon enchants)
						if expiration <= 3600.5 and expiration > 1800.5 then
							duration = 3600

						-- if less than 30 minutes and higher than 10 minutes set max duration to 30 minutes (some weapon enchants)
						elseif expiration <= 1800.5 and expiration > 600.5 then
							duration = 1800

						--if less than 10 minutes and higher than 0 seconds set max duration to 10 minutes (fishing lures)
						elseif expiration <= 600.5 and expiration > 0 then
							duration = 600
						end
					end
					auraButton.weaponDur = duration
					
					-- Set min / max values
					if (auraButton.Bar and auraButton.weaponDur) then
						auraButton.Bar:SetMinMaxValues(0, auraButton.weaponDur)
					end
				end

				-- Set color and value of statusbar and match color of statusbar border to color of the aura border
				local r, g, b = ElvUF.ColorGradient(timeLeft, auraButton.weaponDur, 0.8,0,0,0.8,0.8,0,0,0.8,0)
				auraButton.Bar:SetValue(timeLeft)
				auraButton.Bar:SetStatusBarColor(r, g, b)
				auraButton.Holder:SetBackdropBorderColor(137/255, 0, 191/255)
			end
		end
	end
end

-- Force update of temporary enchants if we change weapon(s) in case the newly equipped weapon(s) already has a temporary enchant on it
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
f:SetScript("OnEvent", function(self, event, slot, ...)
	if event == "PLAYER_EQUIPMENT_CHANGED" then
		if slot == 16 or slot == 17 then
			for i = 1, 2 do
				A:UpdateWeapon(_G["TempEnchant"..i])	
			end
		end
	end
end)

function VAT:OnInitialize()
	hooksecurefunc(A,"UpdateAuras",VAT.UpdateAuras)
	hooksecurefunc(A,"UpdateTime",VAT.UpdateTime)
	hooksecurefunc(A,"UpdateWeapon",VAT.UpdateWeapon)
	hooksecurefunc(A,"UpdateWeaponText",VAT.UpdateWeaponText)
end

E:RegisterModule(VAT:GetName())