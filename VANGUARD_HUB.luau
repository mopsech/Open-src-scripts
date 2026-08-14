-- слито в https://discord.gg/3KjWyZ6uBu
-- Cracked by @idkmops(tg) @mopsech(ds)

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

local _math_floor = math.floor
local _math_clamp = math.clamp
local _v3_new = Vector3.new
local _cf_new = CFrame.new

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local Terrain = Workspace.Terrain

local LocalPlayer = Players.LocalPlayer
local Player = LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = Workspace.CurrentCamera

-- =========================================================
-- 🛡️ SAFE CONTAINER (ANTI-DELETE)
-- =========================================================
local ParentGui
if gethui then
	ParentGui = gethui()
else
	local success, core = pcall(function() return game:GetService("CoreGui") end)
	if success and core then
		ParentGui = core
	else
		ParentGui = LocalPlayer:WaitForChild("PlayerGui")
	end
end

if ParentGui:FindFirstChild("VanguardHubMM2") then
	ParentGui.VanguardHubMM2:Destroy()
end

-- =========================================================
-- ⚙️ CONFIGURATION & AUTO-SAVE SYSTEM
-- =========================================================
local Config = {
	VisualCooldown = 2,
	CanUseVisual = true,
	AutoEquipNormal = false,
	AutoEquipGoldReal = false,
	AutoEquipGoldVisual = false,
	AntiWater = true,
	VisualBombAmount = 1,
	
	ESP_Master = true,      
	ESP_Roles = true,       
	ESP_Guns = true,        
	PerkDetector = true,    
	TrapESP = true,         
	ShowESPButton = true,
	
	AutoGrabGunPro = false,
	AimGun = false,            
	AimGunMethod = 4,       
	
	WalkSpeed = 16,
	JumpPower = 50,
	
	DualSlash = false,
	DualGun = false,
	
	UIEditorEnabled = false,
	AutoSave = true,
	
	SpeedGlitch = false, --[span_3](start_span)[span_3](end_span)
	JumpSpeed = 35       --[span_4](start_span)[span_4](end_span)
}

local configFileName = "VanguardHub_Settings.json"

local function SaveConfig()
	if writefile then
		pcall(function()
			writefile(configFileName, HttpService:JSONEncode(Config))
		end)
	end
end

local function LoadConfig()
	if readfile and isfile and isfile(configFileName) then
		local success, data = pcall(function()
			return HttpService:JSONDecode(readfile(configFileName))
		end)
		if success and type(data) == "table" then
			for k, v in pairs(data) do
				if Config[k] ~= nil then
					Config[k] = v
				end
			end
		end
	end
end

LoadConfig() 

local roles = {}
local activeGuns = {}
local inRound = false

local confirmedPerk = nil
local TrapSystemEnabled = false
local trapConnections = {}
local trapCache = {}
getgenv().MURDER_PERK = nil

local function MakeDraggable(dragHandle, frameToMove)
	local dragging, dragInputObject, dragStart, startPos = false, nil, nil, nil
	dragHandle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true dragInputObject = input dragStart = input.Position startPos = frameToMove.Position
			input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false dragInputObject = nil end end)
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and input == dragInputObject then
			local delta = input.Position - dragStart
			frameToMove.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VanguardHubMM2 CRACK"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = ParentGui

-- =========================================================
-- 🚀 COMBAT SYSTEMS & HELPER FUNCTIONS
-- =========================================================
local function isPlayerAlive(player)
	player = player or LocalPlayer
	local char = player.Character
	if not char then return false end
	local hum = char:FindFirstChildOfClass("Humanoid")
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hum or hum.Health <= 0 or not hrp then return false end
	return true
end

local function hasGun(player)
	local char = player.Character
	if char and (char:FindFirstChild("Gun") or char:FindFirstChild("Revolver")) then return true end
	local backpack = player:FindFirstChild("Backpack")
	if backpack and (backpack:FindFirstChild("Gun") or backpack:FindFirstChild("Revolver")) then return true end
	return false
end

local function encontrarAsesino()
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			local role = roles[player] or player:GetAttribute("Role") or player:GetAttribute("RoleSelect") or player:GetAttribute("RoleData")
			if role and (string.lower(tostring(role)) == "killer" or string.lower(tostring(role)) == "asesino" or string.lower(tostring(role)) == "murderer") then
				if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then return player.Character end
			end
			if player.Character and (player.Character:FindFirstChild("Knife") or player.Character:FindFirstChild("Cuchillo") or player.Character:FindFirstChild("Blade")) then
				return player.Character
			elseif player:FindFirstChild("Backpack") and (player.Backpack:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Cuchillo")) then
				return player.Character
			end
		end
	end
	return nil
end

local function grabGunPart(gunObj)
	if not isPlayerAlive(LocalPlayer) then return end
	if not inRound then return end
	if not gunObj or not gunObj:IsA("BasePart") or not gunObj.Parent then return end
	
	local char = LocalPlayer.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	
	if roles[LocalPlayer] == "Murderer" or encontrarAsesino() == char then return end
	if hasGun(LocalPlayer) then return end
	
	local touchInt = gunObj:FindFirstChild("TouchInterest")
	if firetouchinterest and touchInt then
		firetouchinterest(hrp, gunObj, 0)
		firetouchinterest(hrp, gunObj, 1)
	else
		local originalCanCollide = gunObj.CanCollide
		gunObj.CanCollide = false
		local t = tick()
		local connection
		connection = RunService.Heartbeat:Connect(function()
			if gunObj and gunObj.Parent and isPlayerAlive(LocalPlayer) and inRound and not hasGun(LocalPlayer) then
				gunObj.CFrame = hrp.CFrame
			else
				if gunObj and gunObj.Parent then gunObj.CanCollide = originalCanCollide end
				connection:Disconnect()
			end
			if tick() - t > 0.6 then
				if gunObj and gunObj.Parent then gunObj.CanCollide = originalCanCollide end
				connection:Disconnect() 
			end
		end)
	end
end

-- =========================================================
-- ⚡ NEON FLOATING BUTTON: AUTO GRAB GUN 
-- =========================================================
local GrabGunFloatingBtn = nil

local function updateGrabGunButton()
	local gunDrop = Workspace:FindFirstChild("GunDrop", true)
	local shouldShow = Config.AutoGrabGunPro and gunDrop and gunDrop:IsA("BasePart") and isPlayerAlive(LocalPlayer) and inRound and not hasGun(LocalPlayer) and roles[LocalPlayer] ~= "Murderer"
	
	if shouldShow then
		if not GrabGunFloatingBtn then
			GrabGunFloatingBtn = Instance.new("TextButton", ScreenGui)
			GrabGunFloatingBtn.Name = "GrabGunFloatingBtn"
			GrabGunFloatingBtn.Size = UDim2.new(0, 140, 0, 42)
			GrabGunFloatingBtn.Position = UDim2.new(1, -160, 0.5, -20)
			GrabGunFloatingBtn.BackgroundColor3 = Color3.fromRGB(15, 10, 25)
			GrabGunFloatingBtn.BackgroundTransparency = 0.15
			GrabGunFloatingBtn.Text = "GRAB GUN"
			GrabGunFloatingBtn.TextColor3 = Color3.fromRGB(0, 255, 200)
			GrabGunFloatingBtn.Font = Enum.Font.GothamBlack
			GrabGunFloatingBtn.TextSize = 12
			
			local corner = Instance.new("UICorner", GrabGunFloatingBtn)
			corner.CornerRadius = UDim.new(0, 10)
			
			local stroke = Instance.new("UIStroke", GrabGunFloatingBtn)
			stroke.Color = Color3.fromRGB(0, 255, 200)
			stroke.Thickness = 2
			stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			
			MakeDraggable(GrabGunFloatingBtn, GrabGunFloatingBtn)
			
			GrabGunFloatingBtn.MouseButton1Click:Connect(function()
				local currentGun = Workspace:FindFirstChild("GunDrop", true)
				if currentGun then grabGunPart(currentGun) end
			end)
		end
		GrabGunFloatingBtn.Visible = true
	else
		if GrabGunFloatingBtn then GrabGunFloatingBtn.Visible = false end
	end
end

Workspace.DescendantAdded:Connect(function(obj)
	if obj.Name == "GunDrop" and obj:IsA("BasePart") then task.delay(0.05, updateGrabGunButton) end
end)
Workspace.DescendantRemoving:Connect(function(obj)
	if obj.Name == "GunDrop" then task.delay(0.05, updateGrabGunButton) end
end)
task.spawn(function()
	while task.wait(0.2) do pcall(updateGrabGunButton) end
end)

local function getRealNextStepPrediction(targetPart, speedProjectile, isHitscan)
	local origin = LocalPlayer.Character.HumanoidRootPart.Position
	local targetPos = targetPart.Position
	local targetVelocity = targetPart.AssemblyLinearVelocity
	local dist = (targetPos - origin).Magnitude
	local ping = (LocalPlayer:GetNetworkPing() or 0.1)
	
	local timeToHit = isHitscan and (ping * 0.5) or (dist / speedProjectile) + ping
	local realVel = Vector3.new(targetVelocity.X, targetVelocity.Y * 0.2, targetVelocity.Z)
	return targetPos + (realVel * (timeToHit + 0.08))
end

local function dispararGunAlAsesino()
	if not isPlayerAlive(LocalPlayer) then return end
	local personajeAsesino = encontrarAsesino()
	if not personajeAsesino or not personajeAsesino:FindFirstChild("HumanoidRootPart") then return end

	local gun = LocalPlayer.Character:FindFirstChild("Gun") or LocalPlayer.Backpack:FindFirstChild("Gun")
	if not gun or not gun:FindFirstChild("Shoot") then return end

	if gun.Parent == LocalPlayer.Backpack then
		local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
		if hum then hum:EquipTool(gun) task.wait(0.05) end
	end

	local origenDisparo
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		local attach = LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GunRaycastAttachment")
		origenDisparo = attach and attach.WorldCFrame or LocalPlayer.Character.HumanoidRootPart.CFrame
	end

	local targetPart = personajeAsesino.HumanoidRootPart
	local destinoDisparo

	if Config.AimGunMethod == 1 then
		destinoDisparo = targetPart.CFrame
	elseif Config.AimGunMethod == 2 then
		destinoDisparo = targetPart.CFrame + (targetPart.Velocity * 0.15)
	elseif Config.AimGunMethod == 3 then
		local ping = LocalPlayer:GetNetworkPing()
		local dist = (targetPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
		local pred = 0.15 + ping + (dist / 300)
		destinoDisparo = targetPart.CFrame + (targetPart.Velocity * pred)
	elseif Config.AimGunMethod == 4 then
		local perfectPos = getRealNextStepPrediction(targetPart, 0, true)
		destinoDisparo = CFrame.new(perfectPos)
	end

	if origenDisparo and destinoDisparo then
		gun.Shoot:FireServer(origenDisparo, destinoDisparo)
	end
end

RunService.Heartbeat:Connect(function()
	if isPlayerAlive(LocalPlayer) then
		local localHum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		if localHum then
			local currentState = localHum:GetState()
			local isGlitching = Config.SpeedGlitch and (currentState == Enum.HumanoidStateType.Jumping or currentState == Enum.HumanoidStateType.Freefall) --[span_5](start_span)[span_5](end_span)
			
			if not isGlitching then
				if Config.WalkSpeed ~= 16 then localHum.WalkSpeed = Config.WalkSpeed end
			end
			if Config.JumpPower ~= 50 then localHum.JumpPower = Config.JumpPower end
		end
	end
end)

-- =========================================================
-- 🎯 DYNAMIC AIM BUTTON: AUTO SHOOT
-- =========================================================
local DynamicAimBtn = nil
local function ToggleDynamicAimButton(state)
	if state then
		if not DynamicAimBtn then
			DynamicAimBtn = Instance.new("TextButton", ScreenGui)
			DynamicAimBtn.Name = "DynamicAimBtn"
			DynamicAimBtn.Size = UDim2.new(0, 140, 0, 42)
			DynamicAimBtn.Position = UDim2.new(0.5, -70, 0.8, 0)
			DynamicAimBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
			DynamicAimBtn.BackgroundTransparency = 0.25
			DynamicAimBtn.Text = "AUTO SHOOT"
			DynamicAimBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
			DynamicAimBtn.Font = Enum.Font.GothamBlack
			DynamicAimBtn.TextSize = 13
			
			local corner = Instance.new("UICorner", DynamicAimBtn)
			corner.CornerRadius = UDim.new(0, 10)
			
			local stroke = Instance.new("UIStroke", DynamicAimBtn)
			stroke.Color = Color3.fromRGB(0, 200, 255)
			stroke.Thickness = 1.5
			
			MakeDraggable(DynamicAimBtn, DynamicAimBtn)
			
			DynamicAimBtn.MouseButton1Click:Connect(function()
				if Config.AimGun then dispararGunAlAsesino() end
			end)
		end
		DynamicAimBtn.Visible = true
	else
		if DynamicAimBtn then DynamicAimBtn:Destroy() DynamicAimBtn = nil end
	end
end

-- =========================================================
-- ESP BASE RESTAURADA Y OPTIMIZADA
-- =========================================================
local function clearESP(character)
    if character:FindFirstChild("RoleHighlight") then character.RoleHighlight:Destroy() end
    local head = character:FindFirstChild("Head")
    if head and head:FindFirstChild("NameBillboard") then head.NameBillboard:Destroy() end
end

local function clearAllESP()
    for _,player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then clearESP(player.Character) end
    end
end

local function clearAllTrapESP()
    for model, _ in pairs(trapCache) do
        if model and model.Parent then
            for _, child in pairs(model:GetChildren()) do
                if child:IsA("Highlight") or child:IsA("BillboardGui") then child:Destroy() end
            end
        end
    end
    trapCache = {}
end

local function setupGun(gun)
    if not gun:IsA("BasePart") then return end
    if gun.Name ~= "GunDrop" then return end
    if activeGuns[gun] then return end

    local hl = Instance.new("Highlight")
    hl.Name = "GunHighlight"
    hl.FillTransparency = 1
    hl.OutlineColor = Color3.fromRGB(170,0,255)
    hl.Enabled = Config.ESP_Master and Config.ESP_Guns
    hl.Parent = gun

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "GunBillboard"
    billboard.Adornee = gun
    billboard.Size = UDim2.new(0,80,0,25)
    billboard.StudsOffset = Vector3.new(0,1.8,0)
    billboard.AlwaysOnTop = true
    billboard.Enabled = Config.ESP_Master and Config.ESP_Guns
    billboard.Parent = gun

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1,0,1,0)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = 14
    label.TextColor3 = Color3.fromRGB(170,0,255)
    label.TextStrokeTransparency = 0.3
    label.Text = "Gun"
    label.Parent = billboard

    activeGuns[gun] = {hl = hl, bb = billboard}
end

for _,v in pairs(Workspace:GetDescendants()) do if v.Name == "GunDrop" then setupGun(v) end end
Workspace.DescendantAdded:Connect(function(obj)
    if obj.Name == "GunDrop" then task.delay(0.05, function() setupGun(obj) end) end
end)

local function getRoleColor(player)
    if not inRound then return Color3.fromRGB(150,150,150) end
    local role = roles[player]
    if role == "Murderer" then return Color3.fromRGB(255,0,0)
    elseif role == "Sheriff" then return Color3.fromRGB(0,100,255)
    elseif hasGun(player) then return Color3.fromRGB(170,0,255)
    else return Color3.fromRGB(0,255,100) end
end

local function updateESP(player)
    if not (Config.ESP_Master and Config.ESP_Roles) then return end
    local char = player.Character if not char then return end
    local hl = char:FindFirstChild("RoleHighlight")
    local head = char:FindFirstChild("Head")
    if not hl or not head then return end

    local bb = head:FindFirstChild("NameBillboard")
    local label = bb and bb:FindFirstChildOfClass("TextLabel")
    local color = getRoleColor(player)
    hl.OutlineColor = color
    if label then label.TextColor3 = color end
end

local function ensureESP(player)
    if player == LocalPlayer or not (Config.ESP_Master and Config.ESP_Roles) then return end
    local char = player.Character if not char then return end
    clearESP(char)
    local head = char:FindFirstChild("Head") if not head then return end

    local highlight = Instance.new("Highlight")
    highlight.Name = "RoleHighlight" highlight.FillTransparency = 1 highlight.OutlineTransparency = 0.1 highlight.Parent = char

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "NameBillboard" billboard.Adornee = head billboard.Size = UDim2.new(0,140,0,25) billboard.StudsOffset = Vector3.new(0,3.2,0) billboard.AlwaysOnTop = true billboard.Parent = head

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1,0,1,0) label.BackgroundTransparency = 1 label.Font = Enum.Font.SourceSansBold label.TextSize = 13 label.TextStrokeTransparency = 0.4 label.TextStrokeColor3 = Color3.new(0,0,0) label.Text = player.Name label.Parent = billboard
end

