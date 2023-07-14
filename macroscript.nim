import macroscriptutils, strutils

var autumate = readLines("macro.macro")

for i in autumate:
    var line: seq[string] = i.split("/")
    case line[0]:
        # mouse movement
        of "setpos":
            setpos(cast[int32](line[1].parseInt), cast[int32](line[2].parseInt))
        of "movepos":
            movepos(cast[int32](line[1].parseInt), cast[int32](line[2].parseInt))
        of "setaxis":
            setaxis(line[1], cast[int32](line[2].parseInt))
        of "moveaxis":
            moveaxis(line[1], cast[int32](line[2].parseInt))
        of "center":
            center()
    
