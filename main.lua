-- 設定橫向模式
package.path = package.path .. ";./lua/?.lua"

local movieclip = require("movieclip")
local physics = require( "physics" )
local generator = require("generator")
local createButton = require("createButton")
local movement = require("movement")
local collision = require("collison")

local function setLandscapeMode()
    display.setStatusBar(display.HiddenStatusBar) -- 隱藏狀態欄

    -- 將螢幕旋轉至橫向
    native.setProperty("Orientation","landscapeRight")

    -- 設定螢幕的寬度和高度 x(-115,595) y(0,320)
    local width, height = display.contentWidth, display.contentHeight
end

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

local health = player.health
local direction_M = 1
local speed_M = 7
local jumpHeight_M = -20
Move_Left = false
Move_Right = false
onGround = false


local monster = generator.addMonster()
--timer.performWithDelay(5000, generator.addMonster, 0)

local function shoot(event)
    local fire = display.newImageRect( "images/fire_01.png",8,8)
    transition.to( newLaser, { x=event.x,y=event.y, time=500,
        onComplete = function() display.remove( newLaser ) end})
    Fire = movieclip.newAnim({  "./images/fire_01.png","./images/fire_02.png",
                            "./images/fire_03.png","./images/fire_04.png",
                            "./images/fire_05.png","./images/fire_06.png",
                            "./images/fire_07.png","./images/fire_08.png",
                            "./images/fire_09.png","./images/fire_10.png",
                            "./images/fire_11.png","./images/fire_12.png"  })
    Fire:play({startFrame=1,endFrame=9,loop=1,remove=true})
    Fire.x,Fire.y = player.x,player.y --位置
    Fire.width,Fire.height=8,8
    Fire.setDrag{drag=false}
    fire:removeSelf()
    fire = nil 
end
-- 呼叫函數設置橫向模式
setLandscapeMode()


-- 監聽螢幕觸控事件來觸發射擊
Runtime:addEventListener("touch", shoot)

Runtime:addEventListener("enterFrame", function() movement.P_move_left(player) end)
Runtime:addEventListener("enterFrame", function() movement.P_move_right(player) end)








