import "CoreLibs/crank"

local pd = playdate
local pdgfx <const> = pd.graphics

local seen = {}

local function print_table(tbl, indent)
    if seen[tbl] then return end
    seen[tbl] = true
    indent = indent or ""

    for k, v in pairs(tbl) do
        print(indent .. tostring(k), v)
        if type(v) == "table" then
            print_table(v, indent .. "    ")
        end
    end
end

local function init()
    pdgfx.drawText("Hello World!", 20, 30)
    print_table(_G)
end

function pd.update()
end

init()
