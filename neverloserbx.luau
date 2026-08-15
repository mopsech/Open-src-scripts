local NeverLose = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/NeverLose/refs/heads/main/source.luau"))()

local Window = NeverLose:CreateWindow({
    Name = "AI PAST HUB",
    Content = "Visuals | Combat | Misc",
    Size = UDim2.fromScale(0.9, 0.9),
})

-- ============================================================
-- VISUALS
-- ============================================================
local Visuals = Window:AddTab({ Name = "Visuals", Icon = "sparkles" })

-- ЛЕВАЯ КОЛОНКА: ESP
local ESPSection = Visuals:AddSection({ Name = "ESP" })

ESPSection:AddLabel("ESP Mode"):AddDropdown({
    Default = "Box",
    Values = { "Box", "Highlight", "Box + Highlight" },
    Callback = function(v) end
})

ESPSection:AddLabel("Distance"):AddToggle({
    Default = false,
    Callback = function(v) end
})

ESPSection:AddLabel("Health"):AddToggle({
    Default = false,
    Callback = function(v) end
})

ESPSection:AddLabel("Nametags"):AddToggle({
    Default = false,
    Callback = function(v) end
})

ESPSection:AddLabel("Tracers"):AddToggle({
    Default = false,
    Callback = function(v) end
})

-- ПРАВАЯ КОЛОНКА: Third Person
local ThirdPersonSection = Visuals:AddSection({ Name = "Third Person" })

ThirdPersonSection:AddLabel("Third Person"):AddToggle({
    Default = false,
    Callback = function(v) end
})

-- ============================================================
-- COMBAT
-- ============================================================
local Combat = Window:AddTab({ Name = "Combat", Icon = "swords" })

-- ЛЕВАЯ КОЛОНКА: Aim Bot
local AimSection = Combat:AddSection({ Name = "Aim Bot" })

AimSection:AddLabel("Aim Bot"):AddToggle({
    Default = false,
    Callback = function(v) end
})

AimSection:AddLabel("Smoothness"):AddSlider({
    Default = 50,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Callback = function(v) end
})

AimSection:AddLabel("Predict"):AddSlider({
    Default = 50,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Callback = function(v) end
})

AimSection:AddLabel("Wall Check"):AddToggle({
    Default = false,
    Callback = function(v) end
})

AimSection:AddLabel("Auto Shoot"):AddToggle({
    Default = false,
    Callback = function(v) end
})

-- ПРАВАЯ КОЛОНКА: Rage
local RageSection = Combat:AddSection({ Name = "Rage" })

RageSection:AddLabel("Bhop"):AddToggle({
    Default = false,
    Callback = function(v) end
})

RageSection:AddLabel("SpinBot"):AddToggle({
    Default = false,
    Callback = function(v) end
})

-- ============================================================
-- MISC
-- ============================================================
local Misc = Window:AddTab({ Name = "Misc", Icon = "settings" })

-- ПУСТО
