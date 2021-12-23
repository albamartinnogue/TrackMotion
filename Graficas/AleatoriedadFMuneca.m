function [xnMF,ynMF,mMF,xRMF] = AleatoriedadFMuneca(noise)
%eje x de la señal
%xvar = [x0, x1] que indica el valor maximo y minimo del final del eje x
%y = señal
%yvar = [y0, y1] factor de multiplicacion maximo y minimo
%duration= el intervalo de tiempo que va a durar
%noise = si aplicar rido o no


%nueva x
xMF = 0:0.1:1;
xnMF = xMF+ 0,01*rand(1,11); 
xnMF(1) = 0;
xnMF(end)=1;

xRMF = 0:0.001:1;

%nueva y
yMF = [27,25,23,20,21,20,22,20,23,25,27];
ynMF = yMF + 5*rand(1,11);
ynMF(1) = yMF(1);
ynMF(end) = yMF(end);

%----------------------------
maxim= 1.10;
minim= 0.8;%el rango pongo el que vea apropiado
duration = minim+(maxim-minim)*rand(1);

ppMF= makima(xnMF*duration,ynMF);

mMF= ppval(ppMF, xRMF*duration);


if noise == 1
    mMF = mMF + 3*rand(1,1001);
    
end

figure, plot(xRMF*duration,mMF),grid on,title ('Flexion Muñeca Mala'), hold on;

%Filtrado 
if noise == 1
xMFFiltrar = xRMF*duration;
yMFFiltrar = mMF;
[Asgolay,window] = smoothdata(yMFFiltrar,'sgolay');
plot(xMFFiltrar,yMFFiltrar,'c'), hold on, plot(xMFFiltrar,Asgolay,'r')   
end