local E, L, C = unpack(select(2, ...))

if E.Client == "enUS" or not L.Loaded then
-- Edit lines below to the correct text
  
  -- Install Popup  
  L.install_desc = "Would you like to use |cffFFFF00U-Install|r to install this UI compilation?"
  L.install_accept = "Install"
  L.install_decline = "Decline"
  L.install_declined_text = "You can always use |cffFFFF00U-Install|r later by typing |cffFF0000/uinstall|r"
  
  -- Uninstall Popup  
  L.uninstall_desc = "Would you like to use |cffFFFF00U-Install|r to uninstall this UI compilation and reload your previous settings?"
  L.uninstall_accept = "Remove"
  L.uninstall_decline = "Cancel"
  
  -- Startup Text
  L.startup_declined = "|cffFFFF00U-Install|r wants to install this UI compilation. Type |cffFF0000/uinstall|r to install."
  
  -- Slash Commands
  L.slash_install = "/uinstall"
  L.slash_uninstall_command = "remove"  -- use "remove" for "/uinstall remove"
  
  -- Errors
  L.error_already_installed = "|cffFFFF00U-Install|r has installed already this UI compilation. Type |cffFF0000/uinstall remove|r to uninstall."
  
  L.error_slash = "/uninstall"
  L.error_slash_message = "|cffFFFF00U-Install:|r Did you mean |cffFF0000/uinstall|r ?"
  
  -- Do NOT edit this following line
  L.Loaded = true
end