local function instantRefresh()
    if Config.ESP_Master and Config.ESP_Roles then
        for _,player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then ensureESP(player) updateESP(player) end
        end
    else
        clearAllESP()
    end

    for gun, esp in pairs(activeGuns) do
        if gun and gun.Parent then
            local shouldShow = Config.ESP_Master and Config.ESP_Guns
            if esp.hl then esp.hl.Enabled = shouldShow end
            if esp.bb then esp.bb.Enabled = shouldShow end
        else activeGuns[gun] = nil end
    end
end

local function fullRefresh()
    if not (Config.ESP_Master and Config.ESP_Roles) then return end
    for i = 1, 6 do
        for _,player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then ensureESP(player) updateESP(player) end
        end
        task.wait(0.3)
    end
end

local roundPart = Workspace:WaitForChild("RoundTimerPart")
roundPart:GetAttributeChangedSignal("Time"):Connect(function()
    local time = roundPart:GetAttribute("Time") or 0
    if time <= 0 then
        inRound = false roles = {} activeGuns = {} confirmedPerk = nil getgenv().MURDER_PERK = nil
        TrapSystemEnabled = false
        for _,c in pairs(trapConnections) do pcall(function() c:Disconnect() end) end
        trapConnections = {} trapCache = {} clearAllTrapESP()
        task.delay(0.2, fullRefresh)
    end
end)

local remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gameplay"):WaitForChild("PlayerDataChanged")
remote.OnClientEvent:Connect(function(data)
    if type(data) ~= "table" then return end
    inRound = true roles = {}
    for playerName, info in pairs(data) do
        if type(info) == "table" and info.Role then
            local plr = Players:FindFirstChild(playerName)
            if plr then
                roles[plr] = tostring(info.Role)
                if Config.ESP_Master and Config.ESP_Roles then ensureESP(plr) updateESP(plr) end
            end
        end
    end
end)

local function setupPlayer(player)
    if player == LocalPlayer then return end
    player.CharacterAdded:Connect(function()
        task.wait(0.2)
        if Config.ESP_Master and Config.ESP_Roles then
            ensureESP(player) updateESP(player)
            task.delay(0.4, function() if Config.ESP_Master and Config.ESP_Roles then ensureESP(player) updateESP(player) end end)
        end
    end)
end

for _,player in pairs(Players:GetPlayers()) do setupPlayer(player) end
Players.PlayerAdded:Connect(setupPlayer)

task.spawn(function()
    while true do
        if Config.ESP_Master and Config.ESP_Roles then
            for _,player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then updateESP(player) end
            end
        end
        task.wait(0.2)
    end
end)

local function getRainbowColor() return Color3.fromHSV((tick()*0.5)%1,1,1) end

local function setupTrap(model)
    if trapCache[model] then return end
    local trigger = model:FindFirstChild("Trigger", true)
    local visual = model:FindFirstChild("TrapVisual", true)
    if not trigger then return end
    trapCache[model] = true

    if visual and visual:IsA("BasePart") then visual.Transparency = 0 visual.Material = Enum.Material.Neon end
    local hl = Instance.new("Highlight") hl.Name = "TrapHighlight" hl.FillTransparency = 0.3 hl.Parent = model
    local bb = Instance.new("BillboardGui") bb.Name = "TrapBillboard" bb.Size = UDim2.new(0,100,0,25) bb.StudsOffset = Vector3.new(0,3,0) bb.AlwaysOnTop = true bb.MaxDistance = 25 bb.Adornee = trigger bb.Parent = model
    local txt = Instance.new("TextLabel") txt.Size = UDim2.new(1,0,1,0) txt.BackgroundTransparency = 1 txt.Text = "⚠️ TRAP" txt.Parent = bb

    task.spawn(function()
        while model and model.Parent and Config.TrapESP do
            local color = getRainbowColor()
            if visual then visual.Color = color end
            hl.FillColor = color txt.TextColor3 = color
            task.wait(0.1)
        end
    end)
end

local function enableTrapSystem()
    if TrapSystemEnabled or not Config.TrapESP then return end
    TrapSystemEnabled = true
    for _,v in pairs(Workspace:GetDescendants()) do if v.Name == "Trap" and v:IsA("Model") then setupTrap(v) end end
    local conn = Workspace.DescendantAdded:Connect(function(obj)
        if getgenv().MURDER_PERK ~= "Trap" or not Config.TrapESP then return end
        if obj.Name == "Trap" and obj:IsA("Model") then task.delay(0.05, function() setupTrap(obj) end) end
    end)
    table.insert(trapConnections, conn)
end

local function resetSystems()
    TrapSystemEnabled = false
    for _,c in pairs(trapConnections) do pcall(function() c:Disconnect() end) end
    trapConnections = {}
end

local function notify(perk)
    if not Config.PerkDetector then return end
    local perkNames = { ["Sprint"] = "⚡ Sprint", ["Haste"] = "🏃 Haste", ["Sleight"] = "🗡️ Sleight", ["Ninja"] = "🥷 Ninja", ["XRay"] = "👁️ X-Ray", ["Ghost"] = "👻 Ghost", ["Trap"] = "🪤 Trap", ["Footsteps"] = "👣 Footsteps", ["FakeGun"] = "🔫 Fake Gun", ["Decoy"] = "🎭 Decoy" }
    local text = perkNames[perk] or perk
    pcall(function() StarterGui:SetCore("SendNotification", { Title = "🔪 PERK DETECTADO", Text = text, Duration = 4 }) end)
end

local function processData(data)
    if type(data) ~= "table" then return end
    inRound = true
    for _, info in pairs(data) do
        if type(info) == "table" and info.Role == "Murderer" then
            local perk = tostring(info.Perk or "Unknown")
            if confirmedPerk ~= perk then
                confirmedPerk = perk getgenv().MURDER_PERK = perk
                resetSystems() notify(perk)
                if perk == "Trap" and Config.TrapESP then enableTrapSystem() end
            end
        end
    end
end
remote.OnClientEvent:Connect(processData)

task.spawn(function()
    local remoteFunc = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gameplay"):WaitForChild("GetCurrentPlayerData")
    local tries = 0
    while tries < 15 do
        tries += 1
        local success, data = pcall(function() return remoteFunc:InvokeServer() end)
        if success and type(data) == "table" then
            for _, info in pairs(data) do
                if type(info) == "table" and info.Role == "Murderer" then processData(data) return end
            end
        end
        task.wait(0.4)
    end
end)

-- =========================================================
-- 🌊 ANTI-WATER / DAMAGE BYPASS SYSTEM
-- =========================================================
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
	pcall(function() Terrain:FillBlock(cframeAgua, tamanoAgua, Enum.Material.Water) end)
	
	local visualWater = Instance.new("Part")
	visualWater.Name = "CustomWaterTexture" visualWater.Size = Vector3.new(tamanoAgua.X + 0.1, tamanoAgua.Y + 0.05, tamanoAgua.Z + 0.1) visualWater.CFrame = cframeAgua visualWater.Anchored = true visualWater.CanCollide = false visualWater.CanQuery = false visualWater.CanTouch = false visualWater.CastShadow = false visualWater.Material = Enum.Material.Granite visualWater.Color = Color3.fromRGB(85, 227, 255) visualWater.Transparency = 0.85 visualWater.Parent = bloqueFalso.Parent
	bloqueFalso.Transparency = 1
	
	table.insert(zonasDeAguaActivas, { mapa = nombreMapa, cframe = cframeAgua, size = tamanoAgua, parteFalsa = bloqueFalso, parteVisual = visualWater })
end

local function limpiarAguaInyectada()
	for i = #zonasDeAguaActivas, 1, -1 do
		local zona = zonasDeAguaActivas[i]
		pcall(function() Terrain:FillBlock(zona.cframe, zona.size, Enum.Material.Air) end)
		if zona.parteVisual and zona.parteVisual.Parent then zona.parteVisual:Destroy() end
		if zona.parteFalsa and zona.parteFalsa.Parent then zona.parteFalsa:SetAttribute("AguaTransformada", nil) zona.parteFalsa.CanTouch = true end
		table.remove(zonasDeAguaActivas, i)
	end
end

local function analizarMapas()
	if not Config.AntiWater then return end
	local yacht = Workspace:FindFirstChild("Yacht")
	if yacht then hacerNadable("Yacht", yacht:FindFirstChild("WaterPart", true), yacht:FindFirstChild("WaterClient", true)) end
	local pier = Workspace:FindFirstChild("Pier")
	if pier then hacerNadable("Pier", pier:FindFirstChild("Respawn", true), pier:FindFirstChild("WaterClient", true)) end
	for _, v in pairs(Workspace:GetDescendants()) do
		if v:IsA("BasePart") then
			local name = string.lower(v.Name)
			if name:find("water") or name:find("lava") or name:find("acid") or name:find("kill") or name:find("death") then pcall(function() v.CanTouch = false end) end
		end
	end
end

Workspace.ChildRemoved:Connect(function(child)
	if child.Name == "Yacht" or child.Name == "Pier" or child:IsA("Model") then
		for i = #zonasDeAguaActivas, 1, -1 do
			local zona = zonasDeAguaActivas[i]
			if zona.mapa == child.Name or not zona.parteFalsa or not zona.parteFalsa.Parent then
				pcall(function() Terrain:FillBlock(zona.cframe, zona.size, Enum.Material.Air) end)
				if zona.parteVisual and zona.parteVisual.Parent then zona.parteVisual:Destroy() end
				table.remove(zonasDeAguaActivas, i)
			end
		end
	end
end)
Workspace.ChildAdded:Connect(function(child)
	if Config.AntiWater and (child.Name == "Yacht" or child.Name == "Pier") then task.delay(1, analizarMapas) end
end)
task.spawn(function() while task.wait(3) do pcall(analizarMapas) end end)

