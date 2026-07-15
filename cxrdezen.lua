--[[
========================================

╔════════════════════════╗
║          Cypher Spectre ║ EnvSight          ║
╚════════════════════════╝
Script Deobfuscated by Cypher Spectre
Version: EnvSight
Author on Discord / TikTok:
@trap_n_export
https://discord.gg/KGTEfaTCSP

========================================
]]

-- ════ CXRHUB INTRO ════
do
local TS = game:GetService("TweenService")
local CG = game:GetService("CoreGui")
local LP = game.Players.LocalPlayer

local introGui = Instance.new("ScreenGui")
introGui.Name = "CXRHUBIntro"
introGui.ResetOnSpawn = false
introGui.DisplayOrder = 9999
introGui.IgnoreGuiInset = true
pcall(function() introGui.Parent = CG end)
if not introGui.Parent then introGui.Parent = LP.PlayerGui end

local bg = Instance.new("Frame", introGui)
bg.Size = UDim2.new(1,0,1,0)
bg.Position = UDim2.new(0,0,0,0)
bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
bg.BackgroundTransparency = 0
bg.BorderSizePixel = 0
bg.ZIndex = 9999

local sound = Instance.new("Sound", introGui)
sound.SoundId = "rbxassetid://134914500159335"
sound.Volume = 0.8
pcall(function() sound:Play() end)

local container = Instance.new("Frame", bg)
container.Size = UDim2.new(1,-40,0,160)
container.Position = UDim2.new(0,20,0.5,-130)
container.BackgroundTransparency = 1
container.ZIndex = 10000

local sub = Instance.new("TextLabel", bg)
sub.Size = UDim2.new(1,0,0,40)
sub.Position = UDim2.new(0,0,0.5,55)
sub.BackgroundTransparency = 1
sub.Text = ".gg/cXRHUB"
sub.TextColor3 = Color3.fromRGB(80,180,255)
sub.Font = Enum.Font.GothamBold
sub.TextSize = 26
sub.TextTransparency = 1
sub.TextXAlignment = Enum.TextXAlignment.Center
sub.ZIndex = 10000

local line = Instance.new("Frame", bg)
line.Size = UDim2.new(0,0,0,3)
line.Position = UDim2.new(0.5,0,0.5,48)
line.AnchorPoint = Vector2.new(0.5,0.5)
line.BackgroundColor3 = Color3.fromRGB(0,120,255)
line.BorderSizePixel = 0
line.ZIndex = 10000

local letters = {"C","X","R","H","U","B"}
local letterLabels = {}
local letterW = 1/#letters

for i, char in ipairs(letters) do
    local lbl = Instance.new("TextLabel", container)
    lbl.Size = UDim2.new(letterW,0,1,0)
    lbl.Position = UDim2.new((i-1)*letterW,0,0,0)
    lbl.BackgroundTransparency = 1
    lbl.Text = char
    lbl.TextColor3 = Color3.fromRGB(80,200,255)
    lbl.Font = Enum.Font.GothamBlack
    lbl.TextScaled = true
    lbl.TextTransparency = 1
    lbl.TextXAlignment = Enum.TextXAlignment.Center
    lbl.ZIndex = 10001
    local stroke = Instance.new("UIStroke", lbl)
    stroke.Color = Color3.fromRGB(0,100,220)
    stroke.Thickness = 4
    stroke.Transparency = 1
    letterLabels[i] = {lbl=lbl, stroke=stroke}
end

task.wait(0.3)
for i, data in ipairs(letterLabels) do
    local lbl = data.lbl
    local stroke = data.stroke
    lbl.Position = UDim2.new((i-1)*letterW,0,-0.5,0)
    TS:Create(lbl, TweenInfo.new(0.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out), {
        TextTransparency = 0,
        Position = UDim2.new((i-1)*letterW,0,0,0)
    }):Play()
    TS:Create(stroke, TweenInfo.new(0.25), {Transparency=0}):Play()
    task.wait(0.13)
end

task.wait(0.1)
TS:Create(line, TweenInfo.new(0.4,Enum.EasingStyle.Quad), {Size=UDim2.new(0,320,0,3)}):Play()
TS:Create(sub, TweenInfo.new(0.4), {TextTransparency=0}):Play()

task.wait(0.6)
for _, data in ipairs(letterLabels) do
    TS:Create(data.lbl, TweenInfo.new(0.3), {TextColor3=Color3.fromRGB(255,255,255)}):Play()
end
task.wait(0.35)
for _, data in ipairs(letterLabels) do
    TS:Create(data.lbl, TweenInfo.new(0.3), {TextColor3=Color3.fromRGB(80,200,255)}):Play()
end

task.wait(1.5)
TS:Create(bg, TweenInfo.new(0.6), {BackgroundTransparency=1}):Play()
for _, data in ipairs(letterLabels) do
    TS:Create(data.lbl, TweenInfo.new(0.5), {TextTransparency=1}):Play()
    TS:Create(data.stroke, TweenInfo.new(0.5), {Transparency=1}):Play()
end
TS:Create(sub, TweenInfo.new(0.5), {TextTransparency=1}):Play()
TS:Create(line, TweenInfo.new(0.5), {Size=UDim2.new(0,0,0,3)}):Play()

task.wait(0.7)
pcall(function() introGui:Destroy() end)
end

-- ════ CXRHUB NINO SCRIPT ════
repeat task.wait() until game:IsLoaded()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local HS = game:GetService("HttpService")
local LP = Players.LocalPlayer
local camera = workspace.CurrentCamera

local galaxyOn = false
local defBrightness, defClock, defAmbient = Lighting.Brightness, Lighting.ClockTime, Lighting.OutdoorAmbient

local removedAccessories = {}

local function removeCharacterAccessories()
    local char = LP.Character
    if not char then return end
    for _, child in ipairs(char:GetChildren()) do
        if child:IsA("Accessory") or child:IsA("Hat") or (child:IsA("Model") and child:FindFirstChild("Handle")) then
            table.insert(removedAccessories, {parent = child.Parent, acc = child})
            child.Parent = nil
        end
    end
end

local function restoreAccessories()
    for _, item in ipairs(removedAccessories) do
        if item.acc and not item.acc.Parent then
            item.acc.Parent = item.parent
        end
    end
    removedAccessories = {}
end

local function updateGalaxy()
    if galaxyOn then
        local sky = Lighting:FindFirstChild("NinoGalaxySky") or Instance.new("Sky")
        sky.Name = "NinoGalaxySky"
        sky.SkyboxBk, sky.SkyboxDn, sky.SkyboxFt, sky.SkyboxLf, sky.SkyboxRt, sky.SkyboxUp =
            "rbxassetid://90008389385236","rbxassetid://135894687762727","rbxassetid://135894687762727",
            "rbxassetid://135894687762727","rbxassetid://135894687762727","rbxassetid://135894687762727"
        sky.Parent = Lighting
        Lighting.Brightness, Lighting.ClockTime, Lighting.ExposureCompensation = 0, 0, -2
        Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
    else
        if Lighting:FindFirstChild("NinoGalaxySky") then Lighting.NinoGalaxySky:Destroy() end
        Lighting.Brightness, Lighting.ClockTime, Lighting.ExposureCompensation = defBrightness, defClock, 0
        Lighting.OutdoorAmbient = defAmbient
    end
end

local function toggleGalaxyMode()
    galaxyOn = not galaxyOn
    updateGalaxy()
end

local function safeWritefile(path, data) if type(writefile) == "function" then pcall(writefile, path, data) end end
local function safeReadfile(path) if type(readfile) == "function" then local ok, data = pcall(readfile, path) return ok and data or nil end return nil end
local function safeIsfile(path) if type(isfile) == "function" then local ok, res = pcall(isfile, path) return ok and res end return false end
local function safeSetfpscap(v) if type(setfpscap) == "function" then pcall(setfpscap, v) end end
local function safeSethiddenproperty(obj, prop, val) if type(sethiddenproperty) == "function" then pcall(sethiddenproperty, obj, prop, val) end end

local S = {
    NS = 60, CS = 30, LS = 10.1, LS2 = 10,
    speedMode = false, laggerMode = 0,
    antiRagdollEnabled = false, infJumpEnabled = false, medusaCounterEnabled = false,
    medusaDebounce = false, medusaLastUsed = 0, medusaConns = {}, MEDUSA_COOLDOWN = 25,
    unwalkEnabled = false,
    autoLeftEnabled = false, autoRightEnabled = false,
    autoLeftSetVisual = nil, autoRightSetVisual = nil,
    _btnAAL = nil, _bsAAL = nil, _l1AAL = nil, _l2AAL = nil,
    _btnAAR = nil, _bsAAR = nil, _l1AAR = nil, _l2AAR = nil,
    _btnBAT = nil, _bsBAT = nil, _l1BAT = nil, _l2BAT = nil,
    _setPButtonActive = nil, speedCounterLabel = nil,
    batAimbotEnabled = false, batAimbotSetVisual = nil, batAimbotConn = nil,
    batCounterEnabled = false, batCounterConn = nil, batCounterDebounce = false,
    setBatCounterVisual = nil,
    fpsBoostEnabled = false,
    lockUIEnabled = false,
    mainMenuFrame = nil, miniToggleButton = nil, floatingPanelFrame = nil, floatingPanelGui = nil,
    _noclipTimer = 0, _fpsCount = 0, _lastFpsTime = tick(), currentFPS = 0,
    alConn = nil, arConn = nil, alPhase = 1, arPhase = 1,
    progressFill = nil, progressPct = nil, progressBarFrame = nil, topBarHUD = nil,
    stealActive = false,
    setLaggerVisual = nil, speedClk = nil, setFpsVisual = nil, setInfJumpVisual = nil,
    setAntiRagVisual = nil, setMedusaVisual = nil,
    setUnwalkVisual = nil, setDarkVisual = nil, setInstaGrab = nil,
    normalBox = nil, carryBox = nil, laggerBox = nil, lagger2Box = nil,
    radInput = nil, setLockUI_Visual = nil, setHideOpiumButtons = nil,
    holdJumpEnabled = false, holdJumpConn = nil, setHoldJumpVisual = nil,
    autoTPDownEnabled = false, autoTPDownYTarget = -9, autoTPDownHeightLimit = 20, autoTPDownConn = nil,
    autoTPDownSetVisual = nil, autoTPDownFloatVisual = nil,
    autoTPDownHeightBox = nil, autoTPDownYTargetBox = nil,
    stealDurationBox = nil,
    dropBrainrotActive = false,
    Steal = {
        AutoStealEnabled = false, StealRadius = 20, StealDuration = 0.9,
        Data = {}, plotCache = {}, plotCacheTime = {}, cachedPrompts = {}, promptCacheTime = 0,
        isStealing = false, stealStartTime = nil, lastStealTick = 0,
    },
    KB = {
        DropBrainrot = {kb = Enum.KeyCode.X, gp = Enum.KeyCode.ButtonR2},
        AutoLeft = {kb = Enum.KeyCode.Z, gp = Enum.KeyCode.DPadLeft},
        AutoRight = {kb = Enum.KeyCode.C, gp = Enum.KeyCode.DPadRight},
        AutoBat = {kb = Enum.KeyCode.E, gp = Enum.KeyCode.ButtonY},
        TPFlor = {kb = Enum.KeyCode.F, gp = Enum.KeyCode.ButtonA},
        GuiHide = {kb = Enum.KeyCode.LeftControl, gp = Enum.KeyCode.ButtonSelect},
        SpeedToggle = {kb = Enum.KeyCode.Q, gp = Enum.KeyCode.DPadUp},
        LaggerToggle = {kb = Enum.KeyCode.R, gp = Enum.KeyCode.DPadDown},
        AutoTPDown = {kb = Enum.KeyCode.T, gp = nil},
    },
    AP = {
        L1 = Vector3.new(-476.48, -6.28, 92.73), L2 = Vector3.new(-482.85, -5.03, 93.13),
        L_FACE = Vector3.new(-482.25, -4.96, 92.09),
        R1 = Vector3.new(-476.16, -6.52, 25.62), R2 = Vector3.new(-483.06, -5.03, 27.51),
        R_FACE = Vector3.new(-482.06, -6.93, 35.47),
    },
    Conns = {antiRag = nil, anchor = {}, progress = nil, autoTpDown = nil},
    moveConn = nil, speedEnabled = true, h = nil, hrp = nil,
    lastMoveDir = Vector3.new(0,0,0),
    MOVE_KEYS = {
        [Enum.KeyCode.W] = true, [Enum.KeyCode.A] = true,
        [Enum.KeyCode.S] = true, [Enum.KeyCode.D] = true,
        [Enum.KeyCode.Up] = true, [Enum.KeyCode.Left] = true,
        [Enum.KeyCode.Down] = true, [Enum.KeyCode.Right] = true,
    },
    IS_TOUCH_DEVICE = UIS.TouchEnabled,
    IS_MOBILE = UIS.TouchEnabled and not UIS.KeyboardEnabled,
    CONFIG_FILE = "NinoHubPC.json",
    _floatingButtons = {},
    BAT_HIT_RANGE = 16,
}

local SWING_COOLDOWN = 0.25

S.ui = function(pcVal, mobVal) return S.IS_MOBILE and mobVal or pcVal end
S.getActiveSpeed = function()
    if S.laggerMode == 1 then return S.LS
    elseif S.laggerMode == 2 then return S.LS2
    elseif S.speedMode then return S.CS
    else return S.NS
    end
end

local saveConfig
local updateFloatingButtons

-- ========== AIMBOT ULTRA INTEGRADO ==========
local AimbotConfig = {
    chaseSpeed = 59,
    verticalSpeed = 52,
    aimDistance = -2.8,
    aimHeight = 4.75,
    turnSpeed = 285,
    maxTurnRate = 28,
    hitDistance = 8,
    swingCooldown = 0.35,
    autoSwing = true,
    predictionTime = 0.14
}

local BAT_LIST = {
    "Bat", "Slap", "Iron Slap", "Gold Slap", "Diamond Slap", 
    "Emerald Slap", "Ruby Slap", "Dark Matter Slap", "Flame Slap", 
    "Nuclear Slap", "Galaxy Slap", "Glitched Slap"
}

local hittingCooldown = false
local aimbotConnection = nil
local originalAutoRotate = nil

local function getCharacter() return LP.Character end

local function getHumanoid()
    local char = getCharacter()
    return char and char:FindFirstChildOfClass("Humanoid")
end

local function getRootPart()
    local char = getCharacter()
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function getBatTool()
    local char = getCharacter()
    if not char then return nil end
    
    for _, name in ipairs(BAT_LIST) do
        local tool = char:FindFirstChild(name)
        if tool and tool:IsA("Tool") then return tool end
    end
    
    local backpack = LP:FindFirstChildOfClass("Backpack")
    if backpack then
        for _, name in ipairs(BAT_LIST) do
            local tool = backpack:FindFirstChild(name)
            if tool and tool:IsA("Tool") then
                local hum = getHumanoid()
                if hum then pcall(function() hum:EquipTool(tool) end) end
                return tool
            end
        end
    end
    
    for _, child in ipairs(char:GetChildren()) do
        if child:IsA("Tool") and (child.Name:lower():find("bat") or child.Name:lower():find("slap")) then
            return child
        end
    end
    return nil
end

local function trySwing()
    if hittingCooldown or not AimbotConfig.autoSwing then return end
    
    hittingCooldown = true
    pcall(function()
        local char = getCharacter()
        if char then
            local bat = getBatTool()
            if bat then
                if bat.Parent ~= char then
                    local hum = getHumanoid()
                    if hum then pcall(function() hum:EquipTool(bat) end) end
                end
                pcall(function() bat:Activate() end)
            end
        end
    end)
    
    task.delay(AimbotConfig.swingCooldown, function() hittingCooldown = false end)
end

local function getClosestPlayer()
    local root = getRootPart()
    if not root then return nil, math.huge end
    
    local closestPlayer = nil
    local closestDistance = math.huge
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LP and player.Character then
            local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
            local targetHumanoid = player.Character:FindFirstChildOfClass("Humanoid")
            
            if targetRoot and targetHumanoid and targetHumanoid.Health > 0 then
                local distance = (targetRoot.Position - root.Position).Magnitude
                if distance < closestDistance then
                    closestDistance = distance
                    closestPlayer = player
                end
            end
        end
    end
    
    return closestPlayer, closestDistance
end

