local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Bebek Hub v1.2.1 Beta 9 dev 2",
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Main = Window:AddTab({ Title = "Main", Icon = "" })
local Other = Window:AddTab({ Title = "Other", Icon = "settings" })

Main:AddSlider("Walkspeed", {
    Title = "Walkspeed",
    Default = 16,
    Min = 16,
    Max = 500,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

Main:AddSlider("Jumppower", {
    Title = "Jumppower",
    Default = 50,
    Min = 50,
    Max = 350,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
})

-- ... (Sisanya kode Anda diubah ke Fluent UI)
-- ... (Bagian kode sebelumnya)

-- Teleportasi
Other:AddToggle("Job Truk", {
    Title = "Job Truk",
    Default = false,
    Callback = function(state)
        -- Kode teleportasi Anda di sini
    end
})

-- Anti AFK
Other:AddToggle("Anti AFK", {
    Title = "Anti AFK",
    Default = false,
    Callback = function(state)
        -- Kode Anti AFK Anda di sini
    end
})

-- Hapus Map
Other:AddButton("Hapus Map", {
    Title = "Hapus Map",
    Callback = function()
        -- Kode Hapus Map Anda di sini
    end
})

-- Hapus Trailer
Other:AddButton("Hapus Trailer", {
    Title = "Hapus Trailer",
    Callback = function()
        -- Kode Hapus Trailer Anda di sini
    end
})

-- Dealer
local dealerContainer = game:GetService("Players").LocalPlayer.PlayerGui.Dealership.Container.Dealership.Dealerlist
for _, dealer in ipairs(dealerContainer:GetChildren()) do
    local carNamesAndPrices = {}
    for _, car in ipairs(dealer:GetChildren()) do
        if car and car:FindFirstChild("Frame") and car.Frame:FindFirstChild("CarName") and car.Frame:FindFirstChild("Type") and car.Frame.Type:FindFirstChild("New") and car.Frame.Type.New.Visible and car.Frame:FindFirstChild("Price") then
            local carName = car.Frame.CarName.Text
            local carPrice = car.Frame.Price.Text
            table.insert(carNamesAndPrices, carName .. " (" .. carPrice .. ")")
        end
    end
    Other:AddDropdown(dealer.Name, {
        Title = dealer.Name,
        Values = carNamesAndPrices,
        Multi = false,
        Default = 1,
    })
end

-- Inisialisasi Fluent
Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})
SaveManager:LoadAutoloadConfig()
