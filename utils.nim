import strutils

func `to32`*(str: string): int32 =
    return cast[int32](str.parseInt)