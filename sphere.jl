#Vediamo se Diomadonna funziona sta merda

using PyPlot 

mutable struct mysurface
    u::Vector{Float64}
    v::Vector{Float64}
    x::Array{Float64}
    y::Array{Float64}
    z::Array{Float64}
end
function mysurface(a::Vector{Float64},b::Vector{Float64},fx,fy,fz)
    mysurface(a,b,fx(a,b),fy(a,b),fz(a,b))
end
u = range(0,stop=2*π,length=n);
v = range(0,stop=π,length=n);

x = cos.(u) * sin.(v)';
y = sin.(u) * sin.(v)';
z = ones(n) * cos.(v)';


# The rstride and cstride arguments default to 10
#surf(x,y,z, rstride=4, cstride=4)
#display(gcf())