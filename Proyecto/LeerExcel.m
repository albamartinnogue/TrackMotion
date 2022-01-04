function [num ,x] = LeerExcel(app,fichero)
%LeerExcel('datosHA.xlsx')
[num,txt,raw]= xlsread(fichero,'xlswrite');

%sacamos los valores maximos de tiempo 
             val=num(:,1);
             x = val(end);
             
%esto seria para pintar la grafica          
%plot(num(:,1),num(:,2))
