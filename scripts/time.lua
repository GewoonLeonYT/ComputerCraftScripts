terminal = peripheral.find('monitor')
local termLib = require("libs.termLib")
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
    formattedTime = string.format("%05s", textutils.formatTime(time, true))
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