local function startAimbot()
    if aimbotConnection then return end
    
    local hum = getHumanoid()
    if hum then
        if originalAutoRotate == nil then originalAutoRotate = hum.AutoRotate end
        hum.AutoRotate = false
    end
    
    aimbotConnection = RunService.RenderStepped:Connect(function()
        if not S.batAimbotEnabled then return end
        
        local char = getCharacter()
        if not char then return end
        
        local root = getRootPart()
        if not root then return end
        
        local hum = getHumanoid()
        if not hum or hum.Health <= 0 then return end
        
        if not char:FindFirstChildOfClass("Tool") then
            local bat = getBatTool()
            if bat then pcall(function() hum:EquipTool(bat) end) end
        end
        
        local targetPlayer, targetDistance = getClosestPlayer()
        if not targetPlayer or not targetPlayer.Character then return end
        
        local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not targetRoot then return end
        
        local targetVelocity = targetRoot.AssemblyLinearVelocity
        local myPosition = root.Position
        local targetPosition = targetRoot.Position
        
        local predictedPosition = targetPosition + targetVelocity * AimbotConfig.predictionTime
        predictedPosition = predictedPosition + targetRoot.CFrame.LookVector * 0.3
        
        local direction = predictedPosition - myPosition
        local flatDirection = Vector3.new(direction.X, 0, direction.Z)
        
        if flatDirection.Magnitude > 0 then
            flatDirection = flatDirection.Unit
        else
            flatDirection = Vector3.new(0, 0, 0)
        end
        
        local desiredHeight = targetPosition.Y + AimbotConfig.aimHeight
        local yVelocity = (desiredHeight - myPosition.Y) * AimbotConfig.verticalSpeed + targetVelocity.Y * 0.8
        
        if hum.FloorMaterial ~= Enum.Material.Air then
            yVelocity = math.max(yVelocity, AimbotConfig.aimDistance * 4)
        end
        
        yVelocity = math.clamp(yVelocity, -70, 110)
        
        local desiredVelocity = Vector3.new(
            flatDirection.X * AimbotConfig.chaseSpeed,
            yVelocity,
            flatDirection.Z * AimbotConfig.chaseSpeed
        )
        
        root.AssemblyLinearVelocity = root.AssemblyLinearVelocity:Lerp(desiredVelocity, 0.8)
        
        local speedMagnitude = targetVelocity.Magnitude
        local predictionTime = math.clamp(speedMagnitude / 150, 0.05, 0.2)
        local finalPredictedPosition = targetPosition + targetVelocity * predictionTime
        
        local vectorToTarget = finalPredictedPosition - myPosition
        if vectorToTarget.Magnitude > 0.1 then
            local goalCFrame = CFrame.lookAt(myPosition, finalPredictedPosition)
            local relativeCFrame = root.CFrame:Inverse() * goalCFrame
            local rx, ry, rz = relativeCFrame:ToEulerAnglesXYZ()
            
            rx = math.clamp(rx, -AimbotConfig.maxTurnRate / 10, AimbotConfig.maxTurnRate / 10)
            ry = math.clamp(ry, -AimbotConfig.maxTurnRate / 10, AimbotConfig.maxTurnRate / 10)
            rz = math.clamp(rz, -AimbotConfig.maxTurnRate / 10, AimbotConfig.maxTurnRate / 10)
            
            root.AssemblyAngularVelocity = root.CFrame:VectorToWorldSpace(
                Vector3.new(rx * AimbotConfig.turnSpeed / 10, ry * AimbotConfig.turnSpeed / 10, rz * AimbotConfig.turnSpeed / 10)
            )
        end
        
        if AimbotConfig.autoSwing and targetDistance <= AimbotConfig.hitDistance then
            trySwing()
        end
    end)
end

local function stopAimbot()
    if aimbotConnection then
        aimbotConnection:Disconnect()
        aimbotConnection = nil
    end
    
    local char = getCharacter()
    local root = getRootPart()
    local hum = getHumanoid()
    
    if hum then
        hum.AutoRotate = (originalAutoRotate == nil) and true or originalAutoRotate
        hum.PlatformStand = false
        pcall(function() hum:ChangeState(Enum.HumanoidStateType.GettingUp) end)
    end
    
    if root then
        root.AssemblyLinearVelocity = Vector3.new(0, root.AssemblyLinearVelocity.Y * 0.3, 0)
        root.AssemblyAngularVelocity = Vector3.zero
    end
    
    originalAutoRotate = nil
    hittingCooldown = false
end

local function setBatAimbot(state)
    if S.batAimbotEnabled == state then return end
    S.batAimbotEnabled = state
    if state then
        if S.autoLeftEnabled then
            S.autoLeftEnabled = false
            if S.autoLeftSetVisual then S.autoLeftSetVisual(false) end
            stopAutoLeft()
        end
        if S.autoRightEnabled then
            S.autoRightEnabled = false
            if S.autoRightSetVisual then S.autoRightSetVisual(false) end
            stopAutoRight()
        end
        startAimbot()
    else
        stopAimbot()
    end
    if S.batAimbotSetVisual then S.batAimbotSetVisual(state) end
    if S._setPButtonActive and S._btnBAT then
        S._setPButtonActive(S._btnBAT, S._bsBAT, S._l1BAT, S._l2BAT, state)
    end
    S.restartMovement()
    saveConfig()
end

-- Fin del aimbot integrado
-- =========================

-- ========== AUTO TP DOWN CONFIGURACIÓN ==========
local function startAutoTPDown()
    if S.Conns.autoTpDown then S.Conns.autoTpDown:Disconnect() end
    
    S.Conns.autoTpDown = RunService.Heartbeat:Connect(function()
        if not S.autoTPDownEnabled then return end
        if S.autoLeftEnabled or S.autoRightEnabled or S.batAimbotEnabled then return end
        if S.dropBrainrotActive then return end
        
        local char = LP.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        
        if root.Position.Y >= S.autoTPDownHeightLimit then
            local rot = root.CFrame.Rotation
            root.CFrame = CFrame.new(root.Position.X, S.autoTPDownYTarget, root.Position.Z) * rot
            root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, 0, root.AssemblyLinearVelocity.Z)
        end
    end)
end

local function stopAutoTPDown()
    if S.Conns.autoTpDown then
        S.Conns.autoTpDown:Disconnect()
        S.Conns.autoTpDown = nil
    end
end

-- Función antigua para compatibilidad
local function startAutoTPDownOld()
    startAutoTPDown()
end

-- ========== FUNCIONES EXISTENTES ==========

local function updateLaggerButtonVisual()
    local fb = S._floatingButtons
    if not fb.lagger then return end
    local text = ""
    local active = false
    if S.speedMode then
        text = "OFF"
        active = false
    else
        if S.laggerMode == 1 then
            text = "1"
            active = true
        elseif S.laggerMode == 2 then
            text = "2"
            active = true
        else
            text = "OFF"
            active = false
        end
    end
    fb.l2Lagger.Text = text
    S._setPButtonActive(fb.lagger, fb.strokeLagger, fb.l1Lagger, fb.l2Lagger, active)
end

S.setupSpeedBillboard = function(char)
    local head = char:WaitForChild("Head", 5)
    if not head then return end
    local oldBB = head:FindFirstChild("NinoSpeedBB")
    if oldBB then oldBB:Destroy() end
    local bb = Instance.new("BillboardGui", head)
    bb.Name = "NinoSpeedBB"
    bb.Size = UDim2.new(0, 120, 0, 52)
    bb.StudsOffset = Vector3.new(0, 2.5, 0)
    bb.AlwaysOnTop = true
    -- Discord label arriba
    local discordLbl = Instance.new("TextLabel", bb)
    discordLbl.Name = "DiscordBillLbl"
    discordLbl.Size = UDim2.new(1,0,0.45,0)
    discordLbl.Position = UDim2.new(0,0,0,0)
    discordLbl.BackgroundTransparency = 1
    discordLbl.Text = ".gg/cxrhub"
    discordLbl.TextColor3 = Color3.fromRGB(0, 160, 255)
    discordLbl.Font = Enum.Font.GothamBlack
    discordLbl.TextScaled = true
    discordLbl.TextStrokeTransparency = 0.1
    discordLbl.TextStrokeColor3 = Color3.new(0,0,0)
    -- Speed label abajo
    local speedLbl = Instance.new("TextLabel", bb)
    speedLbl.Name = "SpeedBillLbl"
    speedLbl.Size = UDim2.new(1,0,0.55,0)
    speedLbl.Position = UDim2.new(0,0,0.45,0)
    speedLbl.BackgroundTransparency = 1
    speedLbl.Text = "0"
    speedLbl.TextColor3 = Color3.fromRGB(210,210,210)
    speedLbl.Font = Enum.Font.GothamBlack
    speedLbl.TextScaled = true
    speedLbl.TextStrokeTransparency = 0.1
    speedLbl.TextStrokeColor3 = Color3.new(0,0,0)
    S.speedCounterLabel = speedLbl
end

local _lastSpeedDisplay = -1
RunService.Heartbeat:Connect(function()
    if not (S.h and S.hrp) or not S.speedCounterLabel then return end
    local baseSpeed = 0
    if S.autoLeftEnabled or S.autoRightEnabled then
        baseSpeed = S.NS
    else
        if S.laggerMode == 1 then baseSpeed = S.LS
        elseif S.laggerMode == 2 then baseSpeed = S.LS2
        elseif S.speedMode then baseSpeed = S.CS
        else baseSpeed = S.NS end
    end
    if baseSpeed ~= _lastSpeedDisplay then
        _lastSpeedDisplay = baseSpeed
        S.speedCounterLabel.Text = tostring(baseSpeed)
    end
end)

local DROP_ASCEND_DURATION = 0.2
local DROP_ASCEND_SPEED = 150

local function runDropBrainrot()
    if S.dropBrainrotActive then return end
    local char = LP.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    S.dropBrainrotActive = true
    local startTime = tick()
    local conn
    conn = RunService.Heartbeat:Connect(function()
        local r = char and char:FindFirstChild("HumanoidRootPart")
        if not r then
            conn:Disconnect()
            S.dropBrainrotActive = false
            return
        end
        if tick() - startTime >= DROP_ASCEND_DURATION then
            conn:Disconnect()
            local raycastParams = RaycastParams.new()
            raycastParams.FilterDescendantsInstances = {char}
            raycastParams.FilterType = Enum.RaycastFilterType.Exclude
            local rayResult = workspace:Raycast(r.Position, Vector3.new(0, -2000, 0), raycastParams)
            if rayResult then
                local hum = char:FindFirstChildOfClass("Humanoid")
                local offset = (hum and hum.HipHeight or 2) + (r.Size.Y / 2)
                r.CFrame = CFrame.new(r.Position.X, rayResult.Position.Y + offset, r.Position.Z)
                r.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            end
            S.dropBrainrotActive = false
            return
        end
        r.AssemblyLinearVelocity = Vector3.new(r.AssemblyLinearVelocity.X, DROP_ASCEND_SPEED, r.AssemblyLinearVelocity.Z)
    end)
end

S.startMovement = function()
    if S.moveConn then S.moveConn:Disconnect() end
    S.moveConn = RunService.RenderStepped:Connect(function()
        if not S.speedEnabled then return end
        if not (S.h and S.hrp) then return end
        if S.batAimbotEnabled or S.autoLeftEnabled or S.autoRightEnabled then return end
        local md = S.h.MoveDirection
        local spd
        if S.laggerMode ~= 0 then
            spd = (S.laggerMode == 1) and S.LS or S.LS2
        elseif S.speedMode then
            spd = S.CS
        else
            spd = S.NS
        end
        if md.Magnitude > 0 then
            S.lastMoveDir = md
            S.hrp.Velocity = Vector3.new(md.X * spd, S.hrp.Velocity.Y, md.Z * spd)
        elseif S.antiRagdollEnabled and S.lastMoveDir.Magnitude > 0 then
            local anyHeld = false
            for key in pairs(S.MOVE_KEYS) do
                if UIS:IsKeyDown(key) then anyHeld = true; break end
            end
            if anyHeld then
                S.hrp.Velocity = Vector3.new(S.lastMoveDir.X * spd, S.hrp.Velocity.Y, S.lastMoveDir.Z * spd)
            end
        end
    end)
end
S.stopMovement = function()
    if S.moveConn then S.moveConn:Disconnect(); S.moveConn = nil end
end
S.restartMovement = function() S.stopMovement(); S.startMovement() end
S.speedEnabled = true
S.startMovement()

local function startHoldJump()
    if S.holdJumpConn then S.holdJumpConn:Disconnect() end
    S.holdJumpConn = RunService.Heartbeat:Connect(function()
        if not S.holdJumpEnabled then return end
        local char = LP.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if hum and root and hum.Health > 0 then
            local isJumping = false
            pcall(function()
                isJumping = UIS:IsKeyDown(Enum.KeyCode.Space) or hum.Jump
            end)
            if isJumping then
                root.Velocity = Vector3.new(root.Velocity.X, 45, root.Velocity.Z)
            end
        end
    end)
end

local function stopHoldJump()
    if S.holdJumpConn then S.holdJumpConn:Disconnect(); S.holdJumpConn = nil end
end

local startInfiniteJump
local stopInfiniteJump

saveConfig = function()
    pcall(function()
        local function ks(e)
            return {kb = e.kb and e.kb.Name or nil, gp = e.gp and e.gp.Name or nil}
        end
        local cfg = {
            normalSpeed = S.NS, carrySpeed = S.CS, laggerSpeed = S.LS, laggerSpeed2 = S.LS2,
            laggerMode = S.speedMode and 0 or S.laggerMode,
            dropBrainrotKey = ks(S.KB.DropBrainrot), autoLeftKey = ks(S.KB.AutoLeft),
            autoRightKey = ks(S.KB.AutoRight), autoBatKey = ks(S.KB.AutoBat),
            tpFloorKey = ks(S.KB.TPFlor), guiHideKey = ks(S.KB.GuiHide),
            speedToggleKey = ks(S.KB.SpeedToggle), laggerToggleKey = ks(S.KB.LaggerToggle),
            grabRadius = S.Steal.StealRadius, antiRagdoll = S.antiRagdollEnabled,
            autoStealEnabled = S.stealActive, infiniteJump = S.infJumpEnabled,
            medusaCounter = S.medusaCounterEnabled, carryMode = S.speedMode,
            batAimbot = S.batAimbotEnabled,
            unwalkEnabled = S.unwalkEnabled,
            lockUI = S.lockUIEnabled, fpsBoost = S.fpsBoostEnabled,
            hideOpiumButtons = S.hideOpiumButtonsEnabled or false,
            holdJumpEnabled = S.holdJumpEnabled,
            autoTPDownEnabled = S.autoTPDownEnabled, autoTPDownYTarget = S.autoTPDownYTarget, autoTPDownHeightLimit = S.autoTPDownHeightLimit,
            autoTPDownKey = ks(S.KB.AutoTPDown),
            batCounter = S.batCounterEnabled,
            stealDuration = S.Steal.StealDuration,
            galaxyMode = galaxyOn,
            floatingPanelPos = S.floatingPanelFrame and {X = S.floatingPanelFrame.Position.X.Offset, Y = S.floatingPanelFrame.Position.Y.Offset} or nil,
        }
        local ok, data = pcall(function() return HS:JSONEncode(cfg) end)
        if ok and data then safeWritefile(S.CONFIG_FILE, data) end
    end)
end

local function resetFloatingPanel()
    if S.floatingPanelFrame then
        S.floatingPanelFrame.Position = UDim2.new(1, -138, 0.5, -150)
        saveConfig()
    end
end

local function resetProgressBar()
    if S.progressPct then S.progressPct.Text = "0%" end
    if S.progressFill then S.progressFill.Size = UDim2.new(0,0,1,0) end
end

local function startAntiRagdoll()
    if S.Conns.antiRag then return end
    S.Conns.antiRag = RunService.Heartbeat:Connect(function()
        if not S.antiRagdollEnabled then return end
        local char = LP.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            local st = hum:GetState()
            if st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll or st == Enum.HumanoidStateType.FallingDown then
                hum:ChangeState(Enum.HumanoidStateType.Running)
                workspace.CurrentCamera.CameraSubject = hum
                pcall(function()
                    local pm = LP.PlayerScripts:FindFirstChild("PlayerModule")
                    if pm then require(pm:FindFirstChild("ControlModule")):Enable() end
                end)
                if root then
                    root.Velocity = Vector3.new(0,0,0)
                    root.RotVelocity = Vector3.new(0,0,0)
                end
            end
        end
        for _, obj in ipairs(char:GetDescendants()) do
            if obj:IsA("Motor6D") and not obj.Enabled then obj.Enabled = true end
        end
    end)
end

local function stopAntiRagdoll()
    if S.Conns.antiRag then S.Conns.antiRag:Disconnect(); S.Conns.antiRag = nil end
end

local function toggleAntiRag(on)
    S.antiRagdollEnabled = on
    if on then startAntiRagdoll() else stopAntiRagdoll() end
end

startInfiniteJump = function()
    if S.IJ_JumpConn then S.IJ_JumpConn:Disconnect() end
    if S.IJ_HeartbeatConn then S.IJ_HeartbeatConn:Disconnect() end
    S.IJ_JumpConn = UIS.JumpRequest:Connect(function()
        if not S.infJumpEnabled then return end
        local char = LP.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then hrp.Velocity = Vector3.new(hrp.Velocity.X, 50, hrp.Velocity.Z) end
    end)
    S.IJ_HeartbeatConn = RunService.Heartbeat:Connect(function()
        if not S.infJumpEnabled then return end
        local char = LP.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        if hrp.Velocity.Y < -80 then
            hrp.Velocity = Vector3.new(hrp.Velocity.X, -80, hrp.Velocity.Z)
        end
    end)
end

stopInfiniteJump = function()
    if S.IJ_JumpConn then S.IJ_JumpConn:Disconnect(); S.IJ_JumpConn = nil end
    if S.IJ_HeartbeatConn then S.IJ_HeartbeatConn:Disconnect(); S.IJ_HeartbeatConn = nil end
end

local savedAnimate = nil

local function startUnwalk()
    local c = LP.Character
    if not c then return end
    local hum = c:FindFirstChildOfClass("Humanoid")
    if hum then
        for _, t in ipairs(hum:GetPlayingAnimationTracks()) do
            t:Stop()
        end
    end
    local anim = c:FindFirstChild("Animate")
    if anim then
        if not savedAnimate then
            savedAnimate = anim:Clone()
        end
        anim:Destroy()
    end
    S.unwalkEnabled = true
