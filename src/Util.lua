function GenerateQuads(texture, width, height, offsetx, offsety, frames)
    local textureWidth, textureHeight = texture:getDimensions()
    local counter = 1
    local x, y = offsetx, offsety
    local quads = {}
    for i = 0, frames do 
        local quad = love.graphics.newQuad(x, y, width, height, texture:getDimensions())
        x = x + width
        y = y + height
        quads[counter] = quad
        counter = counter + 1
    end
    return quads
end