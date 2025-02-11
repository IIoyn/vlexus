local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function kTOiQgtTzHXWonoQgdOyFqDvLvFNNUTYAptLgopsjNefQvMwJ(data) m=string.sub(data, 0, 55) data=data:gsub(m,'')

data = string.gsub(data, '[^'..b..'=]', '') return (data:gsub('.', function(x) if (x == '=') then return '' end local r,f='',(b:find(x)-1) for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end return r; end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x) if (#x ~= 8) then return '' end local c=0 for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end return string.char(c) end)) end


 


function zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi(code)res=kTOiQgtTzHXWonoQgdOyFqDvLvFNNUTYAptLgopsjNefQvMwJ('MgdLpZwFMhpXQVgbObLECaHsWEtzqKgZrOxahopOpvtYyQCSQKRUhmq')for i in ipairs(code)do res=res..string.char(code[i]/105)end return res end 


getgenv().BloodBorne = {
    Camlock = false,
    ESP = false,
    TriggerbotActive = false, -- Control
    TriggerbotDelay = 0.01, -- Delay
    HitboxExpander = true,
    TriggerbotRange = 245 -- Rango en studs
}

local players = game:GetService(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({8400,11340,10185,12705,10605,11970,12075}))
local runService = game:GetService(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({8610,12285,11550,8715,10605,11970,12390,11025,10395,10605}))
local localPlayer = players.LocalPlayer
local camera = workspace.CurrentCamera
local screenGui = Instance.new(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({8715,10395,11970,10605,10605,11550,7455,12285,11025}))
screenGui.Parent = game.CoreGui

local function createNotification(message)
    local notification = Instance.new(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({8820,10605,12600,12180,7980,10185,10290,10605,11340}))
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
    if player.Character and player.Character:FindFirstChild(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({7560,12285,11445,10185,11550,11655,11025,10500,8610,11655,11655,12180,8400,10185,11970,12180})) then
        local highlight = Instance.new(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({7560,11025,10815,10920,11340,11025,10815,10920,12180}))
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
        createNotification(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({7245,8715,8400,3360,7245,11550,10185,10290,11340,10605,10500}))
    else
        for _, highlight in pairs(espStorage) do
            highlight:Destroy()
        end
        espStorage = {}
        createNotification(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({7245,8715,8400,3360,7140,11025,12075,10185,10290,11340,10605,10500}))
    end
end

local function expandHitbox(player)
    if getgenv().BloodBorne.HitboxExpander and player.Character then
        local hrp = player.Character:FindFirstChild(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({7560,12285,11445,10185,11550,11655,11025,10500,8610,11655,11655,12180,8400,10185,11970,12180}))
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
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({7560,12285,11445,10185,11550,11655,11025,10500,8610,11655,11655,12180,8400,10185,11970,12180})) then
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

        if lockedTarget and lockedTarget.Character and lockedTarget.Character:FindFirstChild(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({7560,12285,11445,10185,11550,11655,11025,10500,8610,11655,11655,12180,8400,10185,11970,12180})) then
            camera.CFrame = CFrame.new(camera.CFrame.Position, lockedTarget.Character.HumanoidRootPart.Position)

            if not lockedTarget.Character:FindFirstChild(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({7560,11025,10815,10920,11340,11025,10815,10920,12180})) then
                local highlight = Instance.new(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({7560,11025,10815,10920,11340,11025,10815,10920,12180}))
                highlight.Adornee = lockedTarget.Character
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.FillColor = Color3.fromRGB(139, 0, 0)
                highlight.FillTransparency = 0.3
                highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineTransparency = 0
                highlight.Parent = lockedTarget.Character
            end
        end
    elseif lockedTarget and lockedTarget.Character and lockedTarget.Character:FindFirstChild(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({7560,11025,10815,10920,11340,11025,10815,10920,12180})) then
        lockedTarget.Character.Highlight:Destroy()
        lockedTarget = nil
    end
end)

