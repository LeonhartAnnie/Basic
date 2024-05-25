local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
    composer.removeScene("scenes.mainScene")
    local sceneGroup = self.view
    local background = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    background:setFillColor(0, 0, 0) -- 黑色背景

    local endText = display.newText(sceneGroup, "GameOver", display.contentCenterX, display.contentCenterY, native.systemFont, 40)
    endText:setFillColor(1, 1, 1) -- 白色文字
end

scene:addEventListener("create", scene)
return scene