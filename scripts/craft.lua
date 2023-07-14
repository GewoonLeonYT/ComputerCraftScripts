craftingSlots = {
    1, 2, 3, 
    5, 6, 7, 
    9, 10, 11
}
a, blockData = turtle.inspect()

while true do
    while blockData ~= "minecraft:chest" do
        turtle.turnLeft()
        sleep(0)
    end
    for i = 1, #craftingSlots do
        turtle.select(craftingSlots[i])
        currentSlotAmount = turtle.getItemCount()
        currentSlotSpace = turtle.getItemSpace()
        while currentSlotSpace ~= 0 do
            turtle.suck(currentSlotAmount - currentSlotSpace)
        end  
    end 
    turtle.select(16)
    turtle.craft()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.drop()
    turtle.turnLeft()
    turtle.turnLeft()
    sleep(0)
end