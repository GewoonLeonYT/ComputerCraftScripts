restarting = 0
if not turtle then
    printError("Not a turtle!")
else
    turtle.select(1)
    while true do
        if turtle.getItemSpace() == 0 then
            if turtle.getSelectedSlot() == 16 then
                restarting = 1
                turtle.turnLeft()
                turtle.turnLeft()
                for i = 16, 1, -1 do
                    turtle.select(i)
                    turtle.drop()
                end
                turtle.turnLeft()
                turtle.turnLeft()
            end
            if not restarting then
                turtle.select(turtle.getSelectedSlot() + 1)
            end
            restarting = 0
        end
        while turtle.getItemSpace() ~= 0 do
            if turtle.detect() then
                turtle.dig()
                sleep(0)
            end
        end
    end
end