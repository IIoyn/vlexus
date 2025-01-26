getgenv().G = {
    n = "Vlexus Hub",
    v = "9.1",
    t = {
        "Combat", "Visuals", "Movement", "Rage", "Misc", "World"
    },
    cS = {
        b = Color3.fromRGB(25, 25, 25),
        p = Color3.fromRGB(50, 120, 220),
        s = Color3.fromRGB(220, 70, 70),
        t = Color3.fromRGB(255, 255, 255),
        h = Color3.fromRGB(80, 200, 120),
        sl = Color3.fromRGB(200, 200, 200)
    },
    f = {
        saE = false, 
        saP = 0.13444,  
        clE = false,
        clP = 0.1,
        taE = false,
        rE = false,

        esb = false, 
        ess = false, 
        esg = false,
        teE = false,
        fovE = false,

        fE = false,
        csE = false,
        neE = false,
        sjE = false,
        dsE = false,
        ljE = false,
        wrE = false,
        cjE = false,
        spE = false,          
        hbE = false,      
        tE = false,   
        sHE = false,      
        tl = {
            ["S"] = Vector3.new(0, 10, 0),
            ["Sh"] = Vector3.new(50, 5, 100),
        },

        aA = false,
        fL = false,
        qT = false,
        aaiE = false,
        hBE = false,  
        hS = 25,               
        mH = 200,           
    }
}

local function crSw(p, l, v, cb)
    local sf = Instance.new("Frame")
    sf.Size = UDim2.new(0, 200, 0, 40)
    sf.BackgroundColor3 = getgenv().G.cS.b
    sf.Parent = p

    local lT = Instance.new("TextLabel")
    lT.Size = UDim2.new(0.7, 0, 1, 0)
    lT.Text = l
    lT.TextColor3 = getgenv().G.cS.t
    lT.Parent = sf

    local sB = Instance.new("TextButton")
    sB.Size = UDim2.new(0.3, 0, 1, 0)
    sB.Text = v and "On" or "Off"
    sB.BackgroundColor3 = v and getgenv().G.cS.h or getgenv().G.cS.s
    sB.Parent = sf

    sB.MouseButton1Click:Connect(function()
        v = not v
        sB.Text = v and "On" or "Off"
        sB.BackgroundColor3 = v and getgenv().G.cS.h or getgenv().G.cS.s
        cb(v)
    end)
end

local function crSl(p, l, v, min, max, cb)
    local sf = Instance.new("Frame")
    sf.Size = UDim2.new(0, 200, 0, 40)
    sf.BackgroundColor3 = getgenv().G.cS.b
    sf.Parent = p

    local lT = Instance.new("TextLabel")
    lT.Size = UDim2.new(0.7, 0, 1, 0)
    lT.Text = l
    lT.TextColor3 = getgenv().G.cS.t
    lT.Parent = sf

    local slider = Instance.new("Frame")
    slider.Size = UDim2.new(0, 160, 0, 10)
    slider.BackgroundColor3 = getgenv().G.cS.p
    slider.Position = UDim2.new(0, 35, 0, 25)
    slider.Parent = sf

    local hndl = Instance.new("Frame")
    hndl.Size = UDim2.new(0, 20, 0, 20)
    hndl.Position = UDim2.new(0, v, 0, -5)
    hndl.BackgroundColor3 = getgenv().G.cS.s
    hndl.Parent = slider
    hndl.MouseDrag:Connect(function(i)
        local nx = math.clamp(i.Position.X - slider.AbsolutePosition.X, 0, 140)
        hndl.Position = UDim2.new(0, nx, 0, -5)
        cb(math.floor(nx / 140 * (max - min) + min))
    end)
end

local function upHS(s)
    local char = game.Players.LocalPlayer.Character
    if char then
        local h = char:FindFirstChild("Humanoid")
        if h then
            h.HipWidth = s
            h.HipHeight = s
            h.BodyWidthScale = 1.5
            h.BodyHeightScale = 1.5
            h.BodyDepthScale = 1.5
        end
    end
end

local function hbExp(e, s)
    if e then
        upHS(s)
    else
        upHS(1)
    end
end

local function crTb()
    local p = game.Players.LocalPlayer
    local sG = Instance.new("ScreenGui")
    sG.Parent = p.PlayerGui

    local mF = Instance.new("Frame")
    mF.Size = UDim2.new(0, 400, 0, 400)
    mF.BackgroundColor3 = getgenv().G.cS.b
    mF.Position = UDim2.new(0.5, -200, 0.5, -200)
    mF.Parent = sG

    local cT = Instance.new("Frame")
    cT.Size = UDim2.new(0, 380, 0, 300)
    cT.BackgroundColor3 = getgenv().G.cS.b
    cT.Position = UDim2.new(0, 10, 0, 50)
    cT.Parent = mF

    crSw(cT, "Silent Aim", getgenv().G.f.saE, function(v)
        getgenv().G.f.saE = v
    end)

    crSl(cT, "Silent Aim Prediction", getgenv().G.f.saP, 0, 1, function(v)
        getgenv().G.f.saP = v
    end)

    crSw(cT, "Camlock", getgenv().G.f.clE, function(v)
        getgenv().G.f.clE = v
    end)

    crSl(cT, "Camlock Prediction", getgenv().G.f.clP, 0, 1, function(v)
        getgenv().G.f.clP = v
    end)

    crSw(cT, "Hitbox Expander", getgenv().G.f.hBE, function(v)
        getgenv().G.f.hBE = v
        hbExp(v, getgenv().G.f.hS)
    end)
end