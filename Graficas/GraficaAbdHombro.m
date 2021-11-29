%componente x de puntos originales
xHA = 0:0.1:1;

%componente y de puntos originales
yHA = [10,14,19,26,31,33,30,26,21,16,10];

yREF1 = [0,0,0,0,0,0,0,0,0,0,0];
yREF2 = [100,100,100,100,100,100,100,100,100,100,100];
%comonente x de evaluacion
xRHA = 0:0.001:1;

%Para quitar los picos
ppHA= makima(xHA,yHA);

mHA= ppval(ppHA, xRHA);

plot(xRHA,mHA,'r');hold on, grid on,title ('Abducción Hombro')
plot(xHA,yREF1);hold on
plot(xHA,yREF2);