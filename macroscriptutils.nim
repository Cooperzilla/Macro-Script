import winim, os

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
    for i in 0..num:
        mousedown()
        mouseup()

proc wait*(time: int) =
    sleep(time)

proc moveaxis*(axis: string, value: int32) =
    if axis == "x":
        var cords: POINT
        GetCursorPos(cords)
        setpos(cords.x + value, cords.y)
    elif axis == "y":
        var cords: POINT
        GetCursorPos(cords)
        setpos(cords.x, cords.y + value)

proc rmousedown*() =
    var
        input: INPUT
        inputs: UINT = 1

    input.type = INPUT_MOUSE
    input.mi.dx = 0
    input.mi.dy = 0
    input.mi.mouseData = 0
    input.mi.dwFlags = MOUSEEVENTF_RIGHTDOWN
    input.mi.time = 0
    input.mi.dwExtraInfo = 0

    SendInput(inputs, input, cast[int32](sizeof(INPUT)))

proc rmouseup*() =
    var
        input: INPUT
        inputs: UINT = 1

    input.type = INPUT_MOUSE
    input.mi.dx = 0
    input.mi.dy = 0
    input.mi.mouseData = 0
    input.mi.dwFlags = MOUSEEVENTF_RIGHTUP
    input.mi.time = 0
    input.mi.dwExtraInfo = 0

    SendInput(inputs, input, cast[int32](sizeof(INPUT)))

proc rclick*(num: int32) =
    for i in 0..num:
        rmousedown()
        rmouseup()

proc scroll*(num: int32) =
    var
        input: INPUT
        inputs: UINT = 1

    input.type = INPUT_MOUSE
    input.mi.mouseData = num
    input.mi.dwFlags = MOUSEEVENTF_WHEEL

    SendInput(inputs, input, cast[int32](sizeof(INPUT)))

proc hscroll*(num: int32) =
    var
        input: INPUT
        inputs: UINT = 1

    input.type = INPUT_MOUSE
    input.mi.mouseData = num
    input.mi.dwFlags = MOUSEEVENTF_HWHEEL

    SendInput(inputs, input, cast[int32](sizeof(INPUT)))

proc mmousedown*() =
    var
        input: INPUT
        inputs: UINT = 1

    input.type = INPUT_MOUSE
    input.mi.dx = 0
    input.mi.dy = 0
    input.mi.mouseData = 0
    input.mi.dwFlags = MOUSEEVENTF_MIDDLEDOWN
    input.mi.time = 0
    input.mi.dwExtraInfo = 0

    SendInput(inputs, input, cast[int32](sizeof(INPUT)))

proc mmouseup*() =
    var
        input: INPUT
        inputs: UINT = 1

    input.type = INPUT_MOUSE
    input.mi.dx = 0
    input.mi.dy = 0
    input.mi.mouseData = 0
    input.mi.dwFlags = MOUSEEVENTF_MIDDLEUP
    input.mi.time = 0
    input.mi.dwExtraInfo = 0

    SendInput(inputs, input, cast[int32](sizeof(INPUT)))

proc mclick*(num: int32) =
    for i in 0..num:
        mmousedown()
        mmouseup()

proc keydown(key: string) = # WIP
    var
        input: INPUT
        inputs: UINT = 1

    input.type = INPUT_KEYBOARD
    input.mi.dx = 0
    input.mi.dy = 0
    input.mi.mouseData = 0
    ##input.mi.dwFlags = KEYEV
    input.mi.time = 0
    input.mi.dwExtraInfo = 0

    SendInput(inputs, input, cast[int32](sizeof(INPUT)))

proc setaxis*(axis: string, value: int32) =
    if axis == "x":
        var cords: POINT
        GetCursorPos(cords)
        setpos(value, cords.y)
    elif axis == "y":
        var cords: POINT
        GetCursorPos(cords)
        setpos(cords.x, cords.y + value)

proc center* =
    setpos(GetSystemMetrics(0), GetSystemMetrics(1))