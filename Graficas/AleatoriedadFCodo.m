function [xnCF,ynCF,mCF,xRCF] = AleatoriedadFCodo(noise)
%eje x de la señal
%xvar = [x0, x1] que indica el valor maximo y minimo del final del eje x
%y = señal
%yvar = [y0, y1] factor de multiplicacion maximo y minimo
%duration= el intervalo de tiempo que va a durar
%noise = si aplicar rido o no


%nueva x
xCF = 0:0.1:1;
xnCF = xCF+ 0,01*rand(1,11); 
xnCF(1) = 0;
xnCF(end)=1;

xRCF = 0:0.001:1;

%nueva y
yCF = [67,70,89,108,115,120,115,107,83,72,67];
ynCF = yCF + 5*rand(1,11);
ynCF(1) = yCF(1);
ynCF(end) = yCF(end);

%----------------------------
maxim= 1.10;
minim= 0.8;%el rango pongo el que vea apropiado
duration = minim+(maxim-minim)*rand(1);

ppCF= makima(xnCF*duration,ynCF);

mCF= ppval(ppCF, xRCF*duration);


if noise == 1
    mCF = mCF + 3*rand(1,1001);
    
end

plot(xRCF*duration,mCF),grid on,title ('Flexion Codo Malo'), hold on;

%Filtrado 
if noise == 1
xCFFiltrar = xRCF*duration;
yCFFiltrar = mCF;
[Asgolay,window] = smoothdata(yCFFiltrar,'sgolay');
plot(xCFFiltrar,yCFFiltrar,'c'), hold on, plot(xCFFiltrar,Asgolay,'r')   
end
%hola