function [xnHA,ynHA,mHA,xRHA] = AleatoriedadAbdHombro ( noise)
%eje x de la señal
%xvar = [x0, x1] que indica el valor maximo y minimo del final del eje x
%y = señal
%yvar = [y0, y1] factor de multiplicacion maximo y minimo
%duration= el intervalo de tiempo que va a durar
%noise = si aplicar rido o no


%nueva x
xHA = 0:0.1:1;
xnHA = xHA+ 0,01*rand(1,11); 
xnHA(1) = 0;
xnHA(end)=1;

xRHA = 0:0.001:1;

%nueva y
yHA = [10,14,19,26,31,33,30,26,21,16,10];
ynHA = yHA + 5*rand(1,11);
ynHA(1) = yHA(1);
ynHA(end) = yHA(end);

%----------------------------
maxim= 1.10;
minim= 0.8;%el rango pongo el que vea apropiado
duration = minim+(maxim-minim)*rand(1);

ppHA= makima(xnHA*duration,ynHA);

mHA= ppval(ppHA, xRHA*duration);


if noise == 1
    mHA = mHA + 3*rand(1,1001);
    
end

plot(xRHA*duration,mHA),grid on,title ('Abducción Hombro Malo'), hold on;

