%componente x de puntos originales
xCF = 0:0.1:1;

%componente y de puntos originales
yCF = [67,70,89,108,115,120,115,107,83,72,67];

yREF1 = [0,0,0,0,0,0,0,0,0,0,0];
yREF2 = [150,150,150,150,150,150,150,150,150,150,150];

%comonente x de evaluacion
xRCF = 0:0.001:1;

%Para quitar los picos
ppCF= makima(xCF,yCF);

mCF= ppval(ppCF, xRCF);

plot(xRCF,mCF,'g');hold on, grid on,title ('Flexión Codo')
plot(xCF,yREF1);hold on
plot(xCF,yREF2);