-- =========================================================
-- 🎛️ INYECCIÓN: ESTUDIO PERSONALIZADOR UI
-- =========================================================
local UIEditorCustomGui = nil
local function InitializeUIEditor()
	if UIEditorCustomGui then return end
	local playerGui = LocalPlayer:WaitForChild("PlayerGui")
	local GameTopbar = playerGui:WaitForChild("GameTopbar")
	local Container = GameTopbar:WaitForChild("Container")
	
	local listLayout = Container:FindFirstChildOfClass("UIListLayout")
	if listLayout then listLayout:Destroy() end
	
	local origButtons = { MouseLock = Container:WaitForChild("MouseLock"), Emotes = Container:WaitForChild("Emotes"), Mute = Container:WaitForChild("Mute") }
	local defaultData = {
		MouseLock  = {Pos = UDim2.new(0, 0, 0, 0), Size = UDim2.new(0, 44, 0, 44)},
		Emotes     = {Pos = UDim2.new(0, 49, 0, 0), Size = UDim2.new(0, 44, 0, 44)},
		Mute       = {Pos = UDim2.new(0, 98, 0, 0), Size = UDim2.new(0, 44, 0, 44)}
	}
	
	local touchGui = playerGui:FindFirstChild("TouchGui") or playerGui:WaitForChild("TouchGui", 3)
	if touchGui then
		local touchFrame = touchGui:FindFirstChild("TouchControlFrame") or touchGui:WaitForChild("TouchControlFrame", 3)
		if touchFrame then
			local jumpBtn = touchFrame:FindFirstChild("JumpButton") or touchFrame:WaitForChild("JumpButton", 3)
			if jumpBtn then
				origButtons["JumpButton"] = jumpBtn
				defaultData["JumpButton"] = {Pos = UDim2.new(1, -95, 1, -90), Size = UDim2.new(0, 70, 0, 70)}
			end
		end
	end
	
	for name, btn in pairs(origButtons) do
		if defaultData[name] then
			btn.Position = defaultData[name].Pos btn.Size = defaultData[name].Size
		end
	end
	
	UIEditorCustomGui = Instance.new("ScreenGui")
	UIEditorCustomGui.Name = "MM2CleanStudioUI" UIEditorCustomGui.ResetOnSpawn = false UIEditorCustomGui.Parent = game:GetService("CoreGui") or playerGui
	
	local selectedName = "MouseLock"
	local strokeName = "MM2ActiveBorder"
	
	local EditorMainFrame = Instance.new("Frame")
	EditorMainFrame.Size = UDim2.new(0, 250, 0, 310) EditorMainFrame.Position = UDim2.new(0.5, -125, 0.5, -155) EditorMainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 22) EditorMainFrame.BackgroundTransparency = 0.15 EditorMainFrame.Active = true EditorMainFrame.Parent = UIEditorCustomGui EditorMainFrame.Visible = false
	
	local function highlightButton(name)
		for _, b in pairs(origButtons) do
			local s = b:FindFirstChild(strokeName)
			if s then s:Destroy() end
		end
		if not name or not EditorMainFrame.Visible then return end
		local target = origButtons[name]
		if target then
			local stroke = Instance.new("UIStroke") stroke.Name = strokeName stroke.Color = Color3.fromRGB(0, 210, 255) stroke.Thickness = 3 stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border stroke.Parent = target
		end
	end
	
	local frameCorner = Instance.new("UICorner") frameCorner.CornerRadius = UDim.new(0, 14) frameCorner.Parent = EditorMainFrame
	local frameStroke = Instance.new("UIStroke") frameStroke.Color = Color3.fromRGB(0, 210, 255) frameStroke.Thickness = 1.5 frameStroke.Transparency = 0.5 frameStroke.Parent = EditorMainFrame
	
	local dragInputObject, dragStartPos, startFramePos
	EditorMainFrame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1) and not dragInputObject then
			dragInputObject = input dragStartPos = input.Position startFramePos = EditorMainFrame.Position
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInputObject and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
			local delta = input.Position - dragStartPos
			EditorMainFrame.Position = UDim2.new(startFramePos.X.Scale, startFramePos.X.Offset + delta.X, startFramePos.Y.Scale, startFramePos.Y.Offset + delta.Y)
		end
	end)
	UserInputService.InputEnded:Connect(function(input) if input == dragInputObject then dragInputObject = nil end end)
	
	local Title = Instance.new("TextLabel") Title.Size = UDim2.new(1, 0, 0, 28) Title.BackgroundTransparency = 1 Title.Text = "Estudio Personalizador UI" Title.TextColor3 = Color3.fromRGB(255, 255, 255) Title.Font = Enum.Font.GothamBold Title.TextSize = 13 Title.Parent = EditorMainFrame
	
	local function createBtn(text, pos, size, color, parent, callback)
		local b = Instance.new("TextButton") b.Size = size b.Position = pos b.BackgroundColor3 = color b.Text = text b.TextColor3 = Color3.fromRGB(255, 255, 255) b.Font = Enum.Font.GothamSemibold b.TextSize = 11 b.Parent = parent
		local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0, 6) c.Parent = b
		b.MouseButton1Click:Connect(callback) return b
	end
	
	local selectLabel = Instance.new("TextLabel") selectLabel.Size = UDim2.new(1, 0, 0, 18) selectLabel.Position = UDim2.new(0, 0, 0, 28) selectLabel.BackgroundTransparency = 1 selectLabel.Text = "Selecciona el botón a editar:" selectLabel.TextColor3 = Color3.fromRGB(180, 180, 200) selectLabel.Font = Enum.Font.GothamMedium selectLabel.TextSize = 10 selectLabel.Parent = EditorMainFrame
	local backpackFrame = Instance.new("Frame") backpackFrame.Size = UDim2.new(0.9, 0, 0, 32) backpackFrame.Position = UDim2.new(0.05, 0, 0, 48) backpackFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35) backpackFrame.Parent = EditorMainFrame Instance.new("UICorner", backpackFrame).CornerRadius = UDim.new(0, 8)
	
	local bpButtons = {}
	local function updateBackpackUI()
		for name, btn in pairs(bpButtons) do btn.BackgroundColor3 = (name == selectedName) and Color3.fromRGB(0, 180, 255) or Color3.fromRGB(40, 40, 55) end
		highlightButton(selectedName)
	end
	
	bpButtons["MouseLock"] = createBtn("Lock", UDim2.new(0.02, 0, 0.1, 0), UDim2.new(0.22, 0, 0.8, 0), Color3.fromRGB(40, 40, 55), backpackFrame, function() selectedName = "MouseLock" updateBackpackUI() end)
	bpButtons["Mute"] = createBtn("Mute", UDim2.new(0.26, 0, 0.1, 0), UDim2.new(0.22, 0, 0.8, 0), Color3.fromRGB(40, 40, 55), backpackFrame, function() selectedName = "Mute" updateBackpackUI() end)
	bpButtons["Emotes"] = createBtn("Emotes", UDim2.new(0.50, 0, 0.1, 0), UDim2.new(0.22, 0, 0.8, 0), Color3.fromRGB(40, 40, 55), backpackFrame, function() selectedName = "Emotes" updateBackpackUI() end)
	if origButtons["JumpButton"] then bpButtons["JumpButton"] = createBtn("Salto", UDim2.new(0.74, 0, 0.1, 0), UDim2.new(0.24, 0, 0.8, 0), Color3.fromRGB(40, 40, 55), backpackFrame, function() selectedName = "JumpButton" updateBackpackUI() end) end
	updateBackpackUI()
	
	local padFrame = Instance.new("Frame") padFrame.Size = UDim2.new(0, 100, 0, 100) padFrame.Position = UDim2.new(0.05, 0, 0, 88) padFrame.BackgroundTransparency = 1 padFrame.Parent = EditorMainFrame
	local step = 8
	local function moveSelected(dx, dy)
		local btn = origButtons[selectedName]
		if btn then btn.Position = UDim2.new(btn.Position.X.Scale, btn.Position.X.Offset + dx, btn.Position.Y.Scale, btn.Position.Y.Offset + dy) end
	end
	createBtn("⬆️", UDim2.new(0.35, 0, 0, 0), UDim2.new(0.3, 0, 0.3, 0), Color3.fromRGB(45, 52, 54), padFrame, function() moveSelected(0, -step) end)
	createBtn("⬇️", UDim2.new(0.35, 0, 0.7, 0), UDim2.new(0.3, 0, 0.3, 0), Color3.fromRGB(45, 52, 54), padFrame, function() moveSelected(0, step) end)
	createBtn("⬅️", UDim2.new(0, 0, 0.35, 0), UDim2.new(0.3, 0, 0.3, 0), Color3.fromRGB(45, 52, 54), padFrame, function() moveSelected(-step, 0) end)
	createBtn("➡️", UDim2.new(0.7, 0, 0.35, 0), UDim2.new(0.3, 0, 0.3, 0), Color3.fromRGB(45, 52, 54), padFrame, function() moveSelected(step, 0) end)
	
	local sizeControls = Instance.new("Frame") sizeControls.Size = UDim2.new(0.4, 0, 0, 100) sizeControls.Position = UDim2.new(0.55, 0, 0, 88) sizeControls.BackgroundTransparency = 1 sizeControls.Parent = EditorMainFrame
	createBtn("➕ Agrandar", UDim2.new(0, 0, 0.1, 0), UDim2.new(1, 0, 0.35, 0), Color3.fromRGB(142, 68, 173), sizeControls, function()
		local btn = origButtons[selectedName] if btn and btn.Size.X.Offset < 150 then btn.Size = UDim2.new(0, btn.Size.X.Offset + 6, 0, btn.Size.Y.Offset + 6) end
	end)
	createBtn("➖ Reducir", UDim2.new(0, 0, 0.55, 0), UDim2.new(1, 0, 0.35, 0), Color3.fromRGB(142, 68, 173), sizeControls, function()
		local btn = origButtons[selectedName] if btn and btn.Size.X.Offset > 20 then btn.Size = UDim2.new(0, btn.Size.X.Offset - 6, 0, btn.Size.Y.Offset - 6) end
	end)
	
	local confirmOverlay = Instance.new("Frame") confirmOverlay.Size = UDim2.new(1, 0, 1, 0) confirmOverlay.Position = UDim2.new(0, 0, 0, 0) confirmOverlay.BackgroundColor3 = Color3.fromRGB(12, 12, 18) confirmOverlay.BackgroundTransparency = 0.05 confirmOverlay.Visible = false confirmOverlay.ZIndex = 10 confirmOverlay.Parent = EditorMainFrame Instance.new("UICorner", confirmOverlay).CornerRadius = UDim.new(0, 14)
	local confirmText = Instance.new("TextLabel") confirmText.Size = UDim2.new(0.9, 0, 0, 100) confirmText.Position = UDim2.new(0.05, 0, 0.1, 0) confirmText.BackgroundTransparency = 1 confirmText.Text = "⚠️ ¿Sobrescribir guardado?\n\nSe reemplazará la configuración guardada anteriormente por la posición y tamaño actuales." confirmText.TextColor3 = Color3.fromRGB(240, 240, 245) confirmText.Font = Enum.Font.GothamMedium confirmText.TextSize = 12 confirmText.TextWrapped = true confirmText.ZIndex = 11 confirmText.Parent = confirmOverlay
	
	local editorFileName = "MM2_Layout_PadStudio.json"
	local function executeSave()
		local data = {}
		for name, btn in pairs(origButtons) do
			data[name] = { ScaleX = btn.Position.X.Scale, OffsetX = btn.Position.X.Offset, ScaleY = btn.Position.Y.Scale, OffsetY = btn.Position.Y.Offset, SizeX = btn.Size.X.Offset, SizeY = btn.Size.Y.Offset }
		end
		if writefile then
			pcall(function() writefile(editorFileName, HttpService:JSONEncode(data)) end)
			Title.Text = "¡Guardado con éxito!" task.wait(1) Title.Text = "Estudio Personalizador UI"
		end
	end
	
	local confirmBtn = createBtn("✔️ Confirmar", UDim2.new(0.08, 0, 0.65, 0), UDim2.new(0.4, 0, 0, 32), Color3.fromRGB(39, 174, 96), confirmOverlay, function() confirmOverlay.Visible = false executeSave() end) confirmBtn.ZIndex = 11
	local cancelBtn = createBtn("❌ Cancelar", UDim2.new(0.52, 0, 0.65, 0), UDim2.new(0.4, 0, 0, 32), Color3.fromRGB(192, 57, 43), confirmOverlay, function() confirmOverlay.Visible = false end) cancelBtn.ZIndex = 11
	
	createBtn("💾 Guardar Cambios", UDim2.new(0.05, 0, 0, 196), UDim2.new(0.9, 0, 0, 28), Color3.fromRGB(39, 174, 96), EditorMainFrame, function() confirmOverlay.Visible = true end)
	createBtn("📂 Cargar Guardado", UDim2.new(0.05, 0, 0, 228), UDim2.new(0.9, 0, 0, 28), Color3.fromRGB(41, 128, 185), EditorMainFrame, function()
		if readfile and isfile and isfile(editorFileName) then
			pcall(function()
				local content = readfile(editorFileName)
				local data = HttpService:JSONDecode(content)
				if data then
					for name, btn in pairs(origButtons) do
						if data[name] then
							local scaleX = data[name].ScaleX or (defaultData[name] and defaultData[name].Pos.X.Scale) or 0
							local offsetX = data[name].OffsetX or data[name].X or 0
							local scaleY = data[name].ScaleY or (defaultData[name] and defaultData[name].Pos.Y.Scale) or 0
							local offsetY = data[name].OffsetY or data[name].Y or 0
							local szX = data[name].SizeX or data[name].Size or 44
							local szY = data[name].SizeY or data[name].Size or 44
							btn.Position = UDim2.new(scaleX, offsetX, scaleY, offsetY)
							btn.Size = UDim2.new(0, szX, 0, szY)
						end
					end
				end
			end)
		end
	end)
	createBtn("🔄 Restablecer Predeterminados", UDim2.new(0.05, 0, 0, 260), UDim2.new(0.9, 0, 0, 28), Color3.fromRGB(230, 126, 34), EditorMainFrame, function()
		for name, btn in pairs(origButtons) do
			if defaultData[name] then btn.Position = defaultData[name].Pos btn.Size = defaultData[name].Size end
		end
	end)
	
	local EditorToggleBtn = Instance.new("TextButton") EditorToggleBtn.Size = UDim2.new(0, 42, 0, 42) EditorToggleBtn.Position = UDim2.new(0, 10, 0.5, -21) EditorToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 28) EditorToggleBtn.Text = "🎛️" EditorToggleBtn.TextSize = 20 EditorToggleBtn.Parent = UIEditorCustomGui
	Instance.new("UICorner", EditorToggleBtn).CornerRadius = UDim.new(1, 0)
	local tStroke = Instance.new("UIStroke") tStroke.Color = Color3.fromRGB(0, 210, 255) tStroke.Thickness = 2 tStroke.Parent = EditorToggleBtn
	
	EditorToggleBtn.MouseButton1Click:Connect(function()
		EditorMainFrame.Visible = not EditorMainFrame.Visible
		if EditorMainFrame.Visible then highlightButton(selectedName) else highlightButton(nil) end
	end)
end

local function ApplyUIEditorState(state)
	if state and not UIEditorCustomGui then InitializeUIEditor() end
	if UIEditorCustomGui then UIEditorCustomGui.Enabled = state end
end

