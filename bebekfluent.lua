local teleportEnabled = false
local teleportTimer = 48

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Bebek Hub v1.2.1 Beta 9",
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

-- Your spawn function here...

--dealer
-- Your dealer code here...

-- Call the Fluent Library's Init function to finish setting up the UI
Fluent:Init()
