local Fatality = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/Fatality/refs/heads/main/src/source.luau"))();
local Notification = Fatality:CreateNotifier();

Fatality:Loader({
    Name = "Candy Visuals",
    Duration = 4
});

Notification:Notify({
    Title = "Candy Visuals",
    Content = "Hello, "..game.Players.LocalPlayer.DisplayName..' Welcome back!',
    Icon = "clipboard"
})

local Window = Fatality.new({
    Name = "Candy Visuals",
    Expire = "never",
});

-- ===================== SERVICES =====================
local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local MaterialService = game:GetService("MaterialService")
local ContentProvider = game:GetService("ContentProvider")
local TweenService = game:GetService("TweenService")

-- ===================== DEFAULT SETTINGS =====================
local defaultLighting = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    GlobalShadows = Lighting.GlobalShadows,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    Ambient = Lighting.Ambient,
    FogStart = Lighting.FogStart,
    FogEnd = Lighting.FogEnd,
    FogColor = Lighting.FogColor
}

local DefaultSky = Lighting:FindFirstChildOfClass("Sky")
local DefaultSkySettings = {}
if DefaultSky then
    DefaultSkySettings.SkyboxBk = DefaultSky.SkyboxBk
    DefaultSkySettings.SkyboxDn = DefaultSky.SkyboxDn
    DefaultSkySettings.SkyboxFt = DefaultSky.SkyboxFt
    DefaultSkySettings.SkyboxLf = DefaultSky.SkyboxLf
    DefaultSkySettings.SkyboxRt = DefaultSky.SkyboxRt
    DefaultSkySettings.SkyboxUp = DefaultSky.SkyboxUp
end

-- ===================== AURA MODELS (CLASSIC) =====================
local AuraModels = {
    'Godly',
    'Super Sayien',
    'North Star',
    'Blue Lord',
    'Pink Aura',
    'Angel Wing',
    'Sweet Heart',
    'Ethereal Aura',
}

local AuraModelIDs = {
    ['Godly'] = 'rbxassetid://16699750981',
    ['Super Sayien'] = 'rbxassetid://116109508364297',
    ['North Star'] = 'rbxassetid://83945069652732',
    ['Blue Lord'] = 'rbxassetid://10974316799',
    ['Pink Aura'] = 'rbxassetid://115980859615239',
    ['Angel Wing'] = 'rbxassetid://90022969696073',
    ['Sweet Heart'] = 'rbxassetid://91724768175470',
    ['Ethereal Aura'] = 'rbxassetid://97041568674250',
}

local activeClassicAuras = {}

-- ===================== PARTICLE AURA DATA =====================
local PARTICLE_AURA_DATA = {
    { "starlight", "rbxassetid://134645216613107" },
    { "heavenly", "rbxassetid://139300897520961" },
    { "ribbon", "rbxassetid://132069507632161" },
    { "sakura", "rbxassetid://81755778619404" },
    { "angel", "rbxassetid://97658130917593" },
    { "wind", "rbxassetid://80694081850877" },
    { "flow", "rbxassetid://119913533725648" },
    { "star", "rbxassetid://73754563740680" },
    { "neon", "rbxassetid://18498709246" },
}

local PARTICLE_AURA_NAMES = {}
local particleAuraIdByName = {}

for _, row in ipairs(PARTICLE_AURA_DATA) do
    table.insert(PARTICLE_AURA_NAMES, row[1])
    particleAuraIdByName[row[1]] = row[2]
end

local loadedParticleAuras = {}
local activeParticleAuras = {}

-- ===================== TEXTURE PACK (MINECRAFT) =====================
local MINECRAFT_VARIANTS = {
    Brick = { BaseMaterial = Enum.Material.Brick, Texture = 'rbxassetid://10777285622' },
    Concrete = { BaseMaterial = Enum.Material.Concrete, Texture = 'rbxassetid://15622710576' },
    CorrodedMetal = { BaseMaterial = Enum.Material.CorrodedMetal, Texture = 'rbxassetid://78612695839404' },
    Grass = { BaseMaterial = Enum.Material.Grass, Texture = 'rbxassetid://9267183930' },
    Metal = { BaseMaterial = Enum.Material.Metal, Texture = 'rbxassetid://121650613091353' },
    Sand = { BaseMaterial = Enum.Material.Sand, Texture = 'rbxassetid://12624140843' },
    Slate = { BaseMaterial = Enum.Material.Slate, Texture = 'rbxassetid://8676746437' },
    Wood = { BaseMaterial = Enum.Material.Wood, Texture = 'rbxassetid://3258599312' },
    WoodPlanks = { BaseMaterial = Enum.Material.WoodPlanks, Texture = 'rbxassetid://8676581022' },
}

local MATERIAL_VARIANT_BY_MATERIAL = {
    [Enum.Material.Brick] = 'Brick',
    [Enum.Material.Concrete] = 'Concrete',
    [Enum.Material.CorrodedMetal] = 'CorrodedMetal',
    [Enum.Material.Grass] = 'Grass',
    [Enum.Material.Metal] = 'Metal',
    [Enum.Material.Sand] = 'Sand',
    [Enum.Material.Slate] = 'Slate',
    [Enum.Material.Wood] = 'Wood',
    [Enum.Material.WoodPlanks] = 'WoodPlanks',
}

local MINECRAFT_TERRAIN_COLORS = {
    [Enum.Material.Grass] = Color3.fromRGB(106, 170, 64),
    [Enum.Material.Ground] = Color3.fromRGB(134, 96, 67),
    [Enum.Material.Mud] = Color3.fromRGB(102, 76, 51),
    [Enum.Material.Sand] = Color3.fromRGB(219, 211, 160),
    [Enum.Material.Rock] = Color3.fromRGB(122, 122, 122),
    [Enum.Material.Slate] = Color3.fromRGB(90, 90, 90),
    [Enum.Material.Snow] = Color3.fromRGB(245, 245, 245),
    [Enum.Material.Water] = Color3.fromRGB(63, 118, 228),
}

local LarpticTextureState = setmetatable({}, { __mode = 'k' })
local LarpticMaterialVariantsBuilt = false

