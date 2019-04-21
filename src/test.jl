module Test

include("CVX.jl")

using .CVX

v = Variable()
c = [
    v ≤ 1,
    v ≤ 2
]

@show optimize(v, c)
# optimize(v, c) = 0.9999999995433777

v2 = Variable(2)
c2 = [
    v2 == [3.141, 3]
]

@show optimize(v2[1], c2)
# optimize(v2, c2) = 3.141000000002305

end
