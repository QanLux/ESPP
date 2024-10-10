local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local function highlightPlayers()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character and player ~= LocalPlayer then
            -- Create a Highlight object
            local highlight = Instance.new("Highlight")
            highlight.Adornee = player.Character
            highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Red color for highlight
            highlight.FillTransparency = 0.5 -- Set transparency
            highlight.OutlineColor = Color3.fromRGB(0, 0, 0) -- Black outline
            highlight.OutlineTransparency = 0.5 -- Outline transparency
            highlight.Parent = player.Character
        end
    end
end

-- Run the highlight function
highlightPlayers()

-- Optional: Connect to player added event to highlight new players
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Wait() -- Wait for the character to load
    highlightPlayers() -- Highlight the new player
end)
