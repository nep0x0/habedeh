local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = Library:MakeWindow({Name = "Bebek Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "BebekHub"})

local Main = Window:MakeTab({Name = "Main", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local MainSection = Main:AddSection({Name = "Main"})


MainSection:AddToggle({
    Name = "Robot Bebek",
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

--jump
local function doJump()
    -- Gantikan ini dengan kode yang menjalankan lompatan karakter
    game:GetService('VirtualInputManager'):SendKeyEvent(true, 'Space', false, uwu)
    wait(0.2)
    game:GetService('VirtualInputManager'):SendKeyEvent(false, 'Space', false, uwu)
end

-- seat on drive
local function getInTheCar()
        local vim = game:GetService('VirtualInputManager')
        vim:SendKeyEvent(true, 'E', false, game)
        wait(2)
        vim:SendKeyEvent(true, 'E', false, game)
        wait(1)
end

--- message function---
-----------------------

-- Mengambil instance dari LocalPlayer
local player = game.Players.LocalPlayer

-- Fungsi untuk mengirim pesan ke sistem chat
local function SendMessage(message)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
        message,
        "All" -- "All" artinya pesan akan dikirim ke seluruh pemain dalam permainan
    )
end

--- end massage function ---
----------------------------


-------------------------
--teleport function------

local function TeleportToDestination(destination)
    getInTheCar()
    
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

    
        -- Hitungan mundur 1 menit
    local countdownTime = 20 -- 1 menit dalam detik
    repeat
        -- SendMessage("Teleportasi selesai dalam " .. countdownTime .. " detik.")
        wait(1)
        countdownTime = countdownTime - 1
    until countdownTime <= 0
    -- driveTheCar()
    wait(2)
    doJump()
    wait(1)
    getInTheCar()
    wait(1)
    doJump()
    -- Pesan setelah hitungan mundur selesai
    wait(22)
    SendMessage("***")
    
end

--end teleport funtion --
-------------------------





----------------------
-- command funciton --




-- to pt shad
local function toShad()
    -- 21769, 1052, -26873
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-21769, 1052, -26873))
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    wait(2)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
end


-- Fungsi Teleport ke Palimanan
local function toPalimanan()
    -- local countdownTime = 60 -- 1 menit dalam detik
    -- getInTheCar()
    -- wait(.2)
    -- Lakukan teleportasi ke lokasi Palimanan
    TeleportToDestination(Vector3.new(-12959, 1057, -16319))

    -- -- Tunggu hitungan mundur
    -- repeat
    --     wait(1)
    --     countdownTime = countdownTime - 1
    -- until countdownTime <= 0

    -- -- Setelah hitungan mundur selesai, kirim pesan "Teleportasi sudah ready!"
    -- SendMessage(".")
end

-- Fungsi Teleport ke Cirebon
local function toCirebon()
    -- local countdownTime = 60 -- 1 menit dalam detik
    -- getInTheCar()
    -- wait(.2)
    -- Lakukan teleportasi ke lokasi Cirebon
    TeleportToDestination(Vector3.new(-21774, 1048, -27773))

    -- -- Tunggu hitungan mundur
    -- repeat
    --     wait(1)
    --     countdownTime = countdownTime - 1
    -- until countdownTime <= 0

    -- -- Setelah hitungan mundur selesai, kirim pesan "Teleportasi sudah ready!"
    -- SendMessage(".")
end

-- Fungsi Teleport ke KM279
local function toKM279()
    -- local countdownTime = 60 -- 1 menit dalam detik
    -- getInTheCar()
    -- wait(.2)
    -- Lakukan teleportasi ke lokasi KM279
    TeleportToDestination(Vector3.new(-25871, 1055, -43846))

    -- -- Tunggu hitungan mundur
    -- repeat
    --     wait(1)
    --     countdownTime = countdownTime - 1
    -- until countdownTime <= 0

    -- -- Setelah hitungan mundur selesai, kirim pesan "Teleportasi sudah ready!"
    -- SendMessage(".")
end

-- Fungsi Teleport ke Pekalongan
local function toPekalongan()
    -- local countdownTime = 60 -- 1 menit dalam detik
    -- getInTheCar()
    -- wait(.2)
    -- Lakukan teleportasi ke lokasi Pekalongan
    TeleportToDestination(Vector3.new(-38685, 1018, -62449))

    -- -- Tunggu hitungan mundur
    -- repeat
    --     wait(1)
    --     countdownTime = countdownTime - 1
    -- until countdownTime <= 0

    -- -- Setelah hitungan mundur selesai, kirim pesan "Teleportasi sudah ready!"
    -- SendMessage(".")
end

-- Fungsi Teleport ke Semarang
local function toSemarang()
    -- local countdownTime = 60 -- 1 menit dalam detik
    -- getInTheCar()
    -- wait(.2)
    -- Lakukan teleportasi ke lokasi Semarang
    TeleportToDestination(Vector3.new(-50858, 1018, -86462))

    -- -- Tunggu hitungan mundur
    -- repeat
    --     wait(1)
    --     countdownTime = countdownTime - 1
    -- until countdownTime <= 0

    -- -- Setelah hitungan mundur selesai, kirim pesan "Teleportasi sudah ready!"
    -- SendMessage(".")
end

-- reset
local function resetBot()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end






-- end command funciton --
-------------------------

--------------------
-- check funciton --

local function checkJump(text)
    if text == "jump" then
        SendMessage(".")
        doJump()
        wait(14)
    end
end

local function checkGetInTheCar(text)
    if text == "in" then
        SendMessage(".")
        getInTheCar()
        wait(14)
    end
end

local function checkToShad(text)
    if text == "shd" then
        SendMessage(".")
        toShad()
        wait(14)
    end
end

local function checkToPalimanan(text)
    if text == "pl" then
        SendMessage(".")
        toPalimanan()
        wait(14)
    end
end

local function checkToCirebon(text)
    if text == "cr" then
        toCirebon()
        SendMessage(".")
        wait(14)
    end
end

local function checkToKM279(text)
    if text == "km" then
        SendMessage(".")
        toKM279()
        wait(14)
    end
end

local function checkToPekalongan(text)
    if text == "pk" then
        SendMessage(".")
        toPekalongan()
        wait(14)
    end
end

local function checkToSemarang(text)
    if text == "sm" then
        SendMessage(".")
        toSemarang()
        wait(14)
    end
end

local function checkResetBot(text)
    if text == "r" then
        SendMessage(".")
        wait(2)
        resetBot()
        wait(14)
    end
end

-- end check funciton --
------------------------
-- Mengambil instance dari LocalPlayer
local player = game.Players.LocalPlayer

-- Fungsi untuk mengirim pesan ke sistem chat
local function SendMessage(message)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
        message,
        "All" -- "All" artinya pesan akan dikirim ke seluruh pemain dalam permainan
    )
end

------------------------
--  chat reader --------

local function main()
    local success, bubbleChatPath = pcall(function()
        -- return game:GetService("CoreGui").BubbleChat.BubbleChat_3598304244
        return game:GetService("CoreGui").BubbleChat.BubbleChat_3598304244
    end)

    if success and bubbleChatPath then
        -- Pola untuk mencocokkan nomor indeks dinamis dalam nama objek (contoh: "Bubble57")
        local pattern = "Bubble(%d+)"

        -- Cari objek dengan nomor indeks dinamis
        local bubbleText
        for _, bubbleObject in pairs(bubbleChatPath.BubbleChatList:GetChildren()) do
            local bubbleName = bubbleObject.Name
            local dynamicIndex = bubbleName:match(pattern)
            if dynamicIndex then
                -- Dapatkan objek Text dari Bubble dengan nomor indeks yang sesuai
                bubbleText = bubbleObject.Frame.Text
                break
            end
        end

        if bubbleText then
            -- Cetak nilai dari properti Text pada objek Text
            print("Nilai dari properti Text pada objek Text:")
            print(bubbleText.Text)

            if toggleState then
                checkGetInTheCar(bubbleText.Text)
                checkJump(bubbleText.Text)
                checkToShad(bubbleText.Text)
                checkToPalimanan(bubbleText.Text)
                checkToCirebon(bubbleText.Text)
                checkToKM279(bubbleText.Text)
                checkToPekalongan(bubbleText.Text)
                checkToSemarang(bubbleText.Text)
                checkResetBot(bubbleText.Text)
            end
        else
            print("Tidak ada Bubble dengan nomor indeks dinamis yang ditemukan.")
        end
    else
        print("Belum ada command atau BubbleChat_4707451156 tidak valid.")
    end
end

while true do
    if toggleState then
        main()
    end
    wait(1) -- melakukan pengecekan setiap 1 detik
end



-- end  chat reader --
----------------------
-- Call the Orion Library's Init function to finish setting up the UI
Library:Init()

