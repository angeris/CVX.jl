# Generates all operations

import Base.+, Base.-
import LinearAlgebra: Adjoint

include("./types.jl")

struct Variable <: Affine
    size::Int
end

struct AffineExpression <: Affine
    A::ArrayOrNumber
    b::ArrayOrNumber
    child::Affine
end

function AffineExpression(A::AllowedArrays, b::AllowedArrays, child::Variable)
    if size(A)[2] ≠ child.size
        error("Size of matrix $(size(A)[2]) does not match size of variable $(child.size).")
    end
    return AffineExpression(A, b, child)
end

AffineExpression(x::Variable) = AffineExpression(0, 0, x)

struct MaxExpression <: ConvexNotAffine
    children::Tuple{<: Convex}
end


+(x::AffineExpression, y::AffineExpression) = AffineExpression(x.A + y.A, x.b + y.b) #Change this to have the same child
+(x::Variable, y::Variable) = AffineExpression(x) + AffineExpression(y)

*(A::ArrayOrNumber, x::Variable) = AffineExpression(A, 0, x)
+(x::AffineExpression, y::ArrayOrNumber) = x + AffineExpression(0, y)

A = reshape([1,2,3,4], (2,2))
x = Variable(2)
A*x