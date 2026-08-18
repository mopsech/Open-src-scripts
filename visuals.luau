-- ===================== ЗАГРУЗКА FATALITY =====================
local Fatality = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/Fatality/refs/heads/main/src/source.luau"))();
local Notification = Fatality:CreateNotifier();

Fatality:Loader({
    Name = "Candy Visuals",
    Duration = 3
});

local Window = Fatality.new({
    Name = "Candy Visuals",
    Expire = "never",
});

-- ===================== ГЛАВНАЯ ВКЛАДКА =====================
local Visuals = Window:AddMenu({
    Name = "Visuals",
    Icon = "eye"
})

-- ===================== ПОДКАТЕГОРИЯ WORLD =====================
local World = Visuals:AddSection({
    Name = "World",
    Position = 'left'
})

World:AddToggle({
    Name = "Full Bright",
    Callback = function(v)
        if v then
            game.Lighting.Brightness = 3
            game.Lighting.GlobalShadows = false
            game.Lighting.OutdoorAmbient = Color3.new(1,1,1)
        else
            game.Lighting.Brightness = 1
            game.Lighting.GlobalShadows = true
            game.Lighting.OutdoorAmbient = Color3.fromRGB(127,127,127)
        end
    end
})

World:AddSlider({
    Name = "Time of Day",
    Default = 12,
    Min = 0,
    Max = 24,
    Round = 1,
    Callback = function(v)
        game.Lighting.ClockTime = v
    end
})

World:AddToggle({
    Name = "Disable Fog",
    Callback = function(v)
        if v then
            game.Lighting.FogEnd = 100000
            game.Lighting.FogStart = 100000
        else
            game.Lighting.FogEnd = 1000
            game.Lighting.FogStart = 0
        end
    end
})

World:AddColorPicker({
    Name = "Fog Color",
    Default = Color3.fromRGB(127,127,127),
    Callback = function(v)
        game.Lighting.FogColor = v
    end
})

World:AddColorPicker({
    Name = "Ambient Color",
    Default = Color3.fromRGB(127,127,127),
    Callback = function(v)
        game.Lighting.Ambient = v
    end
})

World:AddColorPicker({
    Name = "Outdoor Ambient",
    Default = Color3.fromRGB(127,127,127),
    Callback = function(v)
        game.Lighting.OutdoorAmbient = v
    end
})

-- ===================== ПОДКАТЕГОРИЯ PLAYER =====================
local Player = Visuals:AddSection({
    Name = "Player",
    Position = 'center'
})

local ThirdPerson = Player:AddToggle({
    Name = "Third Person",
    Option = true,
    Callback = function(v)
        if v then
            workspace.CurrentCamera.CameraType = Enum.CameraType.Fixed
        else
            workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
        end
    end
})

ThirdPerson.Option:AddSlider({
    Name = "Distance",
    Default = 10,
    Min = 1,
    Max = 50,
    Round = 1,
    Callback = function(v)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart
            local cam = workspace.CurrentCamera
            local dir = (cam.CFrame.Position - hrp.Position).Unit
            cam.CFrame = CFrame.new(hrp.Position + dir * v, hrp.Position)
        end
    end
})

Player:AddSlider({
    Name = "Walk Speed",
    Default = 16,
    Min = 0,
    Max = 100,
    Round = 1,
    Callback = function(v)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = v
        end
    end
})

Player:AddSlider({
    Name = "Jump Power",
    Default = 50,
    Min = 0,
    Max = 200,
    Round = 1,
    Callback = function(v)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.JumpPower = v
        end
    end
})

Player:AddToggle({
    Name = "No Clip",
    Callback = function(v)
        local char = game.Players.LocalPlayer.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = not v
                end
            end
        end
    end
})

Player:AddToggle({
    Name = "No Fall Damage",
    Callback = function(v)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.UseJumpPower = not v
        end
    end
})

