function _quad_over_lin_conic(m, x, y)
    t = @variable(m)
    @constraint(m, [y+t; y-t; 2*x] ∈ SecondOrderCone())
    return t
end
