local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Title of the library", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]


-- player tab

local PlayerTab = Window:MakeTab({
 Name = "Player",
 Icon = "rbxassetid://4483345998",
 PremiumOnly = false
})

local Section = PlayerTab:AddSection({
 Name = "Movement"
})

PlayerTab:AddSlider({
 Name = "Walkspeed",
 Min = 16,
 Max = 500,
 Default = 16,
 Color = Color3.fromRGB(255,255,255),
 Increment = 1,
 ValueName = "WS",
 Callback = function(Value)
  game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
 end    
})

PlayerTab:AddSlider({
 Name = "Jump Height",
 Min = 16,
 Max = 500,
 Default = 5,
 Color = Color3.fromRGB(255,255,255),
 Increment = 1,
 ValueName = "Height",
 Callback = function(Value)
  game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
 end    
})


--other tab

local OtherTab = Window:MakeTab({
 Name = "Other",
 Icon = "rbxassetid://4483345998",
 PremiumOnly = false
})

local Section = OtherTab:AddSection({
 Name = "Other"
})


OtherTab:AddButton({
 Name = "Delete Doors",
 Callback = function()
       game.Workspace.Doors:Destroy()
   end    
})

OrionLib:Init()