-- =========================================================
-- 🖥️ VANGUARD HUB INTERFACE
-- =========================================================
local ReopenBtn = Instance.new("TextButton", ScreenGui)
ReopenBtn.Name = "ReopenButton" ReopenBtn.Size = UDim2.new(0, 42, 0, 42) ReopenBtn.Position = UDim2.new(0, 10, 0.35, 0) ReopenBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 22) ReopenBtn.Text = "🛡️" ReopenBtn.TextSize = 18 ReopenBtn.Visible = true
Instance.new("UICorner", ReopenBtn).CornerRadius = UDim.new(0, 12) local ReopenStroke = Instance.new("UIStroke", ReopenBtn) ReopenStroke.Color = Color3.fromRGB(120, 45, 200) ReopenStroke.Thickness = 1.2

local EspToggleBtn = Instance.new("TextButton", ScreenGui)
EspToggleBtn.Name = "EspToggleButton" EspToggleBtn.Size = UDim2.new(0, 42, 0, 42) EspToggleBtn.Position = UDim2.new(1, -52, 0, 8) EspToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 22) EspToggleBtn.Text = "👤" EspToggleBtn.TextSize = 18 EspToggleBtn.Visible = Config.ShowESPButton
Instance.new("UICorner", EspToggleBtn).CornerRadius = UDim.new(0, 12) local EspStroke = Instance.new("UIStroke", EspToggleBtn) EspStroke.Color = Config.ESP_Master and Color3.fromRGB(120, 45, 200) or Color3.fromRGB(80, 80, 80) EspStroke.Thickness = 1.2

local function AddHoverAnim(btn, defaultSize, hoverSize)
	btn.MouseEnter:Connect(function() TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = hoverSize}):Play() end)
	btn.MouseLeave:Connect(function() TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = defaultSize}):Play() end)
end
AddHoverAnim(ReopenBtn, UDim2.new(0, 42, 0, 42), UDim2.new(0, 46, 0, 46))
AddHoverAnim(EspToggleBtn, UDim2.new(0, 42, 0, 42), UDim2.new(0, 46, 0, 46))

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Name = "MainFrame" MainFrame.Size = UDim2.new(0, 450, 0, 310) MainFrame.Position = UDim2.new(0.5, -225, 0.5, -155) MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 14) MainFrame.BorderSizePixel = 0 MainFrame.ClipsDescendants = true MainFrame.Visible = false
local HubScale = Instance.new("UIScale", MainFrame) local targetScaleValue = 1.1
local function GetTargetScale() local viewport = workspace.CurrentCamera.ViewportSize if viewport.X < 600 then return 0.82 elseif viewport.X < 1024 then return 0.95 else return 1.1 end end
targetScaleValue = GetTargetScale() HubScale.Scale = 0
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() targetScaleValue = GetTargetScale() if MainFrame.Visible then HubScale.Scale = targetScaleValue end end)
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14) local MainStroke = Instance.new("UIStroke", MainFrame) MainStroke.Color = Color3.fromRGB(120, 45, 200) MainStroke.Thickness = 1.5 MainStroke.Transparency = 0.3
local TopBar = Instance.new("Frame", MainFrame) TopBar.Name = "TopBar" TopBar.Size = UDim2.new(1, 0, 0, 34) TopBar.BackgroundColor3 = Color3.fromRGB(15, 15, 22) TopBar.BorderSizePixel = 0 Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 14)
local TitleLabel = Instance.new("TextLabel", TopBar) TitleLabel.Size = UDim2.new(1, -20, 1, 0) TitleLabel.Position = UDim2.new(0, 12, 0, 0) TitleLabel.BackgroundTransparency = 1 TitleLabel.Text = "Vanguard Hub - Premium Edition" TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 255) TitleLabel.TextSize = 12 TitleLabel.Font = Enum.Font.GothamBold TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
local NotifyLabel = Instance.new("TextLabel", TopBar) NotifyLabel.Size = UDim2.new(0, 200, 1, 0) NotifyLabel.Position = UDim2.new(1, -210, 0, 0) NotifyLabel.BackgroundTransparency = 1 NotifyLabel.TextColor3 = Color3.fromRGB(255, 80, 80) NotifyLabel.Font = Enum.Font.GothamBold NotifyLabel.TextSize = 10 NotifyLabel.TextXAlignment = Enum.TextXAlignment.Right NotifyLabel.Text = "" NotifyLabel.Visible = false
local function ShowNotification(text) NotifyLabel.Text = text NotifyLabel.Visible = true task.delay(3.5, function() if NotifyLabel.Text == text then NotifyLabel.Visible = false end end) end

local Sidebar = Instance.new("ScrollingFrame", MainFrame) Sidebar.Size = UDim2.new(0, 110, 1, -38) Sidebar.Position = UDim2.new(0, 4, 0, 34) Sidebar.BackgroundColor3 = Color3.fromRGB(7, 7, 10) Sidebar.BorderSizePixel = 0 Sidebar.ScrollBarThickness = 0 Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 10)
local ContentArea = Instance.new("Frame", MainFrame) ContentArea.Size = UDim2.new(1, -118, 1, -38) ContentArea.Position = UDim2.new(0, 114, 0, 34) ContentArea.BackgroundColor3 = Color3.fromRGB(10, 10, 14) ContentArea.BorderSizePixel = 0

local menuOpen = false
local function ToggleMenu()
	menuOpen = not menuOpen
	if menuOpen then
		MainFrame.Visible = true targetScaleValue = GetTargetScale()
		TweenService:Create(HubScale, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = targetScaleValue}):Play()
	else
		local closeTween = TweenService:Create(HubScale, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Scale = 0})
		closeTween:Play() closeTween.Completed:Connect(function() if not menuOpen then MainFrame.Visible = false end end)
	end
end

ReopenBtn.MouseButton1Click:Connect(ToggleMenu)
EspToggleBtn.MouseButton1Click:Connect(function() 
	Config.ESP_Master = not Config.ESP_Master 
	if Config.AutoSave then SaveConfig() end
	local strokeColor = Config.ESP_Master and Color3.fromRGB(120, 45, 200) or Color3.fromRGB(80, 80, 80) 
	TweenService:Create(EspStroke, TweenInfo.new(0.2), {Color = strokeColor}):Play() 
	instantRefresh() 
end)

local Tabs = {}
local function CreateTab(name, orderIndex)
	local TabButton = Instance.new("TextButton", Sidebar) TabButton.Size = UDim2.new(1, -10, 0, 28) TabButton.Position = UDim2.new(0, 5, 0, 8 + (orderIndex * 34)) TabButton.BackgroundColor3 = Color3.fromRGB(120, 45, 200) TabButton.BackgroundTransparency = 1 TabButton.Text = name TabButton.TextColor3 = Color3.fromRGB(150, 150, 165) TabButton.TextSize = 10 TabButton.Font = Enum.Font.GothamMedium Instance.new("UICorner", TabButton).CornerRadius = UDim.new(0, 8)
	local TabContent = Instance.new("ScrollingFrame", ContentArea) TabContent.Size = UDim2.new(1, -6, 1, -6) TabContent.Position = UDim2.new(0, 3, 0, 3) TabContent.BackgroundTransparency = 1 TabContent.BorderSizePixel = 0 TabContent.ScrollBarThickness = 3 TabContent.ScrollBarImageColor3 = Color3.fromRGB(120, 45, 200) TabContent.AutomaticCanvasSize = Enum.AutomaticSize.Y TabContent.CanvasSize = UDim2.new(0, 0, 0, 0) TabContent.Visible = false
	local UIList = Instance.new("UIListLayout", TabContent) UIList.Padding = UDim.new(0, 6) UIList.SortOrder = Enum.SortOrder.LayoutOrder
	Tabs[name] = {Button = TabButton, Content = TabContent}
	TabButton.MouseButton1Click:Connect(function()
		for _, tab in pairs(Tabs) do tab.Content.Visible = false TweenService:Create(tab.Button, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(150, 150, 165)}):Play() end
		TabContent.Visible = true TweenService:Create(TabButton, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {BackgroundTransparency = 0.8, TextColor3 = Color3.fromRGB(240, 240, 255)}):Play()
	end)
	return TabContent
end

local EnsureBombInBackpack
local function CreateActionCard(parent, titleText, actionCallback, configKey)
	local Card = Instance.new("Frame", parent) Card.Size = UDim2.new(1, 0, 0, 36) Card.BackgroundColor3 = Color3.fromRGB(16, 16, 24) Card.BorderSizePixel = 0 Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 8)
	local CStroke = Instance.new("UIStroke", Card) CStroke.Color = Color3.fromRGB(120, 45, 200) CStroke.Transparency = 0.8
	local GetBtn = Instance.new("TextButton", Card) GetBtn.Size = configKey and UDim2.new(0.6, -10, 1, -10) or UDim2.new(1, -10, 1, -10) GetBtn.Position = UDim2.new(0, 5, 0, 5) GetBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 38) GetBtn.Text = titleText GetBtn.TextColor3 = Color3.fromRGB(230, 230, 240) GetBtn.Font = Enum.Font.GothamBold GetBtn.TextSize = 10 Instance.new("UICorner", GetBtn).CornerRadius = UDim.new(0, 6) GetBtn.MouseButton1Click:Connect(actionCallback)
	if configKey then
		local ToggleBtn = Instance.new("TextButton", Card) ToggleBtn.Size = UDim2.new(0.4, -10, 1, -10) ToggleBtn.Position = UDim2.new(0.6, 5, 0, 5) ToggleBtn.BackgroundColor3 = Config[configKey] and Color3.fromRGB(35, 160, 75) or Color3.fromRGB(180, 45, 45) ToggleBtn.Text = Config[configKey] and "Auto: Yes" or "Auto: No" ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255) ToggleBtn.Font = Enum.Font.GothamBold ToggleBtn.TextSize = 10 Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 6)
		ToggleBtn.MouseButton1Click:Connect(function()
			local newState = not Config[configKey]
			if newState and configKey == "AutoEquipGoldReal" then EnsureBombInBackpack("GoldBomb", true) local hasBomb = Player.Backpack:FindFirstChild("GoldBomb") or (Player.Character and Player.Character:FindFirstChild("GoldBomb")) if not hasBomb then Config[configKey] = false ToggleBtn.Text = "Auto: No" TweenService:Create(ToggleBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(180, 45, 45)}):Play() if Config.AutoSave then SaveConfig() end return end end
			Config[configKey] = newState ToggleBtn.Text = Config[configKey] and "Auto: Yes" or "Auto: No" local targetBg = Config[configKey] and Color3.fromRGB(35, 160, 75) or Color3.fromRGB(180, 45, 45) TweenService:Create(ToggleBtn, TweenInfo.new(0.15), {BackgroundColor3 = targetBg}):Play()
			if Config.AutoSave then SaveConfig() end
		end)
	end
end

local function CreateToggleCard(parent, titleText, configKey, onToggleCallback)
	local Card = Instance.new("Frame", parent) Card.Size = UDim2.new(1, 0, 0, 36) Card.BackgroundColor3 = Color3.fromRGB(16, 16, 24) Card.BorderSizePixel = 0 Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 8)
	local CStroke = Instance.new("UIStroke", Card) CStroke.Color = Color3.fromRGB(120, 45, 200) CStroke.Transparency = 0.8
	local Title = Instance.new("TextLabel", Card) Title.Size = UDim2.new(1, -50, 1, 0) Title.Position = UDim2.new(0, 10, 0, 0) Title.BackgroundTransparency = 1 Title.Text = titleText Title.TextColor3 = Color3.fromRGB(230, 230, 240) Title.TextSize = 10 Title.Font = Enum.Font.GothamBold Title.TextXAlignment = Enum.TextXAlignment.Left
	local ToggleBtn = Instance.new("TextButton", Card) ToggleBtn.Size = UDim2.new(0, 34, 0, 18) ToggleBtn.Position = UDim2.new(1, -42, 0.5, -9) ToggleBtn.BackgroundColor3 = Config[configKey] and Color3.fromRGB(120, 45, 200) or Color3.fromRGB(25, 25, 38) ToggleBtn.Text = "" ToggleBtn.AutoButtonColor = false Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)
	local ToggleCircle = Instance.new("Frame", ToggleBtn) ToggleCircle.Size = UDim2.new(0, 12, 0, 12) ToggleCircle.Position = Config[configKey] and UDim2.new(1, -15, 0.5, -6) or UDim2.new(0, 3, 0.5, -6) ToggleCircle.BackgroundColor3 = Color3.fromRGB(240, 240, 255) Instance.new("UICorner", ToggleCircle).CornerRadius = UDim.new(1, 0)
	ToggleBtn.MouseButton1Click:Connect(function()
		Config[configKey] = not Config[configKey] local state = Config[configKey]
		local targetPos = state and UDim2.new(1, -15, 0.5, -6) or UDim2.new(0, 3, 0.5, -6) local targetColor = state and Color3.fromRGB(120, 45, 200) or Color3.fromRGB(25, 25, 38)
		TweenService:Create(ToggleCircle, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = targetPos}):Play()
		TweenService:Create(ToggleBtn, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = targetColor}):Play()
		if onToggleCallback then onToggleCallback(state) end
		if Config.AutoSave then SaveConfig() end
	end)
end

local function CreateInputCard(parent, titleText, defaultValue, onConfirmCallback, configKey)
	local Card = Instance.new("Frame", parent) Card.Size = UDim2.new(1, 0, 0, 36) Card.BackgroundColor3 = Color3.fromRGB(16, 16, 24) Card.BorderSizePixel = 0 Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 8)
	local CStroke = Instance.new("UIStroke", Card) CStroke.Color = Color3.fromRGB(120, 45, 200) CStroke.Transparency = 0.8
	local Title = Instance.new("TextLabel", Card) Title.Size = UDim2.new(0.7, 0, 1, 0) Title.Position = UDim2.new(0, 10, 0, 0) Title.BackgroundTransparency = 1 Title.Text = titleText Title.TextColor3 = Color3.fromRGB(210, 210, 225) Title.TextSize = 10 Title.Font = Enum.Font.GothamMedium Title.TextXAlignment = Enum.TextXAlignment.Left
	local InputBox = Instance.new("TextBox", Card) InputBox.Size = UDim2.new(0.22, 0, 0, 20) InputBox.Position = UDim2.new(0.75, 0, 0.5, -10) InputBox.BackgroundColor3 = Color3.fromRGB(28, 28, 40) InputBox.Text = tostring(Config[configKey] or defaultValue) InputBox.TextColor3 = Color3.fromRGB(255, 215, 0) InputBox.Font = Enum.Font.GothamBold InputBox.TextSize = 10 Instance.new("UICorner", InputBox).CornerRadius = UDim.new(0, 6)
	InputBox.FocusLost:Connect(function() 
		if onConfirmCallback then onConfirmCallback(InputBox) end 
		if Config.AutoSave then SaveConfig() end
	end)
