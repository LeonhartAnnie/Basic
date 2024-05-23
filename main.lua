-- 設定橫向模式
package.path = package.path .. ";./Basic/lua/?.lua"

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

local direction_M = 1
local speed_M = 7
local jumpHeight_P = -15
local jumpHeight_M = -20
local onGround = false
local table_right = nil
local table_left = nil

local function onCollision_P(event)
    if event.other.id == "ground" then
        onGround = true
        print(onGround)
    elseif event.other.id == "monster" then
        print("Ouch!")
    end
end

local function onCollision_M(event)
    if event.phase == "began" and event.other.id == "wall" then
        math.randomseed(os.time())
        direction_M = direction_M * (-1)
        speed_M=math.random(13)
        if speed_M<4 then
            speed_M = 5
        end
        speed_M = speed_M*direction_M
        print(speed_M)
    end
end

player:addEventListener("collision", onCollision_P)
dispObj_1:addEventListener("collision", onCollision_M)

local function jump_P(event)
    if event.phase == "began" and onGround then
        onGround=false
        print(onGround)
        player:applyLinearImpulse(0, jumpHeight_P, player.x, player.y)
    end
end

-- 監聽螢幕觸控事件來觸發跳躍
-- Runtime:addEventListener("touch", jump_P)

local function shoot(event)
    X=event.x
    Y=event.y
end
local function Jump_M()
    dispObj_1:applyLinearImpulse(speed_M, jumpHeight_M, dispObj_1.x, dispObj_1.y)
end
-- 呼叫函數設置橫向模式
setLandscapeMode()
timer.performWithDelay(2000,Jump_M,-1)

local b_Press_left = function( event )
    player:applyLinearImpulse(-5,0, player.x, player.y)
end

local b_Press_right = function( event )
    player:applyLinearImpulse(5,0, player.x, player.y)
end

local button_left = widget.newButton
{
        defaultFile = "images/explode1.png",          -- 未按按鈕時顯示的圖片
        overFile = "images/explode2.png",             -- 按下按鈕時顯示的圖片
        label = "Left",                              -- 按鈕上顯示的文字
        font = native.systemFont,                     -- 按鈕使用字型
        labelColor = { default = { 0, 0, 1 } },       -- 按鈕字體顏色   
        fontSize = 20,                                -- 按鈕文字字體大小
        emboss = true,                                -- 立體效果
        onPress = function(event)
            -- 啟動計時器，每隔一段時間執行一次
            local timerDuration = 100  -- 設定計時器的間隔時間（毫秒）
            table_left=timer.performWithDelay(timerDuration, b_Press_left, 0)
            -- 0 表示無限次
        end,
        onRelease = function(event)
            -- 停止計時器
            timer.cancel(table_left)
            -- 在這裡執行放開按鈕時的操作
            print("Button released!")
        end,
}
button_left.x = -40; button_left.y = 280
local button_right = widget.newButton
{
        defaultFile = "images/explode1.png",          -- 未按按鈕時顯示的圖片
        overFile = "images/explode2.png",             -- 按下按鈕時顯示的圖片
        label = "Right",                              -- 按鈕上顯示的文字
        font = native.systemFont,                     -- 按鈕使用字型
        labelColor = { default = { 0, 0, 1 } },       -- 按鈕字體顏色   
        fontSize = 20,                                -- 按鈕文字字體大小
        emboss = true,                                -- 立體效果
        onPress = function(event)
            -- 啟動計時器，每隔一段時間執行一次
            local timerDuration = 100  -- 設定計時器的間隔時間（毫秒）
            table_right=timer.performWithDelay(timerDuration, b_Press_right, 0)
            -- 0 表示無限次
        end,
        onRelease = function(event)
            -- 停止計時器
            timer.cancel(table_right)
            -- 在這裡執行放開按鈕時的操作
            print("Button released!")
        end,
        
}
button_right.x = 30; button_right.y = 280
local button_Jump = widget.newButton
{
        defaultFile = "images/explode1.png",          -- 未按按鈕時顯示的圖片
        overFile = "images/explode2.png",             -- 按下按鈕時顯示的圖片
        label = "Jump",                              -- 按鈕上顯示的文字
        font = native.systemFont,                     -- 按鈕使用字型
        labelColor = { default = { 0, 0, 1 } },       -- 按鈕字體顏色   
        fontSize = 20,                                -- 按鈕文字字體大小
        emboss = true,                                -- 立體效果
        onPress = jump_P,
        
}
button_Jump.x = 280; button_Jump.y = 280
