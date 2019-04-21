module CVX

using LinearAlgebra
using SparseArrays
using JuMP

import Base.+, Base.-, Base.*, Base.≤, Base.≥, Base.==, Base.getindex

include("utils.jl")

include("types.jl")

# Basic atoms
include("base_atoms/variable.jl")
include("base_atoms/constant.jl")

# Affine atoms
include("affine_atoms/index_function.jl")

# Expressions
include("expressions/equality_constraint.jl")
include("expressions/inequality_constraint.jl")

# Problem construction
include("problem_constructors.jl")

end # module
