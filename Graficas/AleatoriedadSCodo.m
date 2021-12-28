function [xnCS,ynCS,mCS,xRCS] =  AleatoriedadSCodo(noise)
%eje x de la señal
%xvar = [x0, x1] que indica el valor maximo y minimo del final del eje x
%y = señal
%yvar = [y0, y1] factor de multiplicacion maximo y minimo
%duration= el intervalo de tiempo que va a durar
%noise = si aplicar rido o no


%nueva x
xCS = 0:0.1:1;
xnCS = xCS+ 0,01*rand(1,11); 
xnCS(1) = 0;
xnCS(end)=1;

xRCS = 0:0.001:1;

%nueva y
yCS = [25,28,35,42,52,51,54,25,17,10,25];
ynCS = yCS + 5*rand(1,11);
ynCS(1) = yCS(1);
ynCS(end) = yCS(end);

%----------------------------
maxim= 1.10;
minim= 0.8;%el rango pongo el que vea apropiado
duration = minim+(maxim-minim)*rand(1);

ppCS= makima(xnCS*duration,ynCS);

mCS= ppval(ppCS, xRCS*duration);


if noise == 1
    mCS = mCS + 3*rand(1,1001); 
end
%X = xRCS*duration;
%Y = mCS;


%senalCodo = plot(xRCS*duration,mCS);grid on,title ('Supinacion Codo Malo'), hold on;

[bb,ab] = butter (6, 0.5);
senalCodoFiltrada = filter(bb,ab,[xRCS*duration,mCS]);
plot(senalCodoFiltrada, 'r'),hold on;
axis([0 1 0 70])
plot(xRCS*duration,mCS),hold on;
axis([0 1 0 70]) 

%Filtrado 
if noise == 1
xCSFiltrar = xRCS*duration;
yCSFiltrar = mCS;
[Asgolay,window] = smoothdata(yCSFiltrar,'sgolay');
plot(xCSFiltrar,yCSFiltrar,'c'), hold on, plot(xCSFiltrar,Asgolay,'r')   
end

%Guardar variables en el workspace 
%assignin('base','nombre wokspace',variable)
assignin('base','xCSFiltrar',xCSFiltrar)
assignin('base','Asgolay',Asgolay)
x = xCSFiltrar';
y = Asgolay';

%Escribir en un excel 
T = table (x, y);
assignin('base','T',T)

L = {'Variable x','Variable y'};
C = table2cell(T);
assignin('base','L',L)
assignin('base','C',C)

%Concateno en la matriz cell la legenda de cada columna 
A = [L;C];
assignin('base','A',A)

%crea y reescribe
xlswrite('datosSC.xlsx',A,'xlswrite','A2');