-- ===================== SKYBOX ASSETS =====================
local SkyboxAssets = {
    ["Black Storm"] = {
        Bk = "rbxassetid://15502511288", Dn = "rbxassetid://15502508460",
        Ft = "rbxassetid://15502510289", Lf = "rbxassetid://15502507918",
        Rt = "rbxassetid://15502509398", Up = "rbxassetid://15502511911"
    },
    ["HD"] = {
        Bk = "http://www.roblox.com/asset/?id=16553658937", Dn = "http://www.roblox.com/asset/?id=16553660713",
        Ft = "http://www.roblox.com/asset/?id=16553662144", Lf = "http://www.roblox.com/asset/?id=16553664042",
        Rt = "http://www.roblox.com/asset/?id=16553665766", Up = "http://www.roblox.com/asset/?id=16553667750"
    },
    ["Snow"] = {
        Bk = "http://www.roblox.com/asset/?id=155657655", Dn = "http://www.roblox.com/asset/?id=155674246",
        Ft = "http://www.roblox.com/asset/?id=155657609", Lf = "http://www.roblox.com/asset/?id=155657671",
        Rt = "http://www.roblox.com/asset/?id=155657619", Up = "http://www.roblox.com/asset/?id=155674931"
    },
    ["Blue Space"] = {
        Bk = "rbxassetid://15536110634", Dn = "rbxassetid://15536112543",
        Ft = "rbxassetid://15536116141", Lf = "rbxassetid://15536114370",
        Rt = "rbxassetid://15536118762", Up = "rbxassetid://15536117282"
    },
    ["Realistic"] = {
        Bk = "rbxassetid://653719502", Dn = "rbxassetid://653718790",
        Ft = "rbxassetid://653719067", Lf = "rbxassetid://653719190",
        Rt = "rbxassetid://653718931", Up = "rbxassetid://653719321"
    },
    ["Stormy"] = {
        Bk = "http://www.roblox.com/asset/?id=18703245834", Dn = "http://www.roblox.com/asset/?id=18703243349",
        Ft = "http://www.roblox.com/asset/?id=18703240532", Lf = "http://www.roblox.com/asset/?id=18703237556",
        Rt = "http://www.roblox.com/asset/?id=18703235430", Up = "http://www.roblox.com/asset/?id=18703232671"
    },
    ["Pink"] = {
        Bk = "rbxassetid://12216109205", Dn = "rbxassetid://12216109875",
        Ft = "rbxassetid://12216109489", Lf = "rbxassetid://12216110170",
        Rt = "rbxassetid://12216110471", Up = "rbxassetid://12216108877"
    },
    ["Sunset"] = {
        Bk = "rbxassetid://600830446", Dn = "rbxassetid://600831635",
        Ft = "rbxassetid://600832720", Lf = "rbxassetid://600886090",
        Rt = "rbxassetid://600833862", Up = "rbxassetid://600835177"
    },
    ["Arctic"] = {
        Bk = "http://www.roblox.com/asset/?id=225469390", Dn = "http://www.roblox.com/asset/?id=225469395",
        Ft = "http://www.roblox.com/asset/?id=225469403", Lf = "http://www.roblox.com/asset/?id=225469450",
        Rt = "http://www.roblox.com/asset/?id=225469471", Up = "http://www.roblox.com/asset/?id=225469481"
    },
    ["Space"] = {
        Bk = "http://www.roblox.com/asset/?id=166509999", Dn = "http://www.roblox.com/asset/?id=166510057",
        Ft = "http://www.roblox.com/asset/?id=166510116", Lf = "http://www.roblox.com/asset/?id=166510092",
        Rt = "http://www.roblox.com/asset/?id=166510131", Up = "http://www.roblox.com/asset/?id=166510114"
    },
    ["Roblox Default"] = {
        Bk = "rbxasset://textures/sky/sky512_bk.tex", Dn = "rbxasset://textures/sky/sky512_dn.tex",
        Ft = "rbxasset://textures/sky/sky512_ft.tex", Lf = "rbxasset://textures/sky/sky512_lf.tex",
        Rt = "rbxasset://textures/sky/sky512_rt.tex", Up = "rbxasset://textures/sky/sky512_up.tex"
    },
    ["Red Night"] = {
        Bk = "http://www.roblox.com/asset/?id=401664839", Dn = "http://www.roblox.com/asset/?id=401664862",
        Ft = "http://www.roblox.com/asset/?id=401664960", Lf = "http://www.roblox.com/asset/?id=401664881",
        Rt = "http://www.roblox.com/asset/?id=401664901", Up = "http://www.roblox.com/asset/?id=401664936"
    },
    ["Deep Space 1"] = {
        Bk = "http://www.roblox.com/asset/?id=149397692", Dn = "http://www.roblox.com/asset/?id=149397686",
        Ft = "http://www.roblox.com/asset/?id=149397697", Lf = "http://www.roblox.com/asset/?id=149397684",
        Rt = "http://www.roblox.com/asset/?id=149397688", Up = "http://www.roblox.com/asset/?id=149397702"
    },
    ["Pink Skies"] = {
        Bk = "http://www.roblox.com/asset/?id=151165214", Dn = "http://www.roblox.com/asset/?id=151165197",
        Ft = "http://www.roblox.com/asset/?id=151165224", Lf = "http://www.roblox.com/asset/?id=151165191",
        Rt = "http://www.roblox.com/asset/?id=151165206", Up = "http://www.roblox.com/asset/?id=151165227"
    },
    ["Purple Sunset"] = {
        Bk = "rbxassetid://264908339", Dn = "rbxassetid://264907909",
        Ft = "rbxassetid://264909420", Lf = "rbxassetid://264909758",
        Rt = "rbxassetid://264908886", Up = "rbxassetid://264907379"
    },
    ["Blue Night"] = {
        Bk = "http://www.roblox.com/asset/?id=12064107", Dn = "http://www.roblox.com/asset/?id=12064152",
        Ft = "http://www.roblox.com/asset/?id=12064121", Lf = "http://www.roblox.com/asset/?id=12063984",
        Rt = "http://www.roblox.com/asset/?id=12064115", Up = "http://www.roblox.com/asset/?id=12064131"
    },
    ["Blossom Daylight"] = {
        Bk = "http://www.roblox.com/asset/?id=271042516", Dn = "http://www.roblox.com/asset/?id=271077243",
        Ft = "http://www.roblox.com/asset/?id=271042556", Lf = "http://www.roblox.com/asset/?id=271042310",
        Rt = "http://www.roblox.com/asset/?id=271042467", Up = "http://www.roblox.com/asset/?id=271077958"
    },
    ["Blue Nebula"] = {
        Bk = "http://www.roblox.com/asset?id=135207744", Dn = "http://www.roblox.com/asset?id=135207662",
        Ft = "http://www.roblox.com/asset?id=135207770", Lf = "http://www.roblox.com/asset?id=135207615",
        Rt = "http://www.roblox.com/asset?id=135207695", Up = "http://www.roblox.com/asset?id=135207794"
    },
    ["Blue Planet"] = {
        Bk = "rbxassetid://218955819", Dn = "rbxassetid://218953419",
        Ft = "rbxassetid://218954524", Lf = "rbxassetid://218958493",
        Rt = "rbxassetid://218957134", Up = "rbxassetid://218950090"
    },
    ["Deep Space 2"] = {
        Bk = "http://www.roblox.com/asset/?id=159248188", Dn = "http://www.roblox.com/asset/?id=159248183",
        Ft = "http://www.roblox.com/asset/?id=159248187", Lf = "http://www.roblox.com/asset/?id=159248173",
        Rt = "http://www.roblox.com/asset/?id=159248192", Up = "http://www.roblox.com/asset/?id=159248176"
    },
    ["Summer"] = {
        Bk = "rbxassetid://16648590964", Dn = "rbxassetid://16648617436",
        Ft = "rbxassetid://16648595424", Lf = "rbxassetid://16648566370",
        Rt = "rbxassetid://16648577071", Up = "rbxassetid://16648598180"
    },
    ["Galaxy"] = {
        Bk = "rbxassetid://15983968922", Dn = "rbxassetid://15983966825",
        Ft = "rbxassetid://15983965025", Lf = "rbxassetid://15983967420",
        Rt = "rbxassetid://15983966246", Up = "rbxassetid://15983964246"
    },
    ["Stylized"] = {
        Bk = "rbxassetid://18351376859", Dn = "rbxassetid://18351374919",
        Ft = "rbxassetid://18351376800", Lf = "rbxassetid://18351376469",
        Rt = "rbxassetid://18351376457", Up = "rbxassetid://18351377189"
    },
    ["Minecraft"] = {
        Bk = "rbxassetid://8735166756", Dn = "http://www.roblox.com/asset/?id=8735166707",
        Ft = "http://www.roblox.com/asset/?id=8735231668", Lf = "http://www.roblox.com/asset/?id=8735166755",
        Rt = "http://www.roblox.com/asset/?id=8735166751", Up = "http://www.roblox.com/asset/?id=8735166729"
    },
    ["Cloudy Rain"] = {
        Bk = "http://www.roblox.com/asset/?id=4498828382", Dn = "http://www.roblox.com/asset/?id=4498828812",
        Ft = "http://www.roblox.com/asset/?id=4498829917", Lf = "http://www.roblox.com/asset/?id=4498830911",
        Rt = "http://www.roblox.com/asset/?id=4498830417", Up = "http://www.roblox.com/asset/?id=4498831746"
    },
    ["Black Cloudy Rain"] = {
        Bk = "http://www.roblox.com/asset/?id=149679669", Dn = "http://www.roblox.com/asset/?id=149681979",
        Ft = "http://www.roblox.com/asset/?id=149679690", Lf = "http://www.roblox.com/asset/?id=149679709",
        Rt = "http://www.roblox.com/asset/?id=149679722", Up = "http://www.roblox.com/asset/?id=149680199"
    }
}

-- ===================== ПЕРЕМЕННЫЕ =====================
local HatVariables = {
    enabled = false,
    style = "Classic",
    transparency = 0.3,
    rainbow = false,
    rainbowSpeed = 5,
    color = Color3.fromRGB(0, 255, 255),
    radius = 2.4,
    height = 1.6,
    reflectance = 0,
    sides = 25,
    parts = {},
    connection = nil,
}

local tau = math.pi * 2
local drawings = {}

for i = 1, HatVariables.sides do
    drawings[i] = {Drawing.new('Line'), Drawing.new('Triangle')}
    drawings[i][1].ZIndex = 2
    drawings[i][1].Thickness = 2
    drawings[i][2].ZIndex = 1
    drawings[i][2].Filled = true
end

