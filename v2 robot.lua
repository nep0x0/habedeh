local function doJump()
    -- Gantikan ini dengan kode yang menjalankan lompatan karakter
    game:GetService('VirtualInputManager'):SendKeyEvent(true, 'Space', false, uwu)
    wait(0.2)
    game:GetService('VirtualInputManager'):SendKeyEvent(false, 'Space', false, uwu)
end

local function getInTheCar()
            -- seat on drive
        local vim = game:GetService('VirtualInputManager')
        vim:SendKeyEvent(true, 'E', false, game)
        wait(2)
        vim:SendKeyEvent(true, 'E', false, game)
        wait(1)
end



local function checkBubbleTextAndJump(text)
    if text == "jump" or text == "Jump" then
        doJump()
        wait(15)
    end
end

local function checkGetInTheCar(text)
    if text == "in" then
        getInTheCar()
        wait(15)
    end
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Bebek Hub", "GrapeTheme")

local Other = Window:NewTab("Other")
local OtherSection = Other:NewSection("Other")
local toggleState = false -- variabel untuk menyimpan status toggle

local commandBotToggle = OtherSection:NewToggle("Command Bot", "Command Bot", function(state)
    toggleState = state -- menyimpan status toggle di variabel
    if state then
        print("Toggle On")
    else
        print("Toggle Off")
    end
end)

local function main()
    local success, bubbleChatPath = pcall(function()
        -- return game:GetService("CoreGui").BubbleChat.BubbleChat_3598304244
        return game:GetService("CoreGui").BubbleChat.BubbleChat_4707451156
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
                checkBubbleTextAndJump(bubbleText.Text)
                checkGetInTheCar(bubbleText.Text)
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