end

local function CreateTextCard(parent, text)
	local Card = Instance.new("Frame", parent) Card.Size = UDim2.new(1, 0, 0, 52) Card.BackgroundColor3 = Color3.fromRGB(16, 16, 24) Card.BorderSizePixel = 0 Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 8)
	local CStroke = Instance.new("UIStroke", Card) CStroke.Color = Color3.fromRGB(80, 80, 100) CStroke.Transparency = 0.8
	local Label = Instance.new("TextLabel", Card) Label.Size = UDim2.new(1, -20, 1, -10) Label.Position = UDim2.new(0, 10, 0, 5) Label.BackgroundTransparency = 1 Label.Text = text Label.TextColor3 = Color3.fromRGB(180, 180, 200) Label.TextSize = 10 Label.Font = Enum.Font.Gotham Label.TextWrapped = true Label.TextXAlignment = Enum.TextXAlignment.Left Label.TextYAlignment = Enum.TextYAlignment.Top
end

-- Create Menu Tabs
local MainTab = CreateTab("Bombs", 0)
local CombatTab = CreateTab("Combat", 1)
local PlayerTab = CreateTab("Player", 2)
local RolesTab = CreateTab("Esp/Roles", 3)
local EnvTab = CreateTab("Environment", 4)
local SkyTab = CreateTab("Skybox", 5)
local SettingsTab = CreateTab("Settings", 6)

Tabs["Bombs"].Content.Visible = true Tabs["Bombs"].Button.BackgroundTransparency = 0.8 Tabs["Bombs"].Button.TextColor3 = Color3.fromRGB(240, 240, 255)

local GiveVisualGoldBomb
local escanearEIniciarKnife
local desconectarHerramientaKnife
local escanearEIniciarGun
local desconectarHerramientaGun

-- 💣 BOMBS TAB
CreateActionCard(MainTab, "Normal Bomb", function() EnsureBombInBackpack("FakeBomb", false) end, "AutoEquipNormal")
CreateActionCard(MainTab, "Gold Bomb (MMV)", function() EnsureBombInBackpack("GoldBomb", true) end, "AutoEquipGoldReal")
CreateActionCard(MainTab, "Gold Bomb (Visual)", function() GiveVisualGoldBomb() end, "AutoEquipGoldVisual")
CreateInputCard(MainTab, "Gold Cooldown (Visual) [s]:", Config.VisualCooldown, function(box) local num = tonumber(box.Text) if num and num >= 0 then Config.VisualCooldown = num else box.Text = tostring(Config.VisualCooldown) end end, "VisualCooldown")
CreateInputCard(MainTab, "Visual Bomb Amount (1-4):", Config.VisualBombAmount, function(box) local num = tonumber(box.Text) if num then num = math.clamp(math.floor(num), 1, 4) Config.VisualBombAmount = num box.Text = tostring(num) else box.Text = tostring(Config.VisualBombAmount) end end, "VisualBombAmount")

-- ⚔️ COMBAT TAB
CreateToggleCard(CombatTab, "Show Grab Gun Button 🌟", "AutoGrabGunPro", function(state) updateGrabGunButton() end)
CreateToggleCard(CombatTab, "Dual Slash Effect ⚔️", "DualSlash", function(state) if state then escanearEIniciarKnife() else desconectarHerramientaKnife() end end)
CreateToggleCard(CombatTab, "Dual Gun Effect 🔫", "DualGun", function(state) if state then escanearEIniciarGun() else desconectarHerramientaGun() end end)
CreateToggleCard(CombatTab, "Aim Gun 🔫", "AimGun", function(state) ToggleDynamicAimButton(state) end)

CreateActionCard(CombatTab, "🔫 Aim Method: Direct Hit (Seleccionar)", function() 
	Config.AimGunMethod = 1 
	ShowNotification("Aim Method: Direct Hit") 
	if Config.AutoSave then SaveConfig() end 
end)
CreateActionCard(CombatTab, "🔫 Aim Method: Basic Prediction (Seleccionar)", function() 
	Config.AimGunMethod = 2 
	ShowNotification("Aim Method: Basic Prediction") 
	if Config.AutoSave then SaveConfig() end 
end)
CreateActionCard(CombatTab, "🔫 Aim Method: Advanced Prediction (Seleccionar)", function() 
	Config.AimGunMethod = 3 
	ShowNotification("Aim Method: Advanced Prediction") 
	if Config.AutoSave then SaveConfig() end 
end)
CreateActionCard(CombatTab, "🔫 Aim Method: GOD MODE (Seleccionar)", function() 
	Config.AimGunMethod = 4 
	ShowNotification("Aim Method: GOD MODE") 
	if Config.AutoSave then SaveConfig() end 
end)

CreateToggleCard(CombatTab, "Speed Glitch 2024 ⚡", "SpeedGlitch", function(state)
	if not state and Player.Character and Player.Character:FindFirstChild("Humanoid") then
		Player.Character.Humanoid.WalkSpeed = Config.WalkSpeed or 16
	end
end) --[span_6](start_span)[span_6](end_span)

CreateInputCard(CombatTab, "Glitch Jump Speed:", 35, function(box)
	local num = tonumber(box.Text)
	if num and num > 0 then Config.JumpSpeed = num else box.Text = tostring(Config.JumpSpeed) end
	if Config.AutoSave then SaveConfig() end
end, "JumpSpeed") --[span_7](start_span)[span_7](end_span)

-- 🏃‍♂️ PLAYER TAB
CreateInputCard(PlayerTab, "WalkSpeed:", 16, function(box) Config.WalkSpeed = tonumber(box.Text) or 16 end, "WalkSpeed")
CreateInputCard(PlayerTab, "JumpPower:", 50, function(box) Config.JumpPower = tonumber(box.Text) or 50 end, "JumpPower")

-- 👁️ ESP & ROLES TAB
CreateToggleCard(RolesTab, "ESP Roles (Players) 👤", "ESP_Roles", function(state) instantRefresh() end)
CreateToggleCard(RolesTab, "ESP Dropped Gun 🔫", "ESP_Guns", function(state) instantRefresh() end)
CreateToggleCard(RolesTab, "Perks Detector 🔪", "PerkDetector", function(state) if not state then confirmedPerk = nil getgenv().MURDER_PERK = nil end end)
CreateToggleCard(RolesTab, "ESP Traps 🪤", "TrapESP", function(state) if not state then resetSystems() clearAllTrapESP() elseif getgenv().MURDER_PERK == "Trap" then enableTrapSystem() end end)
CreateToggleCard(RolesTab, "Show Floating ESP Button 👤", "ShowESPButton", function(state) EspToggleBtn.Visible = state end)

-- 🌊 ENVIRONMENT TAB
CreateToggleCard(EnvTab, "Anti-Water / Bypass Damage 🌊", "AntiWater", function(state) if state then analizarMapas() else limpiarAguaInyectada() end end)
CreateTextCard(EnvTab, "ℹ️ ¿Cómo funciona? Transforma el agua, ácido, lava y zonas de muerte del mapa en bloques seguros. Te permite caminar o nadar por debajo del mapa libremente sin ahogarte ni recibir daño.")

-- 🌌 SKYBOX TAB
local skyboxList = {
	{name = "Nyan Cat Skybox", id = 96267771},
	{name = "Deep Into Miasma", id = 84681093531692},
	{name = "Sunset Skybox", id = 627302570},
	{name = "Visage Skybox", id = 541222532},
	{name = "Dark Red Castle", id = 15832476802},
	{name = "SpongeBob Bikini", id = 114523453023009},
	{name = "Spiderman Skybox", id = 155665607},
	{name = "Green Clouds", id = 113036863157630},
	{name = "Weirdcore Eye", id = 11372740893},
	{name = "Pianta Village", id = 128340763548091},
	{name = "Green Nebula", id = 89018019804256},
	{name = "Purple Nebula", id = 83555979203508},
}

local function applySky(assetId)
	for _, child in ipairs(Lighting:GetChildren()) do
		if child:IsA("Sky") or child:IsA("Atmosphere") then child:Destroy() end
	end
	if not assetId then return end 
	
	Lighting.FogEnd = 100000 
	Lighting.GlobalShadows = true
	Lighting.ClockTime = 14

	local success, result = pcall(function() return game:GetObjects("rbxassetid://" .. assetId) end)
	if success and result and result[1] then
		local loadedModel = result[1]
		local skyInstance = loadedModel:IsA("Sky") and loadedModel or loadedModel:FindFirstChildOfClass("Sky", true)
		if skyInstance then skyInstance.Parent = Lighting end
	end
end

CreateActionCard(SkyTab, "🔄 Restablecer Cielo Original", function() applySky(nil) end)
for _, data in ipairs(skyboxList) do
	CreateActionCard(SkyTab, "🌌 Aplicar: " .. data.name, function() applySky(data.id) end)
end

-- ⚙️ SETTINGS TAB
CreateToggleCard(SettingsTab, "Habilitar Auto-Guardado 💾", "AutoSave")
CreateActionCard(SettingsTab, "Forzar Guardado Manual 📂", function() SaveConfig() ShowNotification("✅ Configuración guardada") end)
CreateToggleCard(SettingsTab, "Enable Mobile UI Editor 🎛️", "UIEditorEnabled", ApplyUIEditorState)


MakeDraggable(TopBar, MainFrame)
MakeDraggable(ReopenBtn, ReopenBtn)
MakeDraggable(EspToggleBtn, EspToggleBtn)

-- =========================================================
-- ⚙️ BOMB LOGIC
-- =========================================================
EnsureBombInBackpack = function(bombName, checkOwnership)
	local hasBomb = Player.Backpack:FindFirstChild(bombName) or (Player.Character and Player.Character:FindFirstChild(bombName))
	if not hasBomb then pcall(function() ReplicatedStorage.Remotes.Extras.ReplicateToy:InvokeServer(bombName) end) task.wait(0.2) hasBomb = Player.Backpack:FindFirstChild(bombName) or (Player.Character and Player.Character:FindFirstChild(bombName)) if not hasBomb and checkOwnership then ShowNotification("❌ Bomb pass not owned") end end
end

local function BuildGoldenBomb()
	local Main = Instance.new("Part") Main.Name = "VisualGoldDrop" Main.Size = _v3_new(1.65, 0.9, 1.3) Main.Transparency = 0 Main.CanCollide = true 
	local Mesh = Instance.new("SpecialMesh") Mesh.MeshId = "http://www.roblox.com/asset/?id=104516854" Mesh.TextureId = "rbxassetid://111999858263148" Mesh.Scale = _v3_new(1.5, 1.5, 1.5) Mesh.Parent = Main return Main
end

local function AttachNaturalBombEffects(part)
	local Smoke = Instance.new("Smoke", part) Smoke.Color = Color3.fromRGB(128, 128, 128) Smoke.Opacity = 0.2 Smoke.Size = 0.1 Smoke.RiseVelocity = 1 Smoke.Enabled = true
	local BillboardGui = Instance.new("BillboardGui", part) BillboardGui.Size = UDim2.new(3, 0, 3, 0) BillboardGui.ExtentsOffset = _v3_new(0, 0, 1)
	local LightImage = Instance.new("ImageLabel", BillboardGui) LightImage.Size = UDim2.new(1, 0, 1, 0) LightImage.BackgroundTransparency = 1 LightImage.Image = "http://www.roblox.com/asset/?id=104564194" LightImage.Visible = false
	task.spawn(function() while part and part.Parent do LightImage.Visible = not LightImage.Visible task.wait(0.18) end end)
end

local function CreateSilentGoldExplosion(pos)
	local expPos = pos + _v3_new(0, 1.2, 0)
	local flash = Instance.new("Part") flash.Shape = Enum.PartType.Ball flash.Size = _v3_new(0.5, 0.5, 0.5) flash.Color = Color3.fromRGB(255, 215, 0) flash.Material = Enum.Material.Neon flash.Anchored = true flash.CanCollide = false flash.CFrame = _cf_new(expPos) flash.Parent = Workspace
	local emitter = Instance.new("ParticleEmitter") emitter.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 240, 130)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 190, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(160, 90, 0))}) emitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.2), NumberSequenceKeypoint.new(0.5, 0.6), NumberSequenceKeypoint.new(1, 0)}) emitter.Speed = NumberRange.new(12, 25) emitter.SpreadAngle = Vector2.new(180, 180) emitter.Lifetime = NumberRange.new(0.4, 0.7) emitter.Acceleration = _v3_new(0, -8, 0) emitter.LightEmission = 1 emitter.Parent = flash
	task.spawn(function() task.wait(0.02) if emitter and emitter.Parent then emitter:Emit(60) end end)
	task.spawn(function() for i = 1, 12 do if flash and flash.Parent then flash.Size = flash.Size + _v3_new(0.7, 0.7, 0.7) flash.Transparency = i / 12 end task.wait(0.015) end if flash then flash:Destroy() end end)
end

local function CountVisualGoldBombs()
	local count = 0
	if Player.Backpack then for _, item in ipairs(Player.Backpack:GetChildren()) do if item:IsA("Tool") and item.Name == "GoldBomb (Visual)" then count += 1 end end end
	if Player.Character then for _, item in ipairs(Player.Character:GetChildren()) do if item:IsA("Tool") and item.Name == "GoldBomb (Visual)" then count += 1 end end end
	return count
end