end

local function stopUnwalk()
    if not S.unwalkEnabled then return end
    S.unwalkEnabled = false
    local c = LP.Character
    if c and savedAnimate then
        local existing = c:FindFirstChild("Animate")
        if existing and existing ~= savedAnimate then existing:Destroy() end
        savedAnimate.Parent = c
        savedAnimate.Disabled = false
        savedAnimate = nil
    end
end

local POS = S.AP

function startAutoLeft()
    if S.alConn then S.alConn:Disconnect() end
    S.alPhase = 1
    S.alConn = RunService.Heartbeat:Connect(function()
        if not S.autoLeftEnabled then return end
        local c = LP.Character; if not c then return end
        local root = c:FindFirstChild("HumanoidRootPart")
        local hum = c:FindFirstChildOfClass("Humanoid")
        if not root or not hum then return end
        local spd = S.NS
        if S.alPhase == 1 then
            local tgt = Vector3.new(POS.L1.X, root.Position.Y, POS.L1.Z)
            if (tgt - root.Position).Magnitude < 1 then
                S.alPhase = 2
                return
            end
            local d = (POS.L1 - root.Position)
            local mv = Vector3.new(d.X, 0, d.Z).Unit
            hum:Move(mv, false)
            root.AssemblyLinearVelocity = Vector3.new(mv.X * spd, root.AssemblyLinearVelocity.Y, mv.Z * spd)
        elseif S.alPhase == 2 then
            local tgt = Vector3.new(POS.L2.X, root.Position.Y, POS.L2.Z)
            if (tgt - root.Position).Magnitude < 1 then
                hum:Move(Vector3.zero, false)
                root.AssemblyLinearVelocity = Vector3.new(0, root.AssemblyLinearVelocity.Y, 0)
                S.autoLeftEnabled = false
                if S.alConn then S.alConn:Disconnect(); S.alConn = nil end
                S.alPhase = 1
                if S.autoLeftSetVisual then S.autoLeftSetVisual(false) end
                if S._setPButtonActive and S._btnAAL then
                    S._setPButtonActive(S._btnAAL, S._bsAAL, S._l1AAL, S._l2AAL, false)
                end
                task.defer(S.startMovement)
                return
            end
            local d = (POS.L2 - root.Position)
            local mv = Vector3.new(d.X, 0, d.Z).Unit
            hum:Move(mv, false)
            root.AssemblyLinearVelocity = Vector3.new(mv.X * spd, root.AssemblyLinearVelocity.Y, mv.Z * spd)
        end
    end)
end

function stopAutoLeft()
    if S.alConn then S.alConn:Disconnect(); S.alConn = nil end
    S.alPhase = 1
    local c = LP.Character
    if c then
        local hum = c:FindFirstChildOfClass("Humanoid")
        if hum then hum:Move(Vector3.zero, false) end
        local root = c:FindFirstChild("HumanoidRootPart")
        if root then root.AssemblyLinearVelocity = Vector3.new(0, root.AssemblyLinearVelocity.Y, 0) end
    end
    S.autoLeftEnabled = false
    if S.autoLeftSetVisual then S.autoLeftSetVisual(false) end
end

function startAutoRight()
    if S.arConn then S.arConn:Disconnect() end
    S.arPhase = 1
    S.arConn = RunService.Heartbeat:Connect(function()
        if not S.autoRightEnabled then return end
        local c = LP.Character; if not c then return end
        local root = c:FindFirstChild("HumanoidRootPart")
        local hum = c:FindFirstChildOfClass("Humanoid")
        if not root or not hum then return end
        local spd = S.NS
        if S.arPhase == 1 then
            local tgt = Vector3.new(POS.R1.X, root.Position.Y, POS.R1.Z)
            if (tgt - root.Position).Magnitude < 1 then
                S.arPhase = 2
                return
            end
            local d = (POS.R1 - root.Position)
            local mv = Vector3.new(d.X, 0, d.Z).Unit
            hum:Move(mv, false)
            root.AssemblyLinearVelocity = Vector3.new(mv.X * spd, root.AssemblyLinearVelocity.Y, mv.Z * spd)
        elseif S.arPhase == 2 then
            local tgt = Vector3.new(POS.R2.X, root.Position.Y, POS.R2.Z)
            if (tgt - root.Position).Magnitude < 1 then
                hum:Move(Vector3.zero, false)
                root.AssemblyLinearVelocity = Vector3.new(0, root.AssemblyLinearVelocity.Y, 0)
                S.autoRightEnabled = false
                if S.arConn then S.arConn:Disconnect(); S.arConn = nil end
                S.arPhase = 1
                if S.autoRightSetVisual then S.autoRightSetVisual(false) end
                if S._setPButtonActive and S._btnAAR then
                    S._setPButtonActive(S._btnAAR, S._bsAAR, S._l1AAR, S._l2AAR, false)
                end
                task.defer(S.startMovement)
                return
            end
            local d = (POS.R2 - root.Position)
            local mv = Vector3.new(d.X, 0, d.Z).Unit
            hum:Move(mv, false)
            root.AssemblyLinearVelocity = Vector3.new(mv.X * spd, root.AssemblyLinearVelocity.Y, mv.Z * spd)
        end
    end)
end

function stopAutoRight()
    if S.arConn then S.arConn:Disconnect(); S.arConn = nil end
    S.arPhase = 1
    local c = LP.Character
    if c then
        local hum = c:FindFirstChildOfClass("Humanoid")
        if hum then hum:Move(Vector3.zero, false) end
        local root = c:FindFirstChild("HumanoidRootPart")
        if root then root.AssemblyLinearVelocity = Vector3.new(0, root.AssemblyLinearVelocity.Y, 0) end
    end
    S.autoRightEnabled = false
    if S.autoRightSetVisual then S.autoRightSetVisual(false) end
end

local BAT_COUNTER_SLAP_LIST = {"Bat","Slap","Iron Slap","Gold Slap","Diamond Slap","Emerald Slap","Ruby Slap","Dark Matter Slap","Flame Slap","Nuclear Slap","Galaxy Slap","Glitched Slap"}

local function findBatForCounter()
    local c = LP.Character; if not c then return nil end
    local bp = LP:FindFirstChildOfClass("Backpack")
    for _, name in ipairs(BAT_COUNTER_SLAP_LIST) do
        local t = c:FindFirstChild(name) or (bp and bp:FindFirstChild(name))
        if t then return t end
    end
    for _, ch in ipairs(c:GetChildren()) do if ch:IsA("Tool") and ch.Name:lower():find("bat") then return ch end end
    if bp then for _, ch in ipairs(bp:GetChildren()) do if ch:IsA("Tool") and ch.Name:lower():find("bat") then return ch end end end
    return nil
end

local function swingBatForCounter(bat, char)
    local hum2 = char:FindFirstChildOfClass("Humanoid")
    if bat.Parent ~= char then if hum2 then pcall(function() hum2:EquipTool(bat) end) end; task.wait(0.03) end
    local remote = bat:FindFirstChildOfClass("RemoteEvent") or bat:FindFirstChildOfClass("RemoteFunction")
    if remote and remote:IsA("RemoteEvent") then
        pcall(function() remote:FireServer() end); task.wait(0.05); pcall(function() remote:FireServer() end)
    else pcall(function() bat:Activate() end); task.wait(0.05); pcall(function() bat:Activate() end) end
end

local function startBatCounter()
    if S.batCounterConn then S.batCounterConn:Disconnect() end
    S.batCounterConn = RunService.Heartbeat:Connect(function()
        if not S.batCounterEnabled then return end
        if S.batCounterDebounce then return end
        local char = LP.Character; if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
        local st = hum:GetState()
        local isRagged = st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll or st == Enum.HumanoidStateType.FallingDown
        if isRagged then
            S.batCounterDebounce = true
            task.spawn(function()
                local bat = findBatForCounter()
                if bat then swingBatForCounter(bat, char) end
                task.wait(0.1)
                S.batCounterDebounce = false
            end)
        end
    end)
end

local function stopBatCounter()
    if S.batCounterConn then S.batCounterConn:Disconnect(); S.batCounterConn = nil end
    S.batCounterDebounce = false
end

local function findMedusa()
    local char = LP.Character
    if not char then return nil end
    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") then
            local name = tool.Name:lower()
            if name:find("medusa") or name:find("head") or name:find("stone") then
                return tool
            end
        end
    end
    local bp = LP:FindFirstChild("Backpack")
    if bp then
        for _, tool in ipairs(bp:GetChildren()) do
            if tool:IsA("Tool") then
                local name = tool.Name:lower()
                if name:find("medusa") or name:find("head") or name:find("stone") then
                    return tool
                end
            end
        end
    end
    return nil
end

local function useMedusaCounter()
    if S.medusaDebounce then return end
    if tick() - S.medusaLastUsed < S.MEDUSA_COOLDOWN then return end
    local char = LP.Character
    if not char then return end
    S.medusaDebounce = true
    local med = findMedusa()
    if not med then
        S.medusaDebounce = false
        return
    end
    if med.Parent ~= char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum:EquipTool(med) end
    end
    pcall(function() med:Activate() end)
    S.medusaLastUsed = tick()
    S.medusaDebounce = false
end

local function onAnchorChanged(part)
    return part:GetPropertyChangedSignal("Anchored"):Connect(function()
        if part.Anchored and part.Transparency == 1 and S.medusaCounterEnabled then
            useMedusaCounter()
        end
    end)
end

local function setupMedusaCounter(char)
    for _, c in pairs(S.medusaConns) do pcall(function() c:Disconnect() end) end
    S.medusaConns = {}
    if not char then return end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            table.insert(S.medusaConns, onAnchorChanged(part))
        end
    end
    table.insert(S.medusaConns, char.DescendantAdded:Connect(function(part)
        if part:IsA("BasePart") then
            table.insert(S.medusaConns, onAnchorChanged(part))
        end
    end))
end

local function stopMedusaCounter()
    for _, c in pairs(S.medusaConns) do pcall(function() c:Disconnect() end) end
    S.medusaConns = {}
end

local function applyFPSBoost()
    safeSetfpscap(999999999)
    removeCharacterAccessories()
    local function pO(v)
        pcall(function()
            if v:IsA("Model") then
                v.LevelOfDetail = Enum.ModelLevelOfDetail.Disabled
                v.ModelStreamingMode = Enum.ModelStreamingMode.Nonatomic
            elseif v:IsA("MeshPart") then
                v.CastShadow = false; v.DoubleSided = false
                v.RenderFidelity = Enum.RenderFidelity.Performance
            elseif v:IsA("BasePart") then
                v.CastShadow = false; v.Material = Enum.Material.Plastic; v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            elseif v:IsA("SpecialMesh") then
                v.TextureId = ""
            elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke")
                or v:IsA("Sparkles") or v:IsA("ParticleEmitter")
                or v:IsA("Trail") or v:IsA("Beam") then
                v.Enabled = false
            elseif v:IsA("SurfaceAppearance") or v:IsA("MaterialVariant") then
                v:Destroy()
            elseif v:IsA("Attachment") then
                v.Visible = false
            end
        end)
    end
    for _, v in pairs(workspace:GetDescendants()) do pO(v) end
    pcall(function()
        local L = Lighting
        for _, v in pairs(L:GetDescendants()) do
            pcall(function()
                if v:IsA("Sky") or v:IsA("Atmosphere") or v:IsA("BloomEffect")
                    or v:IsA("BlurEffect") or v:IsA("SunRaysEffect")
                    or v:IsA("DepthOfFieldEffect") or v:IsA("Clouds")
                    or v:IsA("PostEffect") or v:IsA("ColorCorrectionEffect") then
                    v:Destroy()
                end
            end)
        end
        safeSethiddenproperty(L, "Technology", Enum.Technology.Legacy)
        L.GlobalShadows = false; L.FogEnd = 9e9; L.Brightness = 0
        local ter = workspace:FindFirstChildOfClass("Terrain")
        if ter then
            safeSethiddenproperty(ter, "Decoration", false)
            ter.WaterReflectance = 0; ter.WaterTransparency = 0.7
            ter.WaterWaveSize = 0; ter.WaterWaveSpeed = 0
        end
    end)
    workspace.DescendantAdded:Connect(function(v)
        if S.fpsBoostEnabled then task.spawn(pO, v) end
    end)
end

local function stopFPSBoost()
    S.fpsBoostEnabled = false
    restoreAccessories()
end

local function runTPFloor()
    pcall(function()
        local char = LP.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local rp = RaycastParams.new()
        rp.FilterDescendantsInstances = {char}
        rp.FilterType = Enum.RaycastFilterType.Exclude
        local res = workspace:Raycast(hrp.Position, Vector3.new(0, -500, 0), rp)
        if res then
            hrp.CFrame = CFrame.new(hrp.Position.X, res.Position.Y + hrp.Size.Y/2 + 0.5, hrp.Position.Z)
            hrp.Velocity = Vector3.zero
            pcall(function() hrp.AssemblyLinearVelocity = Vector3.zero end)
            pcall(function() hrp.AssemblyAngularVelocity = Vector3.zero end)
        end
    end)
end

local STEAL_COOLDOWN = 0.05
local PLOT_CACHE_DURATION = 2
local PROMPT_CACHE_REFRESH = 0.08
local getconnections = getconnections or get_signal_cons or getconnects or (syn and syn.get_signal_cons)

local function isMyPlotByName(pn)
    local ct = tick()
    if S.Steal.plotCache[pn] and (ct - (S.Steal.plotCacheTime[pn] or 0)) < PLOT_CACHE_DURATION then return S.Steal.plotCache[pn] end
    local plots = workspace:FindFirstChild("Plots"); if not plots then S.Steal.plotCache[pn]=false; S.Steal.plotCacheTime[pn]=ct; return false end
    local plot = plots:FindFirstChild(pn); if not plot then S.Steal.plotCache[pn]=false; S.Steal.plotCacheTime[pn]=ct; return false end
    local sign = plot:FindFirstChild("PlotSign")
    if sign then local yb = sign:FindFirstChild("YourBase"); if yb and yb:IsA("BillboardGui") then local r = yb.Enabled==true; S.Steal.plotCache[pn]=r; S.Steal.plotCacheTime[pn]=ct; return r end end
    S.Steal.plotCache[pn]=false; S.Steal.plotCacheTime[pn]=ct; return false
end

local function findNearestPrompt()
    local c = LP.Character; if not c then return nil end
    local root = c:FindFirstChild("HumanoidRootPart"); if not root then return nil end
    local ct = tick()
    if ct - S.Steal.promptCacheTime < PROMPT_CACHE_REFRESH and #S.Steal.cachedPrompts > 0 then
        local np, nd = nil, math.huge
        for _, data in ipairs(S.Steal.cachedPrompts) do
            if data.spawn then local dist = (data.spawn.Position - root.Position).Magnitude; if dist <= S.Steal.StealRadius and dist < nd then np = data.prompt; nd = dist end end
        end
        if np then return np end
    end
    S.Steal.cachedPrompts = {}; S.Steal.promptCacheTime = ct
    local plots = workspace:FindFirstChild("Plots"); if not plots then return nil end
    local np, nd = nil, math.huge
    for _, plot in ipairs(plots:GetChildren()) do
        if isMyPlotByName(plot.Name) then continue end
        local pods = plot:FindFirstChild("AnimalPodiums"); if not pods then continue end
        for _, pod in ipairs(pods:GetChildren()) do
            pcall(function()
                local base = pod:FindFirstChild("Base"); local sp = base and base:FindFirstChild("Spawn")
                if sp then local att = sp:FindFirstChild("PromptAttachment"); if att then
                    for _, child in ipairs(att:GetChildren()) do
                        if child:IsA("ProximityPrompt") then
                            local dist = (sp.Position - root.Position).Magnitude
                            table.insert(S.Steal.cachedPrompts, {prompt=child, spawn=sp})
                            if dist <= S.Steal.StealRadius and dist < nd then np=child; nd=dist end
                            break
                        end
                    end
                end end
            end)
        end
    end
    return np
end

local function executeSteal(prompt)
    local ct = tick()
    if S.Steal.isStealing then return end
    if not S.Steal.Data[prompt] then
        S.Steal.Data[prompt] = {hold={}, trigger={}, ready=true}
        pcall(function()
            if getconnections then
                for _, c2 in ipairs(getconnections(prompt.PromptButtonHoldBegan)) do if c2.Function then table.insert(S.Steal.Data[prompt].hold, c2.Function) end end
                for _, c2 in ipairs(getconnections(prompt.Triggered)) do if c2.Function then table.insert(S.Steal.Data[prompt].trigger, c2.Function) end end
            else S.Steal.Data[prompt].useFallback = true end
        end)
        if #S.Steal.Data[prompt].hold == 0 and #S.Steal.Data[prompt].trigger == 0 then S.Steal.Data[prompt].useFallback = true end
    end
    local data = S.Steal.Data[prompt]; if not data.ready then return end
    data.ready = false; S.Steal.isStealing = true; S.Steal.stealStartTime = ct
    if S.Conns.progress then S.Conns.progress:Disconnect() end
    S.Conns.progress = RunService.Heartbeat:Connect(function()
        if not S.Steal.isStealing then S.Conns.progress:Disconnect(); return end
        local prog = math.clamp((tick() - S.Steal.stealStartTime) / S.Steal.StealDuration, 0, 1)
        if S.progressFill then S.progressFill.Size = UDim2.new(prog, 0, 1, 0) end
        if S.progressPct then S.progressPct.Text = math.floor(prog * 100) .. "%" end
    end)
    task.spawn(function()
        local ok = false
        pcall(function() if not data.useFallback then for _, fn in ipairs(data.hold) do task.spawn(fn) end; task.wait(S.Steal.StealDuration); for _, fn in ipairs(data.trigger) do task.spawn(fn) end; ok=true end end)
        if not ok and fireproximityprompt then pcall(function() fireproximityprompt(prompt); ok=true end) end
        if not ok then pcall(function() prompt:InputHoldBegin(); task.wait(S.Steal.StealDuration); prompt:InputHoldEnd() end) end
        if S.Conns.progress then S.Conns.progress:Disconnect() end
        resetProgressBar()
        data.ready = true
        S.Steal.isStealing = false
    end)
