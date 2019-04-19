# Utilities

"Generates a function for types which have not been implemented"
macro notimplemented(fn, argtype)
    return :($fn(e::$argtype) = error($(string(fn)), " is not implemented for expression $e"))
end
