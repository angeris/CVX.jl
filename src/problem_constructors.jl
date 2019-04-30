export @convex_objective

function _generate_conic!(model::Symbol, exp::Expr)
    for i=1:length(exp.args)
        if i==1 && exp.head == :call
            continue
        end
        if typeof(exp.args[i]) == Expr
            _generate_conic!(model, exp.args[i])
            continue
        end
        exp.args[i] = esc(exp.args[i])
    end

    # At a JuMP-can't-deal-with-this node
    if !(exp.args[1] ∈ [:+, :-]) && exp.head != :ref
        exp.args[1] = Symbol("_", exp.args[1], "_conic")
        insert!(exp.args, 2, esc(model))
    end
end

function _generate_conic!(::Symbol, ::Any) end

macro convex_objective(model, sense, exp)
    _generate_conic!(model, exp)
    return quote
        @objective($(esc(model)), $sense, $exp)
    end
end
