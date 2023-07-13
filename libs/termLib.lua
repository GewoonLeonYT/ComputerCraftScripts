local function initialise(terminal)
    terminal = terminal
end
local function setTerm(previous, current)
    previous = tostring(previous) or ''
    current = tostring(current) or ''
    if #previous > #current then
        terminal.clearLine()
    end
    terminal.write(current)
end

local function nextLine()
    cursorPosX, cursorPosY = terminal.getCursorPos()
    line = cursorPosY
    terminal.setCursorPos(1, line + 1)
end

local function setAdvance(previous, current) 
    setTerm(previous, current)
    nextLine()
end

return { initialise = initialise, initialize = initialise, setTerm = setTerm, nextLine = nextLine, setAdvance = setAdvance }