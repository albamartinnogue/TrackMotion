%componente x de puntos originales
xHF = 0:0.1:1;

%componente y de puntos originales
yHF = [40,42,45,50,56,60,56,50,45,42,40];

yREF1 = [0,0,0,0,0,0,0,0,0,0,0];
yREF2 = [100,100,100,100,100,100,100,100,100,100,100];
%comonente x de evaluacion
xRHF = 0:0.001:1;

%Para quitar los picos
pp= makima(xHF,yHF);

m= ppval(pp, xRHF);

plot(xRHF,m);hold on, grid on, title ('Flexión Hombro')
plot(xHF,yREF1);hold on
plot(xHF,yREF2);
