import strutils, tables, nimautogui, nimautogui/utils

proc run(file: string) =
    var
        autumate = splitLines(readFile(file), false)
        vars: Table[string, string]

    for i in autumate:
        var line: seq[string] = i.split("/")

        if line.len > 1:
            if line[1].startsWith("$"):
                line[1] = vars[(line[1]).replace("$", "")]
        if line.len > 2:
            if line[2].startsWith("$"):
                line[2] = vars[(line[2]).replace("$", "")]
    

        case line[0]:
        of "setpos":
            setpos(line[1].to32, line[2].to32)
        of "movepos":
            movepos(line[1].to32, line[2].to32)
        of "setaxis":
            setaxis(line[1], line[2].to32)
        of "moveaxis":
            moveaxis(line[1], line[2].to32)
        of "center":
            center()
        of "wait":
            wait(line[1].parseInt)
        of "mclick":
            mclick(line[1].parseInt)
        of "rclick":
            mclick(line[1].parseInt)
        of "click":
            click(line[1].parseInt)
        of "mousedown":
            mousedown()
        of "mouseup":
            mouseup()
        of "rmousedown":
            rmousedown()
        of "rmouseup":
            rmouseup()
        of "mmousedown":
            mmousedown()
        of "mmouseup":
            mmouseup()
        of "scroll":
            scroll(line[1].to32)
        of "hscroll":
            hscroll(line[1].to32)
        of "var":
            vars[line[1]] = line[2]
        of "log":
            if line[1] == "clipboard":
                line[1] = clipboard()
            if line.len > 2:
                log(line[1], line[2])
            else:
                log(line[1])
        of "import":
            run(line[1])
        of "keydown":
            keydown(line[1])
        of "keyup":
            keyup(line[1])
        of "press":
            press(line[1])
        of "type":
            typewords(line[1])
        of "hotkey":
            hotkey(line[1], line[2])

run("macro.txt")