function GenerateQuads(width, height, texture)
    local quads = {}
    local imWidth, imHeight = texture:getDimensions()
    local numberQuadsX = imWidth / width
    local numberQuadsY = imHeight / height
    local x = 0
    local y = 0
    for j = 0, numberQuadsY do
        for i = 0, numberQuadsX do
            local quad = love.graphics.newQuad(x, y * height, width, height, texture:getDimensions())
            x = x + width
            table.insert(quads, quad)
        end
    end
    return quads
end