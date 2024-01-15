local teleportEnabled = false
local teleportTimer = 48

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Bebek Hub v1.2.1 Fluent 9",
    SubTitle = "by dawid",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Main = Window:AddTab({ Title = "Main", Icon = "" })
local Truck = Window:AddTab({ Title = "Truck", Icon = "" })
local Other = Window:AddTab({ Title = "Other", Icon = "" })

-- Main Tab
Main:AddSlider("Walkspeed", {
    Title = "Walkspeed",
    Description = "Adjust your character's walk speed.",
    Default = 16,
    Min = 16,
    Max = 500,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

Main:AddSlider("Jumppower", {
    Title = "Jumppower",
    Description = "Adjust your character's jump power.",
    Default = 50,
    Min = 50,
    Max = 350,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
})

-- Truck Tab
-- Your teleport functions here...

Truck:AddButton({
    Title = "Silambat Palimanan",
    Callback = function()
        TeleportToPalimanan()
    end
})

Truck:AddButton({
    Title = "PT.CDID Cargo Cirebon",
    Callback = function()
        TeleportToCirebon()
    end
})

Truck:AddButton({
    Title = "Rest Area Km 279",
    Callback = function()
        TeleportToKM279()
    end
})

Truck:AddButton({
    Title = "SuperMart Pekalongan",
    Callback = function()
        TeleportToPekalongan()
    end
})

Truck:AddButton({
    Title = "Rojod Semarang",
    Callback = function()
        TeleportToSemarang()
    end
})

-- Other Tab
Other:AddToggle("Job Truk", {
    Title = "Job Truk",
    Default = false,
    Callback = function(state)
        -- Your Job Truk code here...
    end
})

Other:AddToggle("Anti AFK", {
    Title = "Anti AFK",
    Default = false,
    Callback = function(state)
        -- Your Anti AFK code here...
    end
})

Other:AddToggle("Auto Truck Trip", {
    Title = "Auto Truck Trip",
    Default = false,
    Callback = function(state)
        -- Your Auto Truck Trip code here...
    end
})

Other:AddButton({
    Title = "Hapus Map",
    Callback = function()
        -- Your Hapus Map code here...
    end
})

Other:AddButton({
    Title = "Hapus Trailer",
    Callback = function()
        -- Your Hapus Trailer code here...
    end
})

-- Spawn function
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

-- Dealer code
local dealerContainer = game:GetService("Players").LocalPlayer.PlayerGui.Dealership.Container.Dealership.Dealerlist
local CarSection = Window:AddTab({ Title = "Cars", Icon = "" })

for _, dealer in ipairs(dealerContainer:GetChildren()) do
    -- Membuat daftar nama mobil dan harga untuk dealer ini
    local carNamesAndPrices = {}
    for _, car in ipairs(dealer:GetChildren()) do
        if car and car:FindFirstChild("Frame") and car.Frame:FindFirstChild("CarName") and car.Frame:FindFirstChild("Type") and car.Frame.Type:FindFirstChild("New") and car.Frame.Type.New.Visible and car.Frame:FindFirstChild("Price") then
            local carName = car.Frame.CarName.Text
            local carPrice = car.Frame.Price.Text
            table.insert(carNamesAndPrices, carName .. " (" .. carPrice .. ")")
        end
    end

    -- Membuat dropdown dengan nama mobil dan harga untuk dealer ini
    CarSection:AddDropdown({
        Title = dealer.Name,
        Values = carNamesAndPrices,
        Multi = false,
        Default = 1,
        Callback = function(Value)
            -- Anda bisa menambahkan fungsi yang diinginkan di sini
        end
    })
end

-- Call the Fluent Library's Init function to finish setting up the UI
Fluent:Init()
