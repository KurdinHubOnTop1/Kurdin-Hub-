-- [[ KURDIN HUB | V8 FINAL ELITE - ALL IN ONE ]]
local p = game.Players.LocalPlayer
local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
sg.ResetOnSpawn = false

-- [ ١. مێنۆی سەرەکی ]
local Main = Instance.new("Frame", sg)
Main.Size = UDim2.new(0, 560, 0, 480); Main.Position = UDim2.new(0.5, -280, 0.5, -240)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10); Main.Active = true; Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)
local Stroke = Instance.new("UIStroke", Main)
Stroke.Thickness = 3.5; task.spawn(function() while task.wait() do Stroke.Color = Color3.fromHSV(tick()%5/5, 1, 1) end end)

-- ئاڵای کوردستان
local Flag = Instance.new("Frame", Main)
Flag.Size = UDim2.new(1, 0, 0, 45); Flag.BackgroundTransparency = 1
local function cF(clr, y) 
    local f = Instance.new("Frame", Flag); f.Size = UDim2.new(1,0,0.33,0); f.Position = UDim2.new(0,0,y,0); f.BackgroundColor3 = clr; f.BorderSizePixel = 0 
end
cF(Color3.fromRGB(255,0,0), 0); cF(Color3.fromRGB(255,255,255), 0.33); cF(Color3.fromRGB(0,150,0), 0.66)
local Sun = Instance.new("TextLabel", Flag); Sun.Size = UDim2.new(1,0,1,0); Sun.Text = "☀️"; Sun.TextColor3 = Color3.fromRGB(255,255,0); Sun.BackgroundTransparency = 1; Sun.TextSize = 25

-- [ ٢. بەشەکان ]
local Sidebar = Instance.new("Frame", Main); Sidebar.Size = UDim2.new(0, 130, 1, -70); Sidebar.Position = UDim2.new(0, 10, 0, 60); Sidebar.BackgroundTransparency = 1
local Container = Instance.new("Frame", Main); Container.Size = UDim2.new(1, -160, 1, -70); Container.Position = UDim2.new(0, 150, 0, 60); Container.BackgroundTransparency = 1

local Pages = {}
local function CreatePage(name, visible)
    local f = Instance.new("Frame", Container); f.Size = UDim2.new(1,0,1,0); f.Visible = visible; f.BackgroundTransparency = 1
    Pages[name] = f
    return f
end

local HomeP = CreatePage("Home", true); local TargetP = CreatePage("Target", false)
local GamesP = CreatePage("Games", false); local AntiP = CreatePage("Anti", false); local UpdateP = CreatePage("Update", false)

local function makeTab(name, y, page)
    local b = Instance.new("TextButton", Sidebar); b.Size = UDim2.new(1, 0, 0, 35); b.Position = UDim2.new(0, 0, 0, y)
    b.Text = name; b.BackgroundColor3 = Color3.fromRGB(25, 25, 25); b.TextColor3 = Color3.new(1,1,1); b.Font = Enum.Font.GothamBold; Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() for _,v in pairs(Pages) do v.Visible = false end page.Visible = true end)
end
makeTab("🏠 Home", 0, HomeP); makeTab("🎯 Target", 40, TargetP); makeTab("🎮 Games", 80, GamesP); makeTab("🛡️ Anti", 120, AntiP); makeTab("🔄 Update", 160, UpdateP)

-- [[ ٣. بەشی HOME (Updated) ]]
local MyImg = Instance.new("ImageLabel", HomeP); MyImg.Size = UDim2.new(0, 90, 0, 90); MyImg.Position = UDim2.new(0.5, -45, 0, 0); MyImg.Image = game.Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420); Instance.new("UICorner", MyImg).CornerRadius = UDim.new(1,0)
local Online = Instance.new("TextLabel", HomeP); Online.Size = UDim2.new(1,0,0,30); Online.Position = UDim2.new(0,0,0,110); Online.BackgroundTransparency = 1; Online.Font = Enum.Font.GothamBold; Online.TextSize = 16
task.spawn(function() while task.wait(1) do Online.Text = "Players Online: "..#game.Players:GetPlayers(); Online.TextColor3 = Color3.fromHSV(tick()%5/5, 1, 1) end end)
local DiscBtn = Instance.new("TextButton", HomeP); DiscBtn.Size = UDim2.new(0, 180, 0, 40); DiscBtn.Position = UDim2.new(0.5, -90, 0, 160); DiscBtn.Text = "Join Discord"; DiscBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242); DiscBtn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", DiscBtn)
DiscBtn.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/VmW9t84T") DiscBtn.Text = "Copied!" task.wait(2) DiscBtn.Text = "Join Discord" end)