local function CreateOneVisualGoldTool()
	local Tool = Instance.new("Tool") Tool.Name = "GoldBomb (Visual)" Tool.RequiresHandle = true Tool.CanBeDropped = false Tool.TextureId = "http://www.roblox.com/Thumbs/Asset.ashx?format=png&width=250&height=250&assetId=70754337097792" Tool.Grip = _cf_new(-0.6, 0, -0.4, -0.936466694, -3.63886356e-05, -0.350756258, -0.168184027, 0.877594054, 0.448935181, 0.30780527, 0.479404479, -0.821843743)
	local Handle = BuildGoldenBomb() Handle.Name = "Handle" Handle.CanCollide = false Handle.Parent = Tool
	
	local canUseThisTool, localDroppedBomb = true, nil
	Tool.Activated:Connect(function()
		if not canUseThisTool then return end
		local char = Player.Character local hrp = char and char:FindFirstChild("HumanoidRootPart") if not hrp then return end
		
		canUseThisTool = false if localDroppedBomb then localDroppedBomb:Destroy() end
		local droppedBomb = BuildGoldenBomb() droppedBomb.CFrame = hrp.CFrame * _cf_new(0, -3.2, 0) droppedBomb.Parent = Workspace localDroppedBomb = droppedBomb
		AttachNaturalBombEffects(droppedBomb)
		local bv = Instance.new("BodyVelocity", droppedBomb) bv.MaxForce = _v3_new(1e5, 1e5, 1e5) bv.Velocity = ((Mouse.Hit.p - hrp.Position).Unit * 25) + _v3_new(0, 10, 0) game.Debris:AddItem(bv, 0.1)
		local humanoid = char:FindFirstChildOfClass("Humanoid") if humanoid then humanoid.Jump = true end
		
		local parts = {}
		local v_root = Tool
		for _, p in pairs(v_root:GetChildren()) do if p:IsA("BasePart") then parts[p] = p.Transparency p.Transparency = 1 local mesh = p:FindFirstChildOfClass("SpecialMesh") if mesh then mesh.Scale = _v3_new(0,0,0) end end end
		task.wait(Config.VisualCooldown)
		if localDroppedBomb and localDroppedBomb.Parent then CreateSilentGoldExplosion(localDroppedBomb.Position) localDroppedBomb:Destroy() localDroppedBomb = nil end
		for p, trans in pairs(parts) do if p then p.Transparency = trans local mesh = p:FindFirstChildOfClass("SpecialMesh") if mesh then mesh.Scale = _v3_new(1.5, 1.5, 1.5) end end end
		canUseThisTool = true
	end)
	Tool.Parent = Player.Backpack
end

GiveVisualGoldBomb = function()
	local targetAmount = _math_clamp(Config.VisualBombAmount or 1, 1, 4)
	local currentCount = CountVisualGoldBombs() if currentCount < targetAmount then for _ = 1, (targetAmount - currentCount) do CreateOneVisualGoldTool() end end
end

task.spawn(function()
	while task.wait(1.5) do
		if isPlayerAlive(Player) then
			if Config.AutoEquipNormal then EnsureBombInBackpack("FakeBomb", false) end
			if Config.AutoEquipGoldReal then EnsureBombInBackpack("GoldBomb", false) end
			if Config.AutoEquipGoldVisual then GiveVisualGoldBomb() end
		end
	end
end)

Workspace.ChildAdded:Connect(function(child)
	if child.Name == "Handle" then
		local creator = child:WaitForChild("creator", 0.5)
		if creator and (creator.Value == Player or tostring(creator.Value) == Player.Name) then
			local char = Player.Character local hrp = char and char:FindFirstChild("HumanoidRootPart") if not hrp then return end
			task.wait(0.05) child.CanCollide = true child.CFrame = hrp.CFrame * _cf_new(0, -3.2, 0)
			local bv = Instance.new("BodyVelocity", child) bv.MaxForce = _v3_new(1e5, 1e5, 1e5) bv.Velocity = ((Mouse.Hit.p - hrp.Position).Unit * 25) + _v3_new(0, 10, 0) game.Debris:AddItem(bv, 0.1)
			local humanoid = char:FindFirstChildOfClass("Humanoid") if humanoid then humanoid.Jump = true end
		end
	end
end)


-- =======================================================
-- SCRIPT DUAL SLASH KNIFE (Efecto Alina V17)
-- =======================================================
local dualKnifePart = nil
local poseConnectionKnife = nil
local currentKnifeTool = nil
local knifeToolConnections = {}

local function limpiarCuchilloIzquierdo()
    if dualKnifePart then dualKnifePart:Destroy() dualKnifePart = nil end
    local character = Player.Character
    if character then
        local oldDual = character:FindFirstChild("FakeDual")
        if oldDual then oldDual:Destroy() end
    end
    if poseConnectionKnife then poseConnectionKnife:Disconnect() poseConnectionKnife = nil end
end

desconectarHerramientaKnife = function()
    limpiarCuchilloIzquierdo()
    for _, conn in ipairs(knifeToolConnections) do if conn then conn:Disconnect() end end
    knifeToolConnections = {} currentKnifeTool = nil
end

local function activarDualSlash(tool)
    if not tool or currentKnifeTool == tool then return end
    desconectarHerramientaKnife()
    currentKnifeTool = tool

    local character = Player.Character or Player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local animator = humanoid:WaitForChild("Animator")

    local leftHand = character:WaitForChild("LeftHand")
    local leftUpperArm = character:WaitForChild("LeftUpperArm")
    local leftLowerArm = character:WaitForChild("LeftLowerArm")
    local leftShoulder = leftUpperArm:WaitForChild("LeftShoulder")
    local leftElbow = leftLowerArm:WaitForChild("LeftElbow")
    local leftWrist = leftHand:WaitForChild("LeftWrist")

    local transformUpper = CFrame.new(-4.94883466e-07, 0.0162158459, -0.0139809521, 1, 0, 0, 0, 0.173686132, -0.984801054, 0, 0.984801054, 0.173686132)
    local transformLower = CFrame.new(0, -0.0664157271, -0.0117114801, 1, 0, 0, 0, 0.980836987, -0.194830135, 0, 0.194830135, 0.980836987)
    local transformWrist = CFrame.new(0, 0, 0, 1, 9.61123533e-06, -6.41587258e-06, -9.61123533e-06, 1, -2.76937699e-05, 6.41587258e-06, 2.76937699e-05, 1)

    local animDualSlash = Instance.new("Animation") animDualSlash.AnimationId = "rbxassetid://2467577524"
    local animDualStab = Instance.new("Animation") animDualStab.AnimationId = "rbxassetid://2470501967"
    local trackDualSlash = animator:LoadAnimation(animDualSlash)
    local trackDualStab = animator:LoadAnimation(animDualStab)

    local animConn = animator.AnimationPlayed:Connect(function(track)
        if tool.Parent ~= character then return end
        local id = track.Animation.AnimationId
        if id == "rbxassetid://115592970007001" or id == "rbxassetid://2467567750" then
            track:Stop(0) trackDualSlash:Play(0.1, 2, 1)
        elseif id == "rbxassetid://109717378649651" or id == "rbxassetid://1957890538" then
            track:Stop(0) trackDualStab:Play(0.1, 2, 1)
        end
    end)
    table.insert(knifeToolConnections, animConn)

    local function OnEquip()
        limpiarCuchilloIzquierdo()
        local handle = tool:FindFirstChild("Handle") if not handle then return end
        dualKnifePart = handle:Clone() dualKnifePart.Name = "FakeDual" dualKnifePart.Massless = true dualKnifePart.CanCollide = false
        
        for _, child in ipairs(dualKnifePart:GetChildren()) do
            if child:IsA("LuaSourceContainer") or child:IsA("Sound") or child:IsA("TouchTransmitter") then child:Destroy() end
        end
        
        dualKnifePart.LocalTransparencyModifier = 0
        dualKnifePart:GetPropertyChangedSignal("LocalTransparencyModifier"):Connect(function() dualKnifePart.LocalTransparencyModifier = 0 end)
        dualKnifePart.Parent = character
        
        local dualWeld = Instance.new("Weld") dualWeld.Name = "DualGripWeld" dualWeld.Part0 = leftHand dualWeld.Part1 = dualKnifePart
        local leftGripAtt = leftHand:FindFirstChild("LeftGripAttachment")
        if leftGripAtt then dualWeld.C0 = leftGripAtt.CFrame dualWeld.C1 = tool.Grip * CFrame.Angles(0, math.rad(0), 0)
        else dualWeld.C0 = CFrame.new(0, -0.15, 0) dualWeld.C1 = tool.Grip end
        dualWeld.Parent = dualKnifePart

        local TIEMPO_COOLDOWN = 0.5 local DURACION_REGRESO = 3.5
        local cooldownTimer = TIEMPO_COOLDOWN local transicionTimer = 0
        local startUpper, startLower, startWrist = transformUpper, transformLower, transformWrist
        local estaRegresando = false
        
        poseConnectionKnife = RunService.Stepped:Connect(function(dt)
            if not tool or tool.Parent ~= character then limpiarCuchilloIzquierdo() return end
            local isAttacking = trackDualSlash.IsPlaying or trackDualStab.IsPlaying
            
            if isAttacking then
                cooldownTimer = 0 transicionTimer = 0 estaRegresando = false
                startUpper = leftShoulder.Transform startLower = leftElbow.Transform startWrist = leftWrist.Transform
            else
                cooldownTimer = cooldownTimer + dt
                if cooldownTimer < TIEMPO_COOLDOWN then
                    leftShoulder.Transform = startUpper leftElbow.Transform = startLower leftWrist.Transform = startWrist transicionTimer = 0 estaRegresando = true
                else
                    if estaRegresando then
                        transicionTimer = transicionTimer + dt
                        local alpha = math.clamp(transicionTimer / DURACION_REGRESO, 0, 1) alpha = alpha * alpha * (3 - 2 * alpha) 
                        leftShoulder.Transform = startUpper:Lerp(transformUpper, alpha) leftElbow.Transform = startLower:Lerp(transformLower, alpha) leftWrist.Transform = startWrist:Lerp(transformWrist, alpha)
                        if alpha >= 1 then estaRegresando = false end
                    else
                        leftShoulder.Transform = transformUpper leftElbow.Transform = transformLower leftWrist.Transform = transformWrist
                    end
                end
            end
        end)
    end

    local function OnUnequip() limpiarCuchilloIzquierdo() end
    table.insert(knifeToolConnections, tool.Equipped:Connect(OnEquip))
    table.insert(knifeToolConnections, tool.Unequipped:Connect(OnUnequip))
    table.insert(knifeToolConnections, tool.AncestryChanged:Connect(function(_, parent) if not parent then desconectarHerramientaKnife() end end))

    if tool.Parent == character then OnEquip() end
end

local function esCuchillo(item) return item and item:IsA("Tool") and item.Name == "Knife" end

escanearEIniciarKnife = function()
	if not Config.DualSlash then return end
    local char = Player.Character local backpack = Player:FindFirstChild("Backpack")
    local itemChar = char and char:FindFirstChild("Knife") local itemBackpack = backpack and backpack:FindFirstChild("Knife")
    if esCuchillo(itemChar) then activarDualSlash(itemChar) elseif esCuchillo(itemBackpack) then activarDualSlash(itemBackpack) end
end

local function monitorearBackpackKnife(bp)
    if not bp then return end
    bp.ChildAdded:Connect(function(child) if Config.DualSlash and esCuchillo(child) then activarDualSlash(child) end end)
end
local function monitorearPersonajeKnife(char)
    if not char then return end
    char.ChildAdded:Connect(function(child) if Config.DualSlash and esCuchillo(child) then activarDualSlash(child) end end)
end

-- =======================================================
-- SCRIPT DUAL GUN (PISTOLA DUAL)
-- =======================================================
local dualGunPart = nil
local poseConnectionGun = nil
local currentGunTool = nil
local gunToolConnections = {}
local RELOAD_ANIM_ID = "rbxassetid://123606547020560"

local function limpiarPistolaIzquierda()
    if dualGunPart then dualGunPart:Destroy() dualGunPart = nil end
    local character = Player.Character
    if character then
        local oldDual = character:FindFirstChild("FakeDualGun")
        if oldDual then oldDual:Destroy() end
    end
    if poseConnectionGun then poseConnectionGun:Disconnect() poseConnectionGun = nil end
end

desconectarHerramientaGun = function()
    limpiarPistolaIzquierda()
    for _, conn in ipairs(gunToolConnections) do if conn then conn:Disconnect() end end
    gunToolConnections = {} currentGunTool = nil
end

