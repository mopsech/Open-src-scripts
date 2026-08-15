local NeverLose = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/NeverLose/refs/heads/main/source.luau"))()

local Window = NeverLose:CreateWindow({
    Name = "AI PAST HUB",
    Content = "Visuals | Combat | Misc",
    -- НОРМАЛЬНЫЙ РАЗМЕР (как в первом файле, только чуть шире чтобы подкатегории влезли)
    Size = UDim2.fromOffset(900, 600),
})

-- ============================================================
-- VISUALS
-- ============================================================
local Visuals = Window:AddTab({ Name = "Visuals", Icon = "sparkles" })

-- ПОДКАТЕГОРИЯ 1
local HatSection = Visuals:AddSection({ Name = "Hat & Trail" })
HatSection:AddLabel("Chinese Hat"):AddToggle({ Default = false, Callback = function(v) end })
HatSection:AddLabel("Rainbow Hat"):AddToggle({ Default = false, Callback = function(v) end })
HatSection:AddLabel("Hat Transparency"):AddSlider({ Default = 0.3, Min = 0, Max = 1, Rounding = 2, Callback = function(v) end })
HatSection:AddLabel("Trail"):AddToggle({ Default = false, Callback = function(v) end })
HatSection:AddLabel("Rainbow Trail"):AddToggle({ Default = false, Callback = function(v) end })
HatSection:AddLabel("Trail Lifetime"):AddSlider({ Default = 0.5, Min = 0.1, Max = 3, Rounding = 1, Callback = function(v) end })

-- ПОДКАТЕГОРИЯ 2 (РЯДОМ)
local AuraSection = Visuals:AddSection({ Name = "Aura & ForceField" })
AuraSection:AddLabel("ForceField"):AddToggle({ Default = false, Callback = function(v) end })
AuraSection:AddLabel("Rainbow ForceField"):AddToggle({ Default = false, Callback = function(v) end })
AuraSection:AddLabel("Local Aura"):AddToggle({ Default = false, Callback = function(v) end })

-- ПОДКАТЕГОРИЯ 3 (РЯДОМ)
local WorldSection = Visuals:AddSection({ Name = "World" })
WorldSection:AddLabel("Custom Skybox"):AddToggle({ Default = false, Callback = function(v) end })
WorldSection:AddLabel("Full Bright"):AddToggle({ Default = false, Callback = function(v) end })
WorldSection:AddLabel("Time Changer"):AddToggle({ Default = false, Callback = function(v) end })
WorldSection:AddLabel("Time"):AddSlider({ Default = 12, Min = 0, Max = 24, Rounding = 0, Callback = function(v) end })

-- ПОДКАТЕГОРИЯ 4 (РЯДОМ)
local ESPSection = Visuals:AddSection({ Name = "ESP & Screen" })
ESPSection:AddLabel("ESP Outline"):AddToggle({ Default = false, Callback = function(v) end })
ESPSection:AddLabel("ESP Names"):AddToggle({ Default = false, Callback = function(v) end })
ESPSection:AddLabel("ESP Avatar"):AddToggle({ Default = false, Callback = function(v) end })
ESPSection:AddLabel("Avatar Size"):AddSlider({ Default = 72, Min = 40, Max = 120, Rounding = 0, Callback = function(v) end })
ESPSection:AddLabel("Screen Effect"):AddToggle({ Default = false, Callback = function(v) end })
ESPSection:AddLabel("Anime Image"):AddToggle({ Default = false, Callback = function(v) end })

-- ============================================================
-- COMBAT
-- ============================================================
local Combat = Window:AddTab({ Name = "Combat", Icon = "swords" })

-- ПОДКАТЕГОРИЯ 1
local AimSection = Combat:AddSection({ Name = "Aim & Grab" })
AimSection:AddLabel("Silent Aim"):AddToggle({ Default = false, Callback = function(v) end })
AimSection:AddLabel("Silent Aim Range"):AddSlider({ Default = 50, Min = 5, Max = 200, Rounding = 0, Callback = function(v) end })
AimSection:AddLabel("Further Reach"):AddToggle({ Default = false, Callback = function(v) end })
AimSection:AddLabel("Fire Grab"):AddToggle({ Default = false, Callback = function(v) end })
AimSection:AddLabel("Poison Grab"):AddToggle({ Default = false, Callback = function(v) end })
AimSection:AddLabel("Death Grab"):AddToggle({ Default = false, Callback = function(v) end })
AimSection:AddLabel("Burn Grab"):AddToggle({ Default = false, Callback = function(v) end })
AimSection:AddLabel("Noclip Grab"):AddToggle({ Default = false, Callback = function(v) end })
AimSection:AddLabel("Massless Grab"):AddToggle({ Default = false, Callback = function(v) end })

