-- слито в https://discord.gg/3KjWyZ6uBu
-- Cracked by @idkmops(tg) @mopsech(ds)
--
-- ════════════════════════════════════════════════════════════════
--
--
--   /$$$$$$   /$$$$$$  /$$   /$$ /$$$$$$$  /$$     /$$       /$$$$$$$$  /$$$$$$  /$$   /$$ /$$$$$$$$
--  /$$__  $$ /$$__  $$| $$$ | $$| $$__  $$|  $$   /$$/      |_____ $$  /$$__  $$| $$$ | $$| $$_____/
-- | $$  \__/| $$  \ $$| $$$$| $$| $$  \ $$ \  $$ /$$/            /$$/ | $$  \ $$| $$$$| $$| $$      
-- | $$      | $$$$$$$$| $$ $$ $$| $$  | $$  \  $$$$/            /$$/  | $$  | $$| $$ $$ $$| $$$$$     
-- | $$      | $$__  $$| $$  $$$$| $$  | $$   \  $$/            /$$/   | $$  | $$| $$  $$$$| $$__/   
-- | $$    $$| $$  | $$| $$\  $$$| $$  | $$    | $$            /$$/    | $$  | $$| $$\  $$$| $$      
-- |  $$$$$$/| $$  | $$| $$ \  $$| $$$$$$$/    | $$           /$$$$$$$$|  $$$$$$/| $$ \  $$| $$$$$$$$
--  \______/ |__/  |__/|__/  \__/|_______/     |__/          |________/ \______/ |__/  \__/|________/                                                                                              
--                                                                                                  
--                                                                                                  
--
-- ════════════════════════════════════════════════════════════════
-- 🔥 CRACKED BY MOPS 🔥
-- 💬 Discord: @mopsech
-- ✈️ Telegram: @idkmops
-- 
-- 📢 СКРИПТ СЛИТ В ПУБЛИЧНЫЙ ДОСТУП!
-- 🔗 ССЫЛКА НА КАНАЛ: https://discord.gg/3KjWyZ6uBu
-- 
-- ⭐ СПАСИБО ЗА ИСПОЛЬЗОВАНИЕ!

-- слито в https://discord.gg/3KjWyZ6uBu
-- Cracked by @idkmops(tg) @mopsech(ds)

-- ════════════════════════════════════════════════════════════════
-- 🌊 ANTI-WATER / DAMAGE BYPASS SYSTEM
-- ════════════════════════════════════════════════════════════════

local Workspace = game:GetService("Workspace")
local Terrain = Workspace.Terrain
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Config = {
    AntiWater = true
}

local zonasDeAguaActivas = {}

local function hacerNadable(nombreMapa, bloqueFalso, scriptCliente)
    if not Config.AntiWater then return end
    if not bloqueFalso or not bloqueFalso:IsA("BasePart") then return end
    if scriptCliente and scriptCliente:IsA("LocalScript") then scriptCliente.Enabled = false end
    
    bloqueFalso.CanTouch = false
    if bloqueFalso:GetAttribute("AguaTransformada") then return end
    bloqueFalso:SetAttribute("AguaTransformada", true)
    
    local cframeAgua = bloqueFalso.CFrame
    local tamanoAgua = bloqueFalso.Size
    
    pcall(function()
        Terrain:FillBlock(cframeAgua, tamanoAgua, Enum.Material.Water)
    end)
    
    local visualWater = Instance.new("Part")
    visualWater.Name = "CustomWaterTexture"
    visualWater.Size = Vector3.new(tamanoAgua.X + 0.1, tamanoAgua.Y + 0.05, tamanoAgua.Z + 0.1)
    visualWater.CFrame = cframeAgua
    visualWater.Anchored = true
    visualWater.CanCollide = false
    visualWater.CanQuery = false
    visualWater.CanTouch = false
    visualWater.CastShadow = false
    visualWater.Material = Enum.Material.Granite
    visualWater.Color = Color3.fromRGB(85, 227, 255)
    visualWater.Transparency = 0.85
    visualWater.Parent = bloqueFalso.Parent
    
    bloqueFalso.Transparency = 1
    
    table.insert(zonasDeAguaActivas, {
        mapa = nombreMapa,
        cframe = cframeAgua,
        size = tamanoAgua,
        parteFalsa = bloqueFalso,
        parteVisual = visualWater
    })
end

local function limpiarAguaInyectada()
    for i = #zonasDeAguaActivas, 1, -1 do
        local zona = zonasDeAguaActivas[i]
        pcall(function()
            Terrain:FillBlock(zona.cframe, zona.size, Enum.Material.Air)
        end)
        if zona.parteVisual and zona.parteVisual.Parent then
            zona.parteVisual:Destroy()
        end
        if zona.parteFalsa and zona.parteFalsa.Parent then
            zona.parteFalsa:SetAttribute("AguaTransformada", nil)
            zona.parteFalsa.CanTouch = true
        end
        table.remove(zonasDeAguaActivas, i)
    end
end

local function analizarMapas()
    if not Config.AntiWater then return end
    
    local yacht = Workspace:FindFirstChild("Yacht")
    if yacht then
        hacerNadable("Yacht", yacht:FindFirstChild("WaterPart", true), yacht:FindFirstChild("WaterClient", true))
    end
    
    local pier = Workspace:FindFirstChild("Pier")
    if pier then
        hacerNadable("Pier", pier:FindFirstChild("Respawn", true), pier:FindFirstChild("WaterClient", true))
    end
    
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            local name = string.lower(v.Name)
            if name:find("water") or name:find("lava") or name:find("acid") or name:find("kill") or name:find("death") then
                pcall(function()
                    v.CanTouch = false
                end)
            end
        end
    end
end

Workspace.ChildRemoved:Connect(function(child)
    if child.Name == "Yacht" or child.Name == "Pier" or child:IsA("Model") then
        for i = #zonasDeAguaActivas, 1, -1 do
            local zona = zonasDeAguaActivas[i]
            if zona.mapa == child.Name or not zona.parteFalsa or not zona.parteFalsa.Parent then
                pcall(function()
                    Terrain:FillBlock(zona.cframe, zona.size, Enum.Material.Air)
                end)
                if zona.parteVisual and zona.parteVisual.Parent then
                    zona.parteVisual:Destroy()
                end
                table.remove(zonasDeAguaActivas, i)
            end
        end
    end
end)

Workspace.ChildAdded:Connect(function(child)
    if Config.AntiWater and (child.Name == "Yacht" or child.Name == "Pier") then
        task.delay(1, analizarMapas)
    end
end)

task.spawn(function()
    while task.wait(3) do
        pcall(analizarMapas)
    end
end)

task.spawn(function()
    task.wait(2)
    analizarMapas()
end)

print("sliv by https://discord.gg/3KjWyZ6uBu")
