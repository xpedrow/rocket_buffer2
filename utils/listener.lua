local modules = {}

function export(attrName, attrInstance)
    modules[#modules + 1] = {
        name = attrName,
        instance = attrInstance
    }
end

function import(attrName)
    for index, _ in ipairs(modules) do
        if (modules[index].name == attrName) then
            return modules[index].instance
        end
    end
    return warn("Unable to find module: " .. attrName)
end
