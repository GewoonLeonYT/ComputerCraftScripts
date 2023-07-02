terminal = peripheral.find('monitor')
package.path = package.path .. ";../libs/termLib.lua"
local termLib = require("termLib")
termLib.initialize(terminal)

terminal.clear()
prevTime = 0
prevFormattedTime = ''
prevTicks = 0
prevName = ''

ticksDay = 0
ticksSunset = 12000
ticksNight = 13000

dayCleared = 0


function showTime()
    time = os.time()
    formattedTime = textutils.formatTime(time, true)
    formattedHours = string.format("%02d" , tonumber(string.sub(formattedTime, -5, -4)))
    formattedSeconds = string.sub(formattedTime, -3, -1)
    formattedTime = formattedHours .. formattedSeconds

    ticks = (time * 1000 + 18000) % 24000

    if ticks < ticksSunset then
        currentName = "Day"
    elseif ticks < ticksNight then
        currentName = "Sunset"
    else
        currentName = "Night"
    end
    termLib.setAdvance(prevName, currentName)

    termLib.setAdvance(prevFormattedTime, formattedTime)

    termLib.setAdvance(prevTicks, ticks)

    prevTime = time
    prevFormattedTime = formattedTime
    prevTicks = ticks
    prevName = currentName

    terminal.setCursorPos(1, 1)
    sleep(0)
end

print("Press any key to abort")

parallel.waitForAny(
    function() os.pullEvent("key") end,
    function() 
        while true do
            showTime()
        end
    end
)
terminal.clear()