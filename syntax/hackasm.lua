-- ~/.config/nvim/syntax/hackasm.lua
if vim.b.current_syntax then
	return
end

local cmd = vim.cmd

-- Comments
cmd([[syn match hackComment "//.*$"]])

-- Numbers
cmd([[syn match hackNumber "\<\d\+\>"]])

-- Labels: (LOOP), (END), etc.
cmd([[syn match hackLabel "([A-Za-z_.$:][A-Za-z0-9_.$:]*)"]])

-- A-instructions: @value or @symbol
cmd([[syn match hackAInstr "@[A-Za-z0-9_.$:]\+"]])

-- Predefined symbols (registers, pointers, segments)
cmd([[syn keyword hackPredefined SP LCL ARG THIS THAT]])
cmd([[syn match hackPredefined "\<R1\?[0-9]\>"]])
cmd([[syn keyword hackPredefined SCREEN KBD]])

-- Destination part (before =)
cmd([[syn match hackDest "\<\(A\|D\|M\|AM\|AD\|MD\|AMD\)\ze="]])

-- Jump commands (after ;)
cmd([[syn match hackJump ";\s*\zs\(JGT\|JEQ\|JGE\|JLT\|JNE\|JLE\|JMP\)"]])

-- Computation keywords (comp field values)
cmd([[syn keyword hackComp 0 1 D A M]])
cmd([[syn match hackCompOp "[-+!&|]"]])

-- Operators / punctuation
cmd([[syn match hackOperator "[=;]"]])

-- Highlight links
cmd([[hi def link hackComment    Comment]])
cmd([[hi def link hackNumber     Number]])
cmd([[hi def link hackLabel      Label]])
cmd([[hi def link hackAInstr     Identifier]])
cmd([[hi def link hackPredefined Special]])
cmd([[hi def link hackDest       Type]])
cmd([[hi def link hackJump       Statement]])
cmd([[hi def link hackComp       Constant]])
cmd([[hi def link hackCompOp     Operator]])
cmd([[hi def link hackOperator   Operator]])

vim.b.current_syntax = "hackasm"
