local composer = require("composer")
local scene = composer.newScene()
local createButton = require("createButton")

function scene:create(event)
    composer.removeScene("scenes.mainScene")
    local sceneGroup = self.view
    local background = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    background:setFillColor(0, 355, 0) -- 黑色背景

    local endText = display.newText(sceneGroup, "GameOver", display.contentCenterX, display.contentCenterY, native.systemFont, 40)
    endText:setFillColor(1, 1, 1) -- 白色文字
    local button_restart = createButton.Restart()
    local button_exit = createButton.Exit()
    sceneGroup:insert(background)
    sceneGroup:insert(endText)
    sceneGroup:insert(button_restart)
    sceneGroup:insert(button_exit)
end

function scene:hide(event)
    if event.phase == "will" then
        -- 移除所有顯示物件
        for i = self.view.numChildren, 1, -1 do
            if self.view[i].id == "monster" then
                timer.cancel(self.view[i].jump_timer)
                timer.cancel(self.view[i].fixRotation_timer)
            end
            self.view[i]:removeSelf()
            self.view[i] = nil
        end
    end
end

scene:addEventListener("create", scene)
return scene