local TrailVariables = {
    enabled = false,
    isGradient = false,
    lifetime = 0.5,
    transparencyStart = 0,
    rainbow = false,
    colorStatic = Color3.fromRGB(0, 255, 255),
    gradient1 = Color3.fromRGB(0, 86, 255),
    gradient2 = Color3.fromRGB(255, 0, 0),
    parts = {},
    connection = nil,
}

local AuraTrailerVariables = {
    enabled = false,
    color = Color3.fromRGB(255, 0, 0),
    lifetime = 0.5,
}

local ForceFieldVariables = {
    enabled = false,
    color = Color3.fromRGB(128, 128, 128),
    rainbow = false,
    originalColors = {},
    connection = nil,
}

local WorldVariables = {
    screenEnabled = false,
    screenIntensity = 0,
    screenConnection = nil,
    timeEnabled = false,
    timeValue = 12,
    fullBrightEnabled = false,
}

local NebulaVariables = {
    enabled = false,
    themeColor = Color3.fromRGB(173, 216, 230),
}

local SkyboxVariables = {
    current = "HD",
    customEnabled = false,
}

local AnimeVariables = {
    enabled = false,
    gui = nil,
}

local FPSVariables = {
    fpsPing1Enabled = false,
    fpsPing2Enabled = false,
}

local LarpticAtmosphere = nil
local auraRainbowConnection = nil
local auraPulseConnection = nil

-- ===================== ФУНКЦИИ КИТАЙСКОЙ ШЛЯПЫ =====================
local function Hat_RemoveClassic()
    if HatVariables.parts[player.Character] then 
        HatVariables.parts[player.Character]:Destroy()
        HatVariables.parts[player.Character] = nil 
    end
end

local function Hat_AddClassic(char)
    task.wait(0.1)
    local head = char:WaitForChild("Head", 5)
    if not head then return end
    Hat_RemoveClassic()

    local hat = Instance.new("Part")
    hat.Name = "ChineseHat"
    hat.Transparency = HatVariables.transparency
    hat.Color = HatVariables.color
    hat.Material = Enum.Material.Neon
    hat.CanCollide = false
    hat.Reflectance = HatVariables.reflectance

    local mesh = Instance.new("SpecialMesh")
    mesh.MeshId = "rbxassetid://1033714"
    mesh.Scale = Vector3.new(HatVariables.radius, HatVariables.height, HatVariables.radius)
    mesh.Parent = hat

    local weld = Instance.new("WeldConstraint")
    weld.Part0 = head
    weld.Part1 = hat
    weld.Parent = hat

    hat.CFrame = head.CFrame * CFrame.new(0, 1.1, 0)
    hat.Parent = char
    HatVariables.parts[char] = hat
end

local function Hat_UpdateClassic()
    for char, hat in pairs(HatVariables.parts) do
        if hat and hat.Parent and char == player.Character then
            hat.Transparency = HatVariables.transparency
            hat.Reflectance = HatVariables.reflectance
            
            if HatVariables.rainbow then
                hat.Color = Color3.fromHSV(tick() % HatVariables.rainbowSpeed / HatVariables.rainbowSpeed, 1, 1)
            else
                hat.Color = HatVariables.color
            end
            
            local mesh = hat:FindFirstChildOfClass("SpecialMesh")
            if mesh then
                mesh.Scale = Vector3.new(HatVariables.radius, HatVariables.height, HatVariables.radius)
            end
        end
    end
end

local function Hat_UpdateDrawing()
    local pass = HatVariables.enabled and player.Character and player.Character:FindFirstChild('Head') ~= nil and (camera.CFrame.p - camera.Focus.p).magnitude > 1 and player.Character.Humanoid.Health > 0
    
    for i = 1, #drawings do
        local line, triangle = drawings[i][1], drawings[i][2]
        if pass then
            local color
            if HatVariables.rainbow then
                color = Color3.fromHSV((tick() % HatVariables.rainbowSpeed / HatVariables.rainbowSpeed - (i / #drawings)) % 1, 0.5, 1)
            else
                color = HatVariables.color
            end
            
            local pos = player.Character.Head.Position + Vector3.new(0, 0.75, 0)
            local topWorld = pos + Vector3.new(0, 0.75, 0)

            local last, next = (i / HatVariables.sides) * tau, ((i + 1) / HatVariables.sides) * tau
            local lastWorld = pos + (Vector3.new(math.cos(last), 0, math.sin(last)) * HatVariables.radius)
            local nextWorld = pos + (Vector3.new(math.cos(next), 0, math.sin(next)) * HatVariables.radius)
            local lastScreen = camera:WorldToViewportPoint(lastWorld)
            local nextScreen = camera:WorldToViewportPoint(nextWorld)
            local topScreen = camera:WorldToViewportPoint(topWorld)

            line.From = Vector2.new(lastScreen.X, lastScreen.Y)
            line.To = Vector2.new(nextScreen.X, nextScreen.Y)
            line.Color = color
            line.Transparency = 1 - HatVariables.transparency
            line.Visible = true

            triangle.PointA = Vector2.new(topScreen.X, topScreen.Y)
            triangle.PointB = line.From
            triangle.PointC = line.To
            triangle.Color = color
            triangle.Transparency = 0.35
            triangle.Visible = true
        else
            line.Visible = false
            triangle.Visible = false
        end
    end
end

local function Hat_ToggleEnabled(value)
    HatVariables.enabled = value
    
    if value then
        if HatVariables.style == "Classic" and player.Character then
            Hat_AddClassic(player.Character)
        end
        
        if HatVariables.connection then HatVariables.connection:Disconnect() end
        HatVariables.connection = RunService.Heartbeat:Connect(function()
            if HatVariables.style == "Classic" then
                Hat_UpdateClassic()
            end
        end)
    else
        if player.Character then Hat_RemoveClassic() end
        for i = 1, #drawings do
            drawings[i][1].Visible = false
            drawings[i][2].Visible = false
        end
        
        if HatVariables.connection then 
            HatVariables.connection:Disconnect()
            HatVariables.connection = nil 
        end
    end
end

local function Hat_ChangeStyle(newStyle)
    local wasEnabled = HatVariables.enabled
    HatVariables.style = newStyle
    
    if wasEnabled then
        Hat_ToggleEnabled(false)
        task.wait(0.1)
        Hat_ToggleEnabled(true)
    end
end

local function Hat_UpdateSides(newSides)
    HatVariables.sides = newSides
    
    for i = 1, #drawings do
        drawings[i][1]:Remove()
        drawings[i][2]:Remove()
    end
    drawings = {}
    
    for i = 1, newSides do
        drawings[i] = {Drawing.new('Line'), Drawing.new('Triangle')}
        drawings[i][1].ZIndex = 2
        drawings[i][1].Thickness = 2
        drawings[i][2].ZIndex = 1
        drawings[i][2].Filled = true
    end
end

RunService.RenderStepped:Connect(function()
    if HatVariables.enabled and HatVariables.style == "Drawing" then
        Hat_UpdateDrawing()
    end
end)

-- ===================== ФУНКЦИИ СЛЕДА =====================
local function Trail_RemoveFromCharacter(char)
    if TrailVariables.parts[char] then 
        TrailVariables.parts[char]:Destroy()
        TrailVariables.parts[char] = nil 
    end
    if char and char:FindFirstChild("HumanoidRootPart") then
        local torso = char.HumanoidRootPart
        if torso:FindFirstChild("TrailAttach0") then torso.TrailAttach0:Destroy() end
        if torso:FindFirstChild("TrailAttach1") then torso.TrailAttach1:Destroy() end
    end
end

local function Trail_AddToCharacter(character)
    local torso = character:WaitForChild("HumanoidRootPart", 5)
    if not torso then return end
    Trail_RemoveFromCharacter(character)

    local a0 = Instance.new("Attachment")
    a0.Name = "TrailAttach0"
    a0.Position = Vector3.new(0, 2, 0)
    a0.Parent = torso

    local a1 = Instance.new("Attachment")
    a1.Name = "TrailAttach1"
    a1.Position = Vector3.new(0, -2, 0)
    a1.Parent = torso

    local trail = Instance.new("Trail")
    trail.Attachment0 = a0
    trail.Attachment1 = a1
    trail.Lifetime = TrailVariables.lifetime
    trail.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, TrailVariables.transparencyStart),
        NumberSequenceKeypoint.new(1, 1)
    })
    
    if TrailVariables.isGradient then
        trail.Color = ColorSequence.new(TrailVariables.gradient1, TrailVariables.gradient2)
    else
        trail.Color = ColorSequence.new(TrailVariables.colorStatic)
    end
    
    trail.LightEmission = 0.2
    trail.Enabled = true
    trail.Parent = character
    TrailVariables.parts[character] = trail
