screen = {guiGetScreenSize()}
screenScale = math.max(0.75, screen[2] / 1080)

function resCalculation(x, y, width, height)
    assert(type(x) == 'number', 'Bad argument @resCalculation value expected, got '..type(x))
    assert(type(y) == 'number', 'Bad argument @resCalculation value expected, got '..type(y))
    assert(type(width) == 'number', 'Bad argument @resCalculation value expected, got '..type(width))
    assert(type(height) == 'number', 'Bad argument @resCalculation value expected, got '..type(height))

    return x * screenScale, y * screenScale, width * screenScale, height * screenScale
end

_dxDrawRectangle = dxDrawRectangle
function dxDrawRectangle(x, y, w, h, ...)
    local x, y, w, h = resCalculation(x, y, w, h)

    return _dxDrawRectangle(x, y, w, h, ...)
end

_dxDrawText = dxDrawText
function dxDrawText(text, x, y, w, h, ...)
    local x, y, w, h = resCalculation(x, y, w, h)

    return _dxDrawText(text, x, y, w + x, h + y, ...)
end

_dxDrawImage = dxDrawImage
function dxDrawImage(x, y, w, h, ...)
    local x, y, w, h = resCalculation(x, y, w, h)
    
    return _dxDrawImage(x, y, w, h, ...)
end

_dxDrawImageSection = dxDrawImageSection
function dxDrawImageSection(x, y, w, h, ...)
    local x, y, w, h = resCalculation(x, y, w, h)
    
    return _dxDrawImageSection(x, y, w, h, ...)
end

_dxCreateFont = dxCreateFont
function dxCreateFont(filePath, fontSize, ...)
    return _dxCreateFont(filePath, (fontSize * screenScale), ...)
end

function isCursorOnElement (x, y, w, h)
    local x, y, w, h = resCalculation(x, y, w, h)
    
    if not isCursorShowing() then
        return false
    end
    
    local cursorX, cursorY = getCursorPosition()
    calculatedCursorX, calculatedCursorY = cursorX * screen[1], cursorY * screen[2]
    
    if calculatedCursorX <= x or calculatedCursorX >= x + w or calculatedCursorY <= y or calculatedCursorY >= y + h then
        return false
    end

    return true
end

function formatNumber(number, sep)
    local money, sep = (number and number or 0), (sep and sep or '.')

    for _ = 1, #tostring(money) / 3 do
        money = utf8.gsub(money, '^(-?%d+)(%d%d%d)', '%1' .. sep .. '%2')
    end
    return money
end

function lerp(a, b, t)
    return a + (b - a) * t
end