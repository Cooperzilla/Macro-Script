import winim, os, osproc, math

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

proc click*(num: int) =
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

proc rclick*(num: int) =
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

proc mclick*(num: int) =
    for i in 0..num:
        mmousedown()
        mmouseup()

##proc keydown(key: string) = # WIP
## var
## input: INPUT
## inputs: UINT = 1

##input.type = INPUT_KEYBOARD
## input.ki.wScan = key[0]
## input.ki.dwFlags = KEYEVENTF_UNICODE
## input.ki.time = 0
## input.ki.dwExtraInfo = 0

##SendInput(inputs, input, cast[int32](sizeof(INPUT)))

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
    setpos(cast[int32]((GetSystemMetrics(0) / 2).round.to_int), cast[int32]((GetSystemMetrics(1) / 2).round.to_int))

proc log*(text: string, file: string = "macro_log.txt") =
    var log = open("macro_log.txt", fmAppend)
    log.writeLine(text)

proc clipboard*: string =
    ##if OpenClipboard(0):
        ##var
            ##data = GetClipboardData(CF_TEXT)
            ##text = cast[string](cast[char](GlobalLock(data)))
        ##GlobalUnlock(data)
        ##CloseClipboard()
        ##return text
    return execProcess("powershell Get-Clipboard")