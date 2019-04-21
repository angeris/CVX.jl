export ≤, ≥

struct InequalityConstraintExpression <: ConstraintExpression
    lhs::DisciplinedFunction
    rhs::DisciplinedFunction
end

≤(lhs::DisciplinedFunction, rhs::DisciplinedFunction) = InequalityConstraintExpression(lhs, rhs)

≤(lhs::DisciplinedFunction, rhs::ConstantTypes) = lhs ≤ Constant(float(rhs))
≤(lhs::ConstantTypes, rhs::DisciplinedFunction) = Constant(float(lhs)) ≤ rhs

≥(lhs::FunctionOrConstantTypes, rhs::FunctionOrConstantTypes) = rhs ≤ lhs

function push_model!(m::Model, c::InequalityConstraintExpression)
    @constraint(m, push_model!(m, c.lhs) .≤ push_model!(m, c.rhs))
end
