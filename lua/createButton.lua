local widget = require( "widget" )

local createButton = {}

local b_Press_left = function( event )
    if event.phase == "began" or event.phase == "moved" then
        Move_Left=true
    elseif event.phase == "ended" then
        Move_Left=false
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
        OnEvent = b_Press_left,                           
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
    }
    return button_right
end

function createButton.Jump()
    local button_Jump = widget.newButton
    {
            defaultFile = "images/explode1.png",          -- 未按按鈕時顯示的圖片
            overFile = "images/explode2.png",             -- 按下按鈕時顯示的圖片
            label = "Jump",                              -- 按鈕上顯示的文字
            font = native.systemFont,                     -- 按鈕使用字型
            labelColor = { default = { 0, 0, 1 } },       -- 按鈕字體顏色   
            fontSize = 20,                                -- 按鈕文字字體大小
            emboss = true,                                -- 立體效果
            x = 280,
            y = 280,
    }
    return button_Jump
end

return createButton