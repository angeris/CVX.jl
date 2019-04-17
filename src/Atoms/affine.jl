struct IndexExpression <: Expression
    child::Expression
    indices::UnitRange{Int64}
end

curvature(e::IndexExpression) = curvature(e)
slope(e::IndexExpression) = slope(e)
sign(e::IndexExpression) = sign(e)
