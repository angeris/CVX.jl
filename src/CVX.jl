module CVX

using LinearAlgebra
using SparseArrays
using JuMP

import Base.+, Base.-, Base.*

include("utils.jl")

include("types.jl")

# Atoms
include("variable.jl")
include("affine_atoms.jl")

end # module
