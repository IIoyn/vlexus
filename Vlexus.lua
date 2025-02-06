getgenv().Config = {
    a = "vlexus.lua",
    b = "9.1",
    c = { "Combat", "Visuals", "Movement", "Rage", "Misc", "World" },
    d = {
        e = Color3.fromRGB(25, 25, 25),
        f = Color3.fromRGB(50, 120, 220),
        g = Color3.fromRGB(220, 70, 70),
        h = Color3.fromRGB(255, 255, 255),
        i = Color3.fromRGB(80, 200, 120),
        j = Color3.fromRGB(200, 200, 200)
    },
    k = {
        l = false,
        m = 0.13444,
        n = false,
        o = 0.1
    }
}

getgenv().Stile = {
    p = { q = "yes" },
    r = {
        s = true,
        t = 10,
        u = Color3.fromRGB(209, 206, 255),
        v = 0.7,
    },
    w = {
        x = {
            y = true,
            z = true,
            aa = Color3.fromRGB(209, 206, 255),
            ab = true,
            ac = Color3.fromRGB(209, 206, 255),
        },
    },
}

for _, _ in pairs(game.CoreGui:GetChildren()) do
    if _.Name == "vlexus.lua" then
        _.Destroy()
    end
end

local a1 = Instance.new("ScreenGui")
local a2 = Instance.new("Frame")
local a3 = Instance.new("Frame")
local a4 = Instance.new("UIGradient")
local a5 = Instance.new("Frame")
local a6 = Instance.new("ImageButton")
local a7 = Instance.new("UIGridLayout")
local a8 = Instance.new("ImageButton")
local a9 = Instance.new("ImageButton")
local a10 = Instance.new("ImageButton")
local a11 = Instance.new("ImageButton")
local a12 = Instance.new("ImageButton")
local a13 = Instance.new("ImageButton")
local a14 = Instance.new("ImageButton")
local a15 = Instance.new("Frame")
local a16 = Instance.new("Frame")
local a17 = Instance.new("TextLabel")
local a18 = Instance.new("Frame")
local a19 = Instance.new("TextLabel")
local a20 = Instance.new("TextButton")
local a21 = Instance.new("TextLabel")
local a22 = Instance.new("Frame")
local a23 = Instance.new("Frame")
local a24 = Instance.new("TextLabel")
local a25 = Instance.new("Frame")
local a26 = Instance.new("TextLabel")
local a27 = Instance.new("TextButton")
local a28 = Instance.new("TextLabel")
local a29 = Instance.new("TextLabel")
local a30 = Instance.new("TextButton")

a1.Name = "vlexus.lua"
a1.Parent = game.CoreGui
a1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

a2.Name = "Panel"
a2.Parent = a1
a2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
a2.BorderSizePixel = 0
a2.Position = UDim2.new(0, 439, 0, 96)
a2.Size = UDim2.new(0, 800, 0, 650)

a3.Name = "Gradient"
a3.Parent = a2
a3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
a3.BorderSizePixel = 0
a3.Position = UDim2.new(0, 10, 0, 10)
a3.Size = UDim2.new(0, 780, 0, 3)

a4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(14, 163, 180)), ColorSequenceKeypoint.new(0.26, Color3.fromRGB(25, 96, 184)), ColorSequenceKeypoint.new(0.52, Color3.fromRGB(169, 21, 255)), ColorSequenceKeypoint.new(0.77, Color3.fromRGB(190, 202, 20)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(243, 255, 25))}
a4.Parent = a3

a5.Name = "Sections"
a5.Parent = a2
a5.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
a5.BorderSizePixel = 0
a5.Position = UDim2.new(0, 10, 0, 15)
a5.Size = UDim2.new(0, 110, 0, 625)

a6.Name = "AimbotTab"
a6.Parent = a5
a6.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
a6.BorderSizePixel = 0
a6.Position = UDim2.new(0.0454545468, 0, 0, 0)
a6.Size = UDim2.new(0, 100, 0, 85)
a6.Image = "rbxassetid://12977951813"
a6.ImageColor3 = Color3.fromRGB(200, 200, 200)
a6.ScaleType = Enum.ScaleType.Crop

a7.Name = "Layout"
a7.Parent = a5
a7.HorizontalAlignment = Enum.HorizontalAlignment.Center
a7.SortOrder = Enum.SortOrder.LayoutOrder
a7.VerticalAlignment = Enum.VerticalAlignment.Bottom
a7.CellPadding = UDim2.new(0, 0, 0, 5)
a7.CellSize = UDim2.new(0, 100, 0, 84)

loadstring(game:HttpGet("https://raw.githubusercontent.com/IIoyn/vlexus/main/Vlexus.lua"))()