end

local function Trail_UpdateAll()
    for char, trail in pairs(TrailVariables.parts) do
        if trail and trail.Parent and char == player.Character then
            trail.Lifetime = TrailVariables.lifetime
            trail.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, TrailVariables.transparencyStart),
                NumberSequenceKeypoint.new(1, 1)
            })
            
            if TrailVariables.isGradient then
                trail.Color = ColorSequence.new(TrailVariables.gradient1, TrailVariables.gradient2)
            else
                if TrailVariables.rainbow then
                    trail.Color = ColorSequence.new(Color3.fromHSV(tick() % 5 / 5, 1, 1))
                else
                    trail.Color = ColorSequence.new(TrailVariables.colorStatic)
                end
            end
        end
    end
end

local function Trail_ToggleEnabled(value)
    TrailVariables.enabled = value
    if value and player.Character then
        Trail_AddToCharacter(player.Character)
        if TrailVariables.connection then TrailVariables.connection:Disconnect() end
        TrailVariables.connection = RunService.Heartbeat:Connect(Trail_UpdateAll)
    else
        if player.Character then Trail_RemoveFromCharacter(player.Character) end
        if TrailVariables.connection then 
            TrailVariables.connection:Disconnect()
            TrailVariables.connection = nil 
        end
    end
end

-- ===================== ФУНКЦИИ AURA TRAILER =====================
local function AuraTrailer_Toggle(enabled)
    local character = player.Character
    if not character then return end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    for _, v in pairs(character:GetChildren()) do
        if v:IsA("BasePart") and v ~= hrp then
            if enabled then
                if not v:FindFirstChild("AuraTrailer") then
                    local trail = Instance.new("Trail")
                    trail.Name = "AuraTrailer"
                    trail.Texture = "rbxassetid://1390780157"
                    trail.Parent = v

                    local p1 = Instance.new("Attachment", v)
                    p1.Name = "AuraPointer1"

                    local p2 = Instance.new("Attachment", hrp)
                    p2.Name = "AuraPointer2"

                    trail.Attachment0 = p1
                    trail.Attachment1 = p2
                    trail.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, AuraTrailerVariables.color),
                        ColorSequenceKeypoint.new(1, AuraTrailerVariables.color)
                    })
                    trail.Lifetime = AuraTrailerVariables.lifetime
                end
            else
                if v:FindFirstChild("AuraTrailer") then v.AuraTrailer:Destroy() end
                if v:FindFirstChild("AuraPointer1") then v.AuraPointer1:Destroy() end
            end
        end
    end

    if not enabled then
        for _, obj in pairs(hrp:GetChildren()) do
            if obj.Name == "AuraPointer2" then obj:Destroy() end
        end
    end
end

local function AuraTrailer_Update()
    local character = player.Character
    if not character then return end
    for _, v in pairs(character:GetDescendants()) do
        if v:IsA("Trail") and v.Name == "AuraTrailer" then
            v.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, AuraTrailerVariables.color),
                ColorSequenceKeypoint.new(1, AuraTrailerVariables.color)
            })
            v.Lifetime = AuraTrailerVariables.lifetime
        end
    end
end

-- ===================== ФУНКЦИИ СИЛОВОГО ПОЛЯ =====================
local function ForceField_SaveOriginalColors(char)
    ForceFieldVariables.originalColors[char] = {}
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "ChineseHat" then
            ForceFieldVariables.originalColors[char][part] = {
                Color = part.Color,
                Material = part.Material
            }
        end
    end
end

local function ForceField_Apply(char)
    ForceField_SaveOriginalColors(char)
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "ChineseHat" then
            part.Color = ForceFieldVariables.color
            part.Material = Enum.Material.ForceField
        end
    end
end

local function ForceField_Update()
    if player.Character and ForceFieldVariables.enabled then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "ChineseHat" and part.Material == Enum.Material.ForceField then
                if ForceFieldVariables.rainbow then
                    part.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                else
                    part.Color = ForceFieldVariables.color
                end
            end
        end
    endend

local function ForceField_Remove(char)
    if ForceFieldVariables.originalColors[char] then
        for part, data in pairs(ForceFieldVariables.originalColors[char]) do
            if part and part.Parent and part:IsA("BasePart") then
                part.Color = data.Color
                part.Material = data.Material
            end
        end
        ForceFieldVariables.originalColors[char] = {}
    end
end

local function ForceField_ToggleEnabled(value)
    ForceFieldVariables.enabled = value
    if player.Character then
        if value then
            ForceField_Apply(player.Character)
            if ForceFieldVariables.connection then ForceFieldVariables.connection:Disconnect() end
            ForceFieldVariables.connection = RunService.Heartbeat:Connect(ForceField_Update)
        else
            if ForceFieldVariables.connection then 
                ForceFieldVariables.connection:Disconnect()
                ForceFieldVariables.connection = nil 
            end
            ForceField_Remove(player.Character)
        end
    end
end

-- ===================== ФУНКЦИИ СКАЙБОКСА =====================
local function Skybox_Apply(name)
    local sb = SkyboxAssets[name]
    if not sb then return end
    
    local assets = {sb.Bk, sb.Dn, sb.Ft, sb.Lf, sb.Rt, sb.Up}
    task.spawn(function()
        ContentProvider:PreloadAsync(assets)
    end)
    
    local sky = Lighting:FindFirstChildOfClass("Sky")
    if not sky then 
        sky = Instance.new("Sky")
        sky.Name = "Sky" 
        sky.Parent = Lighting
    end
    
    sky.SkyboxBk = sb.Bk
    sky.SkyboxDn = sb.Dn
    sky.SkyboxFt = sb.Ft
    sky.SkyboxLf = sb.Lf
    sky.SkyboxRt = sb.Rt
    sky.SkyboxUp = sb.Up
end

local function Skybox_RestoreDefault()
    local sky = Lighting:FindFirstChildOfClass("Sky")
    if sky and DefaultSkySettings.SkyboxBk then
        sky.SkyboxBk = DefaultSkySettings.SkyboxBk
        sky.SkyboxDn = DefaultSkySettings.SkyboxDn
        sky.SkyboxFt = DefaultSkySettings.SkyboxFt
        sky.SkyboxLf = DefaultSkySettings.SkyboxLf
        sky.SkyboxRt = DefaultSkySettings.SkyboxRt
        sky.SkyboxUp = DefaultSkySettings.SkyboxUp
    elseif sky then
        sky:Destroy()
    end
end

-- ===================== ФУНКЦИИ CLASSIC AURA =====================
local function ClassicAura_LoadModel(id)
    local success, result = pcall(function() 
        return game:GetObjects(id)[1] 
    end)
    if not success then 
        warn("Failed to load aura model:", id)
        return nil 
    end
    return result
end

local function ClassicAura_DisableOne(auraName)
    if activeClassicAuras[auraName] then
        for _, v in pairs(activeClassicAuras[auraName]) do 
            if v and v.Parent then 
                pcall(function() v:Destroy() end)
            end 
        end
        activeClassicAuras[auraName] = nil
    end
end

local function ClassicAura_EnableOne(char, auraName)
    if not char or not char.Parent then return end
    
    ClassicAura_DisableOne(auraName)
    
    local id = AuraModelIDs[auraName]
    if not id then 
        warn("No ID found for aura:", auraName)
        return 
    end
    
    local model = ClassicAura_LoadModel(id)
    if not model then 
        warn("Failed to load model for:", auraName)
        return 
    end
    
    local effects = {}
    for _, obj in pairs(model:GetDescendants()) do
        if not obj:IsA('BasePart') then
            pcall(function()
                local clone = obj:Clone()
                local parentName = obj.Parent and obj.Parent.Name
                local target = char:FindFirstChild(parentName)
                if not target then 
                    target = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChildWhichIsA('BasePart')
                end
                if target then
                    clone.Parent = target
                    table.insert(effects, clone)
                end
            end)
        end
    end
    
    pcall(function() model:Destroy() end)
    
    if #effects > 0 then
        activeClassicAuras[auraName] = effects
    end
