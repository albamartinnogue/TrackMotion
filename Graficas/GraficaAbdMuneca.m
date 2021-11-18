xMA = 0:0.1:1;

%componente y de puntos originales
yMA = [5,6,10,12,15,16,15,12,9,6,5];

yREF1 = [0,0,0,0,0,0,0,0,0,0,0];
yREF2 = [100,100,100,100,100,100,100,100,100,100,100];
%comonente x de evaluacion
xRMA = 0:0.001:1;

%Para quitar los picos
pp= makima(xMA,yMA);

m= ppval(pp, xRMA);

plot(xRMA,m,'k');hold on, grid on,title ('Abducción muñeca')
plot(xMA,yREF1);hold on
plot(xMA,yREF2);