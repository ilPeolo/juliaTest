#Vediamo se Diomadonna funziona sta merda

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
    surf(self.x,self.y,self.z, rstride=4, cstride=4)
    display(gcf())
end

n=300;

u = collect(range(0,stop=2*π,length=n));
v = collect(range(0,stop=π,length=n));

function defx(u::Vector{Float64},v::Vector{Float64})::Matrix{Float64}
    cos.(u) * sin.(v)'
end
function defy(u::Vector{Float64},v::Vector{Float64})::Matrix{Float64}
    sin.(u) * sin.(v)'
end
function defz(u::Vector{Float64},v::Vector{Float64})::Matrix{Float64}
    ones(length(v)) * cos.(v)'
end


sfera= mysurface(u,v,defx,defy,defz);
#graph(sfera)

mutable struct funzSuSup
    S :: mysurface
    funz::Function
    val::Matrix{Float64}
end
function funzSuSup(Spass::mysurface,f::Function)
    S=Spass
    funz=f
    val=f(S.u,S.v)
end

function funztest(u::Vector{Float64},v::Vector{Float64}):Array{Float64}
    return map(a -> maximum([a,0]), u*v')
end

nuovfunz=funzSuSup(sfera,funztest)

