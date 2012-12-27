local _, E, L, C = nil, unpack(select(2, ...))

-- No Operation Function
E.noop = function() end

-- Profile and Addons Database
E.Profiles = {}
E.Addons = {}

-- Store our name and realm for profile reasons
C.profile = UnitName("player").." - "..GetRealmName()


local function CreateProfileEntry(name, profile, ace3Compatible)
  return {
    Name        = name,
    Profile     = profile,
    Ace3        = ace3Compatible,
  }
end

local function CreateAddonEntry(name, enabled)
  return {
    Name        = name,
    IsEnabled   = enabled,
  }
end

-- Config Functions
function C:IsInstalled()
  if not self.profiles then
    self.profiles = { }
  end
  
  if not self.profiles[self.profile] then
    self.profiles[self.profile] = { }
  end

  return self.profiles[self.profile].installed
end

function C:IsDeclined()
  if not self.profiles or not self.profiles[self.profile] then self:IsInstalled() end

  return self.profiles[self.profile].declined
end

function C:SetInstallState(installed)
  if not self.profiles or not self.profiles[self.profile] then self:IsInstalled() end
  
  self.profiles[self.profile].installed = installed
end

function C:SetDeclinedState(declined)
  if not self.profiles or not self.profiles[self.profile] then self:IsInstalled() end

  self.profiles[self.profile].declined = declined
end

function C:SetBackupDatabase(backup)
  if not self.profiles or not self.profiles[self.profile] then self:IsInstalled() end

  self.profiles[self.profile].backup = backup
end

function C:GetBackupDatabase()
  if not self.profiles or not self.profiles[self.profile] then self:IsInstalled() end

  return self.profiles[self.profile].backup
end

-- Engine Functions
function E:RegisterProfile(Name, Profile, Ace3Compatible)
  table.insert(E.Profiles, CreateProfileEntry(Name, Profile, Ace3Compatible))
end

function E:RegisterAddon(AddonName, Enabled)
  table.insert(E.Addons, CreateAddonEntry(AddonName, Enabled))
end

function E:Install(force)
  local backups = {}
  for _, entry in pairs(self.Profiles) do
    
    
    if entry.Ace3 then
      -- Create a backup of the current profile name
      table.insert(backups, CreateProfileEntry(entry.Name, _G[entry.Name].profileKeys[C.profile], true))
      
      -- Load the profile into the Ace3 database and assign it as the default profile for this toon
      if not _G[entry.Name].profiles[L.ui_name] or force then
        _G[entry.Name].profiles[L.ui_name] = entry.Profile
      end
      
      _G[entry.Name].profileKeys[C.profile] = L.ui_name
    else
      -- Create a backup first
      table.insert(backups, CreateProfileEntry(entry.Name, _G[entry.Name], false))
    
      -- Load the new value into the global
      _G[entry.Name] = entry.Profile
    end
  end
  
  -- Save the backups for later
  C.Backups = backups
  
  -- Load the addons if we need to
  for index = 1,GetNumAddOns() do
    local name, title, notes, enabled, loadable, reason, security = GetAddOnInfo(index)
    for _, entry in pairs(self.Addons) do
      if entry.Name == name then
        if not enabled then
          if entry.IsEnabled then
            print("EnableAddOn:", entry.Name)
            EnableAddOn(entry.Name)
          else
            DisableAddOn(entry.Name)
          end
        end
      end
    end
  end
  
  -- We are now installed, restarting UI
  C:SetInstallState(true)
  ReloadUI()
end

function E:Uninstall()
  for i, entry in pairs(C.Backups) do
    if entry.Ace3 then
      _G[entry.Name].profileKeys[C.profile] = entry.Profile
    else
      -- Load the new value
      _G[entry.Name] = entry.Profile
    end
  end
  
  C:SetInstallState(false)
  ReloadUI()
end

function E:LoadConfig(database)
  setmetatable(C, {
    __index = function(table, key)
        return database[key]
      end,
    __newindex = function(table, key, value)
        database[key] = value
      end,
  })
end

function E.Event_EnteringWorld(self)
  self:UnregisterEvent("PLAYER_ENTERING_WORLD")
  
  -- Make sure we have the config
  if not UInstallDB then UInstallDB = { } end

  -- Load the config into 'C'
  E:LoadConfig(UInstallDB)
  
  -- Check to see if we have to install
  if C:IsDeclined() then
    print(L.startup_declined)
  else  
    if not C:IsInstalled() then
      StaticPopup_Show("UINSTALLER_ASKTO_INSTALL")
    end
  end
end


local entering = CreateFrame("FRAME")
entering:RegisterEvent("PLAYER_ENTERING_WORLD")
entering:SetScript("OnEvent", E.Event_EnteringWorld)

-- Create Static Popup Windows
StaticPopupDialogs["UINSTALLER_ASKTO_INSTALL"] = {
  text          = L.install_desc,
  timeout       = 0,
  whileDead     = 1,
  
  button1       = L.install_accept,
  button2       = L.install_decline,
  OnAccept      = function() C:SetDeclinedState(false); E:Install() end,
  OnCancel      = function() print(L.install_declined_text); C:SetDeclinedState(true) end,
  hideOnEscape  = true,
  
  -- Taint work around
  preferredIndex = 3,
}

StaticPopupDialogs["UINSTALLER_ASKTO_REINSTALL"] = {
  text          = L.reinstall_desc,
  timeout       = 0,
  whileDead     = 1,
  
  button1       = L.reinstall_accept,
  button2       = L.reinstall_decline,
  OnAccept      = function() C:SetDeclinedState(false); E:Install(true) end,
  hideOnEscape  = true,
  
  -- Taint work around
  preferredIndex = 3,
}

StaticPopupDialogs["UINSTALLER_ASKTO_UNINSTALL"] = {
  text          = L.uninstall_desc,
  timeout       = 0,
  whileDead     = 1,
  
  button1       = L.uninstall_accept,
  button2       = L.uninstall_decline,
  OnAccept      = function() E:Uninstall(); C:SetDeclinedState(true); end,
  hideOnEscape  = true,
  
  -- Taint work around
  preferredIndex = 3,
}

-- Register Slash Commands
SLASH_UINSTALL1 = L.slash_install

SlashCmdList["UINSTALL"] = function(input)
  if input == L.slash_uninstall_command then
    if C:IsInstalled() then
      StaticPopup_Show("UINSTALLER_ASKTO_UNINSTALL")
      return
    end
  end
  
  if input == L.slash_reinstall_command then
    if C:IsInstalled() then
      StaticPopup_Show("UINSTALLER_ASKTO_REINSTALL")
      return
    end
  end
  
  if C:IsInstalled() then
    print(L.error_already_installed)
    return
  else
    StaticPopup_Show("UINSTALLER_ASKTO_INSTALL")
    return
  end
end

-- Common Mispellings
SLASH_UNINSTALL1 = L.error_slash
SlashCmdList["UNINSTALL"] = function(input)
  print(L.error_slash_message)
end
