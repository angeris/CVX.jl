# Expression type used generally
abstract type DisciplinedFunction end

# Generate not implemented errors
@notimplemented curvature DisciplinedFunction
@notimplemented slope DisciplinedFunction
@notimplemented sign DisciplinedFunction

@notimplemented push_model! DisciplinedFunction

# Constants
const CONVEX  = :Convex
const CONCAVE = :Concave
const AFFINE  = :Affine

const INCREASING = :Increasing
const DECREASING = :Decreasing
const CONSTANT   = :Constant

const POSITIVE = :Positive
const NEGATIVE = :Negative
const NOSIGN   = :NoSign

# General functions
isconvex(f::DisciplinedFunction) = curvature(f) ∈ (CONVEX, AFFINE)
isconcave(f::DisciplinedFunction) = curvature(f) ∈ (CONCAVE, AFFINE)
isaffine(f::DisciplinedFunction) = curvature(f) == AFFINE

abstract type Expression end
abstract type ConstraintExpression <: Expression end
abstract type ObjectiveExpression <: Expression end

# Expression types
@notimplemented isconvex Expression
