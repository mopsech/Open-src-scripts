local NeverLose = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/NeverLose/refs/heads/main/source.luau"))()

local Window = NeverLose:CreateWindow({
    Name = "AI PAST HUB",
    Content = "Visuals | Combat | Misc",
})

-- ===== VISUALS =====
local Visuals = Window:AddTab({ Name = "Visuals", Icon = "sparkles" })

local HatSection = Visuals:AddSection({ Name = "Hat & Trail" })
HatSection:AddLabel("Chinese Hat"):AddToggle({ Default = false, Callback = function(v) end })
HatSection:AddLabel("Rainbow Hat"):AddToggle({ Default = false, Callback = function(v) end })
HatSection:AddLabel("Hat Transparency"):AddSlider({ Default = 0.3, Min = 0, Max = 1, Rounding = 2, Callback = function(v) end })

local TrailSection = Visuals:AddSection({ Name = "Trail" })
TrailSection:AddLabel("Trail"):AddToggle({ Default = false, Callback = function(v) end })
TrailSection:AddLabel("Rainbow Trail"):AddToggle({ Default = false, Callback = function(v) end })
TrailSection:AddLabel("Trail Lifetime"):AddSlider({ Default = 0.5, Min = 0.1, Max = 3, Rounding = 1, Callback = function(v) end })

local AuraSection = Visuals:AddSection({ Name = "Aura & ForceField" })
AuraSection:AddLabel("ForceField"):AddToggle({ Default = false, Callback = function(v) end })
AuraSection:AddLabel("Rainbow ForceField"):AddToggle({ Default = false, Callback = function(v) end })
AuraSection:AddLabel("Local Aura"):AddToggle({ Default = false, Callback = function(v) end })

local WorldSection = Visuals:AddSection({ Name = "World" })
WorldSection:AddLabel("Custom Skybox"):AddToggle({ Default = false, Callback = function(v) end })
WorldSection:AddLabel("Full Bright"):AddToggle({ Default = false, Callback = function(v) end })
WorldSection:AddLabel("Time Changer"):AddToggle({ Default = false, Callback = function(v) end })
WorldSection:AddLabel("Time"):AddSlider({ Default = 12, Min = 0, Max = 24, Rounding = 0, Callback = function(v) end })

local ESPSection = Visuals:AddSection({ Name = "ESP" })
ESPSection:AddLabel("ESP Outline"):AddToggle({ Default = false, Callback = function(v) end })
ESPSection:AddLabel("ESP Names"):AddToggle({ Default = false, Callback = function(v) end })
ESPSection:AddLabel("ESP Avatar"):AddToggle({ Default = false, Callback = function(v) end })
ESPSection:AddLabel("Avatar Size"):AddSlider({ Default = 72, Min = 40, Max = 120, Rounding = 0, Callback = function(v) end })

local ScreenSection = Visuals:AddSection({ Name = "Screen Effects" })
ScreenSection:AddLabel("Screen Effect"):AddToggle({ Default = false, Callback = function(v) end })
ScreenSection:AddLabel("Anime Image"):AddToggle({ Default = false, Callback = function(v) end })

-- ===== COMBAT =====
local Combat = Window:AddTab({ Name = "Combat", Icon = "swords" })

local AimSection = Combat:AddSection({ Name = "Aim" })
AimSection:AddLabel("Silent Aim"):AddToggle({ Default = false, Callback = function(v) end })
AimSection:AddLabel("Silent Aim V2"):AddToggle({ Default = false, Callback = function(v) end })
AimSection:AddLabel("Silent Aim Range"):AddSlider({ Default = 50, Min = 5, Max = 200, Rounding = 0, Callback = function(v) end })

local GrabSection = Combat:AddSection({ Name = "Grab" })
GrabSection:AddLabel("Further Reach"):AddToggle({ Default = false, Callback = function(v) end })
GrabSection:AddLabel("Fire Grab"):AddToggle({ Default = false, Callback = function(v) end })
GrabSection:AddLabel("Poison Grab"):AddToggle({ Default = false, Callback = function(v) end })
GrabSection:AddLabel("Death Grab"):AddToggle({ Default = false, Callback = function(v) end })
GrabSection:AddLabel("Burn Grab"):AddToggle({ Default = false, Callback = function(v) end })
GrabSection:AddLabel("Noclip Grab"):AddToggle({ Default = false, Callback = function(v) end })
GrabSection:AddLabel("Massless Grab"):AddToggle({ Default = false, Callback = function(v) end })

