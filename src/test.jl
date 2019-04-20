module Test

include("CVX.jl")

using .CVX

v = Variable(1)
c = [
    v ≤ 1,
    v ≤ 2
]

@show optimize(v, c)

end
