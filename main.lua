-- 設定橫向模式
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

local physics = require( "physics" )
physics.start()
--physics.setDrawMode( "hybrid" )
--physics.setDrawMode( "debug" )

local shape_1 = { -4.19999408721924,-13.9999971389771, 6.60000610351563,-13.5999975204468, 23.8000068664551,-5.19999742507935, 24.2000064849854,8.00000286102295, 17.4000072479248,14.8000030517578, -15.799994468689,14.8000030517578, -24.9999942779541,8.80000305175781, -24.5999946594238,-1.59999716281891 }
shape_1.density = 1; shape_1.friction = 0.3; shape_1.bounce = 0.2; 

local player = display.newImageRect("images/sprite_1.png", 50, 29)
player.x = -90
player.y = 305
physics.addBody(player, "dynamic", {radius = 20, bounce = 0.2})

local dispObj_1 = display.newImageRect( "images/sprite_1.png", 50, 29 )
dispObj_1.x = -90
dispObj_1.y = 305
physics.addBody( dispObj_1, 
    {density=shape_1.density, friction=shape_1.friction, bounce=shape_1.bounce, shape=shape_1}
)
local wall_Down = display.newImageRect( "images/ground.png", 710, 70 )
wall_Down.x = 240
wall_Down.y = 355 --355
physics.addBody( wall_Down, "static", { density=1, friction=0.3, bounce=0.2 } )

local wall_Left = display.newImageRect( "images/ground.png", 480, 70 )
wall_Left.x = -150
wall_Left.y = 145
wall_Left.rotation = 90
physics.addBody( wall_Left, "static", { density=1, friction=0.3, bounce=0.2 } )

local wall_Right = display.newImageRect( "images/ground.png", 480, 70 )
wall_Right.x = 630
wall_Right.y = 145
wall_Right.rotation = -90
physics.addBody( wall_Right, "static", { density=1, friction=0.3, bounce=0.2 } )

local wall_Up = display.newImageRect( "images/ground.png", 480, 70 )
wall_Up.x = 240
wall_Up.y = -35
wall_Up.rotation = -180
physics.addBody( wall_Up, "static", { density=1, friction=0.3, bounce=0.2 } )

--]]
local jumpHeight = -0.3
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
        player:applyLinearImpulse(0, jumpHeight, player.x, player.y)
    end
end

-- 監聽螢幕觸控事件來觸發跳躍
Runtime:addEventListener("touch", jump)

local function shoot(event)
    X=event.x
    Y=event.y
end
local function Acount()
    print(1)
end
-- 呼叫函數設置橫向模式
setLandscapeMode()
timer.performWithDelay( 1000,Acount,5)



