PaddleSelectState = Class{__includes = BaseState}

local x = 6

function PaddleSelectState:update(dt)
    if love.keyboard.wasPressed('a') then  
        x = x - 4
        if x < 4 then   
            gSounds['no-select']:play()
        end 
        x = math.max(2 , x )
    end
    if love.keyboard.wasPressed('d') then
        x = x + 4
        if x > 14 then
            gSounds['no-select']:play()
        end 
        x = math.min(x , 14)
    end 

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('serve' , {
            paddle = Paddle(x),
            bricks = LevelMaker.createMap(1),
            health = 3,
            score = 0,
            level = 1
        } )
    end 

    if love.keyboard.wasPressed('escape') then  
        gStateMachine:change('start')
    end 
end 

function PaddleSelectState:render()
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Select the Paddle' , 0 , VIRTUAL_HEIGHT / 3 , VIRTUAL_WIDTH , 'center') 
    
    love.graphics.draw(gTextures['arrows'] , gFrames['arrow'][1] ,70 , 150)
    love.graphics.draw(gTextures['arrows'] , gFrames['arrow'][2] ,320 , 150 )
    
    love.graphics.draw(gTextures['main'] , gFrames['paddles'][x] ,  180 , 155)
end 