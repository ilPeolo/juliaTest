##toro
n=300
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