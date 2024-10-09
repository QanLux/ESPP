local Players = game:GetService("Players")

local function highlightPlayer(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local highlight = Instance.new("Highlight")
    
    highlight.Adornee = character
    highlight.FillColor = Color3.new(1, 0, 0) -- Change to desired highlight color
    highlight.OutlineColor = Color3.new(1, 1, 0) -- Change to desired outline color
    highlight.Parent = character
end

-- Highlight existing players
for _, player in ipairs(Players:GetPlayers()) do
    highlightPlayer(player)
end

-- Highlight new players as they join
Players.PlayerAdded:Connect(highlightPlayer)