end

local function startAutoSteal()
    if S.stealConn then S.stealConn:Disconnect() end
    local _stealTimer = 0
    S.stealConn = RunService.Heartbeat:Connect(function(dt)
        if not S.stealActive or S.Steal.isStealing then return end
        _stealTimer = _stealTimer + dt
        if _stealTimer < 0.02 then return end
        _stealTimer = 0
        local p = findNearestPrompt(); if p then executeSteal(p) end
    end)
end

local function stopAutoSteal()
    if S.stealConn then S.stealConn:Disconnect(); S.stealConn = nil end
    S.Steal.isStealing = false; S.Steal.lastStealTick = 0
    S.Steal.plotCache = {}; S.Steal.plotCacheTime = {}; S.Steal.cachedPrompts = {}
    resetProgressBar()
end

local _noclipCache = {}
RunService.Stepped:Connect(function(_, dt)
    S._noclipTimer = S._noclipTimer + dt
    if S._noclipTimer < 0.15 then return end
    S._noclipTimer = 0
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p.Character then
            local cached = _noclipCache[p]
            if not cached or cached.char ~= p.Character then
                local parts = {}
                for _, obj in ipairs(p.Character:GetDescendants()) do
                    if obj:IsA("BasePart") then table.insert(parts, obj) end
                end
                _noclipCache[p] = {char = p.Character, parts = parts}
                cached = _noclipCache[p]
            end
            for _, part in ipairs(cached.parts) do
                if part and part.Parent then part.CanCollide = false end
            end
        else
            _noclipCache[p] = nil
        end
    end
end)

RunService.RenderStepped:Connect(function()
    S._fpsCount = S._fpsCount + 1
    local now = tick()
    if now - S._lastFpsTime >= 1 then
        S.currentFPS = math.floor(S._fpsCount/(now - S._lastFpsTime))
        S._fpsCount = 0
        S._lastFpsTime = now
    end
end)

updateFloatingButtons = function()
    if not S._setPButtonActive then return end
    local fb = S._floatingButtons
    if fb.lagger then updateLaggerButtonVisual() end
    if fb.carry then S._setPButtonActive(fb.carry, fb.strokeCarry, fb.l1Carry, fb.l2Carry, S.speedMode) end
    if fb.autoLeft then S._setPButtonActive(fb.autoLeft, fb.strokeAutoLeft, fb.l1AutoLeft, fb.l2AutoLeft, S.autoLeftEnabled) end
    if fb.autoRight then S._setPButtonActive(fb.autoRight, fb.strokeAutoRight, fb.l1AutoRight, fb.l2AutoRight, S.autoRightEnabled) end
    if fb.bat then S._setPButtonActive(fb.bat, fb.strokeBat, fb.l1Bat, fb.l2Bat, S.batAimbotEnabled) end
    if fb.autoTPDown then S._setPButtonActive(fb.autoTPDown, fb.strokeAutoTPDown, fb.l1AutoTPDown, fb.l2AutoTPDown, S.autoTPDownEnabled) end
end

local function setUILock(enabled)
    S.lockUIEnabled = enabled
    if S.mainMenuFrame then S.mainMenuFrame.Active = not enabled end
    if S.miniToggleButton then S.miniToggleButton.Active = not enabled end
    if S.floatingPanelFrame then S.floatingPanelFrame.Active = not enabled end
end

