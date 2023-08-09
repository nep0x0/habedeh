if game:GetService("Workspace").Assets.Eggs:FindFirstChild("Cube Of Truth") then game:GetService("Workspace").Assets.Eggs["Cube Of Truth"]:Destroy() end
if game:GetService("Workspace").Assets.Eggs:FindFirstChild("Celestial Emerald") then game:GetService("Workspace").Assets.Eggs["Celestial Emerald"]:Destroy() end
if game:GetService("Workspace").Assets.Eggs:FindFirstChild("Robux Egg") then game:GetService("Workspace").Assets.Eggs["Robux Egg"]:Destroy() end
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("LimitedPets") then game.Players.LocalPlayer.PlayerGui.LimitedPets:Destroy() end
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("BuyGamepass") then game.Players.LocalPlayer.PlayerGui.BuyGamepass:Destroy() end
if game.Players.LocalPlayer.PlayerGui.MainUI:FindFirstChild("TutorialFrame") then game.Players.LocalPlayer.PlayerGui.MainUI.TutorialFrame:Destroy() end

function C() spawn(function () while getgenv().C do local args = {[1] = 0}game:GetService("ReplicatedStorage").Functions.Punch:InvokeServer(unpack(args)) for i, v in pairs(game.workspace:GetChildren()) do if v:FindFirstChild("Attachment") then RTPCFrame(v) end end wait() end end) end
function R() spawn(function () while getgenv().R do game:GetService("ReplicatedStorage").Events.Rebirth:FireServer() wait() end end) end
function H() spawn(function () while getgenv().H do local args = {[1] = E,[2] = 1,[3] = {}}game:GetService("ReplicatedStorage").Events.OpenEgg:FireServer(unpack(args)) wait() end end) end
function U() spawn(function () while getgenv().U do
local args = {[1] = "Upgrade Shop",[2] = "PowerMultiplier"}game:GetService("ReplicatedStorage").Events.Upgrade:FireServer(unpack(args)) 
local args = {[1] = "Upgrade Shop",[2] = "GemsMultiplier"}game:GetService("ReplicatedStorage").Events.Upgrade:FireServer(unpack(args)) 
local args = {[1] = "Upgrade Shop",[2] = "LuckMultiplier"}game:GetService("ReplicatedStorage").Events.Upgrade:FireServer(unpack(args)) 
local args = {[1] = "Upgrade Shop",[2] = "SpeedMultiplier"}game:GetService("ReplicatedStorage").Events.Upgrade:FireServer(unpack(args)) 
local args = {[1] = "Upgrade Shop",[2] = "MagnetMultiplier"}game:GetService("ReplicatedStorage").Events.Upgrade:FireServer(unpack(args)) 
local args = {[1] = "Upgrade Shop",[2] = "StorageIncrementer"}game:GetService("ReplicatedStorage").Events.Upgrade:FireServer(unpack(args)) 
local args = {[1] = "Upgrade Shop",[2] = "PowerMultiplier"}game:GetService("ReplicatedStorage").Events.Upgrade:FireServer(unpack(args)) 
local args = {[1] = "Upgrade Shop",[2] = "PowerMultiplier"}game:GetService("ReplicatedStorage").Events.Upgrade:FireServer(unpack(args)) wait() end end) end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local w = library:CreateWindow("Super Punch Sim")

local b = w:CreateFolder("Main")

b:Button("Infinite All (OP)",function() for i, v in pairs(game:GetService("Workspace").Assets.Chests:GetChildren()) do if v then TPCFrame(v.CFrame) end end end)

b:Toggle("Punch",function(val) getgenv().C = val C() end)
b:Toggle("Upgrade",function(val) getgenv().U = val U() end)
b:Toggle("Rebirth",function(val) getgenv().R = val R() end)
b:Toggle("Hatch",function(val) getgenv().H = val H() end)

b:Dropdown("Choose",{"Basic Egg","Cactus Egg","Bamboo Egg","Chocolate Egg","Golden Cactus Egg","Golden Bamboo Egg","Golden Chocolate Egg","Marine Egg","Ice Crystal Egg","Ice Egg","Chromium Egg","Cyber Egg","Coconut Egg","UFO Egg","Lunar Egg"},true,function(val)
E = val
end)

b:Label("Made by X_LuaF#0705",{TextSize = 21; TextColor = Color3.fromRGB(255,255,255); BgColor = Color3.fromRGB(38, 38, 38);})

local w = library:CreateWindow("LocalPlayer")

local b = w:CreateFolder("LP")

b:DestroyGui()

b:Button("Discord",function() setclipboard("workink.co/2GQ/LTD") end)
b:Button("Full Version",function() loadstring(game:HttpGet("https://pastebin.com/raw/GphZf9Xe", true))() end)
b:Button("Rejoin",function() loadstring(game:HttpGet("https://pastebin.com/raw/mM7JBG5h", true))() end)
b:Button("Reset",function() loadstring(game:HttpGet("https://pastebin.com/raw/EEY6SATj", true))() end)

b:Box("Speed","number",function(val) S = val end)
b:Box("Jump","number",function(val) J = val end)
b:Box("Hip Height","number",function(val) H = val end)
b:Box("Gravity","number",function(val) G = val end)
 
b:Toggle("Speed",function(bool) getgenv().Speed = bool Speed(S) end)
b:Toggle("Jump",function(bool) getgenv().Jump = bool Jump(J) end)
b:Toggle("Hip Height",function(bool) getgenv().Hip = bool Hip(H) end)
b:Toggle("Gravity",function(bool) getgenv().Grav = bool Grav(G) end)
 
b:Slider("FOV (Default is 70)",{min = 0;max = 120;precise = true;},function(val) game.workspace.CurrentCamera.FieldOfView = val end)

function TPCFrame(Player_CFrame) if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Player_CFrame end end
function RTPCFrame(M_CF) if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then M_CF.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame end end
function PHP(Player_HP) game.Players.LocalPlayer.Character.Humanoid.Health = Player_HP end

function Chat(Mes, Freq) spawn(function () while getgenv().Chat do local args = {[1] = Mes,[2] = "All"} game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args)) wait(Freq) end end) end
function Speed(Nume) spawn(function () while getgenv().Speed do game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Nume if not getgenv().Speed then game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 16 end wait() end end) end
function Jump(Nume) spawn(function () while getgenv().Jump do game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Nume if not getgenv().Jump then game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = 50 end wait() end end) end
function Hip(Nume) spawn(function () while getgenv().Hip do game:GetService("Players").LocalPlayer.Character.Humanoid.HipHeight = Nume if not getgenv().Hip then game:GetService("Players").LocalPlayer.Character.Humanoid.HipHeight = 0.1 end wait() end end) end
function Grav(Nume) spawn(function () while getgenv().Grav do game:GetService("Workspace").Gravity = Nume if not getgenv().Grav then game:GetService("Workspace").Gravity = 196.2 end wait() end end) end