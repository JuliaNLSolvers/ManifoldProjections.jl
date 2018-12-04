using Test
using ManifoldProjections
using LinearAlgebra
using Random
Random.seed!(0)

# test sphere with radius 1
x = randn(4)+im*randn(4)
M = Sphere()
retract!(M,x)
@test norm(x) ≈ 1
x = randn(4)+im*randn(4)
v = randn(4)+im*randn(4)
@test project_tangent(M,v,x) == project_tangent!(M,v,x)
@test norm(x) ≈ 1
@test abs(real(v'*x)) < 1e-8
ε = 1e-8
@test (norm(x + ε*v) - 1) < ε^(3/2) # the tangent vector is such that x+εv is on the manifold up to O(ε^2)

# test sphere with radius r
r = 120.0
x = randn(4)+im*randn(4)
M = Sphere(r)
retract!(M,x)
@test norm(x) ≈ r
x = randn(4)+im*randn(4)
v = randn(4)+im*randn(4)
@test project_tangent(M,v,x) == project_tangent!(M,v,x)
@test norm(x) ≈ r
@test abs(real(v'*x)) < 1e-8
@test (norm(x + ε*v) - r) < ε^(3/2) # the tangent vector is such that x+εv is on the manifold up to O(ε^2)

for M in (Stiefel_CholQR(), Stiefel_SVD())
    X = randn(4,2) + im*randn(4,2)
    retract!(M,X)
    @test X'X ≈ I
    V = randn(4,2)+im*randn(4,2)
    @test project_tangent(M,V,X) == project_tangent!(M,V,X)
    @test norm((X + ε*V)'*(X+ε*V) - I) < ε^(3/2)
end
