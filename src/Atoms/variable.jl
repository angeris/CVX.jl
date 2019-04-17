struct Variable <: Expression
    shape::Int # For now, support only vectors
end

curvature(v::Variable) = :Affine
slope(v::Variable) = :Increasing
sign(v::Variable) = :NoSign

size(v::Variable) = v.shape
size(v::Variable, i::Int) = v.shape[i]
