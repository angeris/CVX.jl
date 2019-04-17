struct IndexExpression <: Expression
    child::Expression
    indices::UnitRange{Int64}
end

curvature(e::IndexExpression) = curvature(e.child)
slope(e::IndexExpression) = slope(e.child)
sign(e::IndexExpression) = sign(e.child)
