A Julia library to handle projections on manifolds. This is useful for minimizing functions or solving differential equations defined on manifolds.

Currently, the sphere `{x ∈ K^n, ||x|| = r}` and the Stiefel manifold `{X ∈ K^{n × m}, X'*X = I}` as well as independent copies of these manifolds are supported.

Example usage:

```julia
using ManifoldProjections

x = randn(4)
M = Sphere() # create sphere with r = 1
retract!(M,x)
@assert norm(x) ≈ 1
v = randn(4)
project_tangent!(M,v,x)
@assert abs(v'*x) < 1e-8
```
