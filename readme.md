# Macro Script

A simple program for creating macros.

You type your macro into a macro.txt file.

Docs below.

#### Important notes:

- maximum imports(at least for importing the same file) is ~500
- 0,0 for where your cursor is, is top left
- you cannot use the press or type command to press the "/" key

<details>
<summary>Docs</summary>
 
### Basic Syntax
```
{command}/{argument 1}/{argument 2}
example: setaxis/x/100
```

### List of Commands

#### Mouse Movement
```
setpos/{number}/{number} - sets the mouse's position to the specified coordinates

movepos/{number}/{number} - moves the mouse's position to the specified coordinates

setaxis/{x or y}/{number} - sets the mouse's position to the specified coordinate on the specified axis

moveaxis/{x or y}/{number} - moves the mouse's position to the specified coordinate on the specified axis

center - sets the mouse's position to the center
```

#### Mouse Usage
```
click/{number} - clicks the mouse that number of times

rclick/{number} - right clicks the mouse that number of times

mclick/{number} - middle clicks the mouse that number of times

mousedown - holds the mouse's left click until released

rmousedown - holds the mouse's right click until released

mmousedown - holds the mouse's middle click until released

mouseup - releases the mouse's left click

rmouseup - releases the mouse's right click

mmouseup - releases the mouse's middle click

scroll - scrolls by the specified number

hscroll - scrolls horizontally by the specified number
```

#### Keyboard usage
```
press/{key} - presses the specified key

keydown/{key} - holds down the specified key

keyup/{key} - releases the specified key

hotkey/{key} - presses the 2nd key while holding down the 1st key

type/{words} - presses all keys in the words
```

#### Miscellaneous and flow control
```
var/{name}/{value} - sets a variable that can be called later by using ${name}

log/{value} - logs the given value to a log file(macro_log.txt)

import/{file} - runs the given macro file

clipboard - can be used as the value in var or log, puts in whats on your clipboard

wait/{time} - waits for a time, 1000 = 1 second
```
</details>