-- [[ ٤. بەشی TARGET (Bang & Suck & View & Bring) ]]
local TBox = Instance.new("TextBox", TargetP); TBox.Size = UDim2.new(0.9,0,0,35); TBox.Position = UDim2.new(0.05,0,0,10); TBox.PlaceholderText = "@target...."; TBox.BackgroundColor3 = Color3.fromRGB(30,30,30); TBox.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", TBox)
local TargetPlayer = nil
TBox:GetPropertyChangedSignal("Text"):Connect(function() for _,v in pairs(game.Players:GetPlayers()) do if v.Name:lower():sub(1,#TBox.Text) == TBox.Text:lower() then TargetPlayer = v end end end)

local function addTog(name, y, parent, func)
    local btn = Instance.new("TextButton", parent); btn.Size = UDim2.new(0.47, 0, 0, 32); btn.Position = UDim2.new((y%2==0 and 0.02 or 0.52), 0, 0, 60 + math.floor(y/2)*38)
    btn.Text = name; btn.BackgroundColor3 = Color3.fromRGB(25,25,25); btn.TextColor3 = Color3.new(1,1,1); btn.Font = Enum.Font.Gotham; Instance.new("UICorner", btn)
    local s = Instance.new("UIStroke", btn); s.Thickness = 1.5; s.Color = Color3.fromRGB(60,60,60)
    local on = false
    btn.MouseButton1Click:Connect(function() on = not on; s.Color = on and Color3.fromRGB(0,255,150) or Color3.fromRGB(60,60,60); task.spawn(function() while on do if TargetPlayer then func(TargetPlayer) end task.wait() end end) end)
end
addTog("📍 یمص (Suck)", 0, TargetP, function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0,-0.8,-1.2) * CFrame.Angles(math.rad(40), 0, 0) task.wait(0.1) p.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,0.2) end)
addTog("🔥 بانق (Bang)", 1, TargetP, function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,1.1) task.wait(0.1) p.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-0.5) end)
addTog("👁️ مشاهدە (View)", 2, TargetP, function(t) workspace.CurrentCamera.CameraSubject = t.Character.Humanoid end)
addTog("🤝 ڕاکێشان (Bring)", 3, TargetP, function(t) t.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-2) end)
addTog("🔄 بانق بل عکسی", 4, TargetP, function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(180), 0) * CFrame.new(0,0,0.8) task.wait(0.1) p.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,0.4) end)

-- [[ ٥. بەشی GAMES (Fly & Invis & Speed & Jump) ]]
local WBox = Instance.new("TextBox", GamesP); WBox.Size = UDim2.new(0.45,0,0,30); WBox.PlaceholderText = "Speed پلەیەر"; WBox.BackgroundColor3 = Color3.fromRGB(30,30,30); WBox.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", WBox)
local JBox = Instance.new("TextBox", GamesP); JBox.Size = UDim2.new(0.45,0,0,30); JBox.Position = UDim2.new(0.5,0,0,0); JBox.PlaceholderText = "Jump پلەیەر"; JBox.BackgroundColor3 = Color3.fromRGB(30,30,30); JBox.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", JBox)
task.spawn(function() while task.wait() do p.Character.Humanoid.WalkSpeed = tonumber(WBox.Text) or 16 p.Character.Humanoid.JumpPower = tonumber(JBox.Text) or 50 end end)

