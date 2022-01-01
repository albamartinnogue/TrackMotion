% Leer datos
[num,txt,raw]= xlsread('datosAH.xlsx','xlswrite');

plot(num(:,1),num(:,2))