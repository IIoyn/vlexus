getgenv().Vlexuscc = {
    enabled = true,
    name = "Vlexus",
    version = "4.0",
    colorScheme = {
        background = Color3.fromRGB(30, 30, 30),
        primary = Color3.fromRGB(85, 255, 255),
        secondary = Color3.fromRGB(255, 0, 0),
        text = Color3.fromRGB(255, 255, 255),
        active = Color3.fromRGB(50, 200, 50),
        inactive = Color3.fromRGB(80, 80, 80)
    },
    features = {
        flyEnabled = false,
        cframeEnabled = false,
        godModeEnabled = false,
        autoKillEnabled = false,
        hitboxExpanderEnabled = false,
        hitboxSize = 50,
        predictionEnabled = false,
        camlockEnabled = false,
        silentAimEnabled = false,
        silentAimFov = 50,
        triggerbotEnabled = false,
        predictionFov = 75,
        espEnabled = false,
        chamEnabled = false,
        fogEnabled = false,
        boxEspEnabled = false,
        lineEspEnabled = false,
        nameEspEnabled = false,
        healthBarEspEnabled = false,
        distanceEspEnabled = false,
        weaponEspEnabled = false,
        noRecoilEnabled = false,
        autoHealthEnabled = false,
        fastWalkEnabled = false,
        noClipEnabled = false,
        antiLockEnabled = false,
        desyncEnabled = false,
        fakeLagEnabled = false
    },
    keybinds = {
        flyKey = Enum.KeyCode.F,
        camlockKey = Enum.KeyCode.G,
        silentAimKey = Enum.KeyCode.H,
        triggerbotKey = Enum.KeyCode.J
    }
}

local VlexusHubGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
VlexusHubGui.Name = "VlexusHub"

local MainFrame = Instance.new("Frame", VlexusHubGui)
MainFrame.Size = UDim2.new(0, 500, 0, 900)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -450)
MainFrame.BackgroundColor3 = getgenv().Vlexuscc.colorScheme.background
MainFrame.BorderSizePixel = 0
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 10)

local TitleLabel = Instance.new("TextLabel", MainFrame)
TitleLabel.Size = UDim2.new(1, 0, 0, 60)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 24
TitleLabel.TextColor3 = getgenv().Vlexuscc.colorScheme.text
TitleLabel.Text = "Vlexus Hub - " .. getgenv().Vlexuscc.name
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center

-- Function to create a feature button
local function createFeatureButton(text, position, parent, callback)
    local button = Instance.new("TextButton", parent)
    button.Size = UDim2.new(0.8, 0, 0, 40)
    button.Position = position
    button.Text = text
    button.Font = Enum.Font.Gotham
    button.TextSize = 18
    button.TextColor3 = getgenv().Vlexuscc.colorScheme.text
    button.BackgroundColor3 = getgenv().Vlexuscc.colorScheme.primary

    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(60, 60, 140)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = getgenv().Vlexuscc.colorScheme.primary
    end)

    button.MouseButton1Click:Connect(callback)
    return button
end

-- Create categories
local lockSectionFrame = Instance.new("Frame", MainFrame)
lockSectionFrame.Size = UDim2.new(1, 0, 0, 180)
lockSectionFrame.Position = UDim2.new(0, 0, 0.1, 0)
lockSectionFrame.BackgroundTransparency = 1

local lockTitleLabel = Instance.new("TextLabel", lockSectionFrame)
lockTitleLabel.Size = UDim2.new(1, 0, 0, 30)
lockTitleLabel.BackgroundTransparency = 1
lockTitleLabel.Text = "Lock Features"
lockTitleLabel.Font = Enum.Font.GothamBold
lockTitleLabel.TextColor3 = getgenv().Vlexuscc.colorScheme.text
lockTitleLabel.TextSize = 18

-- Add buttons to the Lock category
local camlockButton = createFeatureButton("Camlock", UDim2.new(0.1, 0, 0.2, 0), lockSectionFrame, function()
    getgenv().Vlexuscc.features.camlockEnabled = not getgenv().Vlexuscc.features.camlockEnabled
    print("Camlock: " .. (getgenv().Vlexuscc.features.camlockEnabled and "Enabled" or "Disabled"))
end)

