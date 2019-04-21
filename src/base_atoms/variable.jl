export Variable

struct Variable <: DisciplinedFunction
    shape::Int
    model_var::Dict{Model, VariableTypes}

    function Variable(shape::Int)
        if shape ≤ 0
            error("Shape value needs to be positive, not $(shape)")
        end

        return new(shape, Dict{Model, VariableTypes}())
    end

    Variable() = Variable(1)
end

curvature(::Variable) = AFFINE
slope(::Variable) = INCREASING
sign(::Variable) = NOSIGN

size(v::Variable) = v.shape
size(v::Variable, i::Int) = v.shape[i]

# TODO: Much better efficiency here would be nice
function push_model!(m::Model, a::Variable)
    if haskey(a.model_var, m)
        return a.model_var[m]
    end

    a.model_var[m] = a.shape == 1 ? @variable(m) : @variable(m, [1:a.shape])

    return a.model_var[m]
end
