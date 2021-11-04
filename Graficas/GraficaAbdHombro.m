%componente x de puntos originales
xHA = 0:0.1:1;

%componente y de puntos originales
yHA = [10,14,19,26,31,33,30,26,21,16,10];

yREF1 = [0,0,0,0,0,0,0,0,0,0,0];
yREF2 = [100,100,100,100,100,100,100,100,100,100,100];
%comonente x de evaluacion
xRHA = 0:0.001:1;

%Para quitar los picos
pp= makima(xHA,yHA);

m= ppval(pp, xRHA);

plot(xRHA,m,'r');hold on, grid on,title ('Abducción Hombro')
plot(xHF,yREF1);hold on
plot(xHF,yREF2);