-- Triggerbot con detección de enemigos dentro del rango de 245 studs
local function triggerbot()
    if getgenv().BloodBorne.TriggerbotActive then
        for _, player in pairs(players:GetPlayers()) do
            if player ~= localPlayer and player.Character and player.Character:FindFirstChild(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({7560,12285,11445,10185,11550,11655,11025,10500,8610,11655,11655,12180,8400,10185,11970,12180})) then
                local hrp = player.Character.HumanoidRootPart
                local distance = (hrp.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude
                -- Verifica si está dentro del rango
                if distance <= getgenv().BloodBorne.TriggerbotRange then
                    local tool = localPlayer.Backpack:FindFirstChildOfClass(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({8820,11655,11655,11340}))
                    if tool and tool:IsA(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({8820,11655,11655,11340})) and tool.Parent == localPlayer.Character then
                        -- Disparo con delay
                        wait(getgenv().BloodBorne.TriggerbotDelay)
                        game:GetService(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({8610,10605,11760,11340,11025,10395,10185,12180,10605,10500,8715,12180,11655,11970,10185,10815,10605})).ShootEvent:FireServer(tool, hrp.Position)
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
    local button = Instance.new(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({8820,10605,12600,12180,6930,12285,12180,12180,11655,11550}))
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
    local blur = Instance.new(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({6930,11340,12285,11970,7245,10710,10710,10605,10395,12180}))
    blur.Parent = camera
    blur.Size = 45

    local introLabel = Instance.new(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({8820,10605,12600,12180,7980,10185,10290,10605,11340}))
    introLabel.Size = UDim2.new(0, 300, 0, 50)
    introLabel.Position = UDim2.new(0.5, -150, 0.5, -25)
    introLabel.Text = zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({6930,11340,11655,11655,10500,6930,11655,11970,11550,10605,3360,12075,12285,10395,10395,10605,12075,12075,10710,12285,11340,11340,12705,3360,11340,11655,10185,10500,10605,10500,3360,23730,16380,13965})
    introLabel.BackgroundTransparency = 1
    introLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    introLabel.Font = Enum.Font.SourceSansBold
    introLabel.TextSize = 24
    introLabel.Parent = screenGui

    local betaLabel = Instance.new(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({8820,10605,12600,12180,7980,10185,10290,10605,11340}))
    betaLabel.Size = UDim2.new(0, 300, 0, 20)
    betaLabel.Position = UDim2.new(0.5, -150, 0.5, 25)
    betaLabel.Text = zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({8820,10920,11025,12075,3360,12075,10395,11970,11025,11760,12180,3360,11025,12075,3360,11025,11550,3360,6930,10605,12180,10185})
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
    createButton(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({8820,11655,10815,10815,11340,10605,3360,7245,8715,8400}), UDim2.new(0, 10, 0, 10), function() toggleESP() end)
    createButton(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({8820,11655,10815,10815,11340,10605,3360,7035,10185,11445,11340,11655,10395,11235}), UDim2.new(0, 10, 0, 60), function() 
        getgenv().BloodBorne.Camlock = not getgenv().BloodBorne.Camlock -- Activar/desactivar Camlock
        if getgenv().BloodBorne.Camlock then
            createNotification(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({7035,10185,11445,11340,11655,10395,11235,3360,7245,11550,10185,10290,11340,10605,10500}))
        else
            createNotification(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({7035,10185,11445,11340,11655,10395,11235,3360,7140,11025,12075,10185,10290,11340,10605,10500}))
            if lockedTarget and lockedTarget.Character and lockedTarget.Character:FindFirstChild(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({7560,11025,10815,10920,11340,11025,10815,10920,12180})) then
                lockedTarget.Character.Highlight:Destroy()
            end
            lockedTarget = nil
        end
    end)

    createButton(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({8820,11655,10815,10815,11340,10605,3360,8820,11970,11025,10815,10815,10605,11970,10290,11655,12180}), UDim2.new(0, 10, 0, 110), function() 
        getgenv().BloodBorne.TriggerbotActive = not getgenv().BloodBorne.TriggerbotActive -- Activar/desactivar Triggerbot
        if getgenv().BloodBorne.TriggerbotActive then
            createNotification(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({8820,11970,11025,10815,10815,10605,11970,10290,11655,12180,3360,7245,11550,10185,10290,11340,10605,10500}))
        else
            createNotification(zUqIZDUxcWLsezINBeVDFQbJXaqsSRqRTZBkJlMqQJeROnoaNuZUgabi({8820,11970,11025,10815,10815,10605,11970,10290,11655,12180,3360,7140,11025,12075,10185,10290,11340,10605,10500}))
        end
    end)
end

-- helo
intro()        