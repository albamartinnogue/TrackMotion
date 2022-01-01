%componente x de puntos originales
xCS= 0:0.1:1;

%componente y de puntos originales
yCS = [25,28,35,42,52,51,54,25,17,10,25];

yREF1 = [0,0,0,0,0,0,0,0,0,0,0];
yREF2 = [100,100,100,100,100,100,100,100,100,100,100];
%comonente x de evaluacion
xRCS = 0:0.001:1;

%Para quitar los picos
ppCS= makima(xCS,yCS);

mCS= ppval(ppCS, xRCS);

plot(xRCS,mCS);hold on, grid on, title ('Supinacion Codo')
plot(xCS,yREF1);hold on
plot(xCS,yREF2);