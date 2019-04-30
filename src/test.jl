module Test

include("Convex.jl")

import .Convex
using JuMP
using SCS

m = Model(with_optimizer(SCS.Optimizer))

@variable(m, x[1:4])
@variable(m, y)

Convex.@convex_objective(m, Min, quad_over_lin(x, y) + x[1])

optimize!(m)

@show objective_value(m)

end