end

local function ClassicAura_RefreshAll()
    local char = player.Character
    if not char then return end
    
    if not ClassicAuraEnabled.Value then
        for _, auraName in ipairs(AuraModels) do
            ClassicAura_DisableOne(auraName)
        end
        return
    end
    
    local selectedAuras = ClassicAuraDropdown.Value
    
    for _, auraName in ipairs(AuraModels) do
        ClassicAura_DisableOne(auraName)
    end
    
    if type(selectedAuras) == "table" then
        for auraName, isSelected in pairs(selectedAuras) do
            if isSelected then
                task.spawn(function()
                    ClassicAura_EnableOne(char, auraName)
                end)
            end
        end
    end
end

-- ===================== ФУНКЦИИ PARTICLE AURA =====================
local function mapCharacterParts(character)
    local parts = {}
    for _, child in ipairs(character:GetChildren()) do
        if child:IsA("BasePart") then
            parts[child.Name] = child
        end
    end
    return parts
end

local function getParticleAuraTemplate(name)
    local cached = loadedParticleAuras[name]
    if cached then return cached end
    local id = particleAuraIdByName[name]
    if not id then return nil end
    local ok, result = pcall(function()
        return game:GetObjects(id)[1]
    end)
    if ok and result then
        loadedParticleAuras[name] = result
        return result
    end
    return nil
end

local function tintParticleSubtree(root, color)
    if not color or not root then return end
    local seq = ColorSequence.new(color)
    local function tintOne(obj)
        pcall(function()
            if obj:IsA("ParticleEmitter") or obj:IsA("Beam") or obj:IsA("Trail") then
                obj.Color = seq
            elseif obj:IsA("PointLight") then
                obj.Color = color
            end
        end)
    end
    tintOne(root)
    for _, d in ipairs(root:GetDescendants()) do
        tintOne(d)
    end
end

local function setParticleEmittersEnabledInSubtree(root, enabled)
    if not root then return end
    pcall(function()
        if root:IsA("ParticleEmitter") then
            root.Enabled = enabled
        end
    end)
    for _, d in ipairs(root:GetDescendants()) do
        pcall(function()
            if d:IsA("ParticleEmitter") then
                d.Enabled = enabled
            end
        end)
    end
end

local function applyParticleAuraToCharacter(character, auraName, color)
    local auraObj = getParticleAuraTemplate(auraName)
    if not auraObj then 
        warn("No template for particle aura:", auraName)
        return {} 
    end

    local localParts = mapCharacterParts(character)
    local cloned = auraObj:Clone()
    local created = {}

    for _, part in ipairs(cloned:GetChildren()) do
        local targetPart = localParts[part.Name]
        if targetPart then
            for _, child in ipairs(part:GetChildren()) do
                pcall(function()
                    local inst = child:Clone()
                    inst.Name = "CandyParticleAura"
                    inst.Parent = targetPart
                    if color then
                        tintParticleSubtree(inst, color)
                    end
                    table.insert(created, inst)
                end)
            end
        end
    end
    
    pcall(function() cloned:Destroy() end)

    for _, p in ipairs(created) do
        setParticleEmittersEnabledInSubtree(p, true)
    end

    return created
end

local function ParticleAura_DisableOne(auraName)
    if activeParticleAuras[auraName] then
        for _, p in ipairs(activeParticleAuras[auraName]) do
            if p then 
                pcall(function() p:Destroy() end)
            end
        end
        activeParticleAuras[auraName] = nil
    end
end

local function ParticleAura_RefreshAll()
    local char = player.Character
    if not char then return end
    
    if not ParticleAuraEnabled.Value then
        for _, auraName in ipairs(PARTICLE_AURA_NAMES) do
            ParticleAura_DisableOne(auraName)
        end
        return
    end
    
    local selectedAuras = ParticleAuraDropdown.Value
    
    for _, auraName in ipairs(PARTICLE_AURA_NAMES) do
        ParticleAura_DisableOne(auraName)
    end
    
    local col = ParticleAuraColor.Value or Color3.fromRGB(133, 220, 255)
    if type(selectedAuras) == "table" then
        for auraName, isSelected in pairs(selectedAuras) do
            if isSelected then
                task.spawn(function()
                    local particles = applyParticleAuraToCharacter(char, auraName, col)
                    activeParticleAuras[auraName] = particles
                end)
            end
        end
    end
end

-- ===================== ФУНКЦИИ ATMOSPHERE =====================
local function applyAtmosphere()
    if not WorldAtmEnabled.Value then
        if LarpticAtmosphere then
            pcall(function() LarpticAtmosphere:Destroy() end)
            LarpticAtmosphere = nil
        end
        return
    end
    local atm = LarpticAtmosphere
    if not (atm and atm.Parent) then
        atm = Instance.new('Atmosphere')
        atm.Name = 'CandyAtmosphere'
        atm.Parent = Lighting
        LarpticAtmosphere = atm
    end
    pcall(function()
        atm.Density = WorldAtmDensity.Value or 0.35
        atm.Offset = WorldAtmOffset.Value or 0
        atm.Haze = WorldAtmHaze.Value or 1
        atm.Glare = WorldAtmGlare.Value or 10
        atm.Color = WorldAtmColor.Value or Color3.fromRGB(199, 212, 255)
        atm.Decay = WorldAtmDecay.Value or Color3.fromRGB(106, 112, 125)
    end)
end

-- ===================== ФУНКЦИИ TEXTURE PACK =====================
local function ensureMinecraftVariants()
    if LarpticMaterialVariantsBuilt then return end

    for name, data in pairs(MINECRAFT_VARIANTS) do
        local variant = MaterialService:FindFirstChild(name)
        if not variant then
            variant = Instance.new('MaterialVariant')
            variant.Name = name
            variant.Parent = MaterialService
        end

        pcall(function()
            variant.BaseMaterial = data.BaseMaterial
            variant.ColorMap = data.Texture
            variant.MetalnessMap = data.Texture
            variant.NormalMap = data.Texture
            variant.RoughnessMap = data.Texture
            variant.MaterialPattern = Enum.MaterialPattern.Regular
            variant.StudsPerTile = 5
        end)
    end

    LarpticMaterialVariantsBuilt = true
end

local function rememberPartState(part)
    if not LarpticTextureState[part] then
        LarpticTextureState[part] = {
            Color = part.Color,
            Material = part.Material,
            MaterialVariant = part.MaterialVariant,
        }
    end
    return LarpticTextureState[part]
end

local function shouldSkipTexturePart(part)
    if not part:IsDescendantOf(workspace) then return true end
    if part.Name == 'CandyWeather' or part.Name == 'Part' then return true end
    local parent = part.Parent
    if parent and (parent:IsA('Tool') or parent:IsA('Accessory')) then return true end
    local model = part:FindFirstAncestorOfClass('Model')
    if model and game.Players:GetPlayerFromCharacter(model) then return true end
    return false
end

local function applyPartTexturePack()
    ensureMinecraftVariants()

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA('BasePart') and not shouldSkipTexturePart(obj) then
            rememberPartState(obj)

            local variantName = MATERIAL_VARIANT_BY_MATERIAL[obj.Material]
            if variantName then
                pcall(function()
                    obj.MaterialVariant = variantName
                end)
            end
        end
    end
end

local function clearPartTexturePack()
    for part, state in pairs(LarpticTextureState) do
        if part and part.Parent and state then
            pcall(function()
                part.Color = state.Color
                part.Material = state.Material
                part.MaterialVariant = state.MaterialVariant or ''
            end)
        end
    end
end

local function clearMinecraftVariants()
    for name, _ in pairs(MINECRAFT_VARIANTS) do
        local variant = MaterialService:FindFirstChild(name)
        if variant and variant:IsA('MaterialVariant') then
            pcall(function() variant:Destroy() end)
        end
    end
    LarpticMaterialVariantsBuilt = false
end

local function applyTexturePack()
    local Terrain = workspace:FindFirstChildOfClass('Terrain')
    if Terrain then
        for mat, col in pairs(MINECRAFT_TERRAIN_COLORS) do
            pcall(function() Terrain:SetMaterialColor(mat, col) end)
        end
    end
    applyPartTexturePack()
end

local function clearTexturePack()
    clearPartTexturePack()
    clearMinecraftVariants()
end