local function gBtn(txt, y, func)
    local b = Instance.new("TextButton", GamesP); b.Size = UDim2.new(0.9,0,0,32); b.Position = UDim2.new(0.05,0,0,y); b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(30,30,30); b.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(func)
end
gBtn("🚀 Kurdin Hub Fly", 40, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.lua"))() end)
gBtn("👻 inv (Invisible)", 75, function() p.Character:BreakJoints() end)

-- [[ ٦. بەشی ANTI & UPDATE (وەک ئەوەی ویستت) ]]
addTog("🛡️ Anti-Bang/Fling", 0, AntiP, function() p.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0) end)
local UpFrame = Instance.new("Frame", UpdateP); UpFrame.Size = UDim2.new(0.9, 0, 0.6, 0); UpFrame.Position = UDim2.new(0.05, 0, 0.1, 0); UpFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15); Instance.new("UICorner", UpFrame)
local US = Instance.new("UIStroke", UpFrame); US.Thickness = 3; task.spawn(function() while task.wait() do US.Color = Color3.fromHSV(tick()%5/5, 1, 1) end end)
local UT = Instance.new("TextLabel", UpFrame); UT.Size = UDim2.new(1, -20, 1, -20); UT.Position = UDim2.new(0, 10, 0, 10); UT.BackgroundTransparency = 1; UT.TextColor3 = Color3.new(1,1,1); UT.TextSize = 13; UT.Text = "📢 ئەپدیت / هەموو جومعە یان هەینی ئەپدیت دەکرێتەوە\n\nبۆ زانیاری زیاتر جۆینی دیسکۆرد بکەن!"

-- [ ٧. دوگمەی کردنەوە و داخستن ]
local Open = Instance.new("TextButton", sg); Open.Size = UDim2.new(0, 50, 0, 50); Open.Position = UDim2.new(0, 10, 0.5, 0); Open.Text = "U"; Open.BackgroundColor3 = Color3.fromRGB(15,15,15); Open.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", Open).CornerRadius = UDim.new(1,0)
Open.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)
-- [[ 🔄 بەشی UPDATE - Kurdin Hub ]]

local UpFrame = Instance.new("Frame", UpdateP)
UpFrame.Size = UDim2.new(0.9, 0, 0.7, 0)
UpFrame.Position = UDim2.new(0.05, 0, 0.15, 0)
UpFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Instance.new("UICorner", UpFrame).CornerRadius = UDim.new(0, 12)

-- ستڕۆکە ڕەنگاوڕەنگەکە (Neon RGB Stroke)
local UpStroke = Instance.new("UIStroke", UpFrame)
UpStroke.Thickness = 3
task.spawn(function() 
    while UpFrame.Parent do 
        UpStroke.Color = Color3.fromHSV(tick()%5/5, 1, 1) 
        task.wait() 
    end 
end)

local UpText = Instance.new("TextLabel", UpFrame)
UpText.Size = UDim2.new(1, -20, 1, -20)
UpText.Position = UDim2.new(0, 10, 0, 10)
UpText.BackgroundTransparency = 1
UpText.TextColor3 = Color3.new(1, 1, 1)
UpText.Font = Enum.Font.GothamBold
UpText.TextSize = 15
UpText.TextWrapped = true
UpText.TextXAlignment = Enum.TextXAlignment.Center

-- ئەو دەقانەی کە داوات کردبوو
UpText.Text = [[
📢 زانیاری ئەپدیت / Update Info

- هەموو جومعە یان هەینی ئەپدیت دەکرێتەوە.
- بەشی Target بە تەواوی چاککرا (Suck, Bang, View).
- بەشی Anti و Games و فڕینی کوردی زیاد کرا.
- سیستەمی ئاگادارکردنەوەی لێفت کردن چالاک کرا.

بۆ زانیاری زیاتر و وەرگرتنی سکریپتی نوێ
جۆینی دیسکۆردەکەمان بکە!
]]

