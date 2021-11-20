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
    clf()
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
function funzSuSup(S::mysurface,f::Function)
    funzSuSup(S,f,f(S.u,S.v))
end
function funztest1(u::Vector{Float64},v::Vector{Float64})
    a=zeros(n,n)
    for i = 1:n
        for j = 1:n
            if i < 150
                a[i,j]=1
            end
        end
    end
    return a
end
function funztest2(u::Vector{Float64},v::Vector{Float64})
    a=zeros(n,n)
    for i = 1:n
        for j = 1:n
            if i > 150
                a[i,j]=1
            end
        end
    end
    return a
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

nuovfunz1=funzSuSup(sfera,funztest1)
nuovfunz2=funzSuSup(sfera,funztest2)

#graph(nuovfunz2)
#graph(nuovfunz1)

return(0)

##toro

u = collect(range(0,stop=2*π,length=n));
v = collect(range(0,stop=2*π,length=n));
R=1.3
r=1

function defx(u::Vector{Float64},v::Vector{Float64})::Matrix{Float64}
    (R.+(r.*cos.(u)))*cos.(v)'
end
function defy(u::Vector{Float64},v::Vector{Float64})::Matrix{Float64}
    (R.+(r.*cos.(u)))*sin.(v)'
end
function defz(u::Vector{Float64},v::Vector{Float64})::Matrix{Float64}
    ones(length(v)) * r.*sin.(u)'
end

toro= mysurface(u,v,defx,defy,defz);

graph(toro)

return 0