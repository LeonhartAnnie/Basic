local composer = require("composer")
local generator = require("generator")
local createButton = require("createButton")
local movement = require("movement")
local movieclip = require("movieclip")
local collision = require("collison")
local scene = composer.newScene()

function scene:create(event)
    --init player, wall
    local sceneGroup = self.view
    local player = generator.addPlayer()
    local wall_Up = generator.addwallUp()
    local wall_Down = generator.addwallDown()
    local wall_Right = generator.addwall_Right()
    local wall_Left = generator.addwall_Left()
    local button_left = createButton.left()
    local button_right = createButton.right()
    local button_Jump = createButton.Jump(player)
    local button_exit = createButton.Exit()
    --[[local background = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    background:setFillColor(0, 0, 355) -- 藍色背景]]--
    local scoreBroad = display.newText("Score : ",-20,15,system.nativeFont,20)
    local scoreDisplay = generator.addScore()
    local healthBroad = display.newText("Health : ",-20,30,system.nativeFont,20)
    local healthDisplay = generator.addHealth(player)

    sceneGroup:insert(player)
    sceneGroup:insert(wall_Up)
    sceneGroup:insert(wall_Down)
    sceneGroup:insert(wall_Right)
    sceneGroup:insert(wall_Left)
    sceneGroup:insert(button_left)
    sceneGroup:insert(button_right)
    sceneGroup:insert(button_Jump)
    sceneGroup:insert(button_exit)
    sceneGroup:insert(scoreBroad)
    sceneGroup:insert(scoreDisplay)
    sceneGroup:insert(healthBroad)
    sceneGroup:insert(healthDisplay)
    
    local addMonster = function () generator.addMonster(sceneGroup) end
    local updateScore = function() generator.updateScore(score) end
    local updateHealth = function() generator.updateHealth(player) end

    self.monsterTimer =  timer.performWithDelay(2000, addMonster, 0)
    self.scoreTimer = timer.performWithDelay(10,updateScore,0)
    self.healthTimer = timer.performWithDelay(10,updateHealth,0)

    local function shoot(event)
        local fire = generator.addFire(player)
        local move_fire = function () movement.move_fire(event, fire, player) end 
        fire.move_fire = move_fire
        Runtime:addEventListener("enterFrame", move_fire)
        --transition.to( fire, { x=event.x,y=event.y, time=500,
        --  onComplete = function() display.remove( fire ) end})
        Fire = movieclip.newAnim({  "./images/fire_01.png","./images/fire_02.png",
                                    "./images/fire_03.png","./images/fire_04.png",
                                    "./images/fire_05.png","./images/fire_06.png",
                                    "./images/fire_07.png","./images/fire_08.png",
                                    "./images/fire_09.png","./images/fire_10.png",
                                    "./images/fire_11.png","./images/fire_12.png"  })
        Fire:play({startFrame=1,endFrame=12,loop=2,remove=true})
        Fire.x,Fire.y = fire.x,fire.y --位置
        Fire.width,Fire.height=20,20
        Fire.setDrag{drag=false}
    end
    
    local P_move_left = function() movement.P_move_left(player) end
    local P_move_right = function() movement.P_move_right(player) end

    player.P_move_left = P_move_left
    player.P_move_right = P_move_right
    
    Runtime:addEventListener("touch", shoot)
    Runtime:addEventListener("enterFrame", P_move_left)
    Runtime:addEventListener("enterFrame", P_move_right)

    self.shootListener = shoot
    self.P_move_left = P_move_left
    self.P_move_right = P_move_right
end

function scene:hide(event)
    if event.phase == "will" then
        -- 移除事件監聽器
        Runtime:removeEventListener("touch", self.shootListener)
        Runtime:removeEventListener("enterFrame", self.P_move_left)
        Runtime:removeEventListener("enterFrame", self.P_move_right)

        -- 取消計時器
        if self.monsterTimer then
            timer.cancel(self.monsterTimer)
            self.monsterTimer = nil
        end
        
        if self.scoreTimer then
            timer.cancel(self.scoreTimer)
            self.scoreTimer = nil
        end

        if self.healthTimer then
            timer.cancel(self.healthTimer)
            self.healthTimer = nil
        end

        -- 移除所有顯示物件
        print(self.view.numChildren)
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
scene:addEventListener("hide", scene)
return scene