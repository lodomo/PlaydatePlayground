import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local pd = playdate
local gfx <const> = pd.graphics
local draw_circle = gfx.drawCircleAtPoint

local function Point(x0, y0)
    return {
        x = (x0 or 0),
        y = (y0 or 0),
    }
end

local function draw_line(p0, p1)
    gfx.drawLine(p0.x, p0.y, p1.x, p1.y)
end

local function lerp(p0, p1, t)
    local x = p0.x + (p1.x - p0.x) * t
    local y = p0.y + (p1.y - p0.y) * t
    return Point(x, y)
end

local function lerp_perp(origin, p0, p1, t)
    local dx = p1.x - p0.x
    local dy = p1.y - p0.y

    local temp = Point(origin.x, origin.y)
    temp.x = origin.x - (dy * t)
    temp.y = origin.y + dx * t
    return temp
end

local function koch_curve(p0, p1)
    local curve = {
        p0,
        lerp(p0, p1, 1.0/3.0),
        lerp(p0, p1, 1.0/2.0),
        lerp(p0, p1, 2.0/3.0),
        p1,
    }

    curve[3] = lerp_perp(curve[3], curve[2], curve[4], (math.sqrt(3)/2))
    return curve
end


local function init()
    local p1 = Point(10, 10)
    local p2 = Point(390, 230)
    -- draw_line(p1, p2)
    local curve = koch_curve(p1, p2)
    -- Iterate through all the curves
    for i = 1, #curve do
        draw_circle(curve[i].x, curve[i].y, 2)
    end
    draw_line(curve[1], curve[2])
    draw_line(curve[2], curve[3])
    draw_line(curve[3], curve[4])
    draw_line(curve[4], curve[5])
end

function pd.update()
end

init()

