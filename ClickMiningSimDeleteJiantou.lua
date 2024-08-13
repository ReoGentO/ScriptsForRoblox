if objectPath then
    local equipmentFolder = objectPath:FindFirstChild("EquipmentFolder1298831605")
    if equipmentFolder then
        local tool = equipmentFolder:FindFirstChild("Tool")
        if tool then
            -- Массив имен объектов, которые нужно удалить
            local objectsToDelete = {"jiantou", "black", "1", "body", "light", "effectPart"}
            
            -- Перебираем и удаляем каждый объект, если он существует
            for _, objectName in ipairs(objectsToDelete) do
                local object = tool:FindFirstChild(objectName)
                if object then
                    object:Destroy()
                    print("Объект '" .. objectName .. "' успешно удален.")
                else
                    print("Объект '" .. objectName .. "' не найден.")
                end
            end
        else
            print("Объект 'Tool' не найден.")
        end
    else
        print("Объект 'EquipmentFolder1298831605' не найден.")
    end
else
    print("Объект 'PlayerToolModelFolder' не найден.")
end