local function makeDraggable(frame, isFloatingPanel)
    local dragging, dragStart, startPos = false, nil, nil
    frame.InputBegan:Connect(function(inp)
        if S.lockUIEnabled then return end
        if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = inp.Position
            startPos = frame.Position
            inp.Changed:Connect(function()
                if inp.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    UIS.InputChanged:Connect(function(inp)
        if S.lockUIEnabled or not dragging then return end
        if inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch then
            local delta = inp.Position - dragStart
            if delta.Magnitude > 2 then
                local newX = startPos.X.Offset + delta.X
                local newY = startPos.Y.Offset + delta.Y
                frame.Position = UDim2.new(startPos.X.Scale, newX, startPos.Y.Scale, newY)
                if isFloatingPanel then saveConfig() end
            end
        end
    end)
end

-- ===========================
-- INTERFAZ - CXRHUB
-- ===========================
local function buildGui_createScrollingPages(rightPanel)
    local pages = {}
    for _, n in ipairs({"Speed", "Main", "Move", "Config", "Songs"}) do
        local sf = Instance.new("ScrollingFrame", rightPanel)
        sf.Size = UDim2.new(1,0,1,0)
        sf.BackgroundTransparency = 1
        sf.BorderSizePixel = 0
        sf.ScrollBarThickness = 6
        sf.ScrollBarImageColor3 = Color3.fromRGB(100,100,100)
        sf.ScrollingEnabled = true
        sf.Visible = false
        sf.AutomaticCanvasSize = Enum.AutomaticSize.Y
        sf.CanvasSize = UDim2.new(0,0,0,0)

        local ll = Instance.new("UIListLayout", sf)
        ll.SortOrder = Enum.SortOrder.LayoutOrder
        ll.Padding = UDim.new(0, 4)
        ll.FillDirection = Enum.FillDirection.Vertical

        local pp = Instance.new("UIPadding", sf)
        pp.PaddingLeft = UDim.new(0, 12)
        pp.PaddingRight = UDim.new(0, 12)
        pp.PaddingTop = UDim.new(0, 12)
        pp.PaddingBottom = UDim.new(0, 40)

        pages[n] = sf
    end
    return pages
end

local rowCounts = {Speed = 0, Main = 0, Move = 0, Config = 0, Songs = 0}

local function mkCard(pg, pages, h)
    local C_CARD = Color3.fromRGB(12,12,12)
    rowCounts[pg] = rowCounts[pg] + 1
    local f = Instance.new("Frame", pages[pg])
    f.Size = UDim2.new(1,0,0,h or 38)
    f.BackgroundColor3 = C_CARD
    f.BorderSizePixel = 0
    f.LayoutOrder = rowCounts[pg]
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", f)
    stroke.Color = Color3.fromRGB(160, 0, 220)
    stroke.Thickness = 1
    return f
end

-- ════ SISTEMA DE NOTIFICACIONES ════
local _notifGui = nil
local _notifQueue = {}
local _notifRunning = false

local function showNotif(text, isOn)
    if not _notifGui or not _notifGui.Parent then
        _notifGui = Instance.new("ScreenGui")
        _notifGui.Name = "CXRHUBNotifs"
        _notifGui.ResetOnSpawn = false
        _notifGui.DisplayOrder = 500
        _notifGui.IgnoreGuiInset = true
        pcall(function() _notifGui.Parent = game:GetService("CoreGui") end)
        if not _notifGui.Parent then _notifGui.Parent = LP:WaitForChild("PlayerGui") end
        local holder = Instance.new("Frame", _notifGui)
        holder.Name = "Holder"
        holder.Size = UDim2.new(0, 220, 1, 0)
        holder.Position = UDim2.new(0, 8, 0, 0)
        holder.BackgroundTransparency = 1
        holder.BorderSizePixel = 0
        local layout = Instance.new("UIListLayout", holder)
        layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
        layout.Padding = UDim.new(0, 6)
        local pad = Instance.new("UIPadding", holder)
        pad.PaddingBottom = UDim.new(0, 80)
    end

    table.insert(_notifQueue, {text=text, isOn=isOn})

    if _notifRunning then return end
    _notifRunning = true
    task.spawn(function()
        while #_notifQueue > 0 do
            local item = table.remove(_notifQueue, 1)
            local holder = _notifGui:FindFirstChild("Holder")
            if not holder then break end

            local card = Instance.new("Frame", holder)
            card.Size = UDim2.new(1, 0, 0, 36)
            card.BackgroundColor3 = Color3.fromRGB(8, 5, 18)
            card.BorderSizePixel = 0
            card.BackgroundTransparency = 1
            Instance.new("UICorner", card).CornerRadius = UDim.new(0, 10)
            local stroke = Instance.new("UIStroke", card)
            stroke.Color = item.isOn and Color3.fromRGB(160, 0, 220) or Color3.fromRGB(80, 80, 80)
            stroke.Thickness = 1.5

            local icon = Instance.new("TextLabel", card)
            icon.Size = UDim2.new(0, 30, 1, 0)
            icon.Position = UDim2.new(0, 4, 0, 0)
            icon.BackgroundTransparency = 1
            icon.Text = item.isOn and "✅" or "❌"
            icon.TextSize = 14
            icon.TextXAlignment = Enum.TextXAlignment.Center

            local lbl = Instance.new("TextLabel", card)
            lbl.Size = UDim2.new(1, -38, 1, 0)
            lbl.Position = UDim2.new(0, 34, 0, 0)
            lbl.BackgroundTransparency = 1
            lbl.Text = item.text
            lbl.TextColor3 = item.isOn and Color3.fromRGB(200, 150, 255) or Color3.fromRGB(160, 160, 160)
            lbl.Font = Enum.Font.GothamBold
            lbl.TextSize = 11
            lbl.TextXAlignment = Enum.TextXAlignment.Left
            lbl.TextTransparency = 1

            local TS2 = game:GetService("TweenService")
            -- Fade in
            TS2:Create(card, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
            TS2:Create(lbl, TweenInfo.new(0.2), {TextTransparency = 0}):Play()
            task.wait(2)
            -- Fade out
            TS2:Create(card, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
            TS2:Create(lbl, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
            task.wait(0.35)
            card:Destroy()
        end
        _notifRunning = false
    end)
end

local function mkToggle(pg, pages, label, defKey, defOn, onToggle, onKeyChanged)
    local C_ON = Color3.fromRGB(255,255,255)
    local C_OFF = Color3.fromRGB(40,40,40)
    local C_WHITE = Color3.fromRGB(255,255,255)
    local card = mkCard(pg, pages, 40)
    local lbl = Instance.new("TextLabel", card)
    lbl.Size = UDim2.new(0,140,1,0)
    lbl.Position = UDim2.new(0,12,0,0)
    lbl.BackgroundTransparency = 1
    lbl.Text = label
    lbl.TextColor3 = C_WHITE
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 13
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    local keyBtn = nil
    if defKey then
        local keyName = (defKey or Enum.KeyCode.Unknown).Name
        keyBtn = Instance.new("TextButton", card)
        keyBtn.Size = UDim2.new(0,60,0,24)
        keyBtn.Position = UDim2.new(1,-110,0.5,-12)
        keyBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
        keyBtn.BorderSizePixel = 0
        keyBtn.Text = keyName
        keyBtn.TextColor3 = C_WHITE
        keyBtn.Font = Enum.Font.GothamBold
        keyBtn.TextSize = 10
        Instance.new("UICorner", keyBtn).CornerRadius = UDim.new(0, 5)
        local listening = false
        keyBtn.MouseButton1Click:Connect(function()
            if listening then return end
            listening = true
            local prev = keyBtn.Text
            keyBtn.Text = "..."
            local conn
            conn = UIS.InputBegan:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.Keyboard or inp.UserInputType == Enum.UserInputType.Gamepad1 then
                    if inp.KeyCode ~= Enum.KeyCode.Escape then
                        keyBtn.Text = inp.KeyCode.Name
                        if onKeyChanged then onKeyChanged(inp.KeyCode, inp.UserInputType == Enum.UserInputType.Gamepad1) end
                    else
                        keyBtn.Text = prev
                    end
                    listening = false
                    conn:Disconnect()
                end
            end)
        end)
    end
    local pillBg = Instance.new("Frame", card)
    pillBg.Size = UDim2.new(0,28,0,16)
    pillBg.Position = UDim2.new(1,-36,0.5,-8)
    pillBg.BackgroundColor3 = defOn and C_ON or C_OFF
    pillBg.BorderSizePixel = 0
    Instance.new("UICorner", pillBg).CornerRadius = UDim.new(1,0)
    local dot = Instance.new("Frame", pillBg)
    dot.Size = UDim2.new(0,12,0,12)
    dot.Position = defOn and UDim2.new(1,-14,0.5,-6) or UDim2.new(0,2,0.5,-6)
    dot.BackgroundColor3 = defOn and Color3.fromRGB(12,12,12) or C_WHITE
    dot.BorderSizePixel = 0
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)
    local isOn = defOn or false
    local function setV(on)
        isOn = on
        pillBg.BackgroundColor3 = on and C_ON or C_OFF
        dot.Position = on and UDim2.new(1,-14,0.5,-6) or UDim2.new(0,2,0.5,-6)
        dot.BackgroundColor3 = on and Color3.fromRGB(12,12,12) or C_WHITE
    end
    local clickArea = Instance.new("TextButton", card)
    clickArea.Size = UDim2.new(1,0,1,0)
    clickArea.BackgroundTransparency = 1
    clickArea.Text = ""
    clickArea.ZIndex = 3
    clickArea.MouseButton1Click:Connect(function()
        isOn = not isOn
        setV(isOn)
        pcall(function() showNotif(label .. (isOn and " ON" or " OFF"), isOn) end)
        if onToggle then onToggle(isOn) end
    end)
    if defOn then setV(true) end
    return setV, keyBtn
end

local function mkInput(pg, pages, label, default, onChange)
    local C_WHITE = Color3.fromRGB(255,255,255)
    local card = mkCard(pg, pages, 38)
    local lbl = Instance.new("TextLabel", card)
    lbl.Size = UDim2.new(0.5,-10,1,0)
    lbl.Position = UDim2.new(0,12,0,0)
    lbl.BackgroundTransparency = 1
    lbl.Text = label
    lbl.TextColor3 = C_WHITE
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 13
    lbl.TextXAlignment = Enum.TextXAlignment.Left

    local box = Instance.new("TextBox", card)
    box.Size = UDim2.new(0,70,0,28)
    box.Position = UDim2.new(1,-78,0.5,-14)
    box.BackgroundColor3 = Color3.fromRGB(30,30,30)
    box.BorderSizePixel = 0
    box.Text = tostring(default)
    box.TextColor3 = C_WHITE
    box.Font = Enum.Font.GothamBlack
    box.TextSize = 11
    box.ClearTextOnFocus = false
    box.MultiLine = false
    pcall(function() box.ReturnKeyType = Enum.ReturnKeyType.Done end)
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)

    local lastVal = tostring(default)
    local isFocused = false

    local function applyValue()
        if not isFocused then return end
        isFocused = false
        local n = tonumber(box.Text)
        if n then
            lastVal = tostring(n)
            box.Text = lastVal
            onChange(n)
        else
            box.Text = lastVal
        end
        pcall(function() box:ReleaseFocus(false) end)
    end

    box.Focused:Connect(function()
        isFocused = true
    end)

    box.FocusLost:Connect(function()
        if isFocused then
            isFocused = false
            local n = tonumber(box.Text)
            if n then
                lastVal = tostring(n)
                box.Text = lastVal
                onChange(n)
            else
                box.Text = lastVal
            end
        end
    end)

    pcall(function()
        box.ReturnPressedFromOnScreenKeyboard:Connect(function()
            applyValue()
        end)
    end)

    UIS.TouchTap:Connect(function(positions)
        if not isFocused then return end
        pcall(function()
            local abs = box.AbsolutePosition
            local sz  = box.AbsoluteSize            local tp  = positions[1]
            if tp then
                local inside = tp.X >= abs.X and tp.X <= abs.X + sz.X
                           and tp.Y >= abs.Y and tp.Y <= abs.Y + sz.Y
                if not inside then
                    applyValue()
                end
            end
        end)
    end)

    return box
end

local function buildGui_createMiniToggle(gui, showGuiFn)
    local C_WHITE = Color3.fromRGB(255,255,255)
    local miniToggleBtn = Instance.new("TextButton", gui)
    miniToggleBtn.Name = "MiniToggle"
    miniToggleBtn.Size = UDim2.new(0,48,0,48)
    miniToggleBtn.Position = UDim2.new(0,38,0,60)
    miniToggleBtn.BackgroundColor3 = Color3.fromRGB(10,10,10)
    miniToggleBtn.BorderSizePixel = 0
    miniToggleBtn.Text = "C"
    miniToggleBtn.TextColor3 = C_WHITE
    miniToggleBtn.Font = Enum.Font.GothamBlack
    miniToggleBtn.TextSize = 28
    miniToggleBtn.ZIndex = 20
    miniToggleBtn.Visible = false
    Instance.new("UICorner", miniToggleBtn).CornerRadius = UDim.new(0,12)
    local miniStroke = Instance.new("UIStroke", miniToggleBtn)
    miniStroke.Color = Color3.fromRGB(0, 150, 255)
    miniStroke.Thickness = 1.5
    miniStroke.Transparency = 0.7
    makeDraggable(miniToggleBtn, false)
    miniToggleBtn.MouseButton1Click:Connect(showGuiFn)
    return miniToggleBtn
end

local function buildSpeedTab(pages)
    S.normalBox = mkInput("Speed", pages, "Normal Speed", S.NS, function(v)
        if v>0 and v<=500 then S.NS = v; S.restartMovement(); saveConfig() end
    end)
    S.carryBox = mkInput("Speed", pages, "Carry Speed", S.CS, function(v)
        if v>0 and v<=500 then S.CS = v; S.restartMovement(); saveConfig() end
    end)
    S.laggerBox = mkInput("Speed", pages, "Lagger Speed 1", S.LS, function(v)
        if v>0 and v<=500 then S.LS = v; S.restartMovement(); saveConfig() end
    end)
    S.lagger2Box = mkInput("Speed", pages, "Lagger Speed 2", S.LS2, function(v)
        if v>0 and v<=500 then S.LS2 = v; S.restartMovement(); saveConfig() end
    end)

    S.speedClk, _ = mkToggle("Speed", pages, "Carry Mode", S.KB.SpeedToggle.kb, false, function(on)
        if on then
            if S.laggerMode ~= 0 then
                S.laggerMode = 0
                if S.setLaggerVisual then S.setLaggerVisual(false) end
                updateLaggerButtonVisual()
            end
        end
        S.speedMode = on
        S.restartMovement()
        updateFloatingButtons()
        saveConfig()
    end, function(k, isGp)
        if isGp then S.KB.SpeedToggle.gp = k; S.KB.SpeedToggle.kb = nil
        else S.KB.SpeedToggle.kb = k; S.KB.SpeedToggle.gp = nil end
        saveConfig()
    end)

    S.setLaggerVisual, _ = mkToggle("Speed", pages, "Lagger Mode", S.KB.LaggerToggle.kb, false, function(on)
        if on then
            if S.speedMode then
                S.speedMode = false
                if S.speedClk then S.speedClk(false) end
            end
            if S.laggerMode == 0 then
                S.laggerMode = 1
            elseif S.laggerMode == 1 then
                S.laggerMode = 2
            else
                S.laggerMode = 0
            end
        else
            S.laggerMode = 0
        end
        updateLaggerButtonVisual()
        S.restartMovement()
        updateFloatingButtons()
        saveConfig()
    end, function(k, isGp)
        if isGp then S.KB.LaggerToggle.gp = k; S.KB.LaggerToggle.kb = nil
        else S.KB.LaggerToggle.kb = k; S.KB.LaggerToggle.gp = nil end
        saveConfig()
    end)

    -- ANTI BAT
    mkToggle("Speed", pages, "ANTI BAT", nil, false, function(on)
        if on then
            pcall(function()
                loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/49f0ff02ca9f52491842d31184af40bb.lua"))()
            end)
        end
    end, nil)
end

local function buildMainTab(pages)
    S.setDarkVisual, _ = mkToggle("Main", pages, "Galaxy Mode", nil, false, function(on)
        toggleGalaxyMode()
        saveConfig()
    end, nil)

    S.setFpsVisual, _ = mkToggle("Main", pages, "FPS Boost", nil, false, function(on)
        S.fpsBoostEnabled = on
        if on then applyFPSBoost() else stopFPSBoost() end
        saveConfig()
    end, nil)

    S.setInfJumpVisual, _ = mkToggle("Main", pages, "Infinite Jump", nil, false, function(on)
        if on and S.holdJumpEnabled then
            S.holdJumpEnabled = false
            stopHoldJump()
            if S.setHoldJumpVisual then S.setHoldJumpVisual(false) end
        end
        S.infJumpEnabled = on
        if on then startInfiniteJump() else stopInfiniteJump() end
        saveConfig()
    end, nil)

    S.setHoldJumpVisual, _ = mkToggle("Main", pages, "Hold Jump", nil, false, function(on)
        if on and S.infJumpEnabled then
            S.infJumpEnabled = false
            stopInfiniteJump()
            if S.setInfJumpVisual then S.setInfJumpVisual(false) end
        end
        S.holdJumpEnabled = on
        if on then startHoldJump() else stopHoldJump() end
        saveConfig()
    end, nil)
end

local function buildMoveTab(pages)
    local batToggleVisual, _ = mkToggle("Move", pages, "Bat Aimbot", S.KB.AutoBat.kb, false, function(on)
        if on then
            if S.autoLeftEnabled then
                S.autoLeftEnabled = false
                if S.autoLeftSetVisual then S.autoLeftSetVisual(false) end
                stopAutoLeft()
            end
            if S.autoRightEnabled then
                S.autoRightEnabled = false
                if S.autoRightSetVisual then S.autoRightSetVisual(false) end
                stopAutoRight()
            end
        end
        setBatAimbot(on); updateFloatingButtons()
    end, function(k, isGp)
        if isGp then S.KB.AutoBat.gp = k; S.KB.AutoBat.kb = nil
        else S.KB.AutoBat.kb = k; S.KB.AutoBat.gp = nil end
        saveConfig()
    end)
    S.batAimbotSetVisual = batToggleVisual

    S.setBatCounterVisual, _ = mkToggle("Move", pages, "Bat Counter", nil, false, function(on)
        S.batCounterEnabled = on
        if on then startBatCounter() else stopBatCounter() end
        saveConfig()
    end, nil)

    local setALVis, _ = mkToggle("Move", pages, "Auto Left", S.KB.AutoLeft.kb, false, function(on)
        S.autoLeftEnabled = on
        if on then
            if S.autoRightEnabled then
                S.autoRightEnabled = false; stopAutoRight()
                if S.autoRightSetVisual then S.autoRightSetVisual(false) end
            end
            if S.batAimbotEnabled then setBatAimbot(false) end
            startAutoLeft()
        else
            stopAutoLeft()
        end
        if S.autoLeftSetVisual then S.autoLeftSetVisual(on) end
        S.restartMovement(); updateFloatingButtons(); saveConfig()
    end, function(k, isGp)
        if isGp then S.KB.AutoLeft.gp = k; S.KB.AutoLeft.kb = nil
        else S.KB.AutoLeft.kb = k; S.KB.AutoLeft.gp = nil end
        saveConfig()
    end)
    S.autoLeftSetVisual = setALVis

    local setARVis, _ = mkToggle("Move", pages, "Auto Right", S.KB.AutoRight.kb, false, function(on)
        S.autoRightEnabled = on
        if on then
            if S.autoLeftEnabled then
                S.autoLeftEnabled = false; stopAutoLeft()
                if S.autoLeftSetVisual then S.autoLeftSetVisual(false) end
            end
            if S.batAimbotEnabled then setBatAimbot(false) end
            startAutoRight()
        else
            stopAutoRight()
        end
        if S.autoRightSetVisual then S.autoRightSetVisual(on) end
        S.restartMovement(); updateFloatingButtons(); saveConfig()
    end, function(k, isGp)
        if isGp then S.KB.AutoRight.gp = k; S.KB.AutoRight.kb = nil
        else S.KB.AutoRight.kb = k; S.KB.AutoRight.gp = nil end
        saveConfig()
    end)
    S.autoRightSetVisual = setARVis

    S.autoTPDownSetVisual, _ = mkToggle("Move", pages, "Auto TP Down", S.KB.AutoTPDown.kb, false, function(on)
        S.autoTPDownEnabled = on
        if on then startAutoTPDown() else stopAutoTPDown() end
        if S.autoTPDownFloatVisual then S.autoTPDownFloatVisual(on) end
        saveConfig()
    end, function(k, isGp)
        if isGp then S.KB.AutoTPDown.gp = k; S.KB.AutoTPDown.kb = nil
        else S.KB.AutoTPDown.kb = k; S.KB.AutoTPDown.gp = nil end
        saveConfig()
    end)

    -- Inputs para configuración de Auto TP Down
    S.autoTPDownHeightBox = mkInput("Move", pages, "TP Height Limit", S.autoTPDownHeightLimit, function(v)
        if v and v > 0 then S.autoTPDownHeightLimit = v; saveConfig() end
    end)
    
    S.autoTPDownYTargetBox = mkInput("Move", pages, "TP Y Target", S.autoTPDownYTarget, function(v)
        if v then S.autoTPDownYTarget = v; saveConfig() end
    end)

    S.setUnwalkVisual, _ = mkToggle("Move", pages, "Unwalk", nil, false, function(on)
        if on then startUnwalk() else stopUnwalk() end
        saveConfig()
    end, nil)

    S.setAntiRagVisual, _ = mkToggle("Move", pages, "Anti Ragdoll", nil, false, function(on)
        toggleAntiRag(on); saveConfig()
    end, nil)

    S.setMedusaVisual, _ = mkToggle("Move", pages, "Medusa Counter", nil, false, function(on)
        S.medusaCounterEnabled = on
        if on then
            setupMedusaCounter(LP.Character)
        else
            stopMedusaCounter()
        end
        saveConfig()
    end, nil)

    local function actionRow(pg, lbl, keyEntry)
        local card = mkCard(pg, pages, 38)
        local lblObj = Instance.new("TextLabel", card)
        lblObj.Size = UDim2.new(0,120,1,0); lblObj.Position = UDim2.new(0,12,0,0)
        lblObj.BackgroundTransparency = 1; lblObj.Text = lbl
        lblObj.TextColor3 = Color3.fromRGB(255,255,255); lblObj.Font = Enum.Font.GothamBold; lblObj.TextSize = 11
        lblObj.TextXAlignment = Enum.TextXAlignment.Left
        local keyBtn = Instance.new("TextButton", card)
        keyBtn.Size = UDim2.new(0,60,0,24); keyBtn.Position = UDim2.new(1,-70,0.5,-12)
        keyBtn.BackgroundColor3 = Color3.fromRGB(30,30,30); keyBtn.BorderSizePixel = 0
        keyBtn.Text = (keyEntry.kb or keyEntry.gp or Enum.KeyCode.Unknown).Name
        keyBtn.TextColor3 = Color3.fromRGB(255,255,255); keyBtn.Font = Enum.Font.GothamBold; keyBtn.TextSize = 10
        Instance.new("UICorner", keyBtn).CornerRadius = UDim.new(0,5)
        local listening = false
        keyBtn.MouseButton1Click:Connect(function()
            if listening then return end
            listening = true
            local prev = keyBtn.Text; keyBtn.Text = "..."
            local conn
            conn = UIS.InputBegan:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.Keyboard or inp.UserInputType == Enum.UserInputType.Gamepad1 then
                    if inp.KeyCode ~= Enum.KeyCode.Escape then
                        keyBtn.Text = inp.KeyCode.Name
                        if inp.UserInputType == Enum.UserInputType.Gamepad1 then
                            keyEntry.gp = inp.KeyCode; keyEntry.kb = nil
                        else
                            keyEntry.kb = inp.KeyCode; keyEntry.gp = nil
                        end
                        saveConfig()
                    else
                        keyBtn.Text = prev
                    end
                    conn:Disconnect(); listening = false
                end
            end)
        end)
    end
    actionRow("Move", "Drop Brainrot", S.KB.DropBrainrot)
    actionRow("Move", "TP Down", S.KB.TPFlor)
end

local function buildConfigTab(pages)
    local C_ON = Color3.fromRGB(255,255,255)
    local C_OFF = Color3.fromRGB(40,40,40)
    local C_WHITE = Color3.fromRGB(255,255,255)

    do
        local card = mkCard("Config", pages, 38)
        local lbl = Instance.new("TextLabel", card)
        lbl.Size = UDim2.new(0,120,1,0); lbl.Position = UDim2.new(0,12,0,0)
        lbl.BackgroundTransparency = 1; lbl.Text = "Auto Steal"; lbl.TextColor3 = C_WHITE
        lbl.Font = Enum.Font.GothamBold; lbl.TextSize = 13
        local pill = Instance.new("Frame", card)
        pill.Size = UDim2.new(0,28,0,16); pill.Position = UDim2.new(1,-36,0.5,-8)
        pill.BackgroundColor3 = C_OFF; pill.BorderSizePixel = 0
        Instance.new("UICorner", pill).CornerRadius = UDim.new(1,0)
        local dot = Instance.new("Frame", pill)
        dot.Size = UDim2.new(0,12,0,12); dot.Position = UDim2.new(0,2,0.5,-6)
        dot.BackgroundColor3 = C_WHITE; dot.BorderSizePixel = 0
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)
        local stealOn = false
        local function setStealVis(on)
            stealOn = on
            pill.BackgroundColor3 = on and C_ON or C_OFF
            dot.Position = on and UDim2.new(1,-14,0.5,-6) or UDim2.new(0,2,0.5,-6)
            dot.BackgroundColor3 = on and Color3.fromRGB(12,12,12) or C_WHITE
        end
        S.setInstaGrab = setStealVis
        local click = Instance.new("TextButton", card)
        click.Size = UDim2.new(1,0,1,0); click.BackgroundTransparency = 1; click.Text = ""; click.ZIndex = 3
        click.MouseButton1Click:Connect(function()
            stealOn = not stealOn; setStealVis(stealOn); S.stealActive = stealOn
            if stealOn then startAutoSteal() else stopAutoSteal() end
            saveConfig()
        end)
    end

    S.radInput = mkInput("Config", pages, "Steal Radius", S.Steal.StealRadius, function(v)
        if v>=1 and v<=300 then S.Steal.StealRadius = math.floor(v) end; saveConfig()
    end)

    S.stealDurationBox = mkInput("Config", pages, "Steal Duration", S.Steal.StealDuration, function(v)
        if v >= 0.05 and v <= 2 then S.Steal.StealDuration = v; saveConfig() end
    end)

    do
        local card = mkCard("Config", pages, 38)
        local lbl = Instance.new("TextLabel", card)
        lbl.Size = UDim2.new(0,100,1,0); lbl.Position = UDim2.new(0,12,0,0)
        lbl.BackgroundTransparency = 1; lbl.Text = "Hide GUI"; lbl.TextColor3 = C_WHITE
        lbl.Font = Enum.Font.GothamBold; lbl.TextSize = 13
        local keyBtn = Instance.new("TextButton", card)
        keyBtn.Size = UDim2.new(0,60,0,24); keyBtn.Position = UDim2.new(1,-70,0.5,-12)
        keyBtn.BackgroundColor3 = Color3.fromRGB(30,30,30); keyBtn.BorderSizePixel = 0
        keyBtn.Text = (S.KB.GuiHide.kb or S.KB.GuiHide.gp or Enum.KeyCode.Unknown).Name
        keyBtn.TextColor3 = C_WHITE; keyBtn.Font = Enum.Font.GothamBold; keyBtn.TextSize = 10
        Instance.new("UICorner", keyBtn).CornerRadius = UDim.new(0,5)
        local listening = false
        keyBtn.MouseButton1Click:Connect(function()
            if listening then return end
            listening = true
            local prev = keyBtn.Text; keyBtn.Text = "..."
            local conn
            conn = UIS.InputBegan:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.Keyboard or inp.UserInputType == Enum.UserInputType.Gamepad1 then
                    if inp.KeyCode ~= Enum.KeyCode.Escape then
                        keyBtn.Text = inp.KeyCode.Name
                        if inp.UserInputType == Enum.UserInputType.Gamepad1 then
                            S.KB.GuiHide.gp = inp.KeyCode; S.KB.GuiHide.kb = nil
                        else
                            S.KB.GuiHide.kb = inp.KeyCode; S.KB.GuiHide.gp = nil
                        end
                        saveConfig()
                    else
                        keyBtn.Text = prev
                    end
                    conn:Disconnect(); listening = false
                end
            end)
        end)
    end

    do
        local card = mkCard("Config", pages, 38)
        local lbl = Instance.new("TextLabel", card)
        lbl.Size = UDim2.new(0,100,1,0); lbl.Position = UDim2.new(0,12,0,0)
        lbl.BackgroundTransparency = 1; lbl.Text = "Lock UI"; lbl.TextColor3 = C_WHITE
        lbl.Font = Enum.Font.GothamBold; lbl.TextSize = 13
        local pill = Instance.new("Frame", card)
        pill.Size = UDim2.new(0,28,0,16); pill.Position = UDim2.new(1,-36,0.5,-8)
        pill.BackgroundColor3 = C_OFF; pill.BorderSizePixel = 0
        Instance.new("UICorner", pill).CornerRadius = UDim.new(1,0)
        local dot = Instance.new("Frame", pill)
        dot.Size = UDim2.new(0,12,0,12); dot.Position = UDim2.new(0,2,0.5,-6)
        dot.BackgroundColor3 = C_WHITE; dot.BorderSizePixel = 0
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)
        local lockOn = false
        local function setLockVis(on)
            lockOn = on
            pill.BackgroundColor3 = on and C_ON or C_OFF
            dot.Position = on and UDim2.new(1,-14,0.5,-6) or UDim2.new(0,2,0.5,-6)
            dot.BackgroundColor3 = on and Color3.fromRGB(12,12,12) or C_WHITE
        end
        S.setLockUI_Visual = setLockVis
        local click = Instance.new("TextButton", card)
        click.Size = UDim2.new(1,0,1,0); click.BackgroundTransparency = 1; click.Text = ""; click.ZIndex = 3
        click.MouseButton1Click:Connect(function()
            lockOn = not lockOn; setLockVis(lockOn); setUILock(lockOn); saveConfig()
        end)
    end

    do
        local card = mkCard("Config", pages, 38)
        local lbl = Instance.new("TextLabel", card)
        lbl.Size = UDim2.new(0,140,1,0); lbl.Position = UDim2.new(0,12,0,0)
        lbl.BackgroundTransparency = 1; lbl.Text = "Hide Buttons"; lbl.TextColor3 = C_WHITE
        lbl.Font = Enum.Font.GothamBold; lbl.TextSize = 13
        local pill = Instance.new("Frame", card)
        pill.Size = UDim2.new(0,28,0,16); pill.Position = UDim2.new(1,-36,0.5,-8)
        pill.BackgroundColor3 = C_OFF; pill.BorderSizePixel = 0
        Instance.new("UICorner", pill).CornerRadius = UDim.new(1,0)
        local dot = Instance.new("Frame", pill)
        dot.Size = UDim2.new(0,12,0,12); dot.Position = UDim2.new(0,2,0.5,-6)
        dot.BackgroundColor3 = C_WHITE; dot.BorderSizePixel = 0
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)
        local hideButtonsOn = false
        local function setHideButtonsVis(on)
            hideButtonsOn = on
            pill.BackgroundColor3 = on and C_ON or C_OFF
            dot.Position = on and UDim2.new(1,-14,0.5,-6) or UDim2.new(0,2,0.5,-6)
            dot.BackgroundColor3 = on and Color3.fromRGB(12,12,12) or C_WHITE
        end
        S.setHideOpiumButtons = setHideButtonsVis
        local click2 = Instance.new("TextButton", card)
        click2.Size = UDim2.new(1,0,1,0); click2.BackgroundTransparency = 1; click2.Text = ""; click2.ZIndex = 3
        click2.MouseButton1Click:Connect(function()
            hideButtonsOn = not hideButtonsOn
            setHideButtonsVis(hideButtonsOn)
            if S.floatingPanelGui then
                S.floatingPanelGui.Enabled = not hideButtonsOn
            end
            pcall(function()
                local pg = LP:FindFirstChild("PlayerGui")
                if pg then
                    local opiumGui = pg:FindFirstChild("OpiumGGV5_2")
                    if opiumGui then opiumGui.Enabled = not hideButtonsOn end
                end
            end)
            S.hideOpiumButtonsEnabled = hideButtonsOn
            saveConfig()
        end)
    end

    do
        local card = mkCard("Config", pages, 38)
        local lbl = Instance.new("TextLabel", card)
        lbl.Size = UDim2.new(0,140,1,0); lbl.Position = UDim2.new(0,12,0,0)
        lbl.BackgroundTransparency = 1; lbl.Text = "Reset Panel"; lbl.TextColor3 = C_WHITE
        lbl.Font = Enum.Font.GothamBold; lbl.TextSize = 13
        local resetBtn = Instance.new("TextButton", card)
        resetBtn.Size = UDim2.new(0,80,0,28)
        resetBtn.Position = UDim2.new(1,-90,0.5,-14)
        resetBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
        resetBtn.BorderSizePixel = 0
        resetBtn.Text = "Reset"
        resetBtn.TextColor3 = C_WHITE
        resetBtn.Font = Enum.Font.GothamBold
        resetBtn.TextSize = 11
        Instance.new("UICorner", resetBtn).CornerRadius = UDim.new(0,6)
        resetBtn.MouseButton1Click:Connect(function()
            local originalText = resetBtn.Text
            resetBtn.Text = "..."
            task.spawn(function()
                resetFloatingPanel()
                task.wait(0.2)
                resetBtn.Text = originalText
            end)
        end)
    end
