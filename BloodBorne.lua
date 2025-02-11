getgenv().BloodBorne = {
    Camlock = false,
    ESP = false,
    TriggerbotActive = false, -- Control
    TriggerbotDelay = 0.01, -- Delay
    HitboxExpander = true,
    TriggerbotRange = 245 -- Rango en studs
}

local players = game:GetService("Players")
local runService = game:GetService("RunService")
local localPlayer = players.LocalPlayer
local camera = workspace.CurrentCamera
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui

local function createNotification(message)
    local notification = Instance.new("TextLabel")
    notification.Size = UDim2.new(0, 150, 0, 30)
    notification.Position = UDim2.new(0.95, -160, 0, 10)
    notification.Text = message
    notification.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    notification.BackgroundTransparency = 0.5
    notification.TextColor3 = Color3.fromRGB(255, 255, 255)
    notification.Font = Enum.Font.SourceSans
    notification.TextSize = 14
    notification.Parent = screenGui
    wait(1)
    notification:Destroy()
end

local espStorage = {}

local function createESP(player)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local highlight = Instance.new("Highlight")
        highlight.Adornee = player.Character
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.FillColor = Color3.fromRGB(200, 200, 200)
        highlight.FillTransparency = 0.6
        highlight.OutlineColor = Color3.fromRGB(50, 50, 50)
        highlight.OutlineTransparency = 0
        highlight.Parent = player.Character
        espStorage[player] = highlight
    end
end

local function toggleESP()
    getgenv().BloodBorne.ESP = not getgenv().BloodBorne.ESP
    if getgenv().BloodBorne.ESP then
        for _, player in pairs(players:GetPlayers()) do
            if player ~= localPlayer then
                createESP(player)
            end
        end
        createNotification("ESP Enabled")
    else
        for _, highlight in pairs(espStorage) do
            highlight:Destroy()
        end
        espStorage = {}
        createNotification("ESP Disabled")
    end
end

local function expandHitbox(player)
    if getgenv().BloodBorne.HitboxExpander and player.Character then
        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.Size = Vector3.new(10, 10, 10)
            hrp.Transparency = 0.5
            hrp.Material = Enum.Material.Neon
            hrp.Color = Color3.fromRGB(80, 80, 80)
        end
    end
end

local function updateHitbox()
    for _, player in pairs(players:GetPlayers()) do
        if player ~= localPlayer then
            expandHitbox(player)
        end
    end
end

runService.Heartbeat:Connect(updateHitbox)

local lockedTarget = nil

local function getClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, player in pairs(players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            local screenPoint, onScreen = camera:WorldToScreenPoint(hrp.Position)

            if onScreen then
                local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)).Magnitude
                if distance < shortestDistance then
                    closestPlayer = player
                    shortestDistance = distance
                end
            end
        end
    end

    return closestPlayer
end

runService.RenderStepped:Connect(function()
    if getgenv().BloodBorne.Camlock then
        if not lockedTarget then
            lockedTarget = getClosestPlayer()
        end

        if lockedTarget and lockedTarget.Character and lockedTarget.Character:FindFirstChild("HumanoidRootPart") then
            camera.CFrame = CFrame.new(camera.CFrame.Position, lockedTarget.Character.HumanoidRootPart.Position)

            if not lockedTarget.Character:FindFirstChild("Highlight") then
                local highlight = Instance.new("Highlight")
                highlight.Adornee = lockedTarget.Character
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.FillColor = Color3.fromRGB(139, 0, 0)
                highlight.FillTransparency = 0.3
                highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineTransparency = 0
                highlight.Parent = lockedTarget.Character
            end
        end
    elseif lockedTarget and lockedTarget.Character and lockedTarget.Character:FindFirstChild("Highlight") then
        lockedTarget.Character.Highlight:Destroy()
        lockedTarget = nil
    end
end)

-- Triggerbot con detección de enemigos dentro del rango de 245 studs
local function triggerbot()
    if getgenv().BloodBorne.TriggerbotActive then
        for _, player in pairs(players:GetPlayers()) do
            if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = player.Character.HumanoidRootPart
                local distance = (hrp.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude
                -- Verifica si está dentro del rango
                if distance <= getgenv().BloodBorne.TriggerbotRange then
                    local tool = localPlayer.Backpack:FindFirstChildOfClass("Tool")
                    if tool and tool:IsA("Tool") and tool.Parent == localPlayer.Character then
                        -- Disparo con delay
                        wait(getgenv().BloodBorne.TriggerbotDelay)
                        game:GetService("ReplicatedStorage").ShootEvent:FireServer(tool, hrp.Position)
                    end
                end
            end
        end
    end
end

runService.Heartbeat:Connect(function()
    triggerbot()
end)

local function createButton(text, position, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 120, 0, 40)
    button.Position = position
    button.Text = text
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 18
    button.Parent = screenGui
    button.AutoButtonColor = true
    button.MouseButton1Click:Connect(callback)
end

local function intro()
    local blur = Instance.new("BlurEffect")
    blur.Parent = camera
    blur.Size = 45

    local introLabel = Instance.new("TextLabel")
    introLabel.Size = UDim2.new(0, 300, 0, 50)
    introLabel.Position = UDim2.new(0.5, -150, 0.5, -25)
    introLabel.Text = "BloodBorne successfully loaded ✅"
    introLabel.BackgroundTransparency = 1
    introLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    introLabel.Font = Enum.Font.SourceSansBold
    introLabel.TextSize = 24
    introLabel.Parent = screenGui

    local betaLabel = Instance.new("TextLabel")
    betaLabel.Size = UDim2.new(0, 300, 0, 20)
    betaLabel.Position = UDim2.new(0.5, -150, 0.5, 25)
    betaLabel.Text = "This script is in Beta"
    betaLabel.BackgroundTransparency = 1
    betaLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    betaLabel.Font = Enum.Font.SourceSans
    betaLabel.TextSize = 12
    betaLabel.Parent = screenGui

    wait(5)

    blur.Size = 0
    wait(0.5)  -- Esperar a que el blur termine

    blur:Destroy()
    introLabel:Destroy()
    betaLabel:Destroy()

    -- Aparecen los botones después de que se acabe el Blur
    createButton("Toggle ESP", UDim2.new(0, 10, 0, 10), function() toggleESP() end)
    createButton("Toggle Camlock", UDim2.new(0, 10, 0, 60), function() 
        getgenv().BloodBorne.Camlock = not getgenv().BloodBorne.Camlock -- Activar/desactivar Camlock
        if getgenv().BloodBorne.Camlock then
            createNotification("Camlock Enabled")
        else
            createNotification("Camlock Disabled")
            if lockedTarget and lockedTarget.Character and lockedTarget.Character:FindFirstChild("Highlight") then
                lockedTarget.Character.Highlight:Destroy()
            end
            lockedTarget = nil
        end
    end)

    createButton("Toggle Triggerbot", UDim2.new(0, 10, 0, 110), function() 
        getgenv().BloodBorne.TriggerbotActive = not getgenv().BloodBorne.TriggerbotActive -- Activar/desactivar Triggerbot
        if getgenv().BloodBorne.TriggerbotActive then
            createNotification("Triggerbot Enabled")
        else
            createNotification("Triggerbot Disabled")
        end
    end)
end

-- Llamamos a la función de introducción
intro()