-- ===================== ФУНКЦИИ НЕБУЛЫ =====================
local function Nebula_Enable()
    local b = Instance.new("BloomEffect", Lighting)
    b.Intensity = 0.7
    b.Size = 24
    b.Threshold = 1
    b.Name = "NebulaBloom"

    local c = Instance.new("ColorCorrectionEffect", Lighting)
    c.Saturation = 0.5
    c.Contrast = 0.2
    c.TintColor = NebulaVariables.themeColor
    c.Name = "NebulaColorCorrection"

    local a = Instance.new("Atmosphere", Lighting)
    a.Density = 0.4
    a.Offset = 0.25
    a.Glare = 1
    a.Haze = 2
    a.Color = NebulaVariables.themeColor
    a.Decay = Color3.fromRGB(173, 216, 230)
    a.Name = "NebulaAtmosphere"

    Lighting.Ambient = NebulaVariables.themeColor
    Lighting.OutdoorAmbient = NebulaVariables.themeColor
    Lighting.FogStart = 100
    Lighting.FogEnd = 500
    Lighting.FogColor = NebulaVariables.themeColor
end

local function Nebula_Disable()
    for _, name in pairs({"NebulaBloom", "NebulaColorCorrection", "NebulaAtmosphere"}) do
        local obj = Lighting:FindFirstChild(name)
        if obj then obj:Destroy() end
    end
    
    Lighting.Ambient = defaultLighting.Ambient
    Lighting.OutdoorAmbient = defaultLighting.OutdoorAmbient
    Lighting.FogStart = defaultLighting.FogStart
    Lighting.FogEnd = defaultLighting.FogEnd
    Lighting.FogColor = defaultLighting.FogColor
end

local function Nebula_UpdateColor()
    if NebulaVariables.enabled then
        local nc = Lighting:FindFirstChild("NebulaColorCorrection")
        if nc then nc.TintColor = NebulaVariables.themeColor end
        
        local na = Lighting:FindFirstChild("NebulaAtmosphere")
        if na then na.Color = NebulaVariables.themeColor end
        
        Lighting.Ambient = NebulaVariables.themeColor
        Lighting.OutdoorAmbient = NebulaVariables.themeColor
        Lighting.FogColor = NebulaVariables.themeColor
    end
end

-- ===================== ФУНКЦИИ ЭКРАНА =====================
local function Screen_Toggle(value)
    WorldVariables.screenEnabled = value
    if value then
        getgenv().gg_scripters = "CandyVisuals"
        WorldVariables.screenConnection = RunService.RenderStepped:Connect(function()
            camera.CFrame = camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, (0.65 + WorldVariables.screenIntensity), 0, 0, 0, 1)
        end)
    else
        if WorldVariables.screenConnection then 
            WorldVariables.screenConnection:Disconnect()
            WorldVariables.screenConnection = nil 
        end
        getgenv().gg_scripters = nil
    end
end

-- ===================== ФУНКЦИИ АНИМЕ =====================
local function Anime_Toggle(value)
    AnimeVariables.enabled = value
    if value then
        AnimeVariables.gui = Instance.new("ScreenGui", player.PlayerGui)
        AnimeVariables.gui.Name = "AnimeImageGui"
        AnimeVariables.gui.ResetOnSpawn = false
        
        local imageLabel = Instance.new("ImageLabel", AnimeVariables.gui)
        imageLabel.Name = "AnimeImage"
        imageLabel.Image = "http://www.roblox.com/asset/?id=117783035423570"
        imageLabel.Size = UDim2.new(0, 350, 0, 400)
        imageLabel.Position = UDim2.new(1, -25, 0, 10)
        imageLabel.AnchorPoint = Vector2.new(1, 0)
        imageLabel.BackgroundTransparency = 1
    else
        if AnimeVariables.gui then 
            AnimeVariables.gui:Destroy()
            AnimeVariables.gui = nil 
        end
    end
end

-- ===================== СОЗДАНИЕ ВКЛАДКИ VISUALS =====================
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
    Callback = function(Value)
        WorldVariables.fullBrightEnabled = Value
        if not Value then
            Lighting.Brightness = defaultLighting.Brightness
            Lighting.GlobalShadows = defaultLighting.GlobalShadows
            Lighting.OutdoorAmbient = defaultLighting.OutdoorAmbient
        end
    end
})

World:AddToggle({
    Name = "Time Changer",
    Callback = function(Value)
        WorldVariables.timeEnabled = Value
    end
})

World:AddSlider({
    Name = "Time of Day",
    Default = 12,
    Min = 0,
    Max = 24,
    Round = 1,
    Callback = function(Value)
        WorldVariables.timeValue = Value
    end
})

World:AddToggle({
    Name = "Disable Fog",
    Callback = function(Value)
        if Value then
            Lighting.FogEnd = 100000
            Lighting.FogStart = 100000
        else
            Lighting.FogEnd = defaultLighting.FogEnd
            Lighting.FogStart = defaultLighting.FogStart
        end
    end
})

World:AddColorPicker({
    Name = "Fog Color",
    Default = Color3.fromRGB(127, 127, 127),
    Callback = function(Value)
        Lighting.FogColor = Value
    end
})

World:AddColorPicker({
    Name = "Ambient Color",
    Default = Color3.fromRGB(127, 127, 127),
    Callback = function(Value)
        Lighting.Ambient = Value
    end
})

World:AddColorPicker({
    Name = "Outdoor Ambient",
    Default = Color3.fromRGB(127, 127, 127),
    Callback = function(Value)
        Lighting.OutdoorAmbient = Value
    end
})

-- SKYBOX
World:AddDivider()

local skyboxList = {}
for k in pairs(SkyboxAssets) do table.insert(skyboxList, k) end
table.sort(skyboxList)

World:AddDropdown({
    Name = "Skybox",
    Values = skyboxList,
    Default = "HD",
    Callback = function(Value)
        SkyboxVariables.current = Value
        if not SkyboxVariables.customEnabled then
            SkyboxVariables.customEnabled = true
            SkyboxToggle:SetValue(true)
        end
        Skybox_Apply(SkyboxVariables.current)
    end
})

local SkyboxToggle = World:AddToggle({
    Name = "Enable Skybox",
    Callback = function(Value)
        SkyboxVariables.customEnabled = Value
        if Value then 
            Skybox_Apply(SkyboxVariables.current) 
        else 
            Skybox_RestoreDefault() 
        end
    end
})

-- ATMOSPHERE
World:AddDivider()

local WorldAtmEnabled = World:AddToggle({
    Name = "Atmosphere",
    Option = true,
    Callback = function(Value)
        if Value then
            applyAtmosphere()
        else
            if LarpticAtmosphere then
                pcall(function() LarpticAtmosphere:Destroy() end)
                LarpticAtmosphere = nil
            end
        end
    end
})

WorldAtmEnabled.Option:AddColorPicker({
    Name = "Atmosphere Color",
    Default = Color3.fromRGB(199, 212, 255),
    Callback = function()
        if WorldAtmEnabled.Value then
            applyAtmosphere()
        end
    end
})

WorldAtmEnabled.Option:AddColorPicker({
    Name = "Atmosphere Decay",
    Default = Color3.fromRGB(106, 112, 125),
    Callback = function()
        if WorldAtmEnabled.Value then
            applyAtmosphere()
        end
    end
})

World:AddSlider({
    Name = "Atmosphere Haze",
    Default = 1,
    Min = 0,
    Max = 10,
    Round = 1,
    Callback = function()
        if WorldAtmEnabled.Value then
            applyAtmosphere()
        end
    end
})

World:AddSlider({
    Name = "Atmosphere Glare",
    Default = 10,
    Min = 0,
    Max = 10,
    Round = 1,
    Callback = function()
        if WorldAtmEnabled.Value then
            applyAtmosphere()
        end
    end
})

World:AddSlider({
    Name = "Atmosphere Offset",
    Default = 0,
    Min = 0,
    Max = 1,
    Round = 2,
    Callback = function()
        if WorldAtmEnabled.Value then
            applyAtmosphere()
        end
    end
})

World:AddSlider({
    Name = "Atmosphere Density",
    Default = 0.35,
    Min = 0,
    Max = 1,
    Round = 2,
    Callback = function()
        if WorldAtmEnabled.Value then
            applyAtmosphere()
        end
    end
})

-- TEXTURE PACK
World:AddDivider()

World:AddToggle({
    Name = "Minecraft Textures",
    Callback = function(Value)
        if Value then
            applyTexturePack()
        else
            clearTexturePack()
        end
    end
})

