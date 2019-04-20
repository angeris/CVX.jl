export Variable, Constant

struct Variable <: DisciplinedFunction
    shape::Int # For now, support only vectors
end

curvature(::Variable) = AFFINE
slope(::Variable) = INCREASING
sign(::Variable) = NOSIGN

size(v::Variable) = v.shape
size(v::Variable, i::Int) = v.shape[i]

function push_model!(m::Model, a::Variable)
    if a.shape == 1
        return @variable(m)
    end

    return @variable(m, [1:a.shape])
end

struct Constant <: DisciplinedFunction
    value::Float64
end

curvature(::Constant) = AFFINE
slope(::Constant) = CONSTANT
#XXX: Likely will require fixing
sign(::Constant) = value ≥ 0 ? POSITIVE : NEGATIVE

push_model!(m::Model, c::Constant) = c.value
