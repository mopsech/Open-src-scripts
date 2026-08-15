local NeverLose = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/NeverLose/refs/heads/main/source.luau"))()

-- Окно на 60% экрана
local Window = NeverLose:CreateWindow({
    Name = "AI PAST HUB",
    Content = "Visuals | Combat | Misc",
    Size = UDim2.fromScale(0.6, 0.6),
})

-- ============================================================
-- VISUALS
-- ============================================================
local Visuals = Window:AddTab({ Name = "Visuals", Icon = "sparkles" })

-- ЛЕВАЯ ПОДКАТЕГОРИЯ: Hat & Trail
local HatSection = Visuals:AddSection({ Name = "Hat & Trail" })
HatSection:AddLabel("Chinese Hat"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.HatEnabled = v
        if v and game.Players.LocalPlayer.Character then
            Visuals.addHat(game.Players.LocalPlayer.Character)
        elseif game.Players.LocalPlayer.Character then
            Visuals.removeHat(game.Players.LocalPlayer.Character)
        end
    end
})
HatSection:AddLabel("Rainbow Hat"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.HatRainbow = v
    end
})
HatSection:AddLabel("Hat Transparency"):AddSlider({
    Default = 0.3,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Callback = function(v)
        _G.HatTransparency = v
    end
})

HatSection:AddLabel("Trail"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.TrailEnabled = v
        if v and game.Players.LocalPlayer.Character then
            Visuals.addTrail(game.Players.LocalPlayer.Character)
        elseif game.Players.LocalPlayer.Character then
            Visuals.removeTrail(game.Players.LocalPlayer.Character)
        end
    end
})
HatSection:AddLabel("Rainbow Trail"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.TrailRainbow = v
    end
})
HatSection:AddLabel("Trail Lifetime"):AddSlider({
    Default = 0.5,
    Min = 0.1,
    Max = 3,
    Rounding = 1,
    Callback = function(v)
        _G.TrailLifetime = v
    end
})

-- ПРАВАЯ ПОДКАТЕГОРИЯ: Aura & ForceField
local AuraSection = Visuals:AddSection({ Name = "Aura & ForceField" })
AuraSection:AddLabel("ForceField"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.ForceFieldEnabled = v
        local char = game.Players.LocalPlayer.Character
        if char then
            if v then
                Visuals.applyForceField(char)
            else
                Visuals.removeForceField(char)
            end
        end
    end
})
AuraSection:AddLabel("Rainbow ForceField"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.ForceFieldRainbow = v
    end
})
AuraSection:AddLabel("Local Aura"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.AuraEnabled = v
        if v then
            if not Visuals.CurrentAuraModel then
                Visuals.updateAuraLogic()
            end
            if game.Players.LocalPlayer.Character then
                Visuals.enableAura(game.Players.LocalPlayer.Character)
            end
        else
            Visuals.disableAura()
        end
    end
})

-- ЛЕВАЯ ПОДКАТЕГОРИЯ: World
local WorldSection = Visuals:AddSection({ Name = "World" })
WorldSection:AddLabel("Custom Skybox"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.CustomSkyEnabled = v
        if v then
            Visuals.applySkybox(_G.CurrentSkybox or "HD")
        else
            Visuals.restoreDefaultSky()
        end
    end
})
WorldSection:AddLabel("Full Bright"):AddToggle({
    Default = false,
    Callback = function(v)
        Visuals.setFullBrightEnabled(v)
    end
})
WorldSection:AddLabel("Time Changer"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.WorldTimeEnabled = v
    end
})
WorldSection:AddLabel("Time"):AddSlider({
    Default = 12,
    Min = 0,
    Max = 24,
    Rounding = 0,
    Callback = function(v)
        _G.WorldTimeValue = v
    end
})

-- ПРАВАЯ ПОДКАТЕГОРИЯ: ESP & Screen
local ESPSection = Visuals:AddSection({ Name = "ESP & Screen" })
ESPSection:AddLabel("ESP Outline"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.ESPOutline = v
    end
})
ESPSection:AddLabel("ESP Names"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.ESPNames = v
    end
})
ESPSection:AddLabel("ESP Avatar"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.ESPAvatar = v
    end
})
ESPSection:AddLabel("Avatar Size"):AddSlider({
    Default = 72,
    Min = 40,
    Max = 120,
    Rounding = 0,
    Callback = function(v)
        _G.AvatarSize = v
    end
})

