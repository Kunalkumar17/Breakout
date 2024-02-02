StartState = Class{__includes = BaseState}

local highlighted = 0

function StartState:update()
    if love.keyboard.wasPressed('w') then
        highlighted = highlighted - 1
        if highlighted < 0 then
            highlighted = 2
        end 
    end

    if love.keyboard.wasPressed('s') then
        highlighted = highlighted + 1
        highlighted = highlighted % 3
    end 

    if highlighted == 2 then
        if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
            love.event.quit()
        end 
    elseif highlighted == 0 then 
        if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
            gStateMachine:change('play')
        end 
    end           
end 

function StartState:render()
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('BREAKOUT' ,0 , VIRTUAL_HEIGHT/3 , VIRTUAL_WIDTH , 'center')
    
    love.graphics.setFont(gFonts['medium'])
    
    if highlighted == 0 then
        love.graphics.setColor(103/255, 1, 1, 1)
        love.graphics.setFont(gFonts['medium2'])
    end
    
    love.graphics.printf('START', 0 , VIRTUAL_HEIGHT/2 + 50, VIRTUAL_WIDTH , 'center')

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(gFonts['medium'])

    if highlighted == 1 then
        love.graphics.setColor(103/255, 1, 1, 1) 
        love.graphics.setFont(gFonts['medium2'])
    end 

    love.graphics.printf('HIGH SCORE', 0 , VIRTUAL_HEIGHT/2 + 70, VIRTUAL_WIDTH , 'center')

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(gFonts['medium'])

    if highlighted == 2 then
        love.graphics.setColor(103/255, 1, 1, 1) 
        love.graphics.setFont(gFonts['medium2'])
    end 

    love.graphics.printf('EXIT', 0 , VIRTUAL_HEIGHT/2 + 90, VIRTUAL_WIDTH , 'center')

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(gFonts['medium'])


end 