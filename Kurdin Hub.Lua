-- [[ KURDIN HUB | FULL ELITE SCRIPT ]]
local p = game.Players.LocalPlayer
local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
sg.ResetOnSpawn = false

-- [ ١. مێنۆی سەرەکی - Neon UI ]
local Main = Instance.new("Frame", sg)
Main.Size = UDim2.new(0, 560, 0, 460); Main.Position = UDim2.new(0.5, -280, 0.5, -230)
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

-- [ ٢. بەشەکان (Sidebar & Container) ]
local Sidebar = Instance.new("Frame", Main); Sidebar.Size = UDim2.new(0, 130, 1, -70); Sidebar.Position = UDim2.new(0, 10, 0, 60); Sidebar.BackgroundTransparency = 1
local Container = Instance.new("Frame", Main); Container.Size = UDim2.new(1, -160, 1, -70); Container.Position = UDim2.new(0, 150, 0, 60); Container.BackgroundTransparency = 1

local Pages = {}
local function CreatePage(name, visible)
    local f = Instance.new("Frame", Container); f.Size = UDim2.new(1,0,1,0); f.Visible = visible; f.BackgroundTransparency = 1
    Pages[name] = f
    return f
end

local HomeP = CreatePage("Home", true)
local TargetP = CreatePage("Target", false)
local GamesP = CreatePage("Games", false)
local SpamP = CreatePage("Spam", false)

local function makeTab(name, y, page)
    local b = Instance.new("TextButton", Sidebar); b.Size = UDim2.new(1, 0, 0, 38); b.Position = UDim2.new(0, 0, 0, y)
    b.Text = name; b.BackgroundColor3 = Color3.fromRGB(25, 25, 25); b.TextColor3 = Color3.new(1,1,1); b.Font = Enum.Font.GothamBold; Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() for _,v in pairs(Pages) do v.Visible = false end page.Visible = true end)
end

makeTab("🏠 Home", 0, HomeP); makeTab("🎯 Target", 45, TargetP); makeTab("🎮 Games", 90, GamesP); makeTab("💬 Spam", 135, SpamP)

-- [[ ٣. بەشی HOME ]]
local MyImg = Instance.new("ImageLabel", HomeP)
MyImg.Size = UDim2.new(0, 90, 0, 90); MyImg.Position = UDim2.new(0.5, -45, 0, 0)
MyImg.Image = game.Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420); Instance.new("UICorner", MyImg).CornerRadius = UDim.new(1,0)

local Welcome = Instance.new("TextLabel", HomeP)
Welcome.Size = UDim2.new(1,0,0,30); Welcome.Position = UDim2.new(0,0,0,100); Welcome.Text = "Welcome to Kurdin Hub: "..p.Name; Welcome.TextColor3 = Color3.new(1,1,1); Welcome.BackgroundTransparency = 1; Welcome.Font = Enum.Font.GothamBold

local Online = Instance.new("TextLabel", HomeP)
Online.Size = UDim2.new(1,0,0,30); Online.Position = UDim2.new(0,0,0,130); Online.BackgroundTransparency = 1; Online.Font = Enum.Font.GothamBold
task.spawn(function() while task.wait(1) do Online.Text = "Users Online: "..#game.Players:GetPlayers(); Online.TextColor3 = Color3.fromHSV(tick()%5/5, 1, 1) end end)

local JoinText = Instance.new("TextLabel", HomeP)
JoinText.Size = UDim2.new(1,0,0,20); JoinText.Position = UDim2.new(0,0,0,170); JoinText.Text = "Join Discord | جۆینی دیسکۆردەکەمان بکە"; JoinText.TextColor3 = Color3.new(1,1,1); JoinText.BackgroundTransparency = 1; JoinText.Font = Enum.Font.Gotham

local DiscBtn = Instance.new("TextButton", HomeP)
DiscBtn.Size = UDim2.new(0, 140, 0, 40); DiscBtn.Position = UDim2.new(0.5, -70, 0, 200); DiscBtn.Text = "Join Discord [ _ ]"; DiscBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242); DiscBtn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", DiscBtn)
DiscBtn.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/RqNuZhtB") DiscBtn.Text = "Copied!" task.wait(2) DiscBtn.Text = "Join Discord [ _ ]" end)

