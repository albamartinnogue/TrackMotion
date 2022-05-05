function [mSUP, mINF] = RangosCalidad ( app, yIdeal, ejex, rango)

%Grafica ideal
%y = [10,14,19,26,31,33,30,26,21,16,10];

x = 0:0.1:1;
%Rangos
rSUP = yIdeal + rango;
rINF= yIdeal - rango;

xR = 0:0.001:1;

%makima rango SUP
    ppSUP= makima(x*ejex,rSUP);
    mSUP= ppval(ppSUP, xR*ejex);

%makima rango INF
     ppINF= makima(x*ejex,rINF);
     mINF= ppval(ppINF, xR*ejex);
    
 
   % plot(xR*duration,mSUP, 'r'), hold on, plot(xR*duration,mINF, 'r')




