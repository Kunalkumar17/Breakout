function GenaerateQuads(atlas, tileWidth , tileHeight)
    local sheetWidth = atlas:getWidth()
    local sheetHeight = atlas:getHeight()

    local sheetCounter = 1
    local spritesheet = {}

    for y = 0 , sheetHeight - 1 do 
        for x = 0 , sheetWidth -1 do
            spritesheet[sheetCounter] = love.graphics.newQuad(x * tileWidth , y * tileHeight , tileWidth , tileHeight , atlas:getDimensions())
            sheetCounter = sheetCounter + 1
        end 
    end 

    return spritesheet
end 

function table.slice(tbl, first, last, step)
    local sliced = {}
  
    for i = first or 1, last or #tbl, step or 1 do
      sliced[#sliced+1] = tbl[i]
    end
  
    return sliced
end

function GenerateQuadPaddles(atlas)
    local x = 0 
    local y = 64

    local Counter = 1 
    local quads = {}

    quads[Counter] = love.graphics.newQuad(x , y , 32 , 16, atlas:getDimensions())
    Counter = Counter + 1

    quads[Counter] = love.graphics.newQuad(x + 32 , y , 64 , 16 , atlas:getDimensions())
    Counter = Counter + 1 

    quads[Counter] = love.graphics.newQuad(x + 94 , y , 96 , 16 , atlas:getDimensions())
    Counter = Counter + 1 

    quads[Counter] = love.graphics.newQuad(x , y + 16 , 128 , 16 , atlas:getDimensions())
    Counter = Counter + 1
    
    x = 0
    y = y + 32

    return quads
end 