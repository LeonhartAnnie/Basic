local widget = require( "widget" )
local movement = require("movement")
local createButton = {}

local b_Press_left = function( event )
    if event.phase == "began" or event.phase == "moved" then
        Move_Left=true
    elseif event.phase == "ended" then
        Move_Left=false
    end
end

local b_Press_right = function( event )
    if event.phase == "began" or event.phase == "moved" then
        Move_Right=true
    elseif event.phase == "ended" then
        Move_Right=false
    end
end


function createButton.left()
    local button_left = widget.newButton
    {
        defaultFile = "images/explode1.png",          -- 未按按鈕時顯示的圖片
        overFile = "images/explode2.png",             -- 按下按鈕時顯示的圖片
        label = "Left",                              -- 按鈕上顯示的文字
        font = native.systemFont,                     -- 按鈕使用字型
        labelColor = { default = { 0, 0, 1 } },       -- 按鈕字體顏色   
        fontSize = 20,                                -- 按鈕文字字體大小
        emboss = true,
        x = -40,
        y = 280,
        onEvent = b_Press_left,                           
    }
    return button_left
end

function createButton.right()
    local button_right = widget.newButton
    {
        defaultFile = "images/explode1.png",          -- 未按按鈕時顯示的圖片
        overFile = "images/explode2.png",             -- 按下按鈕時顯示的圖片
        label = "Right",                              -- 按鈕上顯示的文字
        font = native.systemFont,                     -- 按鈕使用字型
        labelColor = { default = { 0, 0, 1 } },       -- 按鈕字體顏色   
        fontSize = 20,                                -- 按鈕文字字體大小
        emboss = true,                                -- 立體效果
        x = 30,
        y = 280,
        onEvent = b_Press_right,                           
    }
    return button_right
end

function createButton.Jump(player)
    local button_Jump = widget.newButton
    {
            defaultFile = "images/explode1.png",          -- 未按按鈕時顯示的圖片
            overFile = "images/explode2.png",             -- 按下按鈕時顯示的圖片
            label = "Jump",                              -- 按鈕上顯示的文字
            font = native.systemFont,                     -- 按鈕使用字型
            labelColor = { default = { 0, 0, 1 } },       -- 按鈕字體顏色   
            fontSize = 20,                                -- 按鈕文字字體大小
            emboss = true,                                -- 立體效果
            x = 550,
            y = 280,
            onEvent = function (event) movement.jump_P(player, event) end
    }
    return button_Jump
end

local exitGame=function(event)
    if system.getInfo("platformName") == "Android" or system.getInfo("platformName") == "Win" then
        native.requestExit()
    else
        os.exit()
    end
end

function createButton.Exit()
    local exitButton = widget.newButton
    {
            defaultFile = "images/explode1.png",          -- 未按按鈕時顯示的圖片
            overFile = "images/explode2.png",             -- 按下按鈕時顯示的圖片
            label = "Exit",                              -- 按鈕上顯示的文字
            font = native.systemFont,
            labelColor = { default = { 0, 0, 1 } },
            fontSize = 20,
            emboss = true,
            x = 550,
            y = 15,
            onPress = exitGame,
    }
    return exitButton
end

return createButton