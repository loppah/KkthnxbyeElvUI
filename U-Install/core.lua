local E, L, C = unpack(select(2, ...))

-- Profile and Addons Database
E.Profiles = {}
E.Addons = {}

local function CreateProfileEntry(n, p)
  return {Name=n,Profile=p}
end

local function CreateAddonEntry(n, e)
  return {Name=n,IsEnabled=e}
end

function E:RegisterProfile(Name, Profile)
  table.insert(E.Profiles, CreateProfileEntry(Name, Profile))
end

function E:RegisterAddon(AddonName, Enabled)
  table.insert(E.Addons, CreateAddonEntry(AddonName, Enabled))
end

function E:Install()
  local backups = {}
  for i, entry in pairs(self.Profiles) do
    -- Create a backup first
    table.insert(backups, CreateProfileEntry(entry.Name, _G[entry.Name]))
    
    -- Load the new value
    _G[entry.Name] = entry.Profile
  end
  
  -- Save the backups for later
  C.Backups = backups
  
  -- Load the addons if we need to
  for index = 1,GetNumAddOns() do
    local name, title, notes, enabled, loadable, reason, security = GetAddOnInfo(index)
    for i, entry in pairs(self.Addons) do
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
  C.installed = true
  ReloadUI()
end

function E:Uninstall()
  for i, entry in pairs(C.Backups) do
    -- Load the new value
    _G[entry.Name] = entry.Profile
  end
  
  C.installed = false
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
  if C.declined then
    print(L.startup_declined)
  else  
    if not C.installed then
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
  OnAccept      = function() E:Install(); C.declined = false end,
  OnCancel      = function() print(L.install_declined_text); C.declined = true end,
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
  OnAccept      = function() E:Uninstall(); C.declined = true; end,
  hideOnEscape  = true,
  
  -- Taint work around
  preferredIndex = 3,
}

-- Register Slash Commands
SLASH_UINSTALL1 = L.slash_install

SlashCmdList["UINSTALL"] = function(input)
  if input == L.slash_uninstall_command then
    if C.installed then
      StaticPopup_Show("UINSTALLER_ASKTO_UNINSTALL")
      return
    end
  end
  
  if C.installed then
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
