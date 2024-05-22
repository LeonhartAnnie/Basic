-- 設定橫向模式
package.path = package.path .. ";./lua/?.lua"

local widget = require( "widget" )
local physics = require( "physics" )
local generator = require("generator")

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



local dispObj_1 = display.newImageRect( "images/sprite_1.png",60, 50 )
dispObj_1.x = -90
dispObj_1.y = 100
physics.addBody( dispObj_1, 
    {density=shape_1.density, friction=shape_1.friction, bounce=shape_1.bounce, shape=shape_1}
)



--]]
local jumpHeight_P = -15
local jumpHeight_M = -15
local onGround = false

local function onCollision(event)
    if event.phase == "began" then
        onGround = true
    elseif event.phase == "ended" then
        onGround = false
    end
end

player:addEventListener("collision", onCollision)

local function jump(event)
    if event.phase == "began" and onGround then
        player:applyLinearImpulse(10, jumpHeight_P, player.x, player.y)
    end
end

-- 監聽螢幕觸控事件來觸發跳躍
Runtime:addEventListener("touch", jump)

local function shoot(event)
    X=event.x
    Y=event.y
end
local function Acount()
    dispObj_1:applyLinearImpulse(5, jumpHeight_M, dispObj_1.x, dispObj_1.y)
end
-- 呼叫函數設置橫向模式
setLandscapeMode()
timer.performWithDelay( 2000,Acount,-1)



