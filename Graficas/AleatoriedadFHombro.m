function [xnHF,ynHF,mHF,xRHF] = AleatoriedadFHombro ( noise)
%eje x de la señal
%xvar = [x0, x1] que indica el valor maximo y minimo del final del eje x
%y = señal
%yvar = [y0, y1] factor de multiplicacion maximo y minimo
%duration= el intervalo de tiempo que va a durar
%noise = si aplicar rido o no


%nueva x
xHF = 0:0.1:1;
xnHF = xHF+ 0,01*rand(1,11); 
xnHF(1) = 0;
xnHF(end)=1;

xRHF = 0:0.001:1;

%nueva y
yHF = [40,42,45,50,56,60,56,50,45,42,40];
ynHF = yHF + 5*rand(1,11);
ynHF(1) = yHF(1);
ynHF(end) = yHF(end);

%----------------------------
maxim= 1.10;
minim= 0.8;%el rango pongo el que vea apropiado
duration = minim+(maxim-minim)*rand(1);

ppHF= makima(xnHF*duration,ynHF);

mHF= ppval(ppHF, xRHF*duration);


if noise == 1
    mHF = mHF + 3*rand(1,1001);
    
end

plot(xRHF*duration,mHF),grid on,title ('Flexion Hombro Malo'), hold on;

%Filtrado 
if noise == 1
xHFFiltrar = xRHF*duration;
yHFFiltrar = mHF;
[Asgolay,window] = smoothdata(yHFFiltrar,'sgolay');
plot(xHFFiltrar,yHFFiltrar,'c'), hold on, plot(xHFFiltrar,Asgolay,'r')   
end
%hola