ESPSection:AddLabel("Screen Effect"):AddToggle({
    Default = false,
    Callback = function(v)
        Visuals.setScreenEnabled(v)
    end
})
ESPSection:AddLabel("Anime Image"):AddToggle({
    Default = false,
    Callback = function(v)
        Visuals.toggleAnimeImage(v)
    end
})

-- ============================================================
-- COMBAT
-- ============================================================
local Combat = Window:AddTab({ Name = "Combat", Icon = "swords" })

-- ЛЕВАЯ ПОДКАТЕГОРИЯ: Aim & Grab
local AimSection = Combat:AddSection({ Name = "Aim & Grab" })
AimSection:AddLabel("Silent Aim"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.SilentAim = v
        _G.SilentAimV2 = v
    end
})
AimSection:AddLabel("Silent Aim Range"):AddSlider({
    Default = 50,
    Min = 5,
    Max = 200,
    Rounding = 0,
    Callback = function(v)
        _G.SilentAimRange = v
    end
})

AimSection:AddLabel("Further Reach"):AddToggle({
    Default = false,
    Callback = function(v)
        AllunFunctions.setFurtherReachEnabled(v)
    end
})
AimSection:AddLabel("Fire Grab"):AddToggle({
    Default = false,
    Callback = function(v)
        if v then
            AllunFunctions.state.fireGrabCoroutine = coroutine.create(AllunFunctions.fireGrab)
            coroutine.resume(AllunFunctions.state.fireGrabCoroutine)
        elseif AllunFunctions.state.fireGrabCoroutine then
            coroutine.close(AllunFunctions.state.fireGrabCoroutine)
            AllunFunctions.state.fireGrabCoroutine = nil
        end
    end
})
AimSection:AddLabel("Poison Grab"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.Poison_Grab = v
    end
})
AimSection:AddLabel("Death Grab"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.Death_Grab = v
    end
})
AimSection:AddLabel("Burn Grab"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.Burn_Grab = v
    end
})
AimSection:AddLabel("Noclip Grab"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.NoclipGrab = v
        if v then
            AllunFunctions.state.noclipGrabCoroutine = coroutine.create(AllunFunctions.noclipGrab)
            coroutine.resume(AllunFunctions.state.noclipGrabCoroutine)
        elseif AllunFunctions.state.noclipGrabCoroutine then
            coroutine.close(AllunFunctions.state.noclipGrabCoroutine)
            AllunFunctions.state.noclipGrabCoroutine = nil
        end
    end
})
AimSection:AddLabel("Massless Grab"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.MasslessGrab = v
    end
})

-- ПРАВАЯ ПОДКАТЕГОРИЯ: Auras
local AuraSec = Combat:AddSection({ Name = "Auras" })
AuraSec:AddLabel("Poison Aura"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.Poison_Aura = v
    end
})
AuraSec:AddLabel("Death Aura"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.DeathAura = v
    end
})
AuraSec:AddLabel("Burn Aura"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.BurnAura = v
    end
})
AuraSec:AddLabel("Fling Aura"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.FlingAura = v
    end
})
AuraSec:AddLabel("Anchor Aura"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.AnchorAura = v
    end
})
AuraSec:AddLabel("Telekinesis Aura"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.TornadoAura = v
    end
})
AuraSec:AddLabel("Aura Radius"):AddSlider({
    Default = 20,
    Min = 5,
    Max = 50,
    Rounding = 0,
    Callback = function(v)
        _G.AuraRadius = v
    end
})

-- ЛЕВАЯ ПОДКАТЕГОРИЯ: Defense
local DefenseSection = Combat:AddSection({ Name = "Defense" })
DefenseSection:AddLabel("Anti-Grab"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.AntiGrab = v
    end
})
DefenseSection:AddLabel("Anti-Burn"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.AntiBurn = v
    end
})
DefenseSection:AddLabel("Anti-Explosion"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.AntiExplosion = v
    end
})
DefenseSection:AddLabel("Anti-Void"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.AntiVoid = v
    end
})
DefenseSection:AddLabel("Anti-Kick"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.AntiKick = v
    end
})
DefenseSection:AddLabel("Anti-Lag"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.AntiLag = v
    end
})
DefenseSection:AddLabel("Anti-Blobman"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.AntiBlobman = v
    end
})
DefenseSection:AddLabel("Anti-Barrier"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.AntiBarrier = v
    end
})

