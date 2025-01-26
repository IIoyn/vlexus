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
VlexusHubGui.Name = "VlexusCC"
VlexusHubGui.Parent = game:GetService("CoreGui")

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

local lockSectionFrame = Instance.new("Frame", MainFrame)
lockSectionFrame.Size = UDim2.new(1, 0, 0, 180)
lockSectionFrame.Position = UDim2.new(0, 0, 0.1, 0)
lockSectionFrame.BackgroundTransparency = 1

local lockTitleLabel = Instance.new("TextLabel", lockSectionFrame)
lockTitleLabel.Size = UDim2.new(1, 0, 0, 30)
lockTitleLabel.BackgroundTransparency = 1
