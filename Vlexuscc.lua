getgenv().VlexusHub = {
    name = "Vlexus Hub",
    version = "6.5",
    tabs = {
        "Aimbot",
        "Visuals",
        "Movement",
        "Misc",
        "World"
    },
    colorScheme = {
        background = Color3.fromRGB(20, 20, 20),
        primary = Color3.fromRGB(31, 131, 255),
        secondary = Color3.fromRGB(255, 85, 85),
        text = Color3.fromRGB(255, 255, 255),
        highlight = Color3.fromRGB(0, 255, 0),
        slider = Color3.fromRGB(200, 200, 200)
    },
    features = {
        aimbotEnabled = false,
        fovCircleEnabled = false,
        silentAimEnabled = false,
        espEnabled = false,
        skeletonEsp = false,
        boxEsp = false,
        glowEsp = false,
        healthBarEnabled = false,
        flyEnabled = false,
        noClipEnabled = false,
        speedHackEnabled = false,
        bunnyHopEnabled = false,
        fakeLagEnabled = false,
        atmosphereModifier = false,
        customFogEnabled = false,
        hitmarkerEnabled = true,
        ragdollEnabled = true,
        rapidFireEnabled = false,
        autoAirEnabled = false,
        customThemeEnabled = true,
    }
}

-- Función para crear un switch de encendido/apagado
local function createSwitch(parent, label, value, callback)
    local switchFrame = Instance.new("Frame", parent)
    switchFrame.Size = UDim2.new(0, 200, 0, 40)
    switchFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

    local labelText = Instance.new("TextLabel", switchFrame)
    labelText.Size = UDim2.new(0.7, 0, 1, 0)
    labelText.Text = label
    labelText.TextColor3 = Color3.fromRGB(255, 255, 255)

    local switchButton = Instance.new("TextButton", switchFrame)
    switchButton.Size = UDim2.new(0.3, 0, 1, 0)
    switchButton.Text = value and "On" or "Off"
    switchButton.BackgroundColor3 = value and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)

    switchButton.MouseButton1Click:Connect(function()
        value = not value
        switchButton.Text = value and "On" or "Off"
        switchButton.BackgroundColor3 = value and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        callback(value)
    end)
end

-- Función para habilitar el Auto Air con retraso
local autoAirConnection
local function enableAutoAir(enabled)
    local player = game.Players.LocalPlayer
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    
    if enabled then
        if not autoAirConnection then
            autoAirConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if humanoid and humanoid.FloorMaterial == Enum.Material.Air then
                    wait(0.45)
                    if humanoid.FloorMaterial == Enum.Material.Air then
                        local tool = player.Character:FindFirstChildOfClass("Tool")
                        if tool and tool:FindFirstChild("Activate") then
                            tool.Activate()
                        end
                    end
                end
            end)
        end
    else
        if autoAirConnection then
            autoAirConnection:Disconnect()
            autoAirConnection = nil
        end
    end
end

-- Función para habilitar el Rapid Fire con un retraso de 0.2 segundos
local rapidFireConnection
local function enableRapidFire(enabled)
    local player = game.Players.LocalPlayer
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    
    if enabled then
        if not rapidFireConnection then
            rapidFireConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if humanoid and humanoid.Health > 0 then
                    wait(0.2) -- Delay de 0.2 segundos
                    local tool = player.Character:FindFirstChildOfClass("Tool")
                    if tool and tool:FindFirstChild("Activate") then
                        tool.Activate()
                    end
                end
            end)
        end
    else
        if rapidFireConnection then
            rapidFireConnection:Disconnect()
            rapidFireConnection = nil
        end
    end
end