end

local function buildGui()
    local C_BG_OUTER  = Color3.fromRGB(0, 30, 90)
    local C_BG_INNER  = Color3.fromRGB(0, 20, 70)
    local C_WHITE     = Color3.fromRGB(255,255,255)
    local C_DIM       = Color3.fromRGB(140, 185, 255)
    local C_ACCENT    = Color3.fromRGB(80, 180, 255)
    local C_BORDER    = Color3.fromRGB(0, 100, 220)
    local C_CARD_BG   = Color3.fromRGB(0, 25, 80)
    local C_ACTIVE_BG = Color3.fromRGB(0, 80, 200)

    local TOTAL_W  = 410
    local TOTAL_H  = 412
    local SIDEBAR_W = 132

    local old = game:GetService("CoreGui"):FindFirstChild("NinoHub")
    if old then old:Destroy() end

    local gui = Instance.new("ScreenGui")
    gui.Name = "NinoHub"
    gui.ResetOnSpawn = false
    gui.DisplayOrder = 100
    gui.IgnoreGuiInset = true
    pcall(function() gui.Parent = game:GetService("CoreGui") end)
    if not gui.Parent then gui.Parent = LP:WaitForChild("PlayerGui") end

    local main = Instance.new("Frame", gui)
    main.Name = "Main"
    main.Size = UDim2.new(0, TOTAL_W, 0, TOTAL_H)
    main.Position = UDim2.new(0, 40, 0, 0)
    main.BackgroundColor3 = C_BG_OUTER
    main.BorderSizePixel = 0
    main.ClipsDescendants = true
    main.Visible = true
    local mainCorner = Instance.new("UICorner", main)
    mainCorner.CornerRadius = UDim.new(0, 12)
    local mainStroke = Instance.new("UIStroke", main)
    mainStroke.Color = Color3.fromRGB(0, 150, 255)
    mainStroke.Thickness = 2
    S.mainMenuFrame = main
    makeDraggable(main, false)

    local sidebar = Instance.new("Frame", main)
    sidebar.Size = UDim2.new(0, SIDEBAR_W, 1, 0)
    sidebar.Position = UDim2.new(0,0,0,0)
    sidebar.BackgroundColor3 = C_BG_OUTER
    sidebar.BorderSizePixel = 0
    sidebar.ClipsDescendants = true
    local sidebarCorner = Instance.new("UICorner", sidebar)
    sidebarCorner.CornerRadius = UDim.new(0, 12)

    local divider = Instance.new("Frame", main)
    divider.Size = UDim2.new(0,1,1,-24)
    divider.Position = UDim2.new(0,SIDEBAR_W,0,12)
    divider.BackgroundColor3 = C_BORDER
    divider.BorderSizePixel = 0

    -- Header Nino Hud
    local headerFrame = Instance.new("Frame", sidebar)
    headerFrame.Size = UDim2.new(1,0,0,200)
    headerFrame.Position = UDim2.new(0,0,0,0)
    headerFrame.BackgroundTransparency = 1
    headerFrame.ClipsDescendants = false

    local logoContainer = Instance.new("Frame", headerFrame)
    logoContainer.Size = UDim2.new(1,0,1,0)
    logoContainer.Position = UDim2.new(0,0,0,0)
    logoContainer.BackgroundTransparency = 1
    logoContainer.ClipsDescendants = true

    local logoImage = Instance.new("ImageLabel", logoContainer)
    logoImage.Size = UDim2.new(1,0,1,0)
    logoImage.BackgroundTransparency = 1
    logoImage.Image = "rbxassetid://135894687762727"
    logoImage.ScaleType = Enum.ScaleType.Crop
    logoImage.ImageColor3 = Color3.fromRGB(180,180,180)
    logoImage.ImageTransparency = 0.45

    local fadeGradient = Instance.new("UIGradient", logoImage)
    fadeGradient.Rotation = 90
    fadeGradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.2),
        NumberSequenceKeypoint.new(0.55, 0.3),
        NumberSequenceKeypoint.new(1, 1)
    })

    local overlay = Instance.new("Frame", headerFrame)
    overlay.Size = UDim2.new(1,0,1,0)
    overlay.BackgroundColor3 = Color3.fromRGB(0, 40, 120)
    overlay.BackgroundTransparency = 0.35
    overlay.BorderSizePixel = 0

    local overlayGrad = Instance.new("UIGradient", overlay)
    overlayGrad.Rotation = 90
    overlayGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.8),
        NumberSequenceKeypoint.new(0.6, 0.2),
        NumberSequenceKeypoint.new(1, 0)
    })

    local titleLabel = Instance.new("TextLabel", headerFrame)
    titleLabel.Size = UDim2.new(1,-16,0,32)
    titleLabel.Position = UDim2.new(0,8,0,10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "CXRHUB"
    titleLabel.TextColor3 = Color3.fromRGB(255,255,255)
    titleLabel.Font = Enum.Font.GothamBlack
    titleLabel.TextSize = 22
    titleLabel.TextXAlignment = Enum.TextXAlignment.Center

    
    -- CX ROJO ENCIMA DEL LOGO
    local logoCX = Instance.new("TextLabel", headerFrame)
    logoCX.Size = UDim2.new(0,220,0,140)
    logoCX.Position = UDim2.new(0.5,-110,0,55)
    logoCX.BackgroundTransparency = 1
    logoCX.Text = "CX"
    logoCX.TextColor3 = Color3.fromRGB(160, 50, 220)
    logoCX.Font = Enum.Font.GothamBlack
    logoCX.TextSize = 90
    logoCX.TextXAlignment = Enum.TextXAlignment.Center
    logoCX.TextYAlignment = Enum.TextYAlignment.Top
    logoCX.ZIndex = 100
    logoCX.TextStrokeTransparency = 0.3
    logoCX.TextStrokeColor3 = Color3.fromRGB(200, 100, 255)
    local cxStroke = Instance.new("UIStroke", logoCX)
    cxStroke.Color = Color3.fromRGB(180, 0, 255)
    cxStroke.Thickness = 4
    cxStroke.Transparency = 0.0
    cxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    local cxGrad = Instance.new("UIGradient", cxStroke)
    cxGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 255)),
        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(100, 0, 255)),
        ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(180, 0, 255)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255)),
    })
    cxGrad.Rotation = 0
    local _cxAngle = 0
    local _cxPulse = 0
    RunService.Heartbeat:Connect(function(dt)
        if not logoCX or not logoCX.Parent then return end
        _cxAngle = (_cxAngle + dt * 120) % 360
        _cxPulse = _cxPulse + dt * 3
        cxGrad.Rotation = _cxAngle
        local pulse = (math.sin(_cxPulse) + 1) / 2
        local r = math.floor(140 + pulse * 115)
        local g = math.floor(0 + pulse * 50)
        local b = math.floor(200 + pulse * 55)
        logoCX.TextColor3 = Color3.fromRGB(r, g, b)
        cxStroke.Thickness = 3 + pulse * 2
    end)

local subLabel = Instance.new("TextLabel", headerFrame)
    subLabel.Size = UDim2.new(1,-16,0,16)
    subLabel.Position = UDim2.new(0,8,0,42)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = ""
    subLabel.TextColor3 = Color3.fromRGB(180,180,180)
    subLabel.Font = Enum.Font.Gotham
    subLabel.TextSize = 10
    subLabel.TextXAlignment = Enum.TextXAlignment.Center

    local accentLine = Instance.new("Frame", headerFrame)
    accentLine.Size = UDim2.new(0,40,0,2)
    accentLine.Position = UDim2.new(0.5,-20,0,62)
    accentLine.BackgroundColor3 = Color3.fromRGB(255,255,255)
    accentLine.BackgroundTransparency = 0.6
    accentLine.BorderSizePixel = 0
    Instance.new("UICorner", accentLine).CornerRadius = UDim.new(1,0)

    local logoDiv = Instance.new("Frame", sidebar)
    logoDiv.Size = UDim2.new(1,-20,0,1)
    logoDiv.Position = UDim2.new(0,10,0,200)
    logoDiv.BackgroundColor3 = C_BORDER
    logoDiv.BorderSizePixel = 0

    local TAB_NAMES = {"Speed", "Main", "Move", "Config"}
    local tabBtns = {}

    local tabListFrame = Instance.new("Frame", sidebar)
    tabListFrame.Size = UDim2.new(1,0,1,-210)
    tabListFrame.Position = UDim2.new(0,0,0,205)
    tabListFrame.BackgroundTransparency = 1

    local tabLL = Instance.new("UIListLayout", tabListFrame)
    tabLL.SortOrder = Enum.SortOrder.LayoutOrder
    tabLL.Padding = UDim.new(0, 8)
    local tabPad = Instance.new("UIPadding", tabListFrame)
    tabPad.PaddingLeft = UDim.new(0, 12)
    tabPad.PaddingRight = UDim.new(0, 12)
    tabPad.PaddingTop = UDim.new(0, 8)

    local function switchTab(name) end

    for i, name in ipairs(TAB_NAMES) do
        local btn = Instance.new("TextButton", tabListFrame)
        btn.Size = UDim2.new(1,0,0,36)
        btn.BackgroundColor3 = C_CARD_BG
        btn.BorderSizePixel = 0
        btn.Text = ""
        btn.LayoutOrder = i
        btn.AutoButtonColor = false

        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
        local stroke = Instance.new("UIStroke", btn)
        stroke.Color = C_BORDER
        stroke.Thickness = 1
        stroke.Transparency = 0.4

        local lbl = Instance.new("TextLabel", btn)
        lbl.Size = UDim2.new(1,0,1,0)
        lbl.BackgroundTransparency = 1
        lbl.Text = name
        lbl.TextColor3 = C_DIM
        lbl.Font = Enum.Font.GothamBold
        lbl.TextSize = 13
        lbl.TextXAlignment = Enum.TextXAlignment.Center

        local activeIndicator = Instance.new("Frame", btn)
        activeIndicator.Size = UDim2.new(0.8,0,0,2)
        activeIndicator.Position = UDim2.new(0.1,0,1,-2)
        activeIndicator.BackgroundColor3 = C_ACCENT
        activeIndicator.BorderSizePixel = 0
        activeIndicator.Visible = (name == "Speed")
        Instance.new("UICorner", activeIndicator).CornerRadius = UDim.new(1,0)

        tabBtns[name] = {bg = btn, lbl = lbl, ind = activeIndicator, stroke = stroke}
        btn.MouseButton1Click:Connect(function()
            switchTab(name)
        end)
    end

    local rightPanel = Instance.new("Frame", main)
    rightPanel.Size = UDim2.new(0, TOTAL_W - SIDEBAR_W - 1, 1, 0)
    rightPanel.Position = UDim2.new(0, SIDEBAR_W+1, 0, 0)
    rightPanel.BackgroundColor3 = C_BG_INNER
    rightPanel.BorderSizePixel = 0
    rightPanel.ClipsDescendants = true
    local rightCorner = Instance.new("UICorner", rightPanel)
    rightCorner.CornerRadius = UDim.new(0, 12)

    local topBar = Instance.new("Frame", rightPanel)
    topBar.Size = UDim2.new(1,0,0,44)
    topBar.BackgroundColor3 = C_BG_INNER
    topBar.BorderSizePixel = 0
    local topBarDiv = Instance.new("Frame", rightPanel)
    topBarDiv.Size = UDim2.new(1,-20,0,1)
    topBarDiv.Position = UDim2.new(10,0,0,44)
    topBarDiv.BackgroundColor3 = C_BORDER
    topBarDiv.BorderSizePixel = 0

    local panelTitle = Instance.new("TextLabel", topBar)
    panelTitle.Size = UDim2.new(1,-50,1,0)
    panelTitle.Position = UDim2.new(0,16,0,0)
    panelTitle.BackgroundTransparency = 1
    panelTitle.Text = "Speed"
    panelTitle.TextColor3 = C_WHITE
    panelTitle.Font = Enum.Font.GothamBlack
    panelTitle.TextSize = 16
    panelTitle.TextXAlignment = Enum.TextXAlignment.Left

    -- Botón Minimizar (barra de minimizar)
    local closeBtn = Instance.new("TextButton", topBar)
    closeBtn.Size = UDim2.new(0,28,0,28)
    closeBtn.Position = UDim2.new(1,-34,0.5,-14)
    closeBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
    closeBtn.BorderSizePixel = 0
    closeBtn.Text = "–"
    closeBtn.TextColor3 = C_WHITE
    closeBtn.Font = Enum.Font.GothamBlack
    closeBtn.TextSize = 20
    closeBtn.AutoButtonColor = false
    closeBtn.ZIndex = 50
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(1,0)

    closeBtn.MouseButton1Click:Connect(function()
        main.Visible = false
        if S.miniToggleButton then S.miniToggleButton.Visible = true end
    end)

    local contentArea = Instance.new("Frame", rightPanel)
    contentArea.Size = UDim2.new(1,0,1,-80)
    contentArea.Position = UDim2.new(0,0,0,80)
    contentArea.BackgroundTransparency = 1
    contentArea.ClipsDescendants = true

    -- Buscador
    local searchBar = Instance.new("Frame", rightPanel)
    searchBar.Size = UDim2.new(1,-20,0,28)
    searchBar.Position = UDim2.new(0,10,0,47)
    searchBar.BackgroundColor3 = Color3.fromRGB(5,5,15)
    searchBar.BorderSizePixel = 0
    Instance.new("UICorner", searchBar).CornerRadius = UDim.new(0,8)
    local searchStroke = Instance.new("UIStroke", searchBar)
    searchStroke.Color = Color3.fromRGB(120,0,200)
    searchStroke.Thickness = 1.5
    local searchBox = Instance.new("TextBox", searchBar)
    searchBox.Size = UDim2.new(1,-30,1,0)
    searchBox.Position = UDim2.new(0,28,0,0)
    searchBox.BackgroundTransparency = 1
    searchBox.Text = ""
    searchBox.PlaceholderText = "Buscar..."
    searchBox.PlaceholderColor3 = Color3.fromRGB(100,100,100)
    searchBox.TextColor3 = Color3.fromRGB(220,220,220)
    searchBox.Font = Enum.Font.Gotham
    searchBox.TextSize = 12
    searchBox.TextXAlignment = Enum.TextXAlignment.Left
    searchBox.ClearTextOnFocus = false
    local searchIcon = Instance.new("TextLabel", searchBar)
    searchIcon.Size = UDim2.new(0,26,1,0)
    searchIcon.Position = UDim2.new(0,2,0,0)
    searchIcon.BackgroundTransparency = 1
    searchIcon.Text = "🔍"
    searchIcon.TextSize = 13
    searchIcon.TextXAlignment = Enum.TextXAlignment.Center

    -- Filtrar cards al escribir
    searchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local q = searchBox.Text:lower()
        for _, pg in pairs(pages) do
            for _, child in ipairs(pg:GetChildren()) do
                if child:IsA("Frame") then
                    local lbl = child:FindFirstChildWhichIsA("TextLabel", true)
                    if lbl then
                        child.Visible = q == "" or lbl.Text:lower():find(q, 1, true) ~= nil
                    end
                end
            end
        end
    end)

    local pages = buildGui_createScrollingPages(contentArea)
    local activePage = pages["Speed"]
    activePage.Visible = true

    switchTab = function(name)
        if activePage then activePage.Visible = false end
        activePage = pages[name]
        activePage.Visible = true
        panelTitle.Text = name
        for tName, tData in pairs(tabBtns) do
            local isActive = (tName == name)
            tData.lbl.TextColor3 = isActive and Color3.fromRGB(255,255,255) or C_DIM
            tData.lbl.TextSize = isActive and 15 or 13
            tData.ind.Visible = isActive
            tData.bg.BackgroundColor3 = isActive and Color3.fromRGB(100, 0, 180) or C_CARD_BG
            tData.stroke.Color = isActive and Color3.fromRGB(200, 80, 255) or C_BORDER
            tData.stroke.Thickness = isActive and 2 or 1
            tData.stroke.Transparency = isActive and 0 or 0.4
        end
    end

    buildSpeedTab(pages)
    buildMainTab(pages)
    buildMoveTab(pages)
    buildConfigTab(pages)

    local function showGui()
        main.Visible = true
        main.Position = UDim2.new(0.5, -TOTAL_W/2, 0.5, -TOTAL_H/2 - 30)
        main.BackgroundTransparency = 1
        game:GetService("TweenService"):Create(main, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Position = UDim2.new(0.5, -TOTAL_W/2, 0.5, -TOTAL_H/2),
            BackgroundTransparency = 0
        }):Play()
        if S.miniToggleButton then S.miniToggleButton.Visible = false end
    end
    S.miniToggleButton = buildGui_createMiniToggle(gui, showGui)

    UIS.InputBegan:Connect(function(input, gpe)
        if input.UserInputType ~= Enum.UserInputType.Keyboard and input.UserInputType ~= Enum.UserInputType.Gamepad1 then return end
        local kc = input.KeyCode
        local function match(entry)
            return kc == entry.kb or (entry.gp and kc == entry.gp)
        end
        if gpe then
            if match(S.KB.GuiHide) then
                if main.Visible then
                    main.Visible = false
                    if S.miniToggleButton then S.miniToggleButton.Visible = true end
                else
                    showGui()
                end
            end
            return
        end
        if match(S.KB.DropBrainrot) then
            task.spawn(runDropBrainrot)
        elseif match(S.KB.TPFlor) then
            runTPFloor()
        elseif match(S.KB.AutoLeft) then
            S.autoLeftEnabled = not S.autoLeftEnabled
            if S.autoLeftEnabled then
                if S.autoRightEnabled then S.autoRightEnabled = false; stopAutoRight(); if S.autoRightSetVisual then S.autoRightSetVisual(false) end end
                if S.batAimbotEnabled then setBatAimbot(false) end
                startAutoLeft()
            else stopAutoLeft() end
            if S.autoLeftSetVisual then S.autoLeftSetVisual(S.autoLeftEnabled) end
            S.restartMovement(); updateFloatingButtons(); saveConfig()
        elseif match(S.KB.AutoRight) then
            S.autoRightEnabled = not S.autoRightEnabled
            if S.autoRightEnabled then
                if S.autoLeftEnabled then S.autoLeftEnabled = false; stopAutoLeft(); if S.autoLeftSetVisual then S.autoLeftSetVisual(false) end end
                if S.batAimbotEnabled then setBatAimbot(false) end
                startAutoRight()
            else stopAutoRight() end
            if S.autoRightSetVisual then S.autoRightSetVisual(S.autoRightEnabled) end
            S.restartMovement(); updateFloatingButtons(); saveConfig()
        elseif match(S.KB.AutoBat) then
            setBatAimbot(not S.batAimbotEnabled)
        elseif match(S.KB.GuiHide) then
            if main.Visible then
                main.Visible = false
                if S.miniToggleButton then S.miniToggleButton.Visible = true end
            else
                showGui()
            end
        elseif match(S.KB.SpeedToggle) then
            if S.laggerMode ~= 0 then
                S.laggerMode = 0
                if S.setLaggerVisual then S.setLaggerVisual(false) end
                updateLaggerButtonVisual()
            end
            S.speedMode = not S.speedMode
            if S.speedClk then S.speedClk(S.speedMode) end
            S.restartMovement(); updateFloatingButtons(); saveConfig()
        elseif match(S.KB.LaggerToggle) then
            if S.speedMode then
                S.speedMode = false
                if S.speedClk then S.speedClk(false) end
            end
            if S.laggerMode == 1 then
                S.laggerMode = 2
            else
                S.laggerMode = 1
            end
            updateLaggerButtonVisual()
            if S.setLaggerVisual then S.setLaggerVisual(true) end
            S.restartMovement(); updateFloatingButtons(); saveConfig()
        elseif match(S.KB.AutoTPDown) then
            S.autoTPDownEnabled = not S.autoTPDownEnabled
            if S.autoTPDownEnabled then startAutoTPDown() else stopAutoTPDown() end
            if S.autoTPDownSetVisual then S.autoTPDownSetVisual(S.autoTPDownEnabled) end
            if S.autoTPDownFloatVisual then S.autoTPDownFloatVisual(S.autoTPDownEnabled) end
            saveConfig()
        end
    end)

    showGui()
