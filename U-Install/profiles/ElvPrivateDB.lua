local E, L, C = unpack(select(2, ...))

local name, ace3 = "ElvPrivateDB", true
local profile = {
  ["skins"] = {
    ["addons"] = {
      ["EmbedSkada"] = true,
      ["AlwaysTrue"] = true,
    },
  },
  ["install_complete"] = "5.1",
}

E:RegisterProfile(name, profile, ace3)
