export ==

struct EqualityConstraintExpression <: ConstraintExpression
    lhs::DisciplinedFunction
    rhs::DisciplinedFunction
end

==(lhs::DisciplinedFunction, rhs::DisciplinedFunction) = EqualityConstraintExpression(lhs, rhs)

==(lhs::DisciplinedFunction, rhs::ConstantTypes) = lhs == Constant(float(rhs))
==(lhs::ConstantTypes, rhs::DisciplinedFunction) = Constant(float(lhs)) == rhs

isconvex(e::EqualityConstraintExpression) = isaffine(e.lhs) && isaffine(e.rhs)

function push_model!(m::Model, c::EqualityConstraintExpression)
    @constraint(m, push_model!(m, c.lhs) .== push_model!(m, c.rhs))
end