-- NEBULA
World:AddDivider()

World:AddToggle({
    Name = "Nebula Theme",
    Callback = function(Value)
        NebulaVariables.enabled = Value
        if Value then
            Nebula_Enable()
        else
            Nebula_Disable()
        end
    end
})

World:AddColorPicker({
    Name = "Nebula Color",
    Default = Color3.fromRGB(173, 216, 230),
    Callback = function(Value)
        NebulaVariables.themeColor = Value
        Nebula_UpdateColor()
    end
})

-- SCREEN EFFECT
World:AddDivider()

World:AddToggle({
    Name = "Screen Effect",
    Callback = function(Value)
        Screen_Toggle(Value)
    end
})

World:AddSlider({
    Name = "Screen Stretch",
    Default = 0,
    Min = 0,
    Max = 0.2,
    Round = 3,
    Callback = function(Value)
        WorldVariables.screenIntensity = Value
    end
})

-- ===================== ПОДКАТЕГОРИЯ PLAYER =====================
local Player = Visuals:AddSection({
    Name = "Player",
    Position = 'center'
})

-- КИТАЙСКАЯ ШЛЯПА
Player:AddDivider()
Player:AddLabel("Chinese Hat")

local HatToggle = Player:AddToggle({
    Name = "Enable Hat",
    Callback = function(Value)
        Hat_ToggleEnabled(Value)
    end
})

Player:AddDropdown({
    Name = "Hat Style",
    Values = {"Classic", "Drawing"},
    Default = "Classic",
    Callback = function(Value)
        Hat_ChangeStyle(Value)
    end
})

Player:AddToggle({
    Name = "Rainbow Hat",
    Callback = function(Value)
        HatVariables.rainbow = Value
    end
})

Player:AddSlider({
    Name = "Rainbow Speed",
    Default = 5,
    Min = 1,
    Max = 20,
    Round = 0,
    Callback = function(Value)
        HatVariables.rainbowSpeed = Value
    end
})

Player:AddSlider({
    Name = "Hat Transparency",
    Default = 0.3,
    Min = 0,
    Max = 1,
    Round = 2,
    Callback = function(Value)
        HatVariables.transparency = Value
    end
})

Player:AddSlider({
    Name = "Hat Radius",
    Default = 2.4,
    Min = 0.5,
    Max = 10,
    Round = 1,
    Callback = function(Value)
        HatVariables.radius = Value
    end
})

Player:AddSlider({
    Name = "Hat Height",
    Default = 1.6,
    Min = 0.5,
    Max = 5,
    Round = 1,
    Callback = function(Value)
        HatVariables.height = Value
    end
})

Player:AddSlider({
    Name = "Hat Reflectance",
    Default = 0,
    Min = 0,
    Max = 1,
    Round = 2,
    Callback = function(Value)
        HatVariables.reflectance = Value
    end
})

Player:AddSlider({
    Name = "Hat Sides",
    Default = 25,
    Min = 3,
    Max = 300,
    Round = 0,
    Callback = function(Value)
        Hat_UpdateSides(Value)
    end
})

Player:AddColorPicker({
    Name = "Hat Color",
    Default = Color3.fromRGB(0, 255, 255),
    Callback = function(Value)
        HatVariables.color = Value
    end
})

-- TRAIL
Player:AddDivider()
Player:AddLabel("Trail")

local TrailToggle = Player:AddToggle({
    Name = "Enable Trail",
    Callback = function(Value)
        Trail_ToggleEnabled(Value)
    end
})

Player:AddToggle({
    Name = "Gradient Trail",
    Callback = function(Value)
        TrailVariables.isGradient = Value
        if TrailVariables.enabled and player.Character then 
            Trail_AddToCharacter(player.Character) 
        end
    end
})

Player:AddSlider({
    Name = "Trail Lifetime",
    Default = 0.5,
    Min = 0.1,
    Max = 3,
    Round = 1,
    Callback = function(Value)
        TrailVariables.lifetime = Value
        Trail_UpdateAll()
    end
})

Player:AddSlider({
    Name = "Trail Transparency",
    Default = 0,
    Min = 0,
    Max = 1,
    Round = 2,
    Callback = function(Value)
        TrailVariables.transparencyStart = Value
        Trail_UpdateAll()
    end
})

Player:AddToggle({
    Name = "Rainbow Trail",
    Callback = function(Value)
        TrailVariables.rainbow = Value
        Trail_UpdateAll()
    end
})

Player:AddColorPicker({
    Name = "Trail Color",
    Default = Color3.fromRGB(0, 255, 255),
    Callback = function(Value)
        TrailVariables.colorStatic = Value
        Trail_UpdateAll()
    end
})

Player:AddColorPicker({
    Name = "Gradient Color 1",
    Default = Color3.fromRGB(0, 86, 255),
    Callback = function(Value)
        TrailVariables.gradient1 = Value
        Trail_UpdateAll()
    end
})

Player:AddColorPicker({
    Name = "Gradient Color 2",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(Value)
        TrailVariables.gradient2 = Value
        Trail_UpdateAll()
    end
})

-- FORCEFIELD
Player:AddDivider()
Player:AddLabel("ForceField")

local FFToggle = Player:AddToggle({
    Name = "Enable ForceField",
    Callback = function(Value)
        ForceField_ToggleEnabled(Value)
    end
})

Player:AddToggle({
    Name = "Rainbow ForceField",
    Callback = function(Value)
        ForceFieldVariables.rainbow = Value
        ForceField_Update()
    end
})

Player:AddColorPicker({
    Name = "ForceField Color",
    Default = Color3.fromRGB(128, 128, 128),
    Callback = function(Value)
        ForceFieldVariables.color = Value
        if ForceFieldVariables.enabled and not ForceFieldVariables.rainbow and player.Character then 
            ForceField_Apply(player.Character) 
        end
    end
})

-- AURA TRAILER
Player:AddDivider()
Player:AddLabel("Aura Trailer")

local AuraTrailerToggle = Player:AddToggle({
    Name = "Enable Aura Trailer",
    Callback = function(Value)
        AuraTrailerVariables.enabled = Value
        AuraTrailer_Toggle(Value)
    end
})

Player:AddColorPicker({
    Name = "Aura Trailer Color",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(Value)
        AuraTrailerVariables.color = Value
        if AuraTrailerVariables.enabled then AuraTrailer_Update() end
    end
})

Player:AddSlider({
    Name = "Aura Trailer Lifetime",
    Default = 0.5,
    Min = 0.1,
    Max = 3,
    Round = 1,
    Callback = function(Value)
        AuraTrailerVariables.lifetime = Value
        if AuraTrailerVariables.enabled then AuraTrailer_Update() end
    end
})

-- PLAYER MOVEMENT
Player:AddDivider()
Player:AddLabel("Movement")

Player:AddToggle({
    Name = "Walk on Water",
    Callback = function(Value)
        local char = player.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, not Value)
        end
    end
})

Player:AddToggle({
    Name = "No Clip",
    Callback = function(Value)
        local char = player.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = not Value
                end
            end
        end
    end
})

Player:AddSlider({
    Name = "Walk Speed",
    Default = 16,
    Min = 0,
    Max = 100,
    Round = 1,
    Callback = function(Value)
        local char = player.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = Value
        end
    end
})

Player:AddSlider({
    Name = "Jump Power",
    Default = 50,
    Min = 0,
    Max = 200,
    Round = 1,
    Callback = function(Value)
        local char = player.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.JumpPower = Value
        end
    end
})

Player:AddToggle({
    Name = "No Fall Damage",
    Callback = function(Value)
        local char = player.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.UseJumpPower = not Value
        end
    end
})

-- THIRD PERSON
Player:AddDivider()
Player:AddLabel("Camera")

local ThirdPerson = Player:AddToggle({
    Name = "Third Person",
    Option = true,
    Callback = function(Value)
        if Value then
            camera.CameraSubject = player.Character
            camera.CameraType = Enum.CameraType.Fixed
        else
            camera.CameraSubject = player.Character
            camera.CameraType = Enum.CameraType.Custom
        end
    end
})

ThirdPerson.Option:AddSlider({
    Name = "Third Person Distance",
    Default = 10,
    Min = 1,
    Max = 50,
    Round = 1,
    Callback = function(Value)
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart
            local direction = (camera.CFrame.Position - hrp.Position).Unit
            camera.CFrame = CFrame.new(hrp.Position + direction * Value, hrp.Position)
        end
    end
})

