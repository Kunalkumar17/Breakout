VictoryState = Class{__includes = BaseState}


function VictoryState:enter(params)
    self.level = params.level
    self.paddle = params.paddle
    self.bricks = params.bricks
    self.health = params.health
    self.score = params.score 
    self.ball = params.ball
end 

function VictoryState:update( dt )
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('serve' , {
            paddle = self.paddle,
            bricks = LevelMaker.createMap(self.level + 1),
            health = self.health,
            score = self.score ,
            level = self.level + 1
        })
    end 
end

function VictoryState:render()
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('Level '..tostring(self.level)..' Complete!', 0 , VIRTUAL_HEIGHT / 2 , VIRTUAL_WIDTH , 'center')

    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Press Enter to Proceed to Next Level' , 0 ,  VIRTUAL_HEIGHT / 2 + 70 , VIRTUAL_WIDTH , 'center')
end