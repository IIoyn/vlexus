getgenv().VlexusHub = {
    name = "Vlexus Hub",
    version = "9.1",
    tabs = {
        "Combat",
        "Visuals",
        "Movement",
        "Rage",
        "Misc",
        "World"
    },
    colorScheme = {
        background = Color3.fromRGB(25, 25, 25),
        primary = Color3.fromRGB(50, 120, 220),
        secondary = Color3.fromRGB(220, 70, 70),
        text = Color3.fromRGB(255, 255, 255),
        highlight = Color3.fromRGB(80, 200, 120),
        slider = Color3.fromRGB(200, 200, 200)
    },
    features = {
        -- Combat
        silentAimEnabled = false,
        silentAimPrediction = 0.13444,  -- Predeterminada
        camlockEnabled = false,
        camlockPrediction = 0.1,        -- Predicción ajustable
        targetAimEnabled = false,
        rageModeEnabled = false,

        -- Visuals
        espBox = false,
        espSkeleton = false,
        espGlow = false,
        tracersEnabled = false,
        fovCircleEnabled = false,

        -- Movement
        flyEnabled = false,
        cframeSpeedEnabled = false,
        noclipEnabled = false,
        superJumpEnabled = false,
        dashesEnabled = false,
        longJumpEnabled = false,
        wallRunEnabled = false,
        crouchJumpEnabled = false,
        sprintEnabled = false,           -- Habilita sprint
        hoverboardEnabled = false,      -- Habilita hoverboard
        teleportationEnabled = false,   -- Habilita teletransportación
        speedHackEnhanced = false,      -- Speed Hack Mejorado
        teleportLocations = {
            ["Spawn"] = Vector3.new(0, 10, 0),
            ["Shop"] = Vector3.new(50, 5, 100),
        },

        -- Rage
        autoAirEnabled = false,
        fakeLagEnabled = false,
        quickTurnEnabled = false,
        antiaimEnabled = false,
        hitboxExpanderEnabled = false,  -- Activador para Hitbox Expander
        hitboxSize = 25,               -- Tamaño predeterminado de la hitbox
        maxHitboxSize = 200,           -- Tamaño máximo de la hitbox
    }
}

-- Función para crear interruptores en la UI
local function createSwitch(parent, label, value, callback)
    local switchFrame = Instance.new("Frame", parent)
    switchFrame.Size = UDim2.new(0, 200, 0, 40)
    switchFrame.BackgroundColor3 = getgenv().VlexusHub.colorScheme.background

    local labelText = Instance.new("TextLabel", switchFrame)
    labelText.Size = UDim2.new(0.7, 0, 1, 0)
    labelText.Text = label
    labelText.TextColor3 = getgenv().VlexusHub.colorScheme.text

    local switchButton = Instance.new("TextButton", switchFrame)
    switchButton.Size = UDim2.new(0.3, 0, 1, 0)
    switchButton.Text = value and "On" or "Off"
    switchButton.BackgroundColor3 = value and getgenv().VlexusHub.colorScheme.highlight or getgenv().VlexusHub.colorScheme.secondary

    switchButton.MouseButton1Click:Connect(function()
        value = not value
        switchButton.Text = value and "On" or "Off"
        switchButton.BackgroundColor3 = value and getgenv().VlexusHub.colorScheme.highlight or getgenv().VlexusHub.colorScheme.secondary
        callback(value)
    end)
end

-- Función para crear sliders
local function createSlider(parent, label, value, minValue, maxValue, callback)
    local sliderFrame = Instance.new("Frame", parent)
    sliderFrame.Size = UDim2.new(0, 200, 0, 40)
    sliderFrame.BackgroundColor3 = getgenv().VlexusHub.colorScheme.background

    local labelText = Instance.new("TextLabel", sliderFrame)
    labelText.Size = UDim2.new(0.7, 0, 1, 0)
    labelText.Text = label
    labelText.TextColor3 = getgenv().VlexusHub.colorScheme.text

    -- Barra deslizante
    local slider = Instance.new("Frame", sliderFrame)
    slider.Size = UDim2.new(0, 160, 0, 10)
    slider.BackgroundColor3 = getgenv().VlexusHub.colorScheme.primary
    slider.Position = UDim2.new(0, 35, 0, 25)

    -- Agregar el control deslizante
    local handle = Instance.new("Frame", slider)
    handle.Size = UDim2.new(0, 20, 0, 20)
    handle.Position = UDim2.new(0, value, 0, -5)
    handle.BackgroundColor3 = getgenv().VlexusHub.colorScheme.secondary
    handle.MouseDrag:Connect(function(input)
        local newX = math.clamp(input.Position.X - slider.AbsolutePosition.X, 0, 140)
        handle.Position = UDim2.new(0, newX, 0, -5)
        callback(math.floor(newX / 140 * (maxValue - minValue) + minValue))
    end)
