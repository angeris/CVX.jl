abstract type Expression end

# Generate not implemented errors
@notimplemented curvature Expression
@notimplemented slope Expression
@notimplemented sign Expression

isconvex(e::Expression) = curvature(e) ∈ (:Convex, :Affine)
isconcave(e::Expression) = curvature(e) ∈ (:Concave, :Affine)
isaffine(e::Expression) = curvature(e) == :Affine
