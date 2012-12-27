local E, L, C = unpack(select(2, ...))

if E.Client == "enUS" or not L.Loaded then
-- Edit lines below to the correct text
  L.ui_name = "|cffC5B358Kkthnxbye|r|cff7282E0ElvUI|r"
  
  -- Slash Commands
  L.slash_install = "/uinstall"
  L.slash_uninstall_command = "remove"     -- use "remove" for "/uinstall remove"
  L.slash_reinstall_command = "reinstall"  -- use "reinstall" for "/uinstall reinstall"
  
  -- Install Popup  
  L.install_desc = "Would you like to use |cffFFFF00U-Install|r to install " .. L.ui_name .. "?"
  L.install_accept = "Install"
  L.install_decline = "Decline"
  L.install_declined_text = "You can always use |cffFFFF00U-Install|r later by typing |cffFF0000" .. L.slash_install .. "|r"
  
  -- Reinstall Popup
  L.reinstall_desc = "Would you like to use |cffFFFF00U-Install|r to reinstall " .. L.ui_name .. "? All settings will be restored to default and any changes will be lost."
  L.reinstall_accept = "Reinstall"
  L.reinstall_decline = "Cancel"
  
  -- Uninstall Popup  
  L.uninstall_desc = "Would you like to use |cffFFFF00U-Install|r to uninstall " .. L.ui_name .. " and reload your previous settings?"
  L.uninstall_accept = "Remove"
  L.uninstall_decline = "Cancel"

  -- Startup Text
  L.startup_declined = "|cffFFFF00U-Install|r wants to install " .. L.ui_name .. ". Type |cffFF0000" .. L.slash_install .. "|r to install."
  
  -- Errors
  L.error_already_installed = "|cffFFFF00U-Install|r has already installed " .. L.ui_name .. ".\n  Type |cffFF0000" .. L.slash_install .. "|r |cff7090D8" .. L.slash_uninstall_command .. "|r to uninstall.\n  Type |cffFF0000" .. L.slash_install .. "|r |cff7090D8" .. L.slash_reinstall_command .. "|r to reinstall ".. L.ui_name .."."
  
  L.error_slash = "/uninstall"
  L.error_slash_message = "|cffFFFF00U-Install:|r Did you mean |cffFF0000" .. L.slash_install .. "|r ?"
  
  -- Do NOT edit this following line
  L.Loaded = true
end
