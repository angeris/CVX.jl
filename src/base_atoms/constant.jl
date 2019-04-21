export Constant

struct Constant <: DisciplinedFunction
    value::Union{Float64, Array{Float64, 1}}
end

curvature(::Constant) = AFFINE
slope(::Constant) = CONSTANT
#XXX: Likely will require fixing
sign(c::Constant) = c.value ≥ 0 ? POSITIVE : NEGATIVE

push_model!(m::Model, c::Constant) = c.value
