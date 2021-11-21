#Vediamo se Diomadonna funziona sta merda

include("./mieFunz.jl")

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


nuovfunz1=funzSuSup(sfera,funztest1)
nuovfunz2=funzSuSup(sfera,funztest2)

graph(nuovfunz2)
graph(nuovfunz1)

return(0)

