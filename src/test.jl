module Test

include("CVX.jl")

using .CVX

v = Variable()
c = [
    v ≤ 1,
    v ≤ 2
]

@show optimize(v, c)

v2 = Variable(1)
c2 = [
    v2 == 3.141
]

@show optimize(v2, c2)

end
