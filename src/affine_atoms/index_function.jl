# Gets indices of a given expression
export getindex

struct IndexFunction <: DisciplinedFunction
    child::DisciplinedFunction
    indices::IndexTypes
end

# There is probably a better thing to do here
curvature(f::IndexFunction) = curvature(f.child)
slope(f::IndexFunction) = slope(f.child)
sign(f::IndexFunction) = sign(f.child)

getindex(v::DisciplinedFunction, idx::IndexTypes) = IndexFunction(v, idx)

push_model!(m::Model, a::IndexFunction) = push_model!(m, a.child)[a.indices]
