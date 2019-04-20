# ----- General affine atoms -----
# Gets indices of a given expression
export getindex

struct IndexFunction <: DisciplinedFunction
    child::DisciplinedFunction
    indices::Union{Int64, UnitRange{Int64}} # TODO: For now
end

# There is probably a better thing to do here
curvature(f::IndexFunction) = curvature(f.child)
slope(f::IndexFunction) = slope(f.child)
sign(f::IndexFunction) = sign(f.child)

getindex(v::DisciplinedFunction, idx::Int64) = IndexFunction(v, idx)
getindex(v::DisciplinedFunction, I::UnitRange{Int64}) = IndexFunction(v, I)

push_model!(m::Model, a::IndexFunction) = push_model!(m, a.child)[a.indices]


# ----- Inequalities and equalities -----
# Equalities
export ==

struct EqualityConstraintExpression <: ConstraintExpression
    lhs::DisciplinedFunction
    rhs::DisciplinedFunction
end

==(lhs::DisciplinedFunction, rhs::DisciplinedFunction) = EqualityConstraintExpression(lhs, rhs)

==(lhs::DisciplinedFunction, rhs::Real) = EqualityConstraintExpression(lhs, Constant(float(rhs)))

function push_model!(m::Model, c::EqualityConstraintExpression)
    @constraint(m, push_model!(m, c.lhs) .== push_model!(m, c.rhs))
end

# Inequalities
export ≤, ≥

struct InequalityConstraintExpression <: ConstraintExpression
    lhs::DisciplinedFunction
    rhs::DisciplinedFunction
end

≤(lhs::DisciplinedFunction, rhs::DisciplinedFunction) = InequalityConstraintExpression(lhs, rhs)
≥(lhs::DisciplinedFunction, rhs::DisciplinedFunction) = InequalityConstraintExpression(rhs, lhs)

# TODO: Complete definitions
≤(lhs::DisciplinedFunction, rhs::Real) = InequalityConstraintExpression(lhs, Constant(float(rhs)))

function push_model!(m::Model, c::InequalityConstraintExpression)
    @constraint(m, push_model!(m, c.lhs) .≤ push_model!(m, c.rhs))
end
