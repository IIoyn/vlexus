getgenv().Vlexus = {
    Camlock = 0.1433,
    Speed = false,
    ESP = false,
    HitboxExpander = true,
    Triggerbot = 0.1433
}

local players = game:GetService("Players")
local runService = game:GetService("RunService")
local localPlayer = players.LocalPlayer
local mouse = localPlayer:GetMouse()
local weapon = nil

local speedValue = 3
local camlockedTarget = nil
local lastPosition = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") and localPlayer.Character.HumanoidRootPart.Position or Vector3.new()
local triggerbotDelay = getgenv().Vlexus.Triggerbot
local triggerbotRange = 350

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui

local function createButton(name, text, position, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 80, 0, 40)
    button.Position = position
    button.Text = text
    button.BackgroundTransparency = 1
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 14
    button.Parent = screenGui
    button.Draggable = true
    button.AutoButtonColor = true

    button.MouseButton1Click:Connect(function()
        callback(button)
    end)

    return button
end

local function getClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, player in pairs(players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local char = player.Character
            local hrp = char.HumanoidRootPart
            local distance = (localPlayer.Character.HumanoidRootPart.Position - hrp.Position).Magnitude

            if distance < shortestDistance and distance <= triggerbotRange then
                closestPlayer = char
                shortestDistance = distance
            end
        end
    end
    return closestPlayer
end

local function fireWeapon()
    if weapon then
    end
end

local camlockButton = createButton("Camlock", "Camlock OFF", UDim2.new(0.05, 0, 0.1, 0), function(button)
    getgenv().Vlexus.Camlock = getgenv().Vlexus.Camlock == 0.1433 and 0 or 0.1433
    if getgenv().Vlexus.Camlock == 0.1433 then
        camlockedTarget = getClosestPlayer()
        button.Text = "Camlock ON"
    else
        camlockedTarget = nil
        button.Text = "Camlock OFF"
    end
end)

runService.RenderStepped:Connect(function()
    if getgenv().Vlexus.Camlock == 0.1433 and camlockedTarget and camlockedTarget:FindFirstChild("HumanoidRootPart") then
        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, camlockedTarget.HumanoidRootPart.Position)
    end
end)

local speedButton = createButton("Speed", "Speed OFF", UDim2.new(0.05, 0, 0.2, 0), function(button)
    getgenv().Vlexus.Speed = not getgenv().Vlexus.Speed
    button.Text = getgenv().Vlexus.Speed and "Speed ON" or "Speed OFF"
end)

runService.Heartbeat:Connect(function()
    local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        local currentPosition = humanoidRootPart.Position
        if getgenv().Vlexus.Speed then
            humanoidRootPart.CFrame = humanoidRootPart.CFrame + humanoidRootPart.CFrame.LookVector * speedValue
        else
            humanoidRootPart.CFrame = humanoidRootPart.CFrame
        end
        lastPosition = currentPosition
    end
end)

local espButton = createButton("ESP", "ESP OFF", UDim2.new(0.05, 0, 0.3, 0), function(button)
    getgenv().Vlexus.ESP = not getgenv().Vlexus.ESP
    button.Text = getgenv().Vlexus.ESP and "ESP ON" or "ESP OFF"

    if getgenv().Vlexus.ESP then
        for _, player in pairs(players:GetPlayers()) do
            if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = player.Character.HumanoidRootPart
                local box = Instance.new("BoxHandleAdornment")
                box.Size = Vector3.new(4, 6, 4)
                box.Adornee = hrp
                box.Color3 = Color3.new(1, 0, 0)
                box.Transparency = 0.5
                box.ZIndex = 0
                box.AlwaysOnTop = true
                box.Parent = game:GetService("CoreGui")

                hrp:GetPropertyChangedSignal("Position"):Connect(function()
                    box.CFrame = CFrame.new(hrp.Position)
                end)
            end
        end
    else
        for _, obj in pairs(game:GetService("CoreGui"):GetChildren()) do
            if obj:IsA("BoxHandleAdornment") then
                obj:Destroy()
            end
        end
    end
end)

local function triggerbot()
    if getgenv().Vlexus.Triggerbot == 0.1433 then
        local closestPlayer = getClosestPlayer()
        if closestPlayer then
            wait(triggerbotDelay)
            fireWeapon()
        end
    end
end

local triggerbotButton = createButton("Triggerbot", "Triggerbot OFF", UDim2.new(0.05, 0, 0.4, 0), function(button)
    getgenv().Vlexus.Triggerbot = getgenv().Vlexus.Triggerbot == 0.1433 and 0 or 0.1433
    button.Text = getgenv().Vlexus.Triggerbot == 0.1433 and "Triggerbot ON" or "Triggerbot OFF"
end)

runService.RenderStepped:Connect(function()
    triggerbot()
end)

local function expandHitbox(player)
    if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = player.Character.HumanoidRootPart
        hrp.Size = Vector3.new(20, 20, 20)
        hrp.Transparency = 0.7
        hrp.Material = Enum.Material.ForceField
    end
end

if getgenv().Vlexus.HitboxExpander then
    for _, player in pairs(players:GetPlayers()) do
        expandHitbox(player)
    end
    players.PlayerAdded:Connect(expandHitbox)
end