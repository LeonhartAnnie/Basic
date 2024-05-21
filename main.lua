-- 設定橫向模式
local function setLandscapeMode()
    display.setStatusBar(display.HiddenStatusBar) -- 隱藏狀態欄

    -- 將螢幕旋轉至橫向
    native.setProperty("Orientation","landscapeRight")

    -- 設定螢幕的寬度和高度
    local width, height = display.contentWidth, display.contentHeight

    -- 更新場景中的內容，以適應新的螢幕尺寸
    -- 這裡可以調整你的場景中的物件位置和大小
end

local physics = require( "physics" )
physics.start()
--physics.setDrawMode( "hybrid" )
--physics.setDrawMode( "debug" )

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


-- 呼叫函數設置橫向模式
setLandscapeMode()


