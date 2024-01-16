local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Fluent " .. Fluent.Version,
    SubTitle = "by dawid",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Dealerships = Window:AddTab({ Title = "Dealerships", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

-----tp
local function TeleportToDestination(destination)
    -- Your teleport function here
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character
    local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")

    local SeatPart = Humanoid.SeatPart
    local Vehicle = SeatPart.Parent

    if SeatPart:FindFirstAncestor("Body") then
        Vehicle = SeatPart:FindFirstAncestor("Body").Parent
    end

    Vehicle.PrimaryPart = SeatPart

    Character.Parent = Vehicle
    Vehicle:MoveTo(destination)

    -- Menunggu sampai vehicle mencapai tujuan
    Vehicle.PrimaryPart.Anchored = true
    wait(2) -- Menunggu selama 2 detik (sesuaikan dengan durasi yang diinginkan)
    Vehicle.PrimaryPart.Anchored = false

    Character.Parent = workspace
end

local function GetWaypointDestination(waypoint)
    local destinations = {
        ["Silambat Palimanan"] = Vector3.new(-13001.578, 1058.455, -16360.201),
        ["Rest Area Km 279"] = Vector3.new(-25910.939, 1059.604, -43896.273),
        ["SuperMart Pekalongan"] = Vector3.new(-38720.934, 1018.218, -62491.059),
        ["PT.CDID Cargo Cirebon"] = Vector3.new(-21803.887, 1046.989, -27817.059),
        ["Rojod Semarang"] = Vector3.new(-50889.66, 1017.867, -86514.797)
    }

    return destinations[waypoint]
end

--tp end

do
    --auto truck
    local ToggleAutoTruck = Tabs.Main:AddToggle("AutoTruck", {Title = "Auto Job Truck", Default = false })

    ToggleAutoTruck:OnChanged(function()
        Callback = function(state)
            if state then
                local args = {[1] = "Truck"}
                game:GetService("ReplicatedStorage"):WaitForChild("NetworkContainer"):WaitForChild("RemoteEvents"):WaitForChild("Job"):FireServer(unpack(args))
                wait(2)
                -- Teleport ke tempat yang diinginkan
                -- game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-21796, 1065, -26800))
                game.Players.LocalPlayer.Character:MoveTo(Vector3.new( -21801, 1062, -26799))
                -- Wait sebelum jatuh (hindari kematian akibat jatuh)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
                wait(3)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                wait(1.5)
                -- Press tombol "E"
                game:GetService('VirtualInputManager'):SendKeyEvent(true,'E',false,uwu)
                wait(0.2)
                game:GetService('VirtualInputManager'):SendKeyEvent(false,'E',false,uwu)
                wait(2)
                -- Teleport spawn car
                game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-21787, 1042, -26788))
                wait(4)
                -- spawn car
                game:GetService('VirtualInputManager'):SendKeyEvent(true,'F',false,uwu)
                wait(0.2)
                game:GetService('VirtualInputManager'):SendKeyEvent(false,'F',false,uwu)
                wait(8)
                -- seat on drive
                local vim = game:GetService('VirtualInputManager')
                vim:SendKeyEvent(true, 'E', false, game)
                wait(2)
                vim:SendKeyEvent(true, 'E', false, game)
                wait(1)
                -- remove text
                vim:SendKeyEvent(true, 'Q', false, game)
                wait(0.2)
                vim:SendKeyEvent(true, 'Q', false, game)
    
                -- work
                teleportEnabled = true
            else
                local args = {[1] = "Unemployee"}
                game:GetService("ReplicatedStorage"):WaitForChild("NetworkContainer"):WaitForChild("RemoteEvents"):WaitForChild("Job"):FireServer(unpack(args))
                -- work
                teleportEnabled = false
                teleportTimer = 48
            end
        end
    end)

    spawn(function()
        while true do
            if teleportEnabled then
                if teleportTimer <= 0 then
                    local waypointFolder = game:GetService("Workspace").Etc.Waypoint
                    if waypointFolder then
                        local waypoint = waypointFolder.Waypoint
                        if waypoint then
                            local textLabel = waypoint.BillboardGui.TextLabel
    
                            local waypointDestination = GetWaypointDestination(textLabel.Text)
                            if waypointDestination then
                                TeleportToDestination(waypointDestination)
                            end
                        end
                    end
    
                    teleportTimer = 48
                else
                    teleportTimer = teleportTimer - 1
                end
            end
            wait(1)
        end
    end)

    Options.ToggleAutoTruck:SetValue(false)
    --auto truck end

    --anti afk
    local ToggleAntiAfk = Tabs.Main:AddToggle("AntiAfk", {Title = "Anti Afk", Default = false })

    ToggleAntiAfk:OnChanged(function()
        
    end)

    Options.ToggleAntiAfk:SetValue(false)
    --anti afk end

    local Slider = Tabs.Main:AddSlider("Slider", {
        Title = "Walkspeed",
        Description = "This is a Walkspeed",
        Default = 16,
        Min = 16,
        Max = 500,
        Rounding = 1,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    })

    Slider:OnChanged(function(Value)
        --print("Slider changed:", Value)
    end)

    Slider:SetValue(16)

    --dealer tab
    local Dropdown = Tabs.Dealerships:AddDropdown("Dropdown", {
        Title = "Dropdown",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
        Multi = false,
        Default = 1,
    })

    Dropdown:SetValue("four")

    Dropdown:OnChanged(function(Value)
        --print("Dropdown changed:", Value)
    end)

    local Input = Tabs.Dealerships:AddInput("Input", {
        Title = "Input",
        Default = "Default",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            --print("Input changed:", Value)
        end
    })

    Input:OnChanged(function()
        --print("Input updated:", Input.Value)
    end)

end


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "KWEK",
    Content = "Udah Aktif Bos.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
