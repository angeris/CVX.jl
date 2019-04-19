# Gets indices of a given expression
struct IndexFun <: DisciplinedFunction
    child::DisciplinedFunction
    indices::UnitRange{Int64} # TODO: For now
end

# There is probably a better thing to do here
curvature(f::IndexFun) = curvature(f.child)
slope(f::IndexFun) = slope(f.child)
sign(f::IndexFun) = sign(f.child)

getindex(v::Variable, idx::Int64) = IndexFun(v, i:i)
getindex(v::Variable, I::UnitRange{Int64}) = IndexFun(v, I)


# Inequalities and equalities
struct EqualityConstraintExpression <: Expression
    lhs::DisciplinedFunction
    rhs::DisciplinedFunction
end

==(lhs::DisciplinedFunction, rhs::DisciplinedFunction) = EqualityConstraintExpression(lhs, rhs)

struct InequalityConstraintExpression <: Expression
    lhs::DisciplinedFunction
    rhs::DisciplinedFunction
end

# This will need to be rewritten for conic-type constraints
≤(lhs::DisciplinedFunction, rhs::DisciplinedFunction) = InequalityConstraintExpression(lhs, rhs)
≥(lhs::DisciplinedFunction, rhs::DisciplinedFunction) = InequalityConstraintExpression(rhs, lhs)
