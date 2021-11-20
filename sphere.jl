#Vediamo se Diomadonna funziona sta merda

using PyPlot 

mutable struct mysurface
    u::Vector{Float64}
    v::Vector{Float64}
    x::Array{Float64}
    y::Array{Float64}
    z::Array{Float64}
end
function mysurface(a::Vector{Float64},b::Vector{Float64},fx::function(),fy::function(),fz::function())
    mysurface(a,b,fx(a,b),fy(a,b),fz(a,b))
end

fx(u,v) = cos.(u) * sin.(v)';
fy(u,v) = sin.(u) * sin.(v)';
fz(u,v) = ones(n) * cos.(v)';

n=300;
u = range(0,stop=2*π,length=n);
v = range(0,stop=π,length=n);

mysurface(u,v,fx,fy,fz);




# The rstride and cstride arguments default to 10
#surf(x,y,z, rstride=4, cstride=4)
#display(gcf())

return(0)