end

-- ===========================
-- PANEL FLOTANTE
-- ===========================
local function createFloatingButtonPanel()
    local panelGui = Instance.new("ScreenGui")
    panelGui.Name = "NinoHub_FloatingPanel"; panelGui.ResetOnSpawn = false
    panelGui.IgnoreGuiInset = true; panelGui.DisplayOrder = 8
    if not pcall(function() panelGui.Parent = game:GetService("CoreGui") end) then
        panelGui.Parent = LP:WaitForChild("PlayerGui")
    end
    S.floatingPanelGui = panelGui
    local panelFrame = Instance.new("Frame", panelGui)
    panelFrame.Size = UDim2.new(0,130,0,0); panelFrame.Position = UDim2.new(1,-138,0.5,-150)
    panelFrame.BackgroundColor3 = Color3.fromRGB(4,4,6); panelFrame.BackgroundTransparency = 1
    panelFrame.BorderSizePixel = 0; panelFrame.Active = true; panelFrame.ZIndex = 20
    panelFrame.AutomaticSize = Enum.AutomaticSize.Y
    Instance.new("UICorner", panelFrame).CornerRadius = UDim.new(0,14)
    S.floatingPanelFrame = panelFrame
    makeDraggable(panelFrame, true)
    local btnGrid = Instance.new("Frame", panelFrame)
    btnGrid.Size = UDim2.new(1,-8,0,0); btnGrid.Position = UDim2.new(0,4,0,20)
    btnGrid.BackgroundTransparency = 1; btnGrid.ZIndex = 21; btnGrid.AutomaticSize = Enum.AutomaticSize.Y
    local gridLayout = Instance.new("UIGridLayout", btnGrid)
    gridLayout.CellSize = UDim2.new(0.5,-4,0,62)
    gridLayout.CellPadding = UDim2.new(0,8,0,10)
    gridLayout.SortOrder = Enum.SortOrder.LayoutOrder; gridLayout.FillDirectionMaxCells = 2
    local pad = Instance.new("UIPadding", btnGrid)
    pad.PaddingLeft = UDim.new(0,2); pad.PaddingRight = UDim.new(0,2)
    pad.PaddingTop = UDim.new(0,2); pad.PaddingBottom = UDim.new(0,2)
    local PURPLE_OFF  = Color3.fromRGB(40, 10, 60)
    local PURPLE_ON   = Color3.fromRGB(120, 0, 200)
    local STROKE_OFF  = Color3.fromRGB(180, 0, 80)
    local STROKE_ON   = Color3.fromRGB(220, 0, 100)
    local TEXT_COLOR  = Color3.fromRGB(255, 255, 255)
    local function makePButton(label1, label2, order)
        local btn = Instance.new("TextButton", btnGrid)
        btn.LayoutOrder = order; btn.BackgroundColor3 = PURPLE_OFF; btn.BorderSizePixel = 0
        btn.Text = ""; btn.ZIndex = 22
        -- CÍRCULO
        Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)
        -- Borde rojo brillante
        local stroke = Instance.new("UIStroke", btn)
        stroke.Color = STROKE_OFF; stroke.Thickness = 3; stroke.Transparency = 0
        local t1 = Instance.new("TextLabel", btn)
        t1.Size = UDim2.new(1,0,0.55,0); t1.Position = UDim2.new(0,0,0.06,0)
        t1.BackgroundTransparency = 1; t1.Text = label1; t1.TextColor3 = TEXT_COLOR
        t1.Font = Enum.Font.GothamBlack; t1.TextSize = 10; t1.TextXAlignment = Enum.TextXAlignment.Center; t1.ZIndex = 23
        t1.TextStrokeTransparency = 0.4; t1.TextStrokeColor3 = Color3.fromRGB(80, 0, 120)
        local t2 = Instance.new("TextLabel", btn)
        t2.Size = UDim2.new(1,0,0.4,0); t2.Position = UDim2.new(0,0,0.55,0)
        t2.BackgroundTransparency = 1; t2.Text = label2; t2.TextColor3 = TEXT_COLOR
        t2.Font = Enum.Font.GothamBlack; t2.TextSize = 8; t2.TextXAlignment = Enum.TextXAlignment.Center; t2.ZIndex = 23
        t2.TextStrokeTransparency = 0.4; t2.TextStrokeColor3 = Color3.fromRGB(80, 0, 120)
        if label1 == "DROP" then
            t2.Visible = false
            t1.Size = UDim2.new(1,0,1,0)
            t1.Position = UDim2.new(0,0,0,0)
            t1.TextScaled = false
            t1.TextSize = 11
        end
        return btn, stroke, t1, t2
    end
    local function setButtonActive(btn, stroke, label1, label2, active)
        btn.BackgroundColor3 = active and PURPLE_ON or PURPLE_OFF
        stroke.Color = active and STROKE_ON or STROKE_OFF
        stroke.Thickness = active and 4 or 3
        stroke.Transparency = 0
        if label1 then label1.TextColor3 = TEXT_COLOR end
        if label2 then label2.TextColor3 = TEXT_COLOR end
    end
    S._setPButtonActive = setButtonActive

    local btnDROP, bsDROP, l1DROP, l2DROP = makePButton("DROP", "BRAINROT", 1)
    local btnAL, bsAL, l1AL, l2AL = makePButton("AUTO", "LEFT", 2)
    local btnBAT, bsBAT, l1BAT, l2BAT = makePButton("BAT", "AIMBOT", 3)
    local btnAR, bsAR, l1AR, l2AR = makePButton("AUTO", "RIGHT", 4)
    local btnTP, bsTP, l1TP, l2TP = makePButton("TP", "DOWN", 5)
    local btnCS, bsCS, l1CS, l2CS = makePButton("CARRY", "SPD", 6)
    local btnLAG, bsLAG, l1LAG, l2LAG = makePButton("LAGGER", "MODE", 7)
    local btnATD, bsATD, l1ATD, l2ATD = makePButton("AUTO TP", "DOWN", 8)

    S._btnAAL = btnAL; S._bsAAL = bsAL; S._l1AAL = l1AL; S._l2AAL = l2AL
    S._btnAAR = btnAR; S._bsAAR = bsAR; S._l1AAR = l1AR; S._l2AAR = l2AR
    S._btnBAT = btnBAT; S._bsBAT = bsBAT; S._l1BAT = l1BAT; S._l2BAT = l2BAT

    S._floatingButtons = {
        lagger = btnLAG, strokeLagger = bsLAG, l1Lagger = l1LAG, l2Lagger = l2LAG,
        carry = btnCS, strokeCarry = bsCS, l1Carry = l1CS, l2Carry = l2CS,
        autoLeft = btnAL, strokeAutoLeft = bsAL, l1AutoLeft = l1AL, l2AutoLeft = l2AL,
        autoRight = btnAR, strokeAutoRight = bsAR, l1AutoRight = l1AR, l2AutoRight = l2AR,
        bat = btnBAT, strokeBat = bsBAT, l1Bat = l1BAT, l2Bat = l2BAT,
        autoTPDown = btnATD, strokeAutoTPDown = bsATD, l1AutoTPDown = l1ATD, l2AutoTPDown = l2ATD,
    }

    l1LAG.Text = "LAGGER"
    l2LAG.Text = (S.laggerMode == 1 and "1") or "2"
    setButtonActive(btnLAG, bsLAG, l1LAG, l2LAG, true)
    setButtonActive(btnCS, bsCS, l1CS, l2CS, S.speedMode)
    setButtonActive(btnAL, bsAL, l1AL, l2AL, S.autoLeftEnabled)
    setButtonActive(btnAR, bsAR, l1AR, l2AR, S.autoRightEnabled)
    setButtonActive(btnBAT, bsBAT, l1BAT, l2BAT, S.batAimbotEnabled)
    setButtonActive(btnATD, bsATD, l1ATD, l2ATD, S.autoTPDownEnabled)

    S.autoTPDownFloatVisual = function(state)
        setButtonActive(btnATD, bsATD, l1ATD, l2ATD, state)
    end

    btnDROP.MouseButton1Click:Connect(function()
        setButtonActive(btnDROP, bsDROP, l1DROP, l2DROP, true)
        task.delay(0.5, function() setButtonActive(btnDROP, bsDROP, l1DROP, l2DROP, false) end)
        task.spawn(runDropBrainrot)
    end)
    btnTP.MouseButton1Click:Connect(function()
        setButtonActive(btnTP, bsTP, l1TP, l2TP, true)
        task.delay(0.35, function() setButtonActive(btnTP, bsTP, l1TP, l2TP, false) end)
        runTPFloor()
    end)
    btnBAT.MouseButton1Click:Connect(function()
        local newState = not S.batAimbotEnabled
        if newState then
            if S.autoLeftEnabled then
                S.autoLeftEnabled = false; stopAutoLeft()
                if S.autoLeftSetVisual then S.autoLeftSetVisual(false) end
                setButtonActive(btnAL, bsAL, l1AL, l2AL, false)
            end
            if S.autoRightEnabled then
                S.autoRightEnabled = false; stopAutoRight()
                if S.autoRightSetVisual then S.autoRightSetVisual(false) end
                setButtonActive(btnAR, bsAR, l1AR, l2AR, false)
            end
        end
        setBatAimbot(newState)
    end)
    btnAL.MouseButton1Click:Connect(function()
        local newState = not S.autoLeftEnabled
        if newState then
            if S.autoRightEnabled then
                S.autoRightEnabled = false; stopAutoRight()
                if S.autoRightSetVisual then S.autoRightSetVisual(false) end
                setButtonActive(btnAR, bsAR, l1AR, l2AR, false)
            end
            if S.batAimbotEnabled then setBatAimbot(false); setButtonActive(btnBAT, bsBAT, l1BAT, l2BAT, false) end
            S.autoLeftEnabled = true; startAutoLeft()
        else
            S.autoLeftEnabled = false; stopAutoLeft()
        end
        if S.autoLeftSetVisual then S.autoLeftSetVisual(newState) end
        setButtonActive(btnAL, bsAL, l1AL, l2AL, newState)
        S.restartMovement(); updateFloatingButtons(); saveConfig()
    end)
    btnAR.MouseButton1Click:Connect(function()
        local newState = not S.autoRightEnabled
        if newState then
            if S.autoLeftEnabled then
                S.autoLeftEnabled = false; stopAutoLeft()
                if S.autoLeftSetVisual then S.autoLeftSetVisual(false) end
                setButtonActive(btnAL, bsAL, l1AL, l2AL, false)
            end
            if S.batAimbotEnabled then setBatAimbot(false); setButtonActive(btnBAT, bsBAT, l1BAT, l2BAT, false) end
            S.autoRightEnabled = true; startAutoRight()
        else
            S.autoRightEnabled = false; stopAutoRight()
        end
        if S.autoRightSetVisual then S.autoRightSetVisual(newState) end
        setButtonActive(btnAR, bsAR, l1AR, l2AR, newState)
        S.restartMovement(); updateFloatingButtons(); saveConfig()
    end)
    btnLAG.MouseButton1Click:Connect(function()
        if S.laggerMode == 1 then
            S.laggerMode = 2
        else
            S.laggerMode = 1
        end
        if S.speedMode then
            S.speedMode = false
            if S.speedClk then S.speedClk(false) end
            setButtonActive(btnCS, bsCS, l1CS, l2CS, false)
        end
        updateLaggerButtonVisual()
        if S.setLaggerVisual then S.setLaggerVisual(true) end
        S.restartMovement()
        updateFloatingButtons()
        saveConfig()
    end)
    btnCS.MouseButton1Click:Connect(function()
        local newState = not S.speedMode
        if newState and S.laggerMode ~= 0 then
            S.laggerMode = 0
            if S.setLaggerVisual then S.setLaggerVisual(false) end
            updateLaggerButtonVisual()
        end
        S.speedMode = newState
        if S.speedClk then S.speedClk(newState) end
        setButtonActive(btnCS, bsCS, l1CS, l2CS, newState)
        S.restartMovement(); updateFloatingButtons(); saveConfig()
    end)
    btnATD.MouseButton1Click:Connect(function()
        local newState = not S.autoTPDownEnabled
        S.autoTPDownEnabled = newState
        if newState then startAutoTPDown() else stopAutoTPDown() end
        if S.autoTPDownSetVisual then S.autoTPDownSetVisual(newState) end
        if S.autoTPDownFloatVisual then S.autoTPDownFloatVisual(newState) end
        saveConfig()
    end)