-- [[ ٤. بەشی TARGET (ئیستهداف بە ئەڤتارەوە) ]]
local TImg = Instance.new("ImageLabel", TargetP); TImg.Size = UDim2.new(0, 80, 0, 80); TImg.Position = UDim2.new(0.5, -40, 0, 0); TImg.BackgroundColor3 = Color3.fromRGB(20,20,20); Instance.new("UICorner", TImg).CornerRadius = UDim.new(1,0)
local TBox = Instance.new("TextBox", TargetP); TBox.Size = UDim2.new(0.9,0,0,35); TBox.Position = UDim2.new(0.05,0,0,90); TBox.PlaceholderText = "Target Name..."; TBox.BackgroundColor3 = Color3.fromRGB(30,30,30); TBox.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", TBox)

local TargetPlayer = nil
TBox:GetPropertyChangedSignal("Text"):Connect(function()
    for _,v in pairs(game.Players:GetPlayers()) do
        if v.Name:lower():sub(1,#TBox.Text) == TBox.Text:lower() then
            TargetPlayer = v
            TImg.Image = game.Players:GetUserThumbnailAsync(v.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
        end
    end
end)

local function addTog(name, y, parent, func)
    local btn = Instance.new("TextButton", parent); btn.Size = UDim2.new(0.47, 0, 0, 32); btn.Position = UDim2.new((y%2==0 and 0.02 or 0.52), 0, 0, 135 + math.floor(y/2)*38)
    btn.Text = name; btn.BackgroundColor3 = Color3.fromRGB(25,25,25); btn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", btn)
    local s = Instance.new("UIStroke", btn); s.Thickness = 1.5; s.Color = Color3.fromRGB(60,60,60)
    local on = false
    btn.MouseButton1Click:Connect(function() on = not on; s.Color = on and Color3.fromRGB(0,255,150) or Color3.fromRGB(60,60,60); task.spawn(function() while on do if TargetPlayer then func(TargetPlayer) end task.wait() end end) end)
end

addTog("🌀 Fling 1M", 0, TargetP, function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(tick()*5000), 0) p.Character.HumanoidRootPart.Velocity = Vector3.new(1000000, 1000000, 1000000) end)
addTog("👁️ View", 1, TargetP, function(t) workspace.CurrentCamera.CameraSubject = t.Character.Humanoid end)
addTog("📍 یمص (Slow)", 2, TargetP, function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-1.5) end)
addTog("🔄 بانق بل عکسی", 3, TargetP, function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(180), 0) * CFrame.new(0,0,0.8) end)
addTog("👅 تمص", 4, TargetP, function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1.5,0.5) end)
addTog("🤝 Bring", 5, TargetP, function(t) t.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame end)
addTog("🚀 Teleport", 6, TargetP, function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame end)
addTog("🔥 Bang", 7, TargetP, function(t) p.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,1.1) end)

-- [[ ٥. بەشی GAMES (بازدان و خێرایی) ]]
local WalkBox = Instance.new("TextBox", GamesP); WalkBox.Size = UDim2.new(0.45,0,0,35); WalkBox.PlaceholderText = "Speed"; WalkBox.BackgroundColor3 = Color3.fromRGB(30,30,30); WalkBox.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", WalkBox)
local JumpBox = Instance.new("TextBox", GamesP); JumpBox.Size = UDim2.new(0.45,0,0,35); JumpBox.Position = UDim2.new(0.5,0,0,0); JumpBox.PlaceholderText = "Jump"; JumpBox.BackgroundColor3 = Color3.fromRGB(30,30,30); JumpBox.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", JumpBox)

local infJump = false
game:GetService("UserInputService").JumpRequest:Connect(function() if infJump then p.Character.Humanoid:ChangeState(3) end end)
local JumpBtn = Instance.new("TextButton", GamesP); JumpBtn.Size = UDim2.new(0.9,0,0,35); JumpBtn.Position = UDim2.new(0.05,0,0,45); JumpBtn.Text = "Infinite Jump (Off)"; JumpBtn.BackgroundColor3 = Color3.fromRGB(30,30,30); JumpBtn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", JumpBtn)
JumpBtn.MouseButton1Click:Connect(function() infJump = not infJump; JumpBtn.Text = infJump and "Infinite Jump (On)" or "Infinite Jump (Off)" JumpBtn.TextColor3 = infJump and Color3.new(0,1,0.6) or Color3.new(1,1,1) end)

