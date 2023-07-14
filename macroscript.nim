import funcs, utils, strutils, tables

var 
    autumate = splitLines(readFile("macro.macro"), false)
    vars: Table[string, string]

for i in autumate:
    var line: seq[string] = i.split("/")

    if line[1].startsWith("$"):
        line[1] = vars[line[1].replace("$", "")]
    if line[2].startsWith("$"):
        line[2] = vars[line[2].replace("$", "")]

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