Player:AddSlider({
    Name = "FOV",
    Default = 70,
    Min = 1,
    Max = 120,
    Round = 1,
    Callback = function(v)
        workspace.CurrentCamera.FieldOfView = v
    end
})

-- ===================== ПОДКАТЕГОРИЯ AURA =====================
local Aura = Visuals:AddSection({
    Name = "Aura",
    Position = 'right'
})

local BasicAura = Aura:AddToggle({
    Name = "Enable Aura",
    Option = true,
    Callback = function(v)
        local char = game.Players.LocalPlayer.Character
        if not char then return end
        
        if v then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            
            local aura = Instance.new("Part")
            aura.Name = "CandyAura"
            aura.Size = Vector3.new(6,6,6)
            aura.Shape = Enum.PartType.Ball
            aura.Material = Enum.Material.Neon
            aura.CanCollide = false
            aura.Transparency = 0.5
            aura.Parent = hrp
            
            local weld = Instance.new("WeldConstraint")
            weld.Part0 = hrp
            weld.Part1 = aura
            weld.Parent = aura
        else
            local aura = char:FindFirstChild("CandyAura")
            if aura then aura:Destroy() end
        end
    end
})

BasicAura.Option:AddColorPicker({
    Name = "Color",
    Default = Color3.fromRGB(0,255,255),
    Callback = function(v)
        local char = game.Players.LocalPlayer.Character
        if char then
            local aura = char:FindFirstChild("CandyAura")
            if aura then aura.Color = v end
        end
    end
})

BasicAura.Option:AddSlider({
    Name = "Size",
    Default = 6,
    Min = 1,
    Max = 20,
    Round = 1,
    Callback = function(v)
        local char = game.Players.LocalPlayer.Character
        if char then
            local aura = char:FindFirstChild("CandyAura")
            if aura then aura.Size = Vector3.new(v,v,v) end
        end
    end
})

BasicAura.Option:AddSlider({
    Name = "Transparency",
    Default = 0.5,
    Min = 0,
    Max = 1,
    Round = 2,
    Callback = function(v)
        local char = game.Players.LocalPlayer.Character
        if char then
            local aura = char:FindFirstChild("CandyAura")
            if aura then aura.Transparency = v end
        end
    end
})

Aura:AddToggle({
    Name = "Rainbow Aura",
    Callback = function(v)
        if v then
            game:GetService("RunService").Heartbeat:Connect(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    local aura = char:FindFirstChild("CandyAura")
                    if aura then
                        aura.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                    end
                end
            end)
        end
    end
})

Aura:AddToggle({
    Name = "Pulse Aura",
    Callback = function(v)
        if v then
            game:GetService("RunService").Heartbeat:Connect(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    local aura = char:FindFirstChild("CandyAura")
                    if aura then
                        local size = 6 + math.sin(tick() * 3) * 1.5
                        aura.Size = Vector3.new(size,size,size)
                    end
                end
            end)
        end
    end
})

Aura:AddToggle({
    Name = "Particles",
    Callback = function(v)
        local char = game.Players.LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        if v then
            local e = Instance.new("ParticleEmitter")
            e.Name = "CandyParticles"
            e.Texture = "rbxassetid://373640392"
            e.Rate = 50
            e.Lifetime = NumberRange.new(1)
            e.SpreadAngle = Vector2.new(360,360)
            e.Speed = NumberRange.new(3,6)
            e.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0,0),
                NumberSequenceKeypoint.new(1,1)
            })
            e.Size = NumberSequence.new({
                NumberSequenceKeypoint.new(0,0.5),
                NumberSequenceKeypoint.new(1,0)
            })
            e.Color = ColorSequence.new(Color3.fromRGB(0,255,255))
            e.Parent = hrp
        else
            local e = hrp:FindFirstChild("CandyParticles")
            if e then e:Destroy() end
        end
    end
})

-- ===================== УВЕДОМЛЕНИЕ =====================
Notification:Notify({
    Title = "Candy Visuals",
    Content = "Loaded successfully!",
    Icon = "check"
})
