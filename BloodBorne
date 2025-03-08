-- Variables y Servicios
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local mouse = player:GetMouse()
local screenGui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local buttonFrame = Instance.new("Frame")
local targetPlayer = nil
local espEnabled = false
local aimlockEnabled = false
local smoothness = 0.1
local aimDistance = 500
local espBoxes = {}

-- FPS y MS en tiempo real
local fpsText = Instance.new("TextLabel")
local msText = Instance.new("TextLabel")
local lastTime = tick()
local frameCount = 0
local latency = 0

-- Crear GUI
screenGui.Name = "UniversalGUI"
screenGui.Parent = player.PlayerGui
screenGui.ResetOnSpawn = false

-- Main Frame
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0, 50, 0, 50)
mainFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Header para la GUI
local header = Instance.new("TextLabel")
header.Size = UDim2.new(1, 0, 0, 50)
header.Text = "Game Control"
header.TextSize = 24
header.TextColor3 = Color3.fromRGB(255, 255, 255)
header.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
header.Parent = mainFrame

-- Botones de opciones
buttonFrame.Size = UDim2.new(1, 0, 0, 250)
buttonFrame.Position = UDim2.new(0, 0, 0, 50)
buttonFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
buttonFrame.Parent = mainFrame

-- Botón de Aimlock
local aimlockButton = Instance.new("TextButton")
aimlockButton.Size = UDim2.new(0, 180, 0, 50)
aimlockButton.Position = UDim2.new(0.1, 0, 0.1, 0)
aimlockButton.Text = "Activar Aimlock"
aimlockButton.TextSize = 20
aimlockButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
aimlockButton.TextColor3 = Color3.fromRGB(255, 255, 255)
aimlockButton.Parent = buttonFrame

-- Botón de ESP
local espButton = Instance.new("TextButton")
espButton.Size = UDim2.new(0, 180, 0, 50)
espButton.Position = UDim2.new(0.1, 0, 0.25, 0)
espButton.Text = "Activar ESP"
espButton.TextSize = 20
espButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
espButton.TextColor3 = Color3.fromRGB(255, 255, 255)
espButton.Parent = buttonFrame

-- Función para activar y desactivar el Aimlock
aimlockButton.MouseButton1Click:Connect(function()
    aimlockEnabled = not aimlockEnabled
    if aimlockEnabled then
        aimlockButton.Text = "Desactivar Aimlock"
        print("Aimlock activado")
    else
        aimlockButton.Text = "Activar Aimlock"
        targetPlayer = nil
        print("Aimlock desactivado")
    end
end)

-- Función para activar y desactivar el ESP
espButton.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    if espEnabled then
        espButton.Text = "Desactivar ESP"
        print("ESP activado")
    else
        espButton.Text = "Activar ESP"
        for _, box in pairs(espBoxes) do
            box:Destroy()
        end
        espBoxes = {}
        print("ESP desactivado")
    end
end)

-- Función para obtener el objetivo más cercano
local function getClosestTarget()
    local closestTarget = nil
    local closestDistance = aimDistance

    for _, enemy in ipairs(Players:GetPlayers()) do
        if enemy ~= player and enemy.Character and enemy.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (enemy.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestTarget = enemy
            end
        end
    end

    return closestTarget
end

-- Función para apuntar hacia el enemigo
local function aimAtTarget(target)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        local targetPos = target.Character.HumanoidRootPart.Position
        local direction = (targetPos - player.Character.HumanoidRootPart.Position).unit
        local newCFrame = CFrame.new(player.Character.HumanoidRootPart.Position, targetPos)

        -- Aplicar suavidad en el movimiento de la cámara
        local smoothedCFrame = player.Character.HumanoidRootPart.CFrame:Lerp(newCFrame, smoothness)
        player.Character.HumanoidRootPart.CFrame = smoothedCFrame
    end
end

-- Función de actualización para Aimlock
game:GetService("RunService").RenderStepped:Connect(function()
    if aimlockEnabled then
        targetPlayer = getClosestTarget()
        if targetPlayer then
            aimAtTarget(targetPlayer)
        end
    end

    if espEnabled then
        -- Actualizar ESP para los enemigos
        for _, enemy in ipairs(Players:GetPlayers()) do
            if enemy ~= player and enemy.Character and enemy.Character:FindFirstChild("HumanoidRootPart") then
                if not espBoxes[enemy] then
                    local box = Instance.new("Frame")
                    box.Size = UDim2.new(0, 100, 0, 100)
                    box.Position = UDim2.new(0, enemy.Character.HumanoidRootPart.Position.X, 0, enemy.Character.HumanoidRootPart.Position.Y)
                    box.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                    box.BorderSizePixel = 2
                    box.Parent = screenGui
                    espBoxes[enemy] = box
                end
            end
        end
    end
end)

-- Botón de cerrar GUI
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 80, 0, 30)
closeButton.Position = UDim2.new(1, -90, 0, 10)
closeButton.Text = "Cerrar"
closeButton.TextSize = 18
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Parent = screenGui

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    print("La GUI ha sido cerrada.")
end)

-- Mostrar FPS y MS
fpsText.Size = UDim2.new(0, 200, 0, 50)
fpsText.Position = UDim2.new(0, 10, 1, -60)
fpsText.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsText.BackgroundTransparency = 1
fpsText.TextSize = 20
fpsText.Parent = screenGui

msText.Size = UDim2.new(0, 200, 0, 50)
msText.Position = UDim2.new(0, 10, 1, -120)
msText.TextColor3 = Color3.fromRGB(255, 255, 255)
msText.BackgroundTransparency = 1
msText.TextSize = 20
msText.Parent = screenGui

-- Función para calcular FPS
game:GetService("RunService").Heartbeat:Connect(function()
    frameCount = frameCount + 1
    local currentTime = tick()
    local elapsedTime = currentTime - lastTime

    -- Calcular FPS
    if elapsedTime >= 1 then
        local fps = frameCount
        fpsText.Text = "FPS: " .. fps
        frameCount = 0
        lastTime = currentTime
    end

    -- Mostrar MS (ping)
    latency = player:FindFirstChild("Ping") and player.Ping.Value or 0
    msText.Text = "MS: " .. latency
end)

-- Optimización (mejorar FPS)
RunService.Heartbeat:Connect(function()
    -- Desactivar ciertos efectos visuales (por ejemplo, las partículas innecesarias)
    game:GetService("Lighting").Technology = Enum.Technology.Legacy
end)