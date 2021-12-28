function [xnMA,ynMA,mMA,xRMA] = AleatoriedadAbdMuneca(noise)
%eje x de la señal
%xvar = [x0, x1] que indica el valor maximo y minimo del final del eje x
%y = señal
%yvar = [y0, y1] factor de multiplicacion maximo y minimo
%duration= el intervalo de tiempo que va a durar
%noise = si aplicar rido o no


%nueva x
xMA = 0:0.1:1;
xnMA = xMA+ 0,01*rand(1,11); 
xnMA(1) = 0;
xnMA(end)=1;

xRMA = 0:0.001:1;

%nueva y
yMA = [5,6,10,12,15,16,15,12,9,6,5];
ynMA = yMA + 5*rand(1,11);
ynMA(1) = yMA(1);
ynMA(end) = yMA(end);

%----------------------------
maxim= 1.10;
minim= 0.8;%el rango pongo el que vea apropiado
duration = minim+(maxim-minim)*rand(1);

ppMA= makima(xnMA*duration,ynMA);

mMA= ppval(ppMA, xRMA*duration);


if noise == 1
    mMA = mMA + 3*rand(1,1001);
    
end

plot(xRMA*duration,mMA),grid on,title ('Abduccion Muñeca Mala'), hold on;


%Filtrado 
if noise == 1
xMAFiltrar = xRMA*duration;
yMAFiltrar = mMA;
[Asgolay,window] = smoothdata(yMAFiltrar,'sgolay');
plot(xMAFiltrar,yMAFiltrar,'c'), hold on, plot(xMAFiltrar,Asgolay,'r')   
end
%hola