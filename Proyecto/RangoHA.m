xHA = 0:0.1:1;
%Grafica ideal
yHA = [10,14,19,26,31,33,30,26,21,16,10];

%Rangos
rSUP = yHA + 5;
rINF= yHA - 5;



plot(xHA, yHA), hold on, plot(xHA, rSUP, 'r'), hold on , plot(xHA, rINF, 'r')

