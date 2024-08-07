-- teleportScript.lua

-- Уникальный идентификатор для скрипта
local scriptId = "teleportScriptId"

-- Проверка и остановка ранее запущенного скрипта
if _G[scriptId] then
    _G[scriptId]:Disconnect()
    _G[scriptId] = nil
end

local player = game.Players.LocalPlayer -- Получаем текущего игрока
local teleportPosition = Vector3.new(41, 14, -1238) -- Позиция для телепортации

-- Создаем или получаем ScreenGui
local screenGui = player:WaitForChild("PlayerGui"):FindFirstChild("TeleportScreenGui")
if not screenGui then
    screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    screenGui.Name = "TeleportScreenGui"
end

-- Проверка на существование старой кнопки и её удаление
local oldButton = screenGui:FindFirstChild("TeleportButton")
if oldButton then
    oldButton:Destroy()
end

-- Создаем кнопку для телепортации
local button = Instance.new("TextButton")
button.Name = "TeleportButton"
button.Size = UDim2.new(0, 50, 0, 50)
button.Position = UDim2.new(0, 80, 0.5, -25) -- Позиционируем кнопку сбоку
button.Text = "Телепортироваться"
button.Parent = screenGui

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
_G[scriptId] = button.MouseButton1Click:Connect(teleport)