local silentAimButton = createFeatureButton("Silent Aim", UDim2.new(0.1, 0, 0.3, 0), lockSectionFrame, function()
    getgenv().Vlexuscc.features.silentAimEnabled = not getgenv().Vlexuscc.features.silentAimEnabled
    print("Silent Aim: " .. (getgenv().Vlexuscc.features.silentAimEnabled and "Enabled" or "Disabled"))
end)

local predictionButton = createFeatureButton("Prediction", UDim2.new(0.1, 0, 0.4, 0), lockSectionFrame, function()
    getgenv().Vlexuscc.features.predictionEnabled = not getgenv().Vlexuscc.features.predictionEnabled
    print("Prediction: " .. (getgenv().Vlexuscc.features.predictionEnabled and "Enabled" or "Disabled"))
end)

-- Rage Category
local rageSectionFrame = Instance.new("Frame", MainFrame)
rageSectionFrame.Size = UDim2.new(1, 0, 0, 180)
rageSectionFrame.Position = UDim2.new(0, 0, 0.3, 0)
rageSectionFrame.BackgroundTransparency = 1

local rageTitleLabel = Instance.new("TextLabel", rageSectionFrame)
rageTitleLabel.Size = UDim2.new(1, 0, 0, 30)
rageTitleLabel.BackgroundTransparency = 1
rageTitleLabel.Text = "Rage Features"
rageTitleLabel.Font = Enum.Font.GothamBold
rageTitleLabel.TextColor3 = getgenv().Vlexuscc.colorScheme.text
rageTitleLabel.TextSize = 18

-- Add buttons to the Rage category
local flyButton = createFeatureButton("Fly", UDim2.new(0.1, 0, 0.2, 0), rageSectionFrame, function()
    getgenv().Vlexuscc.features.flyEnabled = not getgenv().Vlexuscc.features.flyEnabled
    print("Fly: " .. (getgenv().Vlexuscc.features.flyEnabled and "Enabled" or "Disabled"))
end)

local cframeButton = createFeatureButton("CFrame", UDim2.new(0.1, 0, 0.3, 0), rageSectionFrame, function()
    getgenv().Vlexuscc.features.cframeEnabled = not getgenv().Vlexuscc.features.cframeEnabled
    print("CFrame: " .. (getgenv().Vlexuscc.features.cframeEnabled and "Enabled" or "Disabled"))
end)

local autoKillButton = createFeatureButton("Auto Kill", UDim2.new(0.1, 0, 0.4, 0), rageSectionFrame, function()
    getgenv().Vlexuscc.features.autoKillEnabled = not getgenv().Vlexuscc.features.autoKillEnabled
    print("Auto Kill: " .. (getgenv().Vlexuscc.features.autoKillEnabled and "Enabled" or "Disabled"))
end)

-- Visuals Category
local visualsSectionFrame = Instance.new("Frame", MainFrame)
visualsSectionFrame.Size = UDim2.new(1, 0, 0, 180)
visualsSectionFrame.Position = UDim2.new(0, 0, 0.5, 0)
visualsSectionFrame.BackgroundTransparency = 1

local visualsTitleLabel = Instance.new("TextLabel", visualsSectionFrame)
visualsTitleLabel.Size = UDim2.new(1, 0, 0, 30)
visualsTitleLabel.BackgroundTransparency = 1
visualsTitleLabel.Text = "Visual Features"
visualsTitleLabel.Font = Enum.Font.GothamBold
visualsTitleLabel.TextColor3 = getgenv().Vlexuscc.colorScheme.text
visualsTitleLabel.TextSize = 18

-- Add buttons to the Visuals category
local espButton = createFeatureButton("ESP", UDim2.new(0.1, 0, 0.2, 0), visualsSectionFrame, function()
    getgenv().Vlexuscc.features.espEnabled = not getgenv().
