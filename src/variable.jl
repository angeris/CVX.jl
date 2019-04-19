struct Variable <: Expression
    shape::Int # For now, support only vectors
end

curvature(v::Variable) = AFFINE
slope(v::Variable) = INCREASING
sign(v::Variable) = NOSIGN

size(v::Variable) = v.shape
size(v::Variable, i::Int) = v.shape[i]
