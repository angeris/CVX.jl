import SCS


export optimize
# TODO: Make types for minimization maximization problems
function optimize(objective::DisciplinedFunction,
    constraints::Array{T, 1}=Array{ConstraintExpression, 1}()) where T <: ConstraintExpression

    m = Model(with_optimizer(SCS.Optimizer))

    @show typeof(push_model!(m, objective))

    @objective(m, Max, push_model!(m, objective))

    for (i, c) ∈ enumerate(constraints)
        push_model!(m, c)
    end

    optimize!(m)

    return objective_value(m)
end
