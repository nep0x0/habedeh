
local teleportEnabled = false
local teleportTimer = 58

local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = Library:MakeWindow({Name = "Bebek Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "BebekHub"})

local Main = Window:MakeTab({Name = "Main", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local MainSection = Main:AddSection({Name = "Main"})

MainSection:AddSlider({
    Name = "Walkspeed",
    Default = 16,
    Min = 16,
    Max = 500,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

MainSection:AddSlider({
    Name = "Jumppower",
    Default = 50,
    Min = 50,
    Max = 350,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
})

MainSection:AddButton({
    Name = "Print Waypoint",
    Callback = function()
        local waypoint = game:GetService("Workspace").Etc.Waypoint.Waypoint
        local textLabel = waypoint.BillboardGui.TextLabel
        print(textLabel.Text)
    end
})

local Truck = Window:MakeTab({Name = "Truck", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Truckection = Truck:AddSection({Name = "Truck"})

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

local function TeleportToPalimanan()
    TeleportToDestination(Vector3.new(-13001.578, 1058.455, -16360.201))
end

local function TeleportToCirebon()
    TeleportToDestination(Vector3.new(-21803.887, 1046.989, -27817.059))
end

local function TeleportToKM279()
    TeleportToDestination(Vector3.new(-25910.939, 1059.604, -43896.273))
end

local function TeleportToPekalongan()
    TeleportToDestination(Vector3.new(-38720.934, 1018.218, -62491.059))
end

local function TeleportToSemarang()
    TeleportToDestination(Vector3.new(-50889.66, 1017.867, -86514.797))
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

Truckection:AddButton({
    Name = "Silambat Palimanan",
    Callback = function()
        TeleportToPalimanan()
    end
})

Truckection:AddButton({
    Name = "PT.CDID Cargo Cirebon",
    Callback = function()
        TeleportToCirebon()
    end
})

Truckection:AddButton({
    Name = "Rest Area Km 279",
    Callback = function()
        TeleportToKM279()
    end
})

Truckection:AddButton({
    Name = "SuperMart Pekalongan",
    Callback = function()
        TeleportToPekalongan()
    end
})

Truckection:AddButton({
    Name = "Rojod Semarang",
    Callback = function()
        TeleportToSemarang()
    end
})

local Other = Window:MakeTab({Name = "Other", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local OtherSection = Other:AddSection({Name = "Other"})

OtherSection:AddToggle({
    Name = "Job Truk",
    Callback = function(state)
        if state then
            local args = {[1] = "Truck"}
            game:GetService("ReplicatedStorage"):WaitForChild("NetworkContainer"):WaitForChild("RemoteEvents"):WaitForChild("Job"):FireServer(unpack(args))
            wait(2)
            -- Teleport ke tempat yang diinginkan
            game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-21796, 1065, -26800))
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
            print("Toggle On")
        else
            local args = {[1] = "Unemployee"}
            game:GetService("ReplicatedStorage"):WaitForChild("NetworkContainer"):WaitForChild("RemoteEvents"):WaitForChild("Job"):FireServer(unpack(args))
            -- work
            teleportEnabled = false
            teleportTimer = 58
            print("Toggle Off")
        end
    end
})

local isAntiAFKEnabled = false -- Variable untuk mengetahui apakah "Anti AFK" diaktifkan

local function enableAntiAFK()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end

local function toggleAntiAFK(state)
    if state then
        isAntiAFKEnabled = true
        print("enabled.")
        enableAntiAFK() -- Panggil fungsi untuk menjalankan "Anti AFK"
    else
        isAntiAFKEnabled = false
        print("disabled.")
    end
end

OtherSection:AddToggle({
    Name = "Anti AFK",
    Callback = toggleAntiAFK
})

OtherSection:AddToggle({
    Name = "Auto Truck Trip",
    Callback = function(state)
        -- Your Auto Truck Trip code here
        if state then
            teleportEnabled = true
            print("Toggle On")
        else
            teleportEnabled = false
            print("Toggle Off")
        end
    end
})

spawn(function()
    while true do
        if teleportEnabled then
            if teleportTimer <= 0 then
                local waypoint = game:GetService("Workspace").Etc.Waypoint.Waypoint
                local textLabel = waypoint.BillboardGui.TextLabel

                local waypointDestination = GetWaypointDestination(textLabel.Text)
                if waypointDestination then
                    TeleportToDestination(waypointDestination)
                end

                teleportTimer = 58
            else
                teleportTimer = teleportTimer - 1
                print(teleportTimer)
            end
        end
        wait(1)
    end
end)

-- Call the Orion Library's Init function to finish setting up the UI
Library:Init()
