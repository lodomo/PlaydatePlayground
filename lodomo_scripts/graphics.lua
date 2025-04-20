import "CoreLibs/graphics"
import "scripts/lodomo/types"

local pd = playdate
local pdgfx <const> = pd.graphics

local drawText = pdgfx.drawText

GRAPHICS = {}

--[[
-- Draw text to the screen.
-- @param text - The string to draw
-- @param x - The x coordinate of the top left corner
-- @param y - The y coordinate of the top left corner
]]
function GRAPHICS.draw_text(text, x, y)
    drawText(text, x, y)
end
