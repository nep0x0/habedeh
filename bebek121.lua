-- Load the library
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = Library:MakeWindow({Name = "Bebek Hub v1.2.0", HidePremium = false, SaveConfig = true, ConfigFolder = "BebekHub"})

-- Define the destinations
local destinations = {
    ["Silambat Palimanan"] = Vector3.new(-13001.578, 1058.455, -16360.201),
    ["Rest Area Km 279"] = Vector3.new(-25910.939, 1059.604, -43896.273),
    ["SuperMart Pekalongan"] = Vector3.new(-38720.934, 1018.218, -62491.059),
    ["PT.CDID Cargo Cirebon"] = Vector3.new(-21803.887, 1046.989, -27817.059),
    ["Rojod Semarang"] = Vector3.new(-50889.66, 1017.867, -86514.797)
}

-- Define the teleport function
local function TeleportToDestination(destination)
    -- Your teleport function here
    -- ...
end

-- Define the tabs
local Main = Window:MakeTab({Name = "Main", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Truck = Window:MakeTab({Name = "Truck", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Other = Window:MakeTab({Name = "Other", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-- Define the sections
local MainSection = Main:AddSection({Name = "Main"})
local Truckection = Truck:AddSection({Name = "Truck"})
local OtherSection = Other:AddSection({Name = "Other"})

-- Add sliders and buttons to the Main section
MainSection:AddSlider({Name = "Walkspeed", Default = 16, Min = 16, Max = 500, Callback = function(Value) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value end})
MainSection:AddSlider({Name = "Jumppower", Default = 50, Min = 50, Max = 350, Callback = function(Value) game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value end})
MainSection:AddButton({Name = "Print Waypoint", Callback = function() print(game:GetService("Workspace").Etc.Waypoint.Waypoint.BillboardGui.TextLabel.Text) end})

-- Add buttons to the Truck section
for name, destination in pairs(destinations) do
    Truckection:AddButton({Name = name, Callback = function() TeleportToDestination(destination) end})
end

-- Add toggles to the Other section
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
            -- print("Toggle On")
        else
            local args = {[1] = "Unemployee"}
            game:GetService("ReplicatedStorage"):WaitForChild("NetworkContainer"):WaitForChild("RemoteEvents"):WaitForChild("Job"):FireServer(unpack(args))
            -- work
            teleportEnabled = false
            teleportTimer = 48
            -- print("Toggle Off")
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
        -- print("enabled.")
        enableAntiAFK() -- Panggil fungsi untuk menjalankan "Anti AFK"
    else
        isAntiAFKEnabled = false
        -- print("disabled.")
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
            -- print("Toggle On")
        else
            teleportEnabled = false
            -- print("Toggle Off")
        end
    end
})

spawn(function()
    while true do
        if teleportEnabled then
            if teleportTimer <= 0 then
                local waypoint = game:GetService("Workspace").Etc.Waypoint.Waypoint
                local textLabel = waypoint.BillboardGui.TextLabel.Text

                -- Jika waypoint bukan "Semarang" atau "Pekalongan", ulangi proses "Job Truk"
                if textLabel ~= "Rojod Semarang" and textLabel ~= "SuperMart Pekalongan" then
                    -- Kode untuk memulai "Job Truk" di sini
                    -- ...
                else
                    local waypointDestination = GetWaypointDestination(textLabel)
                    if waypointDestination then
                        TeleportToDestination(waypointDestination)
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

-- Call the Orion Library's Init function to finish setting up the UI
Library:Init()
