monitor = peripheral.find("monitor")
terminal = term.redirect(monitor)
startX = 1
startY = 1
width, height = term.getSize()
middleX = math.ceil(width/2)
middleY = math.ceil(height/2)
radius = 7
backgroundColour = term.getBackgroundColour()
ratio = width/height

for i = 1, 359, 1 do
    a = math.sin(i/180*math.pi)*radius
    b = math.sqrt(radius^2-a^2)
    if i > 90 and i < 270 then
        b = -b
    end
    term.redirect(terminal)
    drawX = math.floor(middleX+b*ratio+0.5)
    drawY = math.floor(middleY-a+0.5)
    print(a, b, i .. "º", drawX, drawY, ratio)
    term.redirect(monitor)
    paintutils.drawPixel(drawX, drawY, colours.white)
end
term.setBackgroundColour(backgroundColour)
term.redirect(terminal)
