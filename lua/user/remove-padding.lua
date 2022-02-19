function Sad(line_nr, from, to, fname)
  vim.cmd(string.format("silent !sed -i '%ss/%s/%s/' %s", line_nr, from, to, fname)) 
end

local linePaddingX = '49'; -- line number of padding:x in alacritty.yml
local linePaddingY = '50'; -- line number of padding:y in alacritty.yml
local paddingX = '20'; -- amount of horizontal padding
local paddingY = '20'; -- amount of veritcal padding
local alacrittyYmlSrc = '~/.config/alacritty/alacritty.yml'; -- src to alacritty.yml

function IncreasePadding() 
  Sad(linePaddingX, 0, paddingX, alacrittyYmlSrc)
  Sad(linePaddingY, 0, paddingY, alacrittyYmlSrc)
end

function DecreasePadding()
  Sad(linePaddingX, paddingX, 0, alacrittyYmlSrc)
  Sad(linePaddingY, paddingY, 0, alacrittyYmlSrc)
end

vim.cmd[[
  augroup ChangeAlacrittyPadding
   au! 
   au VimEnter * lua DecreasePadding()
   au VimLeavePre * lua IncreasePadding()
  augroup END 
]]