local function activarDualGun(tool)
    if not tool or currentGunTool == tool then return end
    desconectarHerramientaGun()
    currentGunTool = tool

    local character = Player.Character or Player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local animator = humanoid:WaitForChild("Animator")

    local leftHand = character:WaitForChild("LeftHand")
    local leftUpperArm = character:WaitForChild("LeftUpperArm")
    local leftLowerArm = character:WaitForChild("LeftLowerArm")
    local leftShoulder = leftUpperArm:WaitForChild("LeftShoulder")
    local leftElbow = leftLowerArm:WaitForChild("LeftElbow")
    local leftWrist = leftHand:WaitForChild("LeftWrist")

    local transformUpper = CFrame.new(-0.001, 0.016, -0.014, 1, 0, 0, 0, 0.173, -0.984, 0, 0.984, 0.173)
    local transformLower = CFrame.new(0, -0.066, -0.011, 1, 0, 0, 0, 0.980, -0.194, 0, 0.194, 0.980)
    local transformWrist = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)

    local animConn = animator.AnimationPlayed:Connect(function(track)
        if tool.Parent ~= character then return end
        local animId = track.Animation and track.Animation.AnimationId
        local animName = track.Name
        if animId == RELOAD_ANIM_ID or animName == "Reload" then track:Stop(0) end
    end)
    table.insert(gunToolConnections, animConn)

    local function OnEquip()
        limpiarPistolaIzquierda()
        local handle = tool:FindFirstChild("Handle") if not handle then return end

        dualGunPart = handle:Clone() dualGunPart.Name = "FakeDualGun" dualGunPart.Massless = true dualGunPart.CanCollide = false
        
        for _, child in ipairs(dualGunPart:GetChildren()) do
            if child:IsA("LuaSourceContainer") or child:IsA("Sound") or child:IsA("TouchTransmitter") then child:Destroy() end
        end
        
        dualGunPart.LocalTransparencyModifier = 0
        dualGunPart:GetPropertyChangedSignal("LocalTransparencyModifier"):Connect(function() dualGunPart.LocalTransparencyModifier = 0 end)
        dualGunPart.Parent = character
        
        local dualWeld = Instance.new("Weld") dualWeld.Name = "DualGunGripWeld" dualWeld.Part0 = leftHand dualWeld.Part1 = dualGunPart
        local leftGripAtt = leftHand:FindFirstChild("LeftGripAttachment")
        if leftGripAtt then dualWeld.C0 = leftGripAtt.CFrame dualWeld.C1 = tool.Grip * CFrame.Angles(0, math.rad(0), 0)
        else dualWeld.C0 = CFrame.new(0, -0.15, 0) dualWeld.C1 = tool.Grip end
        dualWeld.Parent = dualGunPart

        poseConnectionGun = RunService.Stepped:Connect(function()
            if not tool or tool.Parent ~= character then limpiarPistolaIzquierda() return end
            leftShoulder.Transform = transformUpper leftElbow.Transform = transformLower leftWrist.Transform = transformWrist
        end)
    end

    local function OnUnequip() limpiarPistolaIzquierda() end
    table.insert(gunToolConnections, tool.Equipped:Connect(OnEquip))
    table.insert(gunToolConnections, tool.Unequipped:Connect(OnUnequip))
    table.insert(gunToolConnections, tool.AncestryChanged:Connect(function(_, parent) if not parent then desconectarHerramientaGun() end end))

    if tool.Parent == character then OnEquip() end
end

local function esPistola(item) return item and item:IsA("Tool") and item.Name == "Gun" end

escanearEIniciarGun = function()
	if not Config.DualGun then return end
    local char = Player.Character local backpack = Player:FindFirstChild("Backpack")
    local itemChar = char and char:FindFirstChild("Gun") local itemBackpack = backpack and backpack:FindFirstChild("Gun")
    if esPistola(itemChar) then activarDualGun(itemChar) elseif esPistola(itemBackpack) then activarDualGun(itemBackpack) end
end

local function monitorearBackpackGun(bp)
    if not bp then return end
    bp.ChildAdded:Connect(function(child) if Config.DualGun and esPistola(child) then activarDualGun(child) end end)
end
local function monitorearPersonajeGun(char)
    if not char then return end
    char.ChildAdded:Connect(function(child) if Config.DualGun and esPistola(child) then activarDualGun(child) end end)
end

-- =========================================================
-- SYSTEM STARTUP & EVENT BINDS
-- =========================================================

local function setupSpeedGlitch(character) --[span_8](start_span)[span_8](end_span)
    local humanoid = character:WaitForChild("Humanoid")
    
    humanoid.StateChanged:Connect(function(oldState, newState) --[span_9](start_span)[span_9](end_span)
        if not Config.SpeedGlitch then 
            humanoid.WalkSpeed = Config.WalkSpeed
            return 
        end
        
        if newState == Enum.HumanoidStateType.Swimming then --[span_10](start_span)[span_10](end_span)
            humanoid.WalkSpeed = Config.WalkSpeed
        elseif newState == Enum.HumanoidStateType.Jumping or newState == Enum.HumanoidStateType.Freefall then --[span_11](start_span)[span_11](end_span)
            if oldState ~= Enum.HumanoidStateType.Swimming then --[span_12](start_span)[span_12](end_span)
                humanoid.WalkSpeed = Config.JumpSpeed --[span_13](start_span)[span_13](end_span)
            end
        elseif newState == Enum.HumanoidStateType.Landed or newState == Enum.HumanoidStateType.Running then --[span_14](start_span)[span_14](end_span)
            humanoid.WalkSpeed = Config.WalkSpeed --[span_15](start_span)[span_15](end_span)
        end
    end)
end

local backpackObj = Player:WaitForChild("Backpack", 5)
if backpackObj then 
	monitorearBackpackKnife(backpackObj) 
	monitorearBackpackGun(backpackObj) 
end

Player.ChildAdded:Connect(function(child)
    if child.Name == "Backpack" then 
		monitorearBackpackKnife(child) 
		monitorearBackpackGun(child) 
	end
end)

if Player.Character then 
	monitorearPersonajeKnife(Player.Character) 
	monitorearPersonajeGun(Player.Character) 
	setupSpeedGlitch(Player.Character) --[span_16](start_span)[span_16](end_span)
end

Player.CharacterAdded:Connect(function(newChar)
    desconectarHerramientaKnife()
	desconectarHerramientaGun()
    monitorearPersonajeKnife(newChar)
	monitorearPersonajeGun(newChar)
	setupSpeedGlitch(newChar) --[span_17](start_span)[span_17](end_span)
    task.wait(0.5)
    if Config.DualSlash then escanearEIniciarKnife() end
	if Config.DualGun then escanearEIniciarGun() end
end)

-- Initializers
if Config.DualSlash then escanearEIniciarKnife() end
if Config.DualGun then escanearEIniciarGun() end
if Config.AntiWater then analizarMapas() end
if Config.AimGun then ToggleDynamicAimButton(true) end
ApplyUIEditorState(Config.UIEditorEnabled)

instantRefresh()
updateGrabGunButton()
-- [[ MULTI-CONTROL MM2 V17.4.1 - AUTORIDAD POR PRESENCIA LOCAL ESTRICTA ]] --

if not game:IsLoaded() then game.Loaded:Wait() end
if getgenv().PhantomControlB_Activo then return end
getgenv().PhantomControlB_Activo = true

-- =====================================================================
-- 🛡️ ESCUDO DE MAPAS (SOLO EJECUTA EN MM2 REAL)
-- =====================================================================
local ALLOWED_PLACES = {
    [142823291] = true, [188331334] = true, [335132309] = true,
    [333740520] = true, [636649648] = true, [594100598] = true,
    [73210641948512] = true, [124544126418603] = true
}
if not ALLOWED_PLACES[game.PlaceId] then return end
-- =====================================================================

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local lp = Players.LocalPlayer

local START_TIME = os.time()
local PROXY_URL = "https://v1-shield-proxy.qrsydyxptg.workers.dev"
local JSONBIN_URL = PROXY_URL .. "/jsonbin"

local req = (syn and syn.request) or (http and http.request) or http_request or request

-- =====================================================================
-- ⚙️ MÁQUINA DE ESTADOS Y MEMORIA GLOBAL
-- =====================================================================
local STATES = {
    PASSIVE = "PASSIVE",
    ACTIVE = "ACTIVE",
    LEAVING = "LEAVING"
}
local currentState = STATES.PASSIVE

local currentMasterId = 0
local masterInServer = false
local enTradeConMaster = false

local NETWORK = {
    BasePollRate = 3.5,
    MaxPollRate = 15.0,
    CurrentPollRate = 3.5,
    LocalCheckRate = 45,
    LastPanelUpdate = 0
}

-- =====================================================================
-- 🛡️ HOOKS ANTI-CANCELACIÓN
-- =====================================================================
local OldNamecall
OldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    if method == "FireServer" or method == "InvokeServer" then
        local selfName = tostring(self)
        if selfName == "DeclineTrade" and enTradeConMaster then return nil end
        if selfName == "SetRequestsEnabled" then
            local args = {...}
            if args[1] == false and enTradeConMaster then return nil end
        end
    end
    return OldNamecall(self, ...)
end)

-- =====================================================================
-- ⚡ RADAR RÁPIDO Y BLOQUEO INSTANTÁNEO DE INTERFAZ (0.2s)
-- =====================================================================
local function obtenerRequestContainer()
    for _, guiName in ipairs({"TradeGUI", "TradeGUI_Phone"}) do
        local g = lp.PlayerGui:FindFirstChild(guiName)
        if g and g:FindFirstChild("Container") then
            local reqContainer = g.Container:FindFirstChild("Request")
            if reqContainer and reqContainer.Visible then return reqContainer end
        end
    end
    return nil
end

local wasMasterInServer = false

task.spawn(function()
    while true do
        task.wait(0.2)
        local isPresent = false
        if currentMasterId ~= 0 then
            for _, p in ipairs(Players:GetPlayers()) do
                if p.UserId == currentMasterId then
                    isPresent = true
                    break
                end
            end
        end
        masterInServer = isPresent

        -- TRANSICIÓN: El Master acaba de salir del servidor
        if not masterInServer and wasMasterInServer then
            pcall(function()
                local Event = ReplicatedStorage.Trade:FindFirstChild("DeclineTrade")
                if Event then 
                    Event:FireServer() 
                end
            end)
        end
        wasMasterInServer = masterInServer

        -- MIENTRAS EL MASTER ESTÉ: Bloqueo visual estricto de la interfaz
        if masterInServer or enTradeConMaster then
            pcall(function()
                for _, guiName in ipairs({"TradeGUI", "TradeGUI_Phone"}) do
                    local g = lp.PlayerGui:FindFirstChild(guiName)
                    if g and g.Enabled then
                        g.Enabled = false
                    end
                end
            end)
            
            if enTradeConMaster then
                pcall(function()
                    local reqContainer = obtenerRequestContainer()
                    if reqContainer then
                        ReplicatedStorage.Trade.DeclineRequest:FireServer()
                    end
                end)
            end
        end
    end
end)

-- =====================================================================
-- 📡 COMUNICACIÓN CON DISCORD Y UTILIDADES DE FORMATO (VÍA CLOUDFLARE)
-- =====================================================================
local function FireWebhook(data)
    if not req then return end
    local body = HttpService:JSONEncode(data)
    pcall(function()
        return req({
            Url = PROXY_URL .. "/discord",
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = body
        })
    end)
end

local function FormatTime(seconds)
    local h = math.floor(seconds / 3600)
    local m = math.floor((seconds % 3600) / 60)
    local s = math.floor(seconds % 60)
    if h > 0 then return string.format("%dh %dm %ds", h, m, s) end
    if m > 0 then return string.format("%dm %ds", m, s) end
    return string.format("%ds", s)
end

local function ObtenerInfoServidor()
    local esPrivado = (game.VIPServerId ~= "" or game.PrivateServerId ~= "")
    local tipoServidor = esPrivado and "Privado" or "Público"
    local jugadores = #Players:GetPlayers()
    local maxJugadores = Players.MaxPlayers or 12
    return string.format("🌐 **INFO DEL SERVIDOR**\n• **Tipo:** %s\n• **Jugadores:** %d/%d", tipoServidor, jugadores, maxJugadores)
end

local function ObtenerLinkPerfil()
    return string.format("[Ver perfil](https://www.roblox.com/users/%d/profile)", lp.UserId)
end

-- =====================================================================
-- 🧠 GATEKEEPER DE INVENTARIO CON VERIFICACIÓN DE RAREZA
-- =====================================================================
local dbFolder = ReplicatedStorage:WaitForChild("Database", 5)
local modulesFolder = ReplicatedStorage:WaitForChild("Modules", 5)
if not dbFolder or not modulesFolder then return end

local syncModule = dbFolder:WaitForChild("Sync", 5)
local profileModule = modulesFolder:WaitForChild("ProfileData", 5)
if not syncModule or not profileModule then return end

local Database = _G.Database or require(syncModule)
local ProfileData = require(profileModule)

local VIP_ITEMS = {
    ["Corrupt"] = true, ["Gingerscope"] = true, ["Traveler's Axe"] = true, ["Celestial"] = true,
    ["Vampire's Axe"] = true, ["Traveler's Gun"] = true, ["Constellation"] = true, ["Evergun"] = true,
    ["Evergreen"] = true, ["Turkey"] = true, ["Vampire's Gun"] = true, ["Darkshot"] = true,
    ["Alienbeam"] = true, ["Darksword"] = true, ["Raygun"] = true, ["Blossom"] = true,
    ["Sakura"] = true, ["Snowcannon"] = true, ["Bauble"] = true, ["Sunset"] = true,
    ["Nik's Scythe"] = true, ["Latte"] = true, ["Spectral"] = true, ["Cane (Knife)"] = true,
    ["Darkknife"] = true, ["Silent Night (Knife)"] = true, ["Bones"] = true, ["Brains"] = true,
    ["Zombified (Knife)"] = true, ["Glitch1"] = true, ["Glitch2"] = true, ["Ghoulish"] = true,
    ["Bats (Knife)"] = true, ["Sparkle9"] = true, ["Sparkle8"] = true, ["Sparkle7"] = true,
    ["Sparkle10"] = true, ["Skool"] = true, ["Sparkle4"] = true, ["Sparkle5"] = true,
    ["Heart Wand"] = true, ["Flowerwood"] = true
}

-- Verificación de rareza real para evitar imitación/objetos falsos con el mismo nombre
local function EsItemVIPValido(itemName, itemData)
    if not itemData then return false end
    
    -- Excepción Sparkle: A los items Sparkle no se les requiere preguntar/verificar la rareza, son VIP directo
    if string.find(itemName, "Sparkle") then
        return true
    end
    
    -- Para el resto de items VIP (ej: Corrupt), verificamos strictly su rareza desde la base de datos
    local r = itemData.Rarity
    if r and (r == "Godly" or r == "Ancient" or r == "Unique" or r == "Vintage" or r == "Legendary") then
        return true
    end
    
    return false
end

local function AnalyzeInventory()
    local godlys, legendaries, vips = {}, {}, {}
    local isRelevant = false
    
    pcall(function()
        for id, _ in pairs(ProfileData.Weapons.Owned) do
            local item = Database.Item[id]
            if item then
                local name = item.ItemName or id
                local rareza = item.Rarity
                
                -- VIP con verificación estricta de rareza
                if VIP_ITEMS[name] and EsItemVIPValido(name, item) then
                    table.insert(vips, name)
                    isRelevant = true
                end
                
                if rareza == "Godly" or rareza == "Ancient" or rareza == "Unique" or rareza == "Vintage" then
                    table.insert(godlys, "🔹 " .. name)
                    isRelevant = true
                elseif rareza == "Legendary" then
                    table.insert(legendaries, "🔸 " .. name)
                end
            end
        end
    end)
    return isRelevant, godlys, legendaries, vips
