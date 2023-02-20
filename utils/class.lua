private = {}
setmetatable(private, {__mode = 'k'})

function Class(tbl, parent)
    setmetatable(tbl, {
        __call = function(cls, ...)
            local instance = {}

            setmetatable(instance, {
                __index = cls,
            })

            if (parent and type(parent) == 'table') then
                setmetatable(tbl, {
                    __index = parent,
                })
            end

            instance:constructor(...)

            return instance
        end
    })
    return tbl
end