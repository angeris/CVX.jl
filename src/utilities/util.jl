macro notimplemented(fn, argtype)
    return :($fn(e::$argtype) = error($(string(fn)), " is not implemented for expression $e"))
end
