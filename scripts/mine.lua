if not turtle then
    printError("Not a turtle!")
else
    turtle.select(1)
    while true do
        if turtle.getItemSpace == 0 then
            if turtle.getSelectedSlot() == 16 then
                turtle.turnLeft()
                turtle.turnLeft()
                for i = 16, 1, -1 do
                    turtle.select(i)
                    turtle.drop()
                end
                turtle.turnLeft()
                turtle.turnLeft()
            end
            turtle.select(turtle.getSelectedSlot() + 1)
        end
        while turtle.getItemSpace() ~= 0 do
            if turtle.detect() then
                turtle.dig()
            end
        end
    end
end