task.spawn(function() while task.wait() do p.Character.Humanoid.WalkSpeed = tonumber(WalkBox.Text) or 16 p.Character.Humanoid.JumpPower = tonumber(JumpBox.Text) or 50 end end)

-- [[ ٦. بەشی SPAM ]]
local SText = Instance.new("TextBox", SpamP); SText.Size = UDim2.new(0.9,0,0,35); SText.Position = UDim2.new(0.05,0,0,0); SText.PlaceholderText = "Message..."; SText.BackgroundColor3 = Color3.fromRGB(30,30,30); SText.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", SText)
local SSpeed = Instance.new("TextBox", SpamP); SSpeed.Size = UDim2.new(0.4,0,0,35); SSpeed.Position = UDim2.new(0.05,0,0,45); SSpeed.PlaceholderText = "Speed (0.5)"; SSpeed.BackgroundColor3 = Color3.fromRGB(30,30,30); SSpeed.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", SSpeed)

local spamming = false
local SBtn = Instance.new("TextButton", SpamP); SBtn.Size = UDim2.new(0.45,0,0,35); SBtn.Position = UDim2.new(0.5,0,0,45); SBtn.Text = "Start Spam"; SBtn.BackgroundColor3 = Color3.fromRGB(30,30,30); SBtn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", SBtn)
SBtn.MouseButton1Click:Connect(function()
    spamming = not spamming
    SBtn.Text = spamming and "Stop Spam" or "Start Spam"
    task.spawn(function()
        while spamming do
            local waitTime = tonumber(SSpeed.Text) or 0.5
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(SText.Text, "All")
            task.wait(waitTime)
        end
    end)
end)

-- [ ٧. دوگمەی کردنەوە و داخستن (Kurdin Hub) ]
local Open = Instance.new("TextButton", sg); Open.Size = UDim2.new(0, 50, 0, 50); Open.Position = UDim2.new(0, 10, 0.5, 0); Open.Text = "U"; Open.BackgroundColor3 = Color3.fromRGB(15,15,15); Open.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", Open).CornerRadius = UDim.new(1,0)
local OS = Instance.new("UIStroke", Open); OS.Thickness = 2; task.spawn(function() while task.wait() do OS.Color = Color3.fromHSV(tick()%5/5, 1, 1) end end)
Open.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)
-- [ ١. سیستەمی ئاگادارکردنەوەی لێفت ]
game.Players.PlayerRemoving:Connect(function(player)
    local notifyFrame = Instance.new("Frame", sg)
    notifyFrame.Size = UDim2.new(0, 250, 0, 70)
    notifyFrame.Position = UDim2.new(1, -260, 0.1, 0)
    notifyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Instance.new("UICorner", notifyFrame)
    
    local img = Instance.new("ImageLabel", notifyFrame)
    img.Size = UDim2.new(0, 50, 0, 50); img.Position = UDim2.new(0, 10, 0.5, -25)
    img.Image = "rbxthumb://type=AvatarHeadShot&id="..player.UserId.."&w=150&h=150"
    Instance.new("UICorner", img).CornerRadius = UDim.new(1,0)
    
    local txt = Instance.new("TextLabel", notifyFrame)
    txt.Size = UDim2.new(0, 170, 1, 0); txt.Position = UDim2.new(0, 70, 0, 0)
    txt.Text = "پلەیەرەکە  لێفتی کرد بەناوی:\n" .. player.Name
    txt.TextColor3 = Color3.new(1,1,1); txt.TextSize = 12; txt.BackgroundTransparency = 1; txt.Font = Enum.Font.GothamBold
    
    local b = Instance.new("Frame", notifyFrame)
    b.Size = UDim2.new(1,0,0,2); b.Position = UDim2.new(0,0,1,-2)
    task.spawn(function() while notifyFrame.Parent do b.BackgroundColor3 = Color3.fromHSV(tick()%5/5, 1, 1) task.wait() end end)
    
    task.wait(5)
    if notifyFrame then notifyFrame:Destroy() end
end)