Player:AddSlider({
    Name = "FOV",
    Default = 70,
    Min = 1,
    Max = 120,
    Round = 1,
    Callback = function(Value)
        camera.FieldOfView = Value
    end
})

-- ===================== ПОДКАТЕГОРИЯ AURA =====================
local Aura = Visuals:AddSection({
    Name = "Aura",
    Position = 'right'
})

-- CLASSIC AURA
Aura:AddDivider()
Aura:AddLabel("Classic Aura")

local ClassicAuraEnabled = Aura:AddToggle({
    Name = "Enable Classic Aura",
    Callback = function(Value)
        ClassicAura_RefreshAll()
    end
})

local ClassicAuraDropdown = Aura:AddDropdown({
    Name = "Select Auras",
    Values = AuraModels,
    Multi = true,
    Default = {},
    Callback = function(Value)
        ClassicAura_RefreshAll()
    end
})

-- PARTICLE AURA
Aura:AddDivider()
Aura:AddLabel("Particle Aura")

local ParticleAuraEnabled = Aura:AddToggle({
    Name = "Enable Particle Aura",
    Callback = function(Value)
        ParticleAura_RefreshAll()
    end
})

local ParticleAuraColor = Aura:AddColorPicker({
    Name = "Particle Aura Color",
    Default = Color3.fromRGB(133, 220, 255),
    Callback = function()
        ParticleAura_RefreshAll()
    end
})

local ParticleAuraDropdown = Aura:AddDropdown({
    Name = "Select Particle Auras",
    Values = PARTICLE_AURA_NAMES,
    Multi = true,
    Default = {},
    Callback = function(Value)
        ParticleAura_RefreshAll()
    end
})

-- BASIC AURA
Aura:AddDivider()
Aura:AddLabel("Basic Aura")

local BasicAura = Aura:AddToggle({
    Name = "Enable Basic Aura",
    Option = true,
    Callback = function(Value)
        local char = player.Character
        if not char then return end
        
        if Value then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            
            local aura = Instance.new("Part")
            aura.Name = "CandyBasicAura"
            aura.Size = Vector3.new(6, 6, 6)
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
            local aura = char:FindFirstChild("CandyBasicAura")
            if aura then aura:Destroy() end
        end
    end
})

BasicAura.Option:AddColorPicker({
    Name = "Aura Color",
    Default = Color3.fromRGB(0, 255, 255),
    Callback = function(Value)
        local char = player.Character
        if char then
            local aura = char:FindFirstChild("CandyBasicAura")
            if aura then aura.Color = Value end
        end
    end
})

BasicAura.Option:AddSlider({
    Name = "Aura Size",
    Default = 6,
    Min = 1,
    Max = 20,
    Round = 1,
    Callback = function(Value)
        local char = player.Character
        if char then
            local aura = char:FindFirstChild("CandyBasicAura")
            if aura then
                aura.Size = Vector3.new(Value, Value, Value)
            end
        end
    end
})

BasicAura.Option:AddSlider({
    Name = "Aura Transparency",
    Default = 0.5,
    Min = 0,
    Max = 1,
    Round = 2,
    Callback = function(Value)
        local char = player.Character
        if char then
            local aura = char:FindFirstChild("CandyBasicAura")
            if aura then aura.Transparency = Value end
        end
    end
})

Aura:AddToggle({
    Name = "Rainbow Aura",
    Callback = function(Value)
        if Value then
            if auraRainbowConnection then auraRainbowConnection:Disconnect() end
            auraRainbowConnection = RunService.Heartbeat:Connect(function()
                local char = player.Character
                if char then
                    local aura = char:FindFirstChild("CandyBasicAura")
                    if aura then
                        aura.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                    end
                end
            end)
        else
            if auraRainbowConnection then 
                auraRainbowConnection:Disconnect()
                auraRainbowConnection = nil
            end
        end
    end
})

Aura:AddToggle({
    Name = "Pulse Aura",
    Callback = function(Value)
        if Value then
            if auraPulseConnection then auraPulseConnection:Disconnect() end
            auraPulseConnection = RunService.Heartbeat:Connect(function()
                local char = player.Character
                if char then
                    local aura = char:FindFirstChild("CandyBasicAura")
                    if aura then
                        local size = 6 + math.sin(tick() * 3) * 1.5
                        aura.Size = Vector3.new(size, size, size)
                    end
                end
            end)
        else
            if auraPulseConnection then 
                auraPulseConnection:Disconnect()
                auraPulseConnection = nil
            end
        end
    end
})

Aura:AddToggle({
    Name = "Aura Trails",
    Callback = function(Value)
        local char = player.Character
        if not char then return end
        
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        if Value then
            local trail = Instance.new("Trail")
            trail.Name = "CandyAuraTrail"
            trail.Lifetime = 0.5
            trail.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(1, 1)
            })
            trail.Color = ColorSequence.new(Color3.fromRGB(0, 255, 255))
            trail.Parent = hrp
        else
            local trail = hrp:FindFirstChild("CandyAuraTrail")
            if trail then trail:Destroy() end
        end
    end
})

Aura:AddToggle({
    Name = "Particles",
    Callback = function(Value)
        local char = player.Character
        if not char then return end
        
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        if Value then
            local emitter = Instance.new("ParticleEmitter")
            emitter.Name = "CandyParticles"
            emitter.Texture = "rbxassetid://373640392"
            emitter.Rate = 50
            emitter.Lifetime = NumberRange.new(1)
            emitter.SpreadAngle = Vector2.new(360, 360)
            emitter.VelocityInheritance = 0
            emitter.Speed = NumberRange.new(3, 6)
            emitter.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(1, 1)
            })
            emitter.Size = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.5),
                NumberSequenceKeypoint.new(1, 0)
            })
            emitter.Color = ColorSequence.new(Color3.fromRGB(0, 255, 255))
            emitter.Parent = hrp
        else
            local emitter = hrp:FindFirstChild("CandyParticles")
            if emitter then emitter:Destroy() end
        end
    end
})

-- ANIME
Aura:AddDivider()
Aura:AddLabel("Utilities")

Aura:AddToggle({
    Name = "Anime Image",
    Callback = function(Value)
        Anime_Toggle(Value)
    end
})

Aura:AddButton({
    Name = "FPS/Ping Counter 1",
    Callback = function()
        if not FPSVariables.fpsPing1Enabled then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GLAMOHGA/fling/refs/heads/main/хз%20как%20назвать%20типо%20фпс%20и%20пинг.md"))()
            FPSVariables.fpsPing1Enabled = true
        end
    end
})

Aura:AddButton({
    Name = "FPS/Ping Counter 2",
    Callback = function()
        if not FPSVariables.fpsPing2Enabled then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VetrexTheBest/Fps-ping/refs/heads/main/fps%2Bping.txt"))()
            FPSVariables.fpsPing2Enabled = true
        end
    end
})

-- ===================== HEARTBEAT =====================
RunService.Heartbeat:Connect(function()
    if WorldVariables.timeEnabled then 
        Lighting.ClockTime = WorldVariables.timeValue 
    end
    
    if WorldVariables.fullBrightEnabled then
        Lighting.Brightness = 3
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        Lighting.ExposureCompensation = 0.3
    end
end)

-- ===================== AUTO REAPPLY ON CHARACTER SPAWN =====================
local function ReapplyVisuals_OnCharacterSpawned(char)
    task.wait(1)
    
    if HatVariables.enabled and HatVariables.style == "Classic" then 
        Hat_AddClassic(char) 
    end
    if TrailVariables.enabled then Trail_AddToCharacter(char) end
    if ForceFieldVariables.enabled then ForceField_Apply(char) end
    if AuraTrailerVariables.enabled then AuraTrailer_Toggle(true) end
    if AnimeVariables.enabled then Anime_Toggle(true) end
    ClassicAura_RefreshAll()
    ParticleAura_RefreshAll()
end

player.CharacterAdded:Connect(ReapplyVisuals_OnCharacterSpawned)
if player.Character then ReapplyVisuals_OnCharacterSpawned(player.Character) end

-- ===================== УВЕДОМЛЕНИЕ О ЗАГРУЗКЕ =====================
Notification:Notify({
    Title = "Candy Visuals",
    Content = "Loaded successfully! Enjoy!",
    Icon = "check"
})