-- ПОДКАТЕГОРИЯ 2 (РЯДОМ)
local AuraSec = Combat:AddSection({ Name = "Auras" })
AuraSec:AddLabel("Poison Aura"):AddToggle({ Default = false, Callback = function(v) end })
AuraSec:AddLabel("Death Aura"):AddToggle({ Default = false, Callback = function(v) end })
AuraSec:AddLabel("Burn Aura"):AddToggle({ Default = false, Callback = function(v) end })
AuraSec:AddLabel("Fling Aura"):AddToggle({ Default = false, Callback = function(v) end })
AuraSec:AddLabel("Anchor Aura"):AddToggle({ Default = false, Callback = function(v) end })
AuraSec:AddLabel("Telekinesis Aura"):AddToggle({ Default = false, Callback = function(v) end })
AuraSec:AddLabel("Aura Radius"):AddSlider({ Default = 20, Min = 5, Max = 50, Rounding = 0, Callback = function(v) end })

-- ПОДКАТЕГОРИЯ 3 (РЯДОМ)
local DefenseSection = Combat:AddSection({ Name = "Defense" })
DefenseSection:AddLabel("Anti-Grab"):AddToggle({ Default = false, Callback = function(v) end })
DefenseSection:AddLabel("Anti-Burn"):AddToggle({ Default = false, Callback = function(v) end })
DefenseSection:AddLabel("Anti-Explosion"):AddToggle({ Default = false, Callback = function(v) end })
DefenseSection:AddLabel("Anti-Void"):AddToggle({ Default = false, Callback = function(v) end })
DefenseSection:AddLabel("Anti-Kick"):AddToggle({ Default = false, Callback = function(v) end })
DefenseSection:AddLabel("Anti-Lag"):AddToggle({ Default = false, Callback = function(v) end })
DefenseSection:AddLabel("Anti-Blobman"):AddToggle({ Default = false, Callback = function(v) end })
DefenseSection:AddLabel("Anti-Barrier"):AddToggle({ Default = false, Callback = function(v) end })

-- ============================================================
-- MISC
-- ============================================================
local Misc = Window:AddTab({ Name = "Misc", Icon = "settings" })

-- ПОДКАТЕГОРИЯ 1
local PlayerSection = Misc:AddSection({ Name = "Player & Movement" })
PlayerSection:AddLabel("Second Person Camera"):AddToggle({ Default = false, Callback = function(v) end })
PlayerSection:AddLabel("Walkspeed"):AddToggle({ Default = false, Callback = function(v) end })
PlayerSection:AddLabel("Speed"):AddSlider({ Default = 5, Min = 1, Max = 10, Rounding = 1, Callback = function(v) end })
PlayerSection:AddLabel("Infinite Jump"):AddToggle({ Default = false, Callback = function(v) end })
PlayerSection:AddLabel("Jump Power"):AddSlider({ Default = 50, Min = 16, Max = 500, Rounding = 0, Callback = function(v) end })
PlayerSection:AddLabel("Noclip"):AddToggle({ Default = false, Callback = function(v) end })

-- ПОДКАТЕГОРИЯ 2 (РЯДОМ)
local TeleportSection = Misc:AddSection({ Name = "Teleport & Utility" })
TeleportSection:AddLabel("Place to Teleport"):AddDropdown({
    Default = "Spawn",
    Values = { "Spawn", "Green House", "Blue House", "Farm", "Mine" },
    Callback = function(v) end
})
TeleportSection:AddLabel("Teleport"):AddToggle({ Default = false, Callback = function(v) end })
TeleportSection:AddLabel("Loop Teleport"):AddToggle({ Default = false, Callback = function(v) end })
TeleportSection:AddLabel("Lag Server"):AddToggle({ Default = false, Callback = function(v) end })
TeleportSection:AddLabel("Spawn Banana"):AddToggle({ Default = false, Callback = function(v) end })
TeleportSection:AddLabel("Enable Graphics"):AddToggle({ Default = false, Callback = function(v) end })
TeleportSection:AddLabel("Disable Graphics"):AddToggle({ Default = false, Callback = function(v) end })
TeleportSection:AddLabel("Clear Effects"):AddToggle({ Default = false, Callback = function(v) end })

-- ПОДКАТЕГОРИЯ 3 (РЯДОМ)
local LoopSection = Misc:AddSection({ Name = "Loop" })
LoopSection:AddLabel("Loop Kill"):AddToggle({ Default = false, Callback = function(v) end })
LoopSection:AddLabel("Loop Kick"):AddToggle({ Default = false, Callback = function(v) end })
LoopSection:AddLabel("Loop Ragdoll"):AddToggle({ Default = false, Callback = function(v) end })
LoopSection:AddLabel("Loop Fire"):AddToggle({ Default = false, Callback = function(v) end })

-- ПОДКАТЕГОРИЯ 4 (РЯДОМ)
local BringSection = Misc:AddSection({ Name = "Bring All" })
BringSection:AddLabel("Bring All"):AddToggle({ Default = false, Callback = function(v) end })
BringSection:AddLabel("Whitelist Friends"):AddToggle({ Default = false, Callback = function(v) end })
