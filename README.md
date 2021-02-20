Note: this package is not under active development. Check out https://github.com/JuliaManifolds/Manifolds.jl instead.

A Julia library to handle projections on manifolds. This is useful for minimizing functions or solving differential equations defined on manifolds.

Currently, the sphere `{x ∈ K^n, ||x|| = r}` and the Stiefel manifold `{X ∈ K^{n × m}, X'*X = I}` as well as independent copies of these manifolds are supported.

The projections implemented are `retract` and `project_tangent`.

```
retract(M::Manifold, x) = retract!(M, copy(x))
```
retracts the given point `x` back onto the Manifold `M`.
```
project_tangent(M::Manifold, g, x) = project_tangent!(M, copy(g), x)
```
Projects the given vector `g` into the tangent space on the Manifold `M` around the point `x`.
`x` is assumed to lie on the manifold. This is not checked!

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
