EnterHighScoreState = Class{__includes = BaseState}

local highlighted = 1

local initials = ""

local  char = {
    [1] = 65,
    [2] = 65,
    [3] = 65
}

function EnterHighScoreState:enter(params)
    self.score = params.score
    self.highScores = params.highScores 
    self.scoreIndex = params.scoreIndex
end 

function EnterHighScoreState:update(dt)
    if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('enter') then  

    initials = string.char( char[1] ) .. string.char( char[2] ) .. string.char( char[3] )

    for i = 10 , self.scoreIndex , -1 do 
        self.highScores[i + 1] = {
            name = self.highScores[i].name,
            score = self.highScores[i].score
        }
    end 

    self.highScores[self.scoreIndex].name = initials
    self.highScores[self.scoreIndex].score = self.score

    local scoreStr = ''

    for i = 1 , 10 do 
        scoreStr = scoreStr .. self.highScores[i].name..'\n'
        scoreStr = scoreStr .. tostring(self.highScores[i].score)..'\n'
    end 

    love.filesystem.write('breakout.lst' , scoreStr)

    gStateMachine:change('high-scores' , {
        highScores = self.highScores
    })
    end
    if highlighted == 1 then    
        if love.keyboard.wasPressed('w') then
            char[1] = char[1] + 1
            if char[1] > 90 then    
                char[1] = 65
            end 
        elseif love.keyboard.wasPressed('s') then
            char[1] = char[1] - 1
            if char[1] < 65 then    
                char[1] = 90
            end 
        end 
    end 

    if highlighted == 2 then
        if love.keyboard.wasPressed('w') then
            char[2] = char[2] + 1
            if char[2] > 90 then    
                char[2] = 65
            end 
        elseif love.keyboard.wasPressed('s') then
            char[2] = char[2] - 1
            if char[2] < 65 then    
                char[2] = 90
            end 
        end 
    end 

    if highlighted == 3 then
        if love.keyboard.wasPressed('w') then
            char[3] = char[3] + 1
            if char[3] > 90 then    
                char[3] = 65
            end 
        elseif love.keyboard.wasPressed('s') then
            char[3] = char[3] - 1
            if char[3] < 65 then    
                char[3] = 90
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

    love.graphics.print(tostring(string.char(char[1])) , 160 , 100)

    love.graphics.setColor(1, 1, 1, 1)

    if highlighted == 2 then
        love.graphics.setColor(103/255, 1, 1, 1) 
    end 

    love.graphics.print(tostring(string.char(char[2])) , 210 , 100)

    love.graphics.setColor(1, 1, 1, 1)

    if highlighted == 3 then
        love.graphics.setColor(103/255, 1, 1, 1) 
    end 

    love.graphics.print(tostring(string.char(char[3])) , 260 , 100)

    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.setFont(gFonts['small'])
    love.graphics.printf('Press Enter to confirm' , 0 , VIRTUAL_HEIGHT - 30 , VIRTUAL_WIDTH + 5 , 'center')
    love.graphics.printf('Enter your Name' , 0 , VIRTUAL_HEIGHT / 2 - 50 , VIRTUAL_WIDTH , 'center')
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Congratulations! You Have A High Score' , 0 , 30 , VIRTUAL_WIDTH , 'center')
end     