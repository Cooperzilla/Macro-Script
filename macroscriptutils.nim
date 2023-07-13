import winim

proc setpos*(x: int32, y: int32) =
    SetCursorPos(x, y)

proc movepos*(x: int32, y: int32) =
    var cords: POINT
    GetCursorPos(cords)
    setpos(cords.x + x, cords.y + y)

proc mousedown*() =
    var
        input: INPUT
        inputs: UINT = 1

    input.type = INPUT_MOUSE
    input.mi.dx = 0
    input.mi.dy = 0
    input.mi.mouseData = 0
    input.mi.dwFlags = MOUSEEVENTF_LEFTDOWN
    input.mi.time = 0
    input.mi.dwExtraInfo = 0

    SendInput(inputs, input, cast[int32](sizeof(INPUT)))

proc mouseup*() =
    var
        input: INPUT
        inputs: UINT = 1

    input.type = INPUT_MOUSE
    input.mi.dx = 0
    input.mi.dy = 0
    input.mi.mouseData = 0
    input.mi.dwFlags = MOUSEEVENTF_LEFTUP
    input.mi.time = 0
    input.mi.dwExtraInfo = 0

    SendInput(inputs, input, cast[int32](sizeof(INPUT)))



proc click*(num: int32) =
    mousedown()
    mouseup()