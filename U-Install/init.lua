local AddOnName, AddOn = ...

local E = {} -- Engine
local L = {} -- Locales
local C = {} -- Config

AddOn[1] = E
AddOn[2] = L
AddOn[3] = C

E.Name   = AddOnName
E.Client = GetLocale()

_G[AddOnName] = AddOn
