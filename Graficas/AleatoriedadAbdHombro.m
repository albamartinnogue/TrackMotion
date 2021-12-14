function [xnHA,ynHA,mHA,xRHA] = AleatoriedadAbdHombro (noise)
%eje x de la señal
%xvar = [x0, x1] que indica el valor maximo y minimo del final del eje x
%y = señal
%yvar = [y0, y1] factor de multiplicacion maximo y minimo
%points= puntos donde evaluar makima
%noise = si aplicar rido o no


%nueva x
xHA = 0:0.1:1;
xnHA = xHA+ 0,01*rand(1,11); 
xHA(1) = 0;
xHA(end)=1,1;

T=(xnHA(end)-xnHA(1))/length(xnHA);
rxT = T.*rand(1, length(xnHA))-(T/2);
rxT(1) = 0;
xnHA=xnHA+rxT;


%nueva y
yHA = [10,14,19,26,31,33,30,26,21,16,10];
ynHA = yHA + 5*rand(1,11);
ynHA(1) = yHA(1);
ynHA(end) = yHA(end);

%----------------------------
xRHA = 0:0.001:1;

ppHA= makima(xnHA,ynHA);

mHA= ppval(ppHA, xRHA);



if noise == 1
    mHA = mHA + 3*rand(1,1001);
    
end

plot(xRHA,mHA),grid on,title ('Abducción Hombro Malo'), hold on;

