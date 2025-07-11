ServeState = Class{__includes = BaseState}

function ServeState:enter(params)
    self.paddle = params.paddle
    self.bricks = params.bricks
    self.health = params.health
    self.score = params.score
    self.level = params.level
    self.highScores = params.highScores

    self.ball = Ball()
    self.ball.skin = math.random(7)
end 

function ServeState:update(dt)
    self.paddle:update(dt)
    self.ball.x = self.paddle.x + self.paddle.width / 2 - 4
    self.ball.y = self.paddle.y - 8

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play' , {
            paddle = self.paddle,
            bricks = self.bricks,
            health = self.health,
            score = self.score,
            ball = self.ball,
            level = self.level,
            highScores = self.highScores
        } )
    end 

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end 
    
end 

function ServeState:render()
    self.paddle:render()
    self.ball:render()

    for k , brick in pairs(self.bricks) do
        brick:render()
    end 
    renderHealth(self.health)
    renderScore(self.score)

    love.graphics.printf('Press Enter to serve' , 0 , VIRTUAL_HEIGHT / 2 , VIRTUAL_WIDTH , 'center')
end 
