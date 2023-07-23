-- bisa teleport saat di kursi penupang


local teleportEnabled = false
local teleportTimer = 60

local function TeleportToDestination(destination)
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

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Bebek Hub", "GrapeTheme")
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main")

MainSection:NewSlider("Walkspeed", "SPEED!!", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewSlider("Jumppower", "JUMP HIGH!!", 350, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

MainSection:NewButton("print way point", "way point", function()
    local waypoint = game:GetService("Workspace").Etc.Waypoint.Waypoint
    local textLabel = waypoint.BillboardGui.TextLabel

    print(textLabel.Text)
end)

local Truck = Window:NewTab("Truck")
local Truckection = Truck:NewSection("Truck")

Truckection:NewButton("Silambat Palimanan", "Teleport to Palimanan", function()
    TeleportToPalimanan()
end)

Truckection:NewButton("PT.CDID Cargo Cirebon", "Teleport to Cirebon", function()
    TeleportToCirebon()
end)

Truckection:NewButton("Rest Area Km 279", "Teleport to KM279", function()
    TeleportToKM279()
end)

Truckection:NewButton("SuperMart Pekalongan", "Teleport to Pekalongan", function()
    TeleportToPekalongan()
end)

Truckection:NewButton("Rojod Semarang", "Teleport to Semarang", function()
    TeleportToSemarang()
end)

local Other = Window:NewTab("Other")
local OtherSection = Other:NewSection("Other")

OtherSection:NewToggle("Job Truk", "Job Truk", function(state)
    if state then
        local args = {
            [1] = "Truck"
        }
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
        wait(15)
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
        local args = {
            [1] = "Unemployee"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("NetworkContainer"):WaitForChild("RemoteEvents"):WaitForChild("Job"):FireServer(unpack(args))
        -- work
        teleportEnabled = false
        teleportTimer = 60
        print("Toggle Off")
    end
end)

local isAntiAFKEnabled = false -- Variable untuk mengetahui apakah "Anti AFK" diaktifkan

local function enableAntiAFK()
    local button = game:GetService("Players").LocalPlayer.PlayerGui.Main.Container.Hub.Radio.Frame.TextButton -- path to button here

    local events = {"MouseButton1Click", "MouseButton1Down", "Activated", "MouseButton1Up"}
    while isAntiAFKEnabled do
        for i, v in pairs(events) do
            for i, connection in pairs(getconnections(button[v])) do
                connection:Fire()
            end
        end
        wait(60) -- Menunggu selama 60 detik sebelum tombol ditekan kembali
    end
end

local function toggleAntiAFK(state)
    if state then
        isAntiAFKEnabled = true
        print("Anti AFK is now enabled.")
        enableAntiAFK() -- Panggil fungsi untuk menjalankan "Anti AFK"
    else
        isAntiAFKEnabled = false
        print("Anti AFK is now disabled.")
    end
end

OtherSection:NewToggle("Anti AFK", "Anti AFK", toggleAntiAFK) -- Menggunakan fungsi toggleAntiAFK sebagai callback saat tombol ditekan


OtherSection:NewToggle("Auto Truck Trip", "Auto Truck Trip", function(state)
    if state then
        teleportEnabled = true
        print("Toggle On")
    else
        teleportEnabled = false
        print("Toggle Off")
    end
end)

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

                teleportTimer = 60
            else
                teleportTimer = teleportTimer - 1
                print(teleportTimer)
            end
        end
        wait(1)
    end
end)