-- Función para crear las pestañas
local function loadTabs(parentFrame)
    local TabContainer = Instance.new("Frame", parentFrame)
    TabContainer.Size = UDim2.new(0.25, 0, 1, -50)
    TabContainer.Position = UDim2.new(0, 0, 0, 50)
    TabContainer.BackgroundColor3 = getgenv().VlexusHub.colorScheme.primary

    local TabUICorner = Instance.new("UICorner", TabContainer)
    TabUICorner.CornerRadius = UDim.new(0, 12)

    local ContentFrame = Instance.new("Frame", parentFrame)
    ContentFrame.Size = UDim2.new(0.75, 0, 1, -50)
    ContentFrame.Position = UDim2.new(0.25, 0, 0, 50)
    ContentFrame.BackgroundColor3 = getgenv().VlexusHub.colorScheme.background
    local ContentUICorner = Instance.new("UICorner", ContentFrame)
    ContentUICorner.CornerRadius = UDim.new(0, 12)

    -- Crear botones para las pestañas
    for i, tabName in ipairs(getgenv().VlexusHub.tabs) do
        local TabButton = Instance.new("TextButton", TabContainer)
        TabButton.Size = UDim2.new(1, 0, 0, 40)
        TabButton.Position = UDim2.new(0, 0, 0, (i - 1) * 45)
        TabButton.Text = tabName
        TabButton.Font = Enum.Font.Gotham
        TabButton.TextColor3 = getgenv().VlexusHub.colorScheme.text
        TabButton.BackgroundColor3 = getgenv().VlexusHub.colorScheme.background

        TabButton.MouseButton1Click:Connect(function()
            for _, child in pairs(ContentFrame:GetChildren()) do
                child:Destroy()
            end

            -- Contenido de cada pestaña
            if tabName == "Aimbot" then
                createSwitch(ContentFrame, "Enable Aimbot", getgenv().VlexusHub.features.aimbotEnabled, function(value)
                    getgenv().VlexusHub.features.aimbotEnabled = value
                end)
                createSwitch(ContentFrame, "Enable FOV Circle", getgenv().VlexusHub.features.fovCircleEnabled, function(value)
                    getgenv().VlexusHub.features.fovCircleEnabled = value
                end)
                createSwitch(ContentFrame, "Enable Silent Aim", getgenv().VlexusHub.features.silentAimEnabled, function(value)
                    getgenv().VlexusHub.features.silentAimEnabled = value
                end)
            elseif tabName == "Visuals" then
                createSwitch(ContentFrame, "Enable ESP", getgenv().VlexusHub.features.espEnabled, function(value)
                    getgenv().VlexusHub.features.espEnabled = value
                end)
                createSwitch(ContentFrame, "Enable Skeleton ESP", getgenv().VlexusHub.features.skeletonEsp, function(value)
                    getgenv().VlexusHub.features.skeletonEsp = value
                end)
                createSwitch(ContentFrame, "Enable Glow ESP", getgenv().VlexusHub.features.glowEsp, function(value)
                    getgenv().VlexusHub.features.glowEsp = value
                end)
            elseif tabName == "Movement" then
                createSwitch(ContentFrame, "Enable Fly", getgenv().VlexusHub.features.flyEnabled, function(value)
                    getgenv().VlexusHub.features.flyEnabled = value
                end)
                createSwitch(ContentFrame, "Enable SpeedHack", getgenv().VlexusHub.features.speedHackEnabled, function(value)
                    getgenv().VlexusHub.features.speedHackEnabled = value
                end)
                createSwitch(ContentFrame, "Enable Rapid Fire", getgenv().VlexusHub.features.rapidFireEnabled, function(value)
                    getgenv().VlexusHub.features.rapidFireEnabled = value
                    enableRapidFire(value)
                end)
                createSwitch(ContentFrame, "Enable Auto Air", getgenv().VlexusHub.features.autoAirEnabled, function(value)
                    getgenv().VlexusHub.features.autoAirEnabled = value
                    enableAutoAir(value)
                end)
            elseif tabName == "Misc" then
                createSwitch(ContentFrame, "Enable Fake Lag", getgenv().VlexusHub.features.fakeLagEnabled, function(value)
                    getgenv().VlexusHub.features.fakeLagEnabled = value
                end)
                createSwitch(ContentFrame, "Enable Ragdoll", getgenv().VlexusHub.features.ragdollEnabled, function(value)
                    getgenv().VlexusHub.features.ragdollEnabled = value
                end)
            elseif tabName == "World" then
                createSwitch(ContentFrame, "Modify Atmosphere", getgenv().VlexusHub.features.atmosphereModifier, function(value)
                    getgenv().VlexusHub.features.atmosphereModifier = value
                end)
            end
        end)
    end

    return ContentFrame
end

-- Inicializar la GUI y las funcionalidades
local function createGui()
    local VlexusGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0.4, 0, 0.6, 0)
    MainFrame.Position = UDim2.new(0.3,