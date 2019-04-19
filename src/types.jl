# Expression type used generally
abstract type DisciplinedFunction end

# Generate not implemented errors
@notimplemented curvature DisciplinedFunction
@notimplemented slope DisciplinedFunction
@notimplemented sign DisciplinedFunction

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

# Expression types
@notimplemented isconvex Expression
