if not turtle then
    error("Not a turtle!")
end

restarting = false
blocksToMine = settings.get("scripts.mine.blocksToMine")
positionChest = settings.get("scripts.mine.positionChest")

function hasValue(array, wantedValue)
    for index, value in ipairs(array) do
        if value == wantedValue then
            return true
        end
    end
    
    return false
end

if positionChest > 0 then
    function turn()
        for turns = 1, positionChest do
            turtle.turnLeft()
        end
    end
    function turnBack()
        for turns = 1, positionChest do
            turtle.turnRight()
        end
    end
elseif positionChest < 0 then
    function turn()
        for turns = 1, -positionChest do
            turtle.turnRight()
        end
    end
    function turnBack()
        for turns = 1, -positionChest do
            turtle.turnLeft()
        end
    end
else
    error("positionChest cannot be 0")
end



turtle.select(1)
while true do
    if turtle.getItemSpace() == 0 then
        if turtle.getSelectedSlot() == 16 then
            restarting = true
            turn()
            for slot = 16, 1, -1 do
                turtle.select(slot)
                turtle.drop()
            end
           turnBack() 
        end
        if not restarting then
            turtle.select(turtle.getSelectedSlot() + 1)
        end
        restarting = false
    end
    while turtle.getItemSpace() ~= 0 do
        if turtle.detect() then
            _, blockData = turtle.inspect()
            if hasValue(blocksToMine, blockData["name"]) then
                turtle.dig()
            else
                turtle.turnLeft() 
            end
            sleep(0)
        end
    end
end