end

local function createHUD()
    local HudGui = Instance.new("ScreenGui")
    HudGui.Name = "NinoHub_HUD"; HudGui.ResetOnSpawn = false
    HudGui.IgnoreGuiInset = true; HudGui.DisplayOrder = 15
    if not pcall(function() HudGui.Parent = game:GetService("CoreGui") end) then
        HudGui.Parent = LP:WaitForChild("PlayerGui")
    end
    S.topBarHUD = Instance.new("Frame")
    S.topBarHUD.Size = UDim2.new(0,320,0,28); S.topBarHUD.Position = UDim2.new(0.5,-160,0,55)
    S.topBarHUD.BackgroundColor3 = Color3.fromRGB(0, 0, 0); S.topBarHUD.BackgroundTransparency = 0.05
    S.topBarHUD.BorderSizePixel = 0; S.topBarHUD.Visible = true; S.topBarHUD.Parent = HudGui
    Instance.new("UICorner", S.topBarHUD).CornerRadius = UDim.new(0,7)
    local topStroke = Instance.new("UIStroke", S.topBarHUD)
    topStroke.Thickness = 2; topStroke.Color = Color3.fromRGB(0, 120, 255); topStroke.Transparency = 0
    local topLabel = Instance.new("TextLabel", S.topBarHUD)
    topLabel.Size = UDim2.new(0.5,-8,1,0)
    topLabel.Position = UDim2.new(0,8,0,0)
    topLabel.BackgroundTransparency = 1
    topLabel.Text = "FPS: 0"
    topLabel.TextColor3 = Color3.fromRGB(0, 160, 255); topLabel.Font = Enum.Font.GothamBold
    topLabel.TextSize = 13; topLabel.TextStrokeTransparency = 0.4
    topLabel.TextStrokeColor3 = Color3.fromRGB(0, 40, 120)
    topLabel.TextScaled = false; topLabel.ClipsDescendants = true
    topLabel.TextXAlignment = Enum.TextXAlignment.Left
    -- Label derecho para PING
    local pingLabel = Instance.new("TextLabel", S.topBarHUD)
    pingLabel.Size = UDim2.new(0.5,-8,1,0)
    pingLabel.Position = UDim2.new(0.5,0,0,0)
    pingLabel.BackgroundTransparency = 1
    pingLabel.Text = "PING: 0ms"
    pingLabel.TextColor3 = Color3.fromRGB(0, 160, 255); pingLabel.Font = Enum.Font.GothamBold
    pingLabel.TextSize = 13; pingLabel.TextStrokeTransparency = 0.4
    pingLabel.TextStrokeColor3 = Color3.fromRGB(0, 40, 120)
    pingLabel.TextScaled = false
    pingLabel.TextXAlignment = Enum.TextXAlignment.Right
    S.pingLabel = pingLabel
    S.progressBarFrame = Instance.new("Frame")
    S.progressBarFrame.Size = UDim2.new(0,235,0,15); S.progressBarFrame.Position = UDim2.new(0.5,-117.5,0,38)
    S.progressBarFrame.BackgroundColor3 = Color3.fromRGB(8,8,10); S.progressBarFrame.BackgroundTransparency = 0.35
    S.progressBarFrame.BorderSizePixel = 0; S.progressBarFrame.Visible = true; S.progressBarFrame.Parent = HudGui
    S.progressBarFrame.ClipsDescendants = true
    Instance.new("UICorner", S.progressBarFrame).CornerRadius = UDim.new(0,6)
    local progStroke = Instance.new("UIStroke", S.progressBarFrame)
    progStroke.Thickness = 1.1; progStroke.Color = Color3.fromRGB(255,255,255); progStroke.Transparency = 0.88
    S.progressFill = Instance.new("Frame", S.progressBarFrame)
    S.progressFill.Size = UDim2.new(0,0,1,0); S.progressFill.Position = UDim2.new(0,0,0,0)
    S.progressFill.BackgroundColor3 = Color3.fromRGB(255,255,255); S.progressFill.BorderSizePixel = 0
    Instance.new("UICorner", S.progressFill).CornerRadius = UDim.new(0,4)
    S.progressPct = Instance.new("TextLabel", S.progressBarFrame)
    S.progressPct.Size = UDim2.new(1,0,1,0); S.progressPct.BackgroundTransparency = 1
    S.progressPct.Text = "0%"; S.progressPct.TextColor3 = Color3.fromRGB(0,0,0)
    S.progressPct.Font = Enum.Font.GothamBold; S.progressPct.TextSize = 10.5; S.progressPct.TextStrokeTransparency = 0.7
    local _hudTimer = 0
    RunService.Heartbeat:Connect(function(dt)
        _hudTimer = _hudTimer + dt
        if _hudTimer >= 0.5 then
            _hudTimer = 0
            local ping = 0
            pcall(function() ping = math.floor(LP:GetNetworkPing()*1000) end)
            topLabel.Text = "FPS: "..S.currentFPS
            if S.pingLabel then S.pingLabel.Text = "PING: "..ping.."ms" end
        end
    end)
end

buildGui()
createFloatingButtonPanel()
createHUD()

local function loadConfig()
    if not safeIsfile(S.CONFIG_FILE) then return end
    local data = safeReadfile(S.CONFIG_FILE)
    if not data then return end
    local ok, cfg = pcall(function() return HS:JSONDecode(data) end)
    if not ok or type(cfg) ~= "table" then return end

    if cfg.normalSpeed then S.NS = cfg.normalSpeed; if S.normalBox then S.normalBox.Text = tostring(S.NS) end end
    if cfg.carrySpeed then S.CS = cfg.carrySpeed; if S.carryBox then S.carryBox.Text = tostring(S.CS) end end
    if cfg.laggerSpeed then S.LS = cfg.laggerSpeed; if S.laggerBox then S.laggerBox.Text = tostring(S.LS) end end
    if cfg.laggerSpeed2 then S.LS2 = cfg.laggerSpeed2; if S.lagger2Box then S.lagger2Box.Text = tostring(S.LS2) end end
    if cfg.laggerMode then S.laggerMode = cfg.laggerMode end

    if S.laggerMode == 0 then S.laggerMode = 1 end

    local function tryLoadKey(entry, kbName, gpName)
        if kbName and Enum.KeyCode[kbName] then
            entry.kb = Enum.KeyCode[kbName]; entry.gp = nil
        elseif gpName and Enum.KeyCode[gpName] then
            entry.gp = Enum.KeyCode[gpName]; entry.kb = nil
        end
    end
    if cfg.dropBrainrotKey then tryLoadKey(S.KB.DropBrainrot, cfg.dropBrainrotKey.kb, cfg.dropBrainrotKey.gp) end
    if cfg.autoLeftKey then tryLoadKey(S.KB.AutoLeft, cfg.autoLeftKey.kb, cfg.autoLeftKey.gp) end
    if cfg.autoRightKey then tryLoadKey(S.KB.AutoRight, cfg.autoRightKey.kb, cfg.autoRightKey.gp) end
    if cfg.autoBatKey then tryLoadKey(S.KB.AutoBat, cfg.autoBatKey.kb, cfg.autoBatKey.gp) end
    if cfg.tpFloorKey then tryLoadKey(S.KB.TPFlor, cfg.tpFloorKey.kb, cfg.tpFloorKey.gp) end
    if cfg.guiHideKey then tryLoadKey(S.KB.GuiHide, cfg.guiHideKey.kb, cfg.guiHideKey.gp) end
    if cfg.speedToggleKey then tryLoadKey(S.KB.SpeedToggle, cfg.speedToggleKey.kb, cfg.speedToggleKey.gp) end
    if cfg.laggerToggleKey then tryLoadKey(S.KB.LaggerToggle, cfg.laggerToggleKey.kb, cfg.laggerToggleKey.gp) end
    if cfg.autoTPDownKey then tryLoadKey(S.KB.AutoTPDown, cfg.autoTPDownKey.kb, cfg.autoTPDownKey.gp) end

    if cfg.grabRadius then S.Steal.StealRadius = cfg.grabRadius; if S.radInput then S.radInput.Text = tostring(cfg.grabRadius) end end
    if cfg.stealDuration then S.Steal.StealDuration = cfg.stealDuration; if S.stealDurationBox then S.stealDurationBox.Text = tostring(cfg.stealDuration) end end

    if cfg.autoTPDownHeightLimit then S.autoTPDownHeightLimit = cfg.autoTPDownHeightLimit; if S.autoTPDownHeightBox then S.autoTPDownHeightBox.Text = tostring(cfg.autoTPDownHeightLimit) end end
    if cfg.autoTPDownYTarget then S.autoTPDownYTarget = cfg.autoTPDownYTarget; if S.autoTPDownYTargetBox then S.autoTPDownYTargetBox.Text = tostring(cfg.autoTPDownYTarget) end end

    if cfg.antiRagdoll then toggleAntiRag(true); if S.setAntiRagVisual then S.setAntiRagVisual(true) end end
    if cfg.autoStealEnabled then S.stealActive = true; if S.setInstaGrab then S.setInstaGrab(true) end; startAutoSteal() end
    if cfg.infiniteJump and not cfg.holdJumpEnabled then S.infJumpEnabled = true; startInfiniteJump(); if S.setInfJumpVisual then S.setInfJumpVisual(true) end end
    if cfg.holdJumpEnabled then S.infJumpEnabled = false; if S.setInfJumpVisual then S.setInfJumpVisual(false) end; S.holdJumpEnabled = true; startHoldJump(); if S.setHoldJumpVisual then S.setHoldJumpVisual(true) end end
    if cfg.medusaCounter then S.medusaCounterEnabled = true; setupMedusaCounter(LP.Character); if S.setMedusaVisual then S.setMedusaVisual(true) end end
    if cfg.carryMode then S.speedMode = true; S.laggerMode = 0; if S.speedClk then S.speedClk(true) end end
    if cfg.laggerMode and cfg.laggerMode > 0 and not cfg.carryMode then
        S.laggerMode = cfg.laggerMode
        if S.setLaggerVisual then S.setLaggerVisual(true) end
    end
    if cfg.batAimbot then setBatAimbot(true) end
    if cfg.batCounter then S.batCounterEnabled = true; startBatCounter(); if S.setBatCounterVisual then S.setBatCounterVisual(true) end end
    if cfg.unwalkEnabled then S.unwalkEnabled = true; startUnwalk(); if S.setUnwalkVisual then S.setUnwalkVisual(true) end end
    if cfg.lockUI then S.lockUIEnabled = true; setUILock(true); if S.setLockUI_Visual then S.setLockUI_Visual(true) end end
    if cfg.hideOpiumButtons then S.hideOpiumButtonsEnabled = true; if S.setHideOpiumButtons then S.setHideOpiumButtons(true) end; if S.floatingPanelGui then S.floatingPanelGui.Enabled = false end end
    if cfg.fpsBoost then S.fpsBoostEnabled = true; applyFPSBoost(); if S.setFpsVisual then S.setFpsVisual(true) end end
    if cfg.galaxyMode then galaxyOn = true; updateGalaxy(); if S.setDarkVisual then S.setDarkVisual(true) end end
    if cfg.autoTPDownEnabled then S.autoTPDownEnabled = true; startAutoTPDown(); if S.autoTPDownSetVisual then S.autoTPDownSetVisual(true) end end

    if cfg.floatingPanelPos and S.floatingPanelFrame then
        local x = cfg.floatingPanelPos.X or -138
        local y = cfg.floatingPanelPos.Y or -150
        S.floatingPanelFrame.Position = UDim2.new(1, x, 0.5, y)
    end

    local fb = S._floatingButtons
    if fb.lagger then updateLaggerButtonVisual() end

    S.restartMovement()
    updateFloatingButtons()
end

task.wait(0.5); loadConfig()

task.spawn(function()
    task.wait(0.2)
    if S.antiRagdollEnabled then startAntiRagdoll() end
    if S.unwalkEnabled then startUnwalk() end
    if S.medusaCounterEnabled and LP.Character then setupMedusaCounter(LP.Character) end
    if S.batAimbotEnabled then startAimbot() end
    if S.batCounterEnabled then startBatCounter() end
    if S.infJumpEnabled then startInfiniteJump() end
    if S.holdJumpEnabled then startHoldJump() end
    if S.autoTPDownEnabled then startAutoTPDown() end
    if S.stealActive then startAutoSteal() end
    if S.fpsBoostEnabled then applyFPSBoost() end
    if galaxyOn then updateGalaxy() end
end)

if LP.Character then task.wait(0.3); S.setupSpeedBillboard(LP.Character) end

LP.CharacterAdded:Connect(function(char)
    if S.autoLeftEnabled then stopAutoLeft() end
    if S.autoRightEnabled then stopAutoRight() end
    if S.batAimbotEnabled then stopAimbot() end
    if S.batCounterEnabled then stopBatCounter() end

    if S.antiRagdollEnabled then task.wait(0.1); startAntiRagdoll() end
    if S.unwalkEnabled then task.wait(0.5); startUnwalk() end
    if S.medusaCounterEnabled then setupMedusaCounter(char) end
    task.wait(0.3)
    S.h = char:WaitForChild("Humanoid", 5)
    S.hrp = char:WaitForChild("HumanoidRootPart", 5)
    if S.h and S.hrp then S.setupSpeedBillboard(char) end
    if S.autoLeftEnabled then startAutoLeft() end
    if S.autoRightEnabled then startAutoRight() end
    if S.batAimbotEnabled then startAimbot() end
    if S.batCounterEnabled then startBatCounter() end
    S.restartMovement()
    if S.infJumpEnabled then startInfiniteJump() end
    if S.holdJumpEnabled then startHoldJump() end
    if S.autoTPDownEnabled then startAutoTPDown() end
    if S.stealActive then startAutoSteal() end
    if S.fpsBoostEnabled then
        task.wait(0.5); applyFPSBoost()
        if galaxyOn then task.wait(0.3); updateGalaxy() end
    else
        if galaxyOn then updateGalaxy() end
    end
end)

if LP.Character then
    task.spawn(function()
        local char = LP.Character
        if S.antiRagdollEnabled then startAntiRagdoll() end
        if S.unwalkEnabled then startUnwalk() end
        if S.medusaCounterEnabled then setupMedusaCounter(char) end
        S.h = char:FindFirstChildOfClass("Humanoid")
        S.hrp = char:FindFirstChild("HumanoidRootPart")
        if S.h and S.hrp then S.setupSpeedBillboard(char) end
        if S.autoLeftEnabled then startAutoLeft() end
        if S.autoRightEnabled then startAutoRight() end
        S.restartMovement()
        if S.infJumpEnabled then startInfiniteJump() end
        if S.holdJumpEnabled then startHoldJump() end
        if S.batAimbotEnabled then startAimbot() end
        if S.batCounterEnabled then startBatCounter() end
        if S.autoTPDownEnabled then startAutoTPDown() end
        if S.stealActive then startAutoSteal() end
        if S.fpsBoostEnabled then
            applyFPSBoost()
            if galaxyOn then task.wait(0.3); updateGalaxy() end
        else
            if galaxyOn then updateGalaxy() end
        end
    end)
end

-- SONGS
local SoundService = game:GetService("SoundService")
local NinoActiveSong

local function NinoPlaySong(id)
    if NinoActiveSong then
        NinoActiveSong:Stop()
        NinoActiveSong:Destroy()
    end
    local s = Instance.new("Sound")
    s.SoundId = "rbxassetid://" .. tostring(id)
    s.Volume = 1
    s.Looped = true
    s.Parent = SoundService
    s:Play()
    NinoActiveSong = s
end

local NinoSongs = {
    {"Low Cortisol",110919391228823},
    {"Tuff Song",115853391091360},
    {"Tuff a$$ song 2",89762852335338},
    {"Tuff a$$ song 3",103409564066173},
    {"RIP MY GRANNY",121252909004354},
    {"Hello Juliet",101816084223643},
    {"67 Phonk",125476440612900},
    {"Custom Song",818753792049994}
}

