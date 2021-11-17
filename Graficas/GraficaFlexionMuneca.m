%componente x de puntos originales
xMF= 0:0.1:1;

%componente y de puntos originales
yMF = [27,25,23,20,21,20,22,20,23,25,27];

yREF1 = [0,0,0,0,0,0,0,0,0,0,0];
yREF2 = [100,100,100,100,100,100,100,100,100,100,100];
%comonente x de evaluacion
xRMF = 0:0.001:1;

%Para quitar los picos
pp= makima(xMF,yMF);

m= ppval(pp, xRMF);

plot(xRMF,m);hold on, grid on, title ('Flexion Muñeca')
plot(xMF,yREF1);hold on
plot(xMF,yREF2);