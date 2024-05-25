-- 設定橫向模式
package.path = package.path .. ";./lua/?.lua"

local movieclip = require("movieclip")
local physics = require( "physics" )
local generator = require("generator")
local createButton = require("createButton")
local movement = require("movement")
local composer = require("composer")

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

Move_Left = false
Move_Right = false
onGround = false

composer.gotoScene("scenes.mainScene")

-- 呼叫函數設置橫向模式
setLandscapeMode()
-- 監聽螢幕觸控事件來觸發射擊








