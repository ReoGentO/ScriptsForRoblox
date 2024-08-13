-- Функция для безопасного поиска дочернего объекта
local function safeFind(parent, childName)
    if parent then
        return parent:FindFirstChild(childName)
    else
        return nil
    end
end

-- Удаление объектов из workspace.PlayerToolModelFolder.EquipmentFolder1298831605.Tool
do
    local playerToolModelFolder = safeFind(workspace, "PlayerToolModelFolder")
    local equipmentFolder = safeFind(playerToolModelFolder, "EquipmentFolder1298831605")
    local tool = safeFind(equipmentFolder, "Tool")

    if tool then
        local objectsToDelete = {"jiantou", "black", "1", "body", "light"}
        
        for _, objectName in ipairs(objectsToDelete) do
            local object = tool:FindFirstChild(objectName)
            if object then
                object:Destroy()
                print("Объект '" .. objectName .. "' успешно удален из Tool.")
            else
                print("Объект '" .. objectName .. "' не найден в Tool.")
            end
        end
    else
        print("Объект 'Tool' не найден по указанному пути.")
    end
end

-- Удаление объекта из workspace.Area["1"]["100"].CustomBuyGoods.Halo__HaloSaleItem_1
do
    local area = safeFind(workspace, "Area")
    local folder1 = safeFind(area, "1")
    local folder100 = safeFind(folder1, "100")
    local customBuyGoods = safeFind(folder100, "CustomBuyGoods")
    local haloSaleItem = safeFind(customBuyGoods, "Halo__HaloSaleItem_1")

    if haloSaleItem then
        haloSaleItem:Destroy()
        print("Объект 'Halo__HaloSaleItem_1' успешно удален из CustomBuyGoods.")
    else
        print("Объект 'Halo__HaloSaleItem_1' не найден по указанному пути.")
    end
end
