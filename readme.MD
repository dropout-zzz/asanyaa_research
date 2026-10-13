## general information

"SystemC" is a proprietary game engine developed by INTERHEART and also used by Candy Soft.

## asset layout

| file name | purpose |
| --- | --- |
| `ACT_*.txt` | likely shipped for showing debugging messages, likely not parsed directly by game |

## script numbering

scripts are numbered using 3 components: "script letter", "script ID" and "script sub-ID".

as an example, `A0100_150` means script letter "A", ID 100 and sub-script ID 150.

scripts are split into these small parts to support branching.

## extra notes about script instructions

### conditional jump instructions

in addition to "next script" IDs that game automatically jumps to when reaching end of a script (or when user selects an option), some jump instructions are available inside the script body.

"near jump" jumps to another instruction within the current script, "far jump" can go to a different sub-script.

these instructions checks if a condition flag is true and branches based on that.

furthermore, `-1` in jump destinations means do nothing (not performing a jump)

if condition flag ID is `-1`, use condition from previous instructions (such as "compare flag equals")