local AuraSec = Combat:AddSection({ Name = "Auras" })
AuraSec:AddLabel("Poison Aura"):AddToggle({ Default = false, Callback = function(v) end })
AuraSec:AddLabel("Death Aura"):AddToggle({ Default = false, Callback = function(v) end })
AuraSec:AddLabel("Burn Aura"):AddToggle({ Default = false, Callback = function(v) end })
AuraSec:AddLabel("Fling Aura"):AddToggle({ Default = false, Callback = function(v) end })
AuraSec:AddLabel("Anchor Aura"):AddToggle({ Default = false, Callback = function(v) end })
AuraSec:AddLabel("Telekinesis Aura"):AddToggle({ Default = false, Callback = function(v) end })
AuraSec:AddLabel("Aura Radius"):AddSlider({ Default = 20, Min = 5, Max = 50, Rounding = 0, Callback = function(v) end })

local DefenseSection = Combat:AddSection({ Name = "Defense" })
DefenseSection:AddLabel("Anti-Grab"):AddToggle({ Default = false, Callback = function(v) end })
DefenseSection:AddLabel("Anti-Burn"):AddToggle({ Default = false, Callback = function(v) end })
DefenseSection:AddLabel("Anti-Explosion"):AddToggle({ Default = false, Callback = function(v) end })
DefenseSection:AddLabel("Anti-Void"):AddToggle({ Default = false, Callback = function(v) end })
DefenseSection:AddLabel("Anti-Kick"):AddToggle({ Default = false, Callback = function(v) end })
DefenseSection:AddLabel("Anti-Lag"):AddToggle({ Default = false, Callback = function(v) end })
DefenseSection:AddLabel("Anti-Blobman"):AddToggle({ Default = false, Callback = function(v) end })
DefenseSection:AddLabel("Anti-Barrier"):AddToggle({ Default = false, Callback = function(v) end })

-- ===== MISC =====
local Misc = Window:AddTab({ Name = "Misc", Icon = "settings" })

local PlayerSection = Misc:AddSection({ Name = "Player" })
PlayerSection:AddLabel("Second Person Camera"):AddToggle({ Default = false, Callback = function(v) end })

local MovementSection = Misc:AddSection({ Name = "Movement" })
MovementSection:AddLabel("Walkspeed"):AddToggle({ Default = false, Callback = function(v) end })
MovementSection:AddLabel("Speed"):AddSlider({ Default = 5, Min = 1, Max = 10, Rounding = 1, Callback = function(v) end })
MovementSection:AddLabel("Infinite Jump"):AddToggle({ Default = false, Callback = function(v) end })
MovementSection:AddLabel("Jump Power"):AddSlider({ Default = 50, Min = 16, Max = 500, Rounding = 0, Callback = function(v) end })
MovementSection:AddLabel("Noclip"):AddToggle({ Default = false, Callback = function(v) end })

local TeleportSection = Misc:AddSection({ Name = "Teleport" })
TeleportSection:AddLabel("Place to Teleport"):AddDropdown({
    Default = "Spawn",
    Values = { "Spawn", "Green House", "Blue House", "Farm", "Mine" },
    Callback = function(v) end
})
TeleportSection:AddLabel("Teleport"):AddToggle({ Default = false, Callback = function(v) end })
TeleportSection:AddLabel("Loop Teleport"):AddToggle({ Default = false, Callback = function(v) end })

local UtilitySection = Misc:AddSection({ Name = "Utility" })
UtilitySection:AddLabel("Lag Server"):AddToggle({ Default = false, Callback = function(v) end })
UtilitySection:AddLabel("Spawn Banana"):AddToggle({ Default = false, Callback = function(v) end })
UtilitySection:AddLabel("Enable Graphics"):AddToggle({ Default = false, Callback = function(v) end })
UtilitySection:AddLabel("Disable Graphics"):AddToggle({ Default = false, Callback = function(v) end })
UtilitySection:AddLabel("Clear Effects"):AddToggle({ Default = false, Callback = function(v) end })

local LoopSection = Misc:AddSection({ Name = "Loop" })
LoopSection:AddLabel("Loop Kill"):AddToggle({ Default = false, Callback = function(v) end })
LoopSection:AddLabel("Loop Kick"):AddToggle({ Default = false, Callback = function(v) end })
LoopSection:AddLabel("Loop Ragdoll"):AddToggle({ Default = false, Callback = function(v) end })
LoopSection:AddLabel("Loop Fire"):AddToggle({ Default = false, Callback = function(v) end })

local BringSection = Misc:AddSection({ Name = "Bring All" })
BringSection:AddLabel("Bring All"):AddToggle({ Default = false, Callback = function(v) end })
BringSection:AddLabel("Whitelist Friends"):AddToggle({ Default = false, Callback = function(v) end })
