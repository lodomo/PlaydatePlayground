import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local pd = playdate
local gfx <const> = pd.graphics
local number_test = 2147483600

local function init()
    while number_test > 0 do
        number_test = number_test + 1
    end
    print("number_test: " .. number_test)
end

function pd.update()
end

init()