-- ============================================================
-- MISC
-- ============================================================
local Misc = Window:AddTab({ Name = "Misc", Icon = "settings" })

-- ЛЕВАЯ ПОДКАТЕГОРИЯ: Player & Movement
local PlayerSection = Misc:AddSection({ Name = "Player & Movement" })
PlayerSection:AddLabel("Second Person Camera"):AddToggle({
    Default = false,
    Callback = function(v)
        Compat.setSecondPersonEnabled(v)
    end
})

PlayerSection:AddLabel("Walkspeed"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.SuperSpeed = v
    end
})
PlayerSection:AddLabel("Speed"):AddSlider({
    Default = 5,
    Min = 1,
    Max = 10,
    Rounding = 1,
    Callback = function(v)
        _G.SpeedMultiplier = v
    end
})
PlayerSection:AddLabel("Infinite Jump"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.InfiniteJump = v
    end
})
PlayerSection:AddLabel("Jump Power"):AddSlider({
    Default = 50,
    Min = 16,
    Max = 500,
    Rounding = 0,
    Callback = function(v)
        _G.InfiniteJumpPower = v
    end
})
PlayerSection:AddLabel("Noclip"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.NoclipToggle = v
        if v then
            Compat.startFloating()
        else
            Compat.toggleNoclip()
        end
    end
})

-- ПРАВАЯ ПОДКАТЕГОРИЯ: Teleport & Utility
local TeleportSection = Misc:AddSection({ Name = "Teleport & Utility" })
TeleportSection:AddLabel("Place to Teleport"):AddDropdown({
    Default = "Spawn",
    Values = { "Spawn", "Green House", "Blue House", "Farm", "Mine" },
    Callback = function(v)
        _G.PlaceToTeleport = v
    end
})
TeleportSection:AddLabel("Teleport"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.TeleportEnabled = v
    end
})
TeleportSection:AddLabel("Loop Teleport"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.LoopTeleport = v
    end
})

TeleportSection:AddLabel("Lag Server"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.LagServer = v
    end
})
TeleportSection:AddLabel("Spawn Banana"):AddToggle({
    Default = false,
    Callback = function(v)
        if v then
            Compat.spawnBanana()
        end
    end
})
TeleportSection:AddLabel("Enable Graphics"):AddToggle({
    Default = false,
    Callback = function(v)
        if v then
            Compat.enableGraphics()
        end
    end
})
TeleportSection:AddLabel("Disable Graphics"):AddToggle({
    Default = false,
    Callback = function(v)
        if v then
            Compat.disableGraphics()
        end
    end
})
TeleportSection:AddLabel("Clear Effects"):AddToggle({
    Default = false,
    Callback = function(v)
        if v then
            Compat.clearEffects()
        end
    end
})

-- ЛЕВАЯ ПОДКАТЕГОРИЯ: Loop
local LoopSection = Misc:AddSection({ Name = "Loop" })
LoopSection:AddLabel("Loop Kill"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.LoopKill = v
    end
})
LoopSection:AddLabel("Loop Kick"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.LoopKick = v
    end
})
LoopSection:AddLabel("Loop Ragdoll"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.LoopRagdoll = v
    end
})
LoopSection:AddLabel("Loop Fire"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.LoopFire = v
    end
})

-- ПРАВАЯ ПОДКАТЕГОРИЯ: Bring All
local BringSection = Misc:AddSection({ Name = "Bring All" })
BringSection:AddLabel("Bring All"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.BringAll = v
        if v then
            Compat.startBringAll()
        else
            Compat.stopBringAll()
        end
    end
})
BringSection:AddLabel("Whitelist Friends"):AddToggle({
    Default = false,
    Callback = function(v)
        _G.WhitelistFriends = v
    end
})