-- هێڵێکی جوڵاو بۆ جوانی زیاتر لە خوارەوە
local UnderLine = Instance.new("Frame", UpFrame)
UnderLine.Size = UDim2.new(0.6, 0, 0, 2)
UnderLine.Position = UDim2.new(0.2, 0, 0.9, 0)
task.spawn(function() 
    while UpFrame.Parent do 
        UnderLine.BackgroundColor3 = Color3.fromHSV(tick()%5/5, 1, 1) 
        task.wait() 
    end 
end)
-- [[ ⚠️ KURDIN HUB - NEON LEAVE NOTIFICATION SYSTEM ]]

game.Players.PlayerRemoving:Connect(function(player)
    local notifyFrame = Instance.new("Frame", sg) -- دڵنیابە sg ناوی ScreenGui ـەکەتە
    notifyFrame.Size = UDim2.new(0, 280, 0, 85)
    notifyFrame.Position = UDim2.new(1, -290, 0.1, 0)
    notifyFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Instance.new("UICorner", notifyFrame).CornerRadius = UDim.new(0, 12)
    
    -- نیۆن و ستڕۆک (Neon Stroke)
    local ns = Instance.new("UIStroke", notifyFrame)
    ns.Thickness = 2.5
    task.spawn(function()
        while notifyFrame.Parent do
            ns.Color = Color3.fromHSV(tick()%5/5, 1, 1) -- ڕەنگی جوڵاو
            task.wait()
        end
    end)

    -- وێنەی ئەڤتاری یاریزانەکە
    local img = Instance.new("ImageLabel", notifyFrame)
    img.Size = UDim2.new(0, 60, 0, 60)
    img.Position = UDim2.new(0, 10, 0.5, -30)
    img.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    img.Image = "rbxthumb://type=AvatarHeadShot&id="..player.UserId.."&w=150&h=150"
    Instance.new("UICorner", img).CornerRadius = UDim.new(1, 0)
    local imgS = Instance.new("UIStroke", img)
    imgS.Thickness = 1.5
    imgS.Color = Color3.fromRGB(255, 255, 255)

    -- ناوی سیستم لە سەرەوە
    local Title = Instance.new("TextLabel", notifyFrame)
    Title.Size = UDim2.new(0, 190, 0, 20)
    Title.Position = UDim2.new(0, 80, 0, 10)
    Title.Text = "System Kurdin Hub ☀️"
    Title.TextColor3 = Color3.fromRGB(255, 255, 0) -- ڕەنگی زەرد وەک خۆرەکە
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 14
    Title.BackgroundTransparency = 1
    Title.TextXAlignment = Enum.TextXAlignment.Left

    -- دەقی لێفت کردن (Username & Display)
    local txt = Instance.new("TextLabel", notifyFrame)
    txt.Size = UDim2.new(0, 190, 0, 45)
    txt.Position = UDim2.new(0, 80, 0, 30)
    txt.Text = "پلەیرەکە لە یاریەکە لێفتی کرد بە ناوی:\n" .. "D: " .. player.DisplayName .. "\nU: @" .. player.Name
    txt.TextColor3 = Color3.new(1, 1, 1)
    txt.TextSize = 11
    txt.BackgroundTransparency = 1
    txt.Font = Enum.Font.GothamBold
    txt.TextXAlignment = Enum.TextXAlignment.Left
    txt.TextYAlignment = Enum.TextYAlignment.Top

    -- هێڵی نیۆنی خوارەوە
    local bar = Instance.new("Frame", notifyFrame)
    bar.Size = UDim2.new(1, 0, 0, 3)
    bar.Position = UDim2.new(0, 0, 1, -3)
    Instance.new("UICorner", bar)
    task.spawn(function()
        while notifyFrame.Parent do
            bar.BackgroundColor3 = Color3.fromHSV(tick()%5/5, 1, 1)
            task.wait()
        end
    end)

    -- دوای ٧ چرکە وەک سێبەر ون دەبێت
    task.wait(7)
    if notifyFrame then
        for i = 0, 1, 0.1 do
            if not notifyFrame then break end
            notifyFrame.BackgroundTransparency = i
            Title.TextTransparency = i
            txt.TextTransparency = i
            img.ImageTransparency = i
            task.wait(0.05)
        end
        notifyFrame:Destroy()
    end
end)
