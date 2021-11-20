#Vediamo se Diomadonna funziona sta merda

using PyPlot 

n = 100
u = range(0,stop=2*π,length=n);
v = range(0,stop=π,length=n);

x = cos.(u) * sin.(v)';
y = sin.(u) * sin.(v)';
z = ones(n) * cos.(v)';

# The rstride and cstride arguments default to 10
surf(x,y,z, rstride=4, cstride=4)
display(gcf())