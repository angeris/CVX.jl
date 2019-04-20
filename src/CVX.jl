module CVX

using LinearAlgebra
using SparseArrays
using JuMP

import Base.+, Base.-, Base.*, Base.≤, Base.≥, Base.==, Base.getindex

include("utils.jl")

include("types.jl")

# Atoms
include("variable.jl")
include("affine_atoms.jl")

# Problem construction
include("problem_constructors.jl")

end # module
