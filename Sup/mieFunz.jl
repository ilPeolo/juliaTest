using PyPlot 
using LinearAlgebra

mutable struct mysurface
    u::Vector{Float64}
    v::Vector{Float64}
    x::Matrix{Float64}
    y::Matrix{Float64}
    z::Matrix{Float64}
    fx::Function
    fy::Function
    fz::Function
end
function mysurface(a::Vector{Float64},b::Vector{Float64},fx::Function,fy::Function,fz::Function)
    mysurface(a,b,fx(a,b),fy(a,b),fz(a,b),fx,fy,fz)
end
function graph(self::mysurface)
    clf()
    surf(self.x,self.y,self.z, rstride=4, cstride=4)
    display(gcf())
end

mutable struct funzSuSup
    S :: mysurface
    funz::Function
    val::Matrix{Float64}
end
function funzSuSup(S::mysurface,f::Function)
    funzSuSup(S,f,f(S.u,S.v))
end

function graph(self::funzSuSup)
    norm=0.5 * self.val ./ (maximum(abs.(self.val)))
    newx=self.S.x .+ (self.val .*norm)
    newy=self.S.y .+ (self.val .*norm)
    newz=self.S.z .+ (self.val .*norm)
    clf()
    surf(newx,newy,newz, rstride=4, cstride=4)
    
    display(gcf())
end