local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "33sasf " .. Fluent.Version,
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
    CarTab = Window:AddTab({Title = "Cars", Icon = ""}),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

-----tp
local teleportEnabled = false
local teleportTimer = 48

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
--tp end

--anti afk
local connection -- Variabel untuk menyimpan koneksi

local function enableAntiAFK()
    local vu = game:GetService("VirtualUser")
    connection = game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end
--anti afk end



do
    --auto truck
    local ToggleAutoTruck = Tabs.Main:AddToggle("AutoTruck", {Title = "Auto Job Truck", Default = false })

    ToggleAutoTruck:OnChanged(function(state)
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
    end)

    Options.AutoTruck:SetValue(false)
    --auto truck end

    --anti afk
    local ToggleAntiAFK = Tabs.Main:AddToggle("AntiAFK", {Title = "Anti AFK", Default = false })

    ToggleAntiAFK:OnChanged(function(state)
        if state then
            enableAntiAFK() -- Panggil fungsi untuk menjalankan "Anti AFK"
        else
            if connection then
                connection:Disconnect() -- Memutuskan koneksi
            end
        end
    end)
    
    Options.AntiAFK:SetValue(false)
    --anti afk end
    
    --walkspeed
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
    -- walk speed end

    Slider:SetValue(16)

    --dealer tab
    -- local Dropdown = Tabs.Dealerships:AddDropdown("Dropdown", {
    --     Title = "Dropdown",
    --     Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
    --     Multi = false,
    --     Default = 1,
    -- })

    -- Dropdown:SetValue("four")

    -- Dropdown:OnChanged(function(Value)
    --     --print("Dropdown changed:", Value)
    -- end)

    -- local dealerContainer = game:GetService("Players").LocalPlayer.PlayerGui.Dealership.Container.Dealership.Dealerlist

    -- for _, dealer in ipairs(dealerContainer:GetChildren()) do
    --     local carNamesAndPrices = {}
    --     for _, car in ipairs(dealer:GetChildren()) do
    --         if car and car:FindFirstChild("Frame") and car.Frame:FindFirstChild("CarName") and car.Frame:FindFirstChild("Type") and car.Frame.Type:FindFirstChild("New") and car.Frame.Type.New.Visible and car.Frame:FindFirstChild("Price") then
    --             local carName = car.Frame.CarName.Text
    --             local carPrice = car.Frame.Price.Text
    --             table.insert(carNamesAndPrices, carName .. " (" .. carPrice .. ")")
    --         end
    --     end

    --     Tabs.CarSection:AddDropdown(dealer.Name, {
    --         Title = dealer.Name,
    --         Values = carNamesAndPrices,
    --         Multi = false,
    --         Default = "--",
    --     })
    -- end


    local dealerContainer = game:GetService("Players").LocalPlayer.PlayerGui.Dealership.Container.Dealership.Dealerlist
    
    
    for _, dealer in ipairs(dealerContainer:GetChildren()) do
        local carNamesAndCodes = {}
        for _, car in ipairs(dealer:GetChildren()) do
            if car and car:FindFirstChild("Frame") and car.Frame:FindFirstChild("CarName") and car.Frame:FindFirstChild("Type") and car.Frame.Type:FindFirstChild("New") and car.Frame.Type.New.Visible and car.Frame:FindFirstChild("Price") then
                local carName = car.Frame.CarName.Text
                local carPrice = car.Frame.Price.Text
                local carDisplayName = carName .. " (" .. carPrice .. ")"
                carNamesAndCodes[carDisplayName] = car.Name
            end
        end
    
        CarTab:AddDropdown(dealer.Name, {
            Title = dealer.Name,
            Values = carNamesAndCodes,
            Multi = false,
            Default = 1,
            Callback = function(Value)
                -- Munculkan dialog konfirmasi
                Window:Dialog({
                    Title = "Konfirmasi Pembelian",
                    Content = "Apakah Anda ingin membeli " .. Value .. "?",
                    Buttons = {
                        {
                            Title = "Ya",
                            Callback = function()
                                -- Kode untuk membeli mobil di sini
                                local args = {
                                    [1] = "Buy",
                                    [2] = carNamesAndCodes[Value], -- Menggunakan kode mobil yang dipilih pengguna
                                    [3] = "White", -- Ganti dengan warna yang sesuai
                                    [4] = dealer.Name -- Ganti dengan dealer yang sesuai
                                }
                                game:GetService("ReplicatedStorage"):WaitForChild("NetworkContainer"):WaitForChild("RemoteFunctions"):WaitForChild("Dealership"):InvokeServer(unpack(args))
                            end
                        },
                        {
                            Title = "Tidak",
                            Callback = function()
                                -- Kode jika pengguna memilih "Tidak"
                            end
                        }
                    }
                })
            end
        })
    end
    

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
