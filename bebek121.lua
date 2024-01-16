-- Memuat library
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = Library:MakeWindow({Name = "Bebek Hub v1.2.1 Beta 9 Dev Test 1", HidePremium = false, SaveConfig = true, ConfigFolder = "BebekHub"})

-- Mendapatkan layanan yang dibutuhkan
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService('VirtualInputManager')

-- Mendapatkan pemain lokal
local LocalPlayer = Players.LocalPlayer

-- Mendefinisikan variabel global
local teleportEnabled = false
local teleportTimer = 48

-- Fungsi untuk mengeksekusi teleportasi
local function TeleportToDestination(destination)
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

    Vehicle.PrimaryPart.Anchored = true
    wait(2)
    Vehicle.PrimaryPart.Anchored = false

    Character.Parent = Workspace
end

-- Fungsi untuk mendapatkan tujuan waypoint
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

-- Fungsi untuk mengaktifkan Anti AFK
local function enableAntiAFK()
    LocalPlayer.Idled:connect(function()
        VirtualInputManager:Button2Down(Vector2.new(0,0),Workspace.CurrentCamera.CFrame)
        wait(1)
        VirtualInputManager:Button2Up(Vector2.new(0,0),Workspace.CurrentCamera.CFrame)
    end)
end

-- Fungsi untuk mengaktifkan atau menonaktifkan Anti AFK
local function toggleAntiAFK(state)
    if state then
        enableAntiAFK()
    else
        -- Tidak ada yang perlu dilakukan saat menonaktifkan Anti AFK
    end
end

-- Fungsi untuk mengaktifkan atau menonaktifkan Auto Truck Trip
local function toggleAutoTruckTrip(state)
    teleportEnabled = state
end

-- Fungsi untuk menghapus map
local function removeMap()
    local map = Workspace.Map
    for _, instance in ipairs(map:GetChildren()) do
        if instance.Name ~= "Base" then
            instance:Destroy()
        end
    end
end

-- Fungsi untuk menghapus trailer
local function removeTrailer()
    local trailer = Workspace.Vehicles.deniautututuhsCar.Trailer1
    if trailer then
        trailer:Destroy()
    end
end

-- Membuat tab dan section
local Main = Window:MakeTab({Name = "Main", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local MainSection = Main:AddSection({Name = "Main"})

-- Menambahkan slider untuk Walkspeed dan Jumppower
MainSection:AddSlider({
    Name = "Walkspeed",
    Default = 16,
    Min = 16,
    Max = 500,
    Callback = function(Value)
        LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

MainSection:AddSlider({
    Name = "Jumppower",
    Default = 50,
    Min = 50,
    Max = 350,
    Callback = function(Value)
        LocalPlayer.Character.Humanoid.JumpPower = Value
    end
})

-- Menambahkan tombol untuk teleportasi
local Truck = Window:MakeTab({Name = "Truck", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Truckection = Truck:AddSection({Name = "Truck"})

Truckection:AddButton({
    Name = "Silambat Palimanan",
    Callback = function()
        TeleportToDestination(GetWaypointDestination("Silambat Palimanan"))
    end
})

Truckection:AddButton({
    Name = "PT.CDID Cargo Cirebon",
    Callback = function()
        TeleportToDestination(GetWaypointDestination("PT.CDID Cargo Cirebon"))
    end
})

Truckection:AddButton({
    Name = "Rest Area Km 279",
    Callback = function()
        TeleportToDestination(GetWaypointDestination("Rest Area Km 279"))
    end
})

Truckection:AddButton({
    Name = "SuperMart Pekalongan",
    Callback = function()
        TeleportToDestination(GetWaypointDestination("SuperMart Pekalongan"))
    end
})

Truckection:AddButton({
    Name = "Rojod Semarang",
    Callback = function()
        TeleportToDestination(GetWaypointDestination("Rojod Semarang"))
    end
})

-- Menambahkan toggle untuk Anti AFK dan Auto Truck Trip
local Other = Window:MakeTab({Name = "Other", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local OtherSection = Other:AddSection({Name = "Other"})

OtherSection:AddToggle({
    Name = "Anti AFK",
    Callback = toggleAntiAFK
})

OtherSection:AddToggle({
    Name = "Auto Truck Trip",
    Callback = toggleAutoTruckTrip
})

-- Menambahkan tombol untuk menghapus map dan trailer
OtherSection:AddButton({
    Name = "Hapus Map",
    Callback = removeMap
})

OtherSection:AddButton({
    Name = "Hapus Trailer",
    Callback = removeTrailer
})

-- Menjalankan loop untuk teleportasi
spawn(function()
    while true do
        if teleportEnabled then
            if teleportTimer <= 0 then
                local waypointFolder = Workspace.Etc.Waypoint
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

-- Menyelesaikan setup UI
Library:Init()
