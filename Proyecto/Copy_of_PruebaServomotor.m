
/
clear all port;
a = arduino('COM8');
s=servo(a,'A0'); 

datos = xlsread('testdata.xlsx','Hoja2');
datosFlexion = datos(:,1);

datosFlexion = datosFlexion*1/180;

%datosFlexion = 0:10:length(datosFlexion);

for i=1 : length(datosFlexion)
    writePosition(s,datosFlexion(i,1))
       i=i+1;
       pause(1)
end






   
    
    