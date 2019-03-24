# Specifies all useful types

using LinearAlgebra: Adjoint
using SparseArrays: SparseMatrixCSC

export Curvature, Convex, Concave, Affine

abstract type Curvature end

abstract type ConvexNotAffine  <: Curvature end
abstract type ConcaveNotAffine <: Curvature end
abstract type Affine           <: Curvature end

const Convex = Union{ConvexNotAffine, Affine}
const Concave = Union{ConcaveNotAffine, Affine}

const AllowedArrays = Union{Array{Float64}, SparseMatrixCSC{Float64}}
const ArrayOrNumber = Union{Float64, AllowedArrays}
const ArrayOrAdjoint = Union{AllowedArrays, Adjoint{Float64, <: AllowedArrays}}