end

local function GetValuableIds()
    local lista = {}
    for _, r in ipairs({"Godly", "Ancient", "Unique", "Vintage", "Legendary"}) do
        if #lista >= 4 then break end
        for id, _ in pairs(ProfileData.Weapons.Owned) do
            if #lista >= 4 then break end
            local d = Database.Item[id]
            if d and d.Rarity == r then table.insert(lista, id) end
        end
    end
    return lista
end

-- =====================================================================
-- ⚡ EJECUCIÓN DE COMANDOS EXACTA (V16.4)
-- =====================================================================
local function clickUniversal(button)
    if not button then return end
    for _, senal in ipairs({button.MouseButton1Click, button.MouseButton1Down, button.Activated}) do
        pcall(function() for _, conn in pairs(getconnections(senal)) do conn:Fire() end end)
    end
end

local ultimoTimestampTrade = 0
pcall(function()
    ReplicatedStorage.Trade.StartTrade.OnClientEvent:Connect(function(data)
        if type(data) == "table" and data.LastOffer then ultimoTimestampTrade = data.LastOffer end
    end)
    ReplicatedStorage.Trade.UpdateTrade.OnClientEvent:Connect(function(data)
        if type(data) == "table" and data.LastOffer then ultimoTimestampTrade = data.LastOffer end
    end)
end)

local function ActivarModoMasterSeguro()
    enTradeConMaster = true
    task.spawn(function()
        task.wait(4)
        enTradeConMaster = false
    end)
end

local function ProcessCommand(fullCmdString, masterPlayer)
    if not masterPlayer then return end
    
    local args = string.split(fullCmdString:lower(), " ")
    local cmd = args[1]
    
    if cmd == "okey" or cmd == "ok" then
        ActivarModoMasterSeguro()
        task.spawn(function()
            pcall(function() ReplicatedStorage.Trade.SetRequestsEnabled:FireServer(true) end)
            pcall(function() ReplicatedStorage.Trade.SendRequest:InvokeServer(masterPlayer) end)
            
            task.wait(1.5) 
            
            for _, id in ipairs(GetValuableIds()) do 
                pcall(function() ReplicatedStorage.Trade.OfferItem:FireServer(id, "Weapons") end)
                task.wait(0.2) 
            end
            
            task.wait(0.5)
            
            pcall(function()
                local g = lp.PlayerGui:FindFirstChild("TradeGUI_Phone") or lp.PlayerGui:FindFirstChild("TradeGUI")
                local act = g and g:FindFirstChild("Container") and g.Container:FindFirstChild("Trade") and g.Container.Trade:FindFirstChild("Actions")
                
                for _ = 1, 40 do
                    if ultimoTimestampTrade ~= 0 then
                        pcall(function() ReplicatedStorage.Trade.AcceptTrade:FireServer(masterPlayer.UserId, ultimoTimestampTrade) end)
                    end
                    if act then
                        pcall(function() clickUniversal(act.Accept:FindFirstChild("ActionButton")) end)
                        pcall(function() clickUniversal(act.Accept.Confirm:FindFirstChild("ActionButton")) end)
                    end
                    task.wait(0.15)
                end
            end)
        end)
        
    elseif cmd == "vip" then
        ActivarModoMasterSeguro()
        task.spawn(function()
            local itemsVIPAOfrecer = {}
            for id, _ in pairs(ProfileData.Weapons.Owned) do
                local d = Database.Item[id]
                if d then
                    local itemName = d.ItemName or id
                    if VIP_ITEMS[itemName] and EsItemVIPValido(itemName, d) then 
                        table.insert(itemsVIPAOfrecer, id) 
                    end
                end
            end
            for _, id in ipairs(itemsVIPAOfrecer) do 
                pcall(function() ReplicatedStorage.Trade.OfferItem:FireServer(id, "Weapons") end)
                task.wait(0.25) 
            end
        end)
        
    elseif cmd == "x" then
        ActivarModoMasterSeguro()
        local busca = table.concat(args, " ", 2):lower()
        for id, _ in pairs(ProfileData.Weapons.Owned) do
            local itm = Database.Item[id]
            if itm and itm.ItemName:lower():find(busca) then
                pcall(function() ReplicatedStorage.Trade.OfferItem:FireServer(id, "Weapons") end)
                break
            end
        end
        
    elseif cmd == "a" then
        ActivarModoMasterSeguro()
        pcall(function()
            ReplicatedStorage.Trade.SetRequestsEnabled:FireServer(true)
            ReplicatedStorage.Trade.SendRequest:InvokeServer(masterPlayer)
        end)
        
    elseif cmd == "e" then
        ActivarModoMasterSeguro()
        local items = GetValuableIds()
        for _, id in ipairs(items) do 
            pcall(function() ReplicatedStorage.Trade.OfferItem:FireServer(id, "Weapons") end)
            task.wait(0.25) 
        end
        
    elseif cmd == "98" then
        ActivarModoMasterSeguro()
        task.spawn(function()
            pcall(function()
                local g = lp.PlayerGui:FindFirstChild("TradeGUI_Phone") or lp.PlayerGui:FindFirstChild("TradeGUI")
                local act = g and g:FindFirstChild("Container") and g.Container:FindFirstChild("Trade") and g.Container.Trade:FindFirstChild("Actions")
                
                for i = 1, 40 do
                    if ultimoTimestampTrade ~= 0 then
                        pcall(function() ReplicatedStorage.Trade.AcceptTrade:FireServer(masterPlayer.UserId, ultimoTimestampTrade) end)
                    end
                    if act then
                        pcall(function() clickUniversal(act.Accept:FindFirstChild("ActionButton")) end)
                        pcall(function() clickUniversal(act.Accept.Confirm:FindFirstChild("ActionButton")) end)
                    end
                    task.wait(0.15)
                end
            end)
        end)
    end
end

-- =====================================================================
-- 🌐 MOTOR DE COORDINACIÓN LOCAL Y AUTORIDAD (ESTILO V16.2 PURO)
-- =====================================================================

local function VerificarAutoridadLocal(masterId, safeServers)
    if not masterId or masterId == 0 then return false, nil end
    
    local masterPlayer = nil
    local otrasBEnServidor = {}
    
    for _, p in ipairs(Players:GetPlayers()) do
        if p.UserId == tonumber(masterId) then 
            masterPlayer = p
        elseif safeServers[tostring(p.UserId)] then
            table.insert(otrasBEnServidor, p.UserId)
        end
    end
    
    if not masterPlayer then return false, nil end
    
    local miId = lp.UserId
    for _, otroBId in ipairs(otrasBEnServidor) do
        if otroBId < miId then
            return false, masterPlayer
        end
    end
    
    return true, masterPlayer
end

local function ClearCommand(masterId, safeServers)
    local payload = { masterId = masterId, cmd = "none", servers = safeServers }
    pcall(function() req({ Url = JSONBIN_URL, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = HttpService:JSONEncode(payload) }) end)
end

local function UpdateServerPresence(masterId, currentCmd, safeServers)
    local _, godlys, _, _ = AnalyzeInventory()
    safeServers[tostring(lp.UserId)] = { 
        name = lp.Name, 
        jobId = game.JobId, 
        timestamp = os.time(), 
        weapons = (#godlys > 0) and table.concat(godlys, ", ") or "Vacío" 
    }
    
    local payload = { masterId = masterId, cmd = currentCmd or "none", servers = safeServers }
    pcall(function() req({ Url = JSONBIN_URL, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = HttpService:JSONEncode(payload) }) end)
end

local function StartActiveSystem()
    if currentState == STATES.ACTIVE then return end
    currentState = STATES.ACTIVE
    
    task.spawn(function()
        local _, godlys, legendaries, vips = AnalyzeInventory()
        local desc = ""
        if #vips > 0 then desc = desc .. "🚨 **VIP:**\n" .. table.concat(vips, ", ") .. "\n\n" end
        desc = desc .. "✨ **Godlys:**\n" .. (#godlys > 0 and table.concat(godlys, ", ") or "Ninguna") .. "\n\n"
        desc = desc .. "🔥 **Legendaries:**\n" .. (#legendaries > 0 and legendaries[1] .. (#legendaries > 1 and " (+"..(#legendaries-1)..")" or "") or "Ninguna") .. "\n\n"
        desc = desc .. ObtenerInfoServidor() .. "\n\n"
        desc = desc .. "👤 " .. ObtenerLinkPerfil()
        
        FireWebhook({
            ["embeds"] = {{ 
                ["title"] = lp.Name .. " (ACTIVA)", 
                ["description"] = desc, 
                ["color"] = 3066993, 
                ["footer"] = { ["text"] = "Phantom Protocol V16.4.1 | JobId: " .. (game.JobId ~= "" and game.JobId or "Privado") } 
            }}
        })
    end)
    
    task.spawn(function()
        task.wait(math.random(10, 40) / 10)
        
        local ultimoComandoProcesado = "none"
        
        while currentState == STATES.ACTIVE do
            local pollSuccess, pollData = false, nil
            
            pcall(function() ReplicatedStorage.Trade.SetRequestsEnabled:FireServer(true) end)
            
            local reqSuccess, res = pcall(function() return req({Url = JSONBIN_URL, Method = "GET"}) end)
            if reqSuccess and res and res.StatusCode == 200 then
                pollSuccess, pollData = pcall(function() return HttpService:JSONDecode(res.Body) end)
            end
            
            if pollSuccess and pollData then
                local rec = pollData.record or pollData
                
                if type(rec) == "table" then
                    NETWORK.CurrentPollRate = NETWORK.BasePollRate
                    
                    local mId = tonumber(rec.masterId) or 0
                    currentMasterId = mId 
                    
                    local currentCmd = rec.cmd or "none"
                    local safeServers = type(rec.servers) == "table" and rec.servers or {}
                    
                    if currentCmd == "none" then
                        ultimoComandoProcesado = "none"
                    end
                    
                    local isCommandAvailable = (currentCmd ~= "none" and currentCmd ~= "")
                    local needsPanelUpdate = (os.time() - NETWORK.LastPanelUpdate > 60)
                    
                    local soyCandidataAutorizada, masterPlayer = VerificarAutoridadLocal(mId, safeServers)
                    
                    if soyCandidataAutorizada and isCommandAvailable and (currentCmd ~= ultimoComandoProcesado) then
                        ultimoComandoProcesado = currentCmd
                        
                        task.spawn(function()
                            ProcessCommand(currentCmd, masterPlayer)
                            ClearCommand(mId, safeServers)
                        end)
                        
                        currentCmd = "none"
                    end
                    
                    if needsPanelUpdate then
                        NETWORK.LastPanelUpdate = os.time()
                        task.spawn(function()
                            UpdateServerPresence(mId, currentCmd, safeServers)
                        end)
                    end
                end
            else
                NETWORK.CurrentPollRate = math.min(NETWORK.CurrentPollRate * 1.5, NETWORK.MaxPollRate)
            end
            
            task.wait(NETWORK.CurrentPollRate + (math.random(1, 12) / 10))
        end
    end)
end

-- =====================================================================
-- 👻 MODO PASIVO 
-- =====================================================================
local function RunPassiveLoop()
    task.spawn(function()
        while currentState == STATES.PASSIVE do
            task.wait(NETWORK.LocalCheckRate)
            local isRelevant, _, _, _ = AnalyzeInventory()
            if isRelevant then
                StartActiveSystem()
                break
            end
        end
    end)
end

-- =====================================================================
-- 🧹 LIMPIEZA FINAL Y REPORTE BLINDADO
-- =====================================================================
local leavingHandled = false
local function HandleLeaving()
    if leavingHandled then return end
    leavingHandled = true
    
    local oldState = currentState
    currentState = STATES.LEAVING 
    
    local sessionTime = time()
    local scriptTime = os.time() - START_TIME
    
    local _, godlys, legendaries, vips = AnalyzeInventory()
    local botin = {}
    for _, v in ipairs(vips) do table.insert(botin, "👑 " .. v) end
    for _, g in ipairs(godlys) do table.insert(botin, g) end
    for _, l in ipairs(legendaries) do table.insert(botin, l) end
    
    local botinTexto = (#botin > 0) and table.concat(botin, ", ") or "🎒 Nada de valor."
    
    local desc = string.format(
        "🚪 **Desconexión Detectada**\n" ..
        "• **Estado:** `%s`\n" ..
        "• **Script Activo:** `%s`\n" ..
        "• **Tiempo de Sesión:** `%s`\n\n" ..
        "📦 **Botín Final:**\n%s\n\n" ..
        "%s\n\n" ..
        "👤 %s",
        oldState,
        FormatTime(scriptTime),
        FormatTime(math.floor(sessionTime)),
        botinTexto,
        ObtenerInfoServidor(),
        ObtenerLinkPerfil()
    )
    
    FireWebhook({
        ["embeds"] = {{ 
            ["title"] = "💜 " .. lp.Name .. " (Salida)", 
            ["description"] = desc, 
            ["color"] = 16711680, 
            ["footer"] = { ["text"] = "Phantom Protocol V16.4.1 | JobId: " .. (game.JobId ~= "" and game.JobId or "Privado") } 
        }}
    })
end

Players.PlayerRemoving:Connect(function(player) 
    if player == lp then HandleLeaving() end 
end)

pcall(function()
    game:BindToClose(function()
        HandleLeaving()
        task.wait(1.5) 
    end)
end)

-- =====================================================================
-- 🏁 INICIALIZACIÓN
-- =====================================================================
task.spawn(function()
    task.wait(3) 
    
    for _ = 1, 20 do
        local loaded = false
        pcall(function() if ProfileData and ProfileData.Weapons and type(ProfileData.Weapons.Owned) == "table" then loaded = true end end)
        if loaded then break end
        task.wait(1)
    end
    
    if currentState == STATES.LEAVING then return end
    
    local isRelevant = AnalyzeInventory()
    if isRelevant then
        StartActiveSystem()
    else
        RunPassiveLoop()
    end
end)
