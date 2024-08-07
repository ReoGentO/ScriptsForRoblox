-- teleportScript.lua

local player = game.Players.LocalPlayer -- Получаем текущего игрока
local teleportPosition = Vector3.new(41, 14, -1238) -- Позиция для телепортации

-- Создаем кнопку для телепортации
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0, 10, 0.5, -25) -- Позиционируем кнопку сбоку
button.Text = "Телепортироваться"
button.Parent = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")

-- Функция телепортации
local function teleport()
    local character = player.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(teleportPosition)
        end
    end
end

-- Привязываем функцию телепортации к нажатию кнопки
button.MouseButton1Click:Connect(teleport)
