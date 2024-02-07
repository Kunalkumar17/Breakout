EnterHighScoreState = Class{__includes = BaseState}

local highlighted = 1

local  name = {
    [1] = 65,
    [2] = 65,
    [3] = 65
}

function EnterHighScoreState:update(dt)
    if highlighted == 1 then    
        if love.keyboard.wasPressed('w') then
            name[1] = name[1] + 1
            if name[1] > 90 then    
                name[1] = 65
            end 
        elseif love.keyboard.wasPressed('s') then
            name[1] = name[1] - 1
            if name[1] < 65 then    
                name[1] = 90
            end 
        end 
    end 

    if highlighted == 2 then
        if love.keyboard.wasPressed('w') then
            name[2] = name[2] + 1
            if name[2] > 90 then    
                name[2] = 65
            end 
        elseif love.keyboard.wasPressed('s') then
            name[2] = name[2] - 1
            if name[2] < 65 then    
                name[2] = 90
            end 
        end 
    end 

    if highlighted == 3 then
        if love.keyboard.wasPressed('w') then
            name[3] = name[3] + 1
            if name[3] > 90 then    
                name[3] = 65
            end 
        elseif love.keyboard.wasPressed('s') then
            name[3] = name[3] - 1
            if name[3] < 65 then    
                name[3] = 90
            end 
        end 
    end 

    if love.keyboard.wasPressed('a') then
        highlighted = highlighted - 1
        if highlighted < 1 then 
            highlighted = 3
        end 
    elseif love.keyboard.wasPressed('d') then
        highlighted = highlighted + 1
        if highlighted > 3 then 
            highlighted = 1
        end 
    end 
    
end 

function EnterHighScoreState:render()
    love.graphics.setFont(gFonts['large'])

    if highlighted == 1 then
        love.graphics.setColor(103/255, 1, 1, 1) 
    end 

    love.graphics.print(tostring(string.char(name[1])) , 160 , 100)

    love.graphics.setColor(1, 1, 1, 1)

    if highlighted == 2 then
        love.graphics.setColor(103/255, 1, 1, 1) 
    end 

    love.graphics.print(tostring(string.char(name[2])) , 210 , 100)

    love.graphics.setColor(1, 1, 1, 1)

    if highlighted == 3 then
        love.graphics.setColor(103/255, 1, 1, 1) 
    end 

    love.graphics.print(tostring(string.char(name[3])) , 260 , 100)

    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.setFont(gFonts['small'])
    love.graphics.printf('Press Enter to confirm' , 0 , VIRTUAL_HEIGHT - 30 , VIRTUAL_WIDTH + 5 , 'center')
    love.graphics.printf('Enter your Name' , 0 , VIRTUAL_HEIGHT / 2 - 50 , VIRTUAL_WIDTH , 'center')
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Congratulations! You Have A High Score' , 0 , 30 , VIRTUAL_WIDTH , 'center')
end     