-- 設定橫向模式
package.path = package.path .. ";./lua/?.lua"

local widget = require( "widget" )
local physics = require( "physics" )
local generator = require("generator")
local createButton = require("createButton")
local movement = require("movement")

local function setLandscapeMode()
    display.setStatusBar(display.HiddenStatusBar) -- 隱藏狀態欄

    -- 將螢幕旋轉至橫向
    native.setProperty("Orientation","landscapeRight")

    -- 設定螢幕的寬度和高度 x(-115,595) y(0,320)
    local width, height = display.contentWidth, display.contentHeight

    -- 更新場景中的內容，以適應新的螢幕尺寸
    -- 這裡可以調整你的場景中的物件位置和大小
end
--物件宣告
---[[  


physics.start()
--physics.setDrawMode( "hybrid" )
--physics.setDrawMode( "debug" )

local shape_1 = { -4.99999380111694,-24.7999973297119, -29.7999935150146,0.800002694129944, -29.3999938964844,14.4000024795532, -18.9999942779541,23.2000026702881, 17.8000068664551,24.8000030517578, 29.8000068664551,14.0000028610229, 29.4000072479248,-5.59999752044678, 8.60000610351563,-24.7999973297119 }
shape_1.density = 1; shape_1.friction = 0.3; shape_1.bounce = 0.2; 

--init player, wall
local player = generator.addPlayer()
local wall_Up = generator.addwallUp()
local wall_Down = generator.addwallDown()
local wall_Right = generator.addwall_Right()
local wall_Left = generator.addwall_Left()
local button_left = createButton.left()
local button_right = createButton.right()
local button_Jump = createButton.Jump(player)

local direction_M = 1
local speed_M = 7
local jumpHeight_M = -20
Move_Left = false
Move_Right = false
onGround = false


local function onCollision_P(event)
    if event.other.id == "ground" then
        onGround = true
        print(onGround)
    elseif event.other.id == "monster" then
        print("Ouch!")
    end
end

local function Jump_M()
    monster:applyLinearImpulse(speed_M, jumpHeight_M, monster.x, monster.y)
end

local function onCollision_M(event)
    if event.phase == "ended" and event.other.id == "wall" then
        math.randomseed(os.time())
        direction_M = direction_M * (-1)
        speed_M = math.random(5,13)
        speed_M = speed_M*direction_M
        print(speed_M)
    end
end

timer.performWithDelay(5000, generator.addMonster, 0)
monster:addEventListener("collision", onCollision_M)
player:addEventListener("collision", onCollision_P)




-- 監聽螢幕觸控事件來觸發跳躍
-- Runtime:addEventListener("touch", jump_P)

local function shoot(event)
    X=event.x
    Y=event.y
end

-- 呼叫函數設置橫向模式
setLandscapeMode()
timer.performWithDelay(2000,Jump_M,0)

Runtime:addEventListener("enterFrame", function() movement.P_move_left(player) end)
Runtime:addEventListener("enterFrame", function() movement.P_move_right(player) end)





