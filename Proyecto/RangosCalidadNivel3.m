function [mSUP, mINF] = RangosCalidadNivel3 (app, yIdeal,duration)

%Grafica ideal
%yIdeal = [10,14,19,26,31,33,30,26,21,16,10];

x = 0:0.1:1;
%Rangos
rSUP = yIdeal + 7;
rINF= yIdeal - 7;

xR = 0:0.001:1;

%makima rango SUP
    ppSUP= makima(x*duration,rSUP);
    mSUP= ppval(ppSUP, xR*duration);

%makima rango INF
     ppINF= makima(x*duration,rINF);
     mINF= ppval(ppINF, xR*duration);
    
 
  %  plot(xR*duration,mSUP, '--r'), hold on, plot(xR*duration,mINF, '--r')

end