end

-- Función de ajuste de tamaño de la hitbox
local function updateHitboxSize(size)
    local character = game.Players.LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.HipWidth = size
            humanoid.HipHeight = size
            humanoid.BodyWidthScale = 1.5
            humanoid.BodyHeightScale = 1.5
            humanoid.BodyDepthScale = 1.5
        end
    end
end

-- Función para activar/expandir la hitbox
local function hitboxExpander(enabled, size)
    if enabled then
        updateHitboxSize(size)
    else
        updateHitboxSize(1) -- Tamaño por defecto
    end
end

-- Combat Tab
local function combatTab(frame)
    createSwitch(frame, "Silent Aim", getgenv().VlexusHub.features.silentAimEnabled, function(v)
        getgenv().VlexusHub.features.silentAimEnabled = v
    end)

    createSlider(frame, "Silent Aim Prediction", getgenv().VlexusHub.features.silentAimPrediction, 0, 1, function(v)
        getgenv().VlexusHub.features.silentAimPrediction = v
    end)

    createSwitch(frame, "Camlock", getgenv().VlexusHub.features.camlockEnabled, function(v)
        getgenv().VlexusHub.features.camlockEnabled = v
    end)

    createSlider(frame, "Camlock Prediction", getgenv().VlexusHub.features.camlockPrediction, 0, 1, function(v)
        getgenv().VlexusHub.features.camlockPrediction = v
    end)

    createSwitch(frame, "Hitbox Expander", getgenv().VlexusHub.features.hitboxExpanderEnabled, function(v)
        getgenv().VlexusHub.features.hitboxExpanderEnabled = v
        hitboxExpander(v, getgenv().VlexusHub.features.hitboxSize)
    end)

    -- Ajuste de tamaño de Hitbox
    createSlider(frame, "Hitbox Size", getgenv().VlexusHub.features.hitboxSize, 25, getgenv().VlexusHub.features.maxHitboxSize, function(v)
        getgenv().VlexusHub.features.hitboxSize = v
        if getgenv().VlexusHub.features.hitboxExpanderEnabled then
            hitboxExpander(true, v)
        end
    end)
end

-- Movement Tab
local function movementTab(frame)
    createSwitch(frame, "Fly", getgenv().VlexusHub.features.flyEnabled, function(v)
        getgenv().VlexusHub.features.flyEnabled = v
    end)
    createSwitch(frame, "Speed Hack", getgenv().VlexusHub.features.cframeSpeedEnabled, function(v)
        getgenv().VlexusHub.features.cframeSpeedEnabled = v
    end)
    createSwitch(frame, "Super Jump", getgenv().VlexusHub.features.superJumpEnabled, function(v)
        getgenv().VlexusHub.features.superJumpEnabled = v
    end)
    createSwitch(frame, "Dashes", getgenv().VlexusHub.features.dashesEnabled, function(v)
        getgenv().VlexusHub.features.dashesEnabled = v
    end)
end

-- Rage Tab
local function rageTab(frame)
    createSwitch(frame, "Antiaim", getgenv().VlexusHub.features.antiaimEnabled, function(v)
        getgenv().VlexusHub.features.antiaimEnabled = v
    end)
    createSwitch(frame, "Fake Lag", getgenv().VlexusHub.features.fakeLagEnabled, function(v)
        getgenv().VlexusHub.features.fakeLagEnabled = v
    end)
    createSwitch(frame, "Quick Turn", getgenv().VlexusHub.features.quickTurnEnabled, function(v)
        getgenv().VlexusHub.features.quickTurnEnabled = v
    end)
end