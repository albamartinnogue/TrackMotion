clear all port;
a = arduino('COM8');
s1=servo(a,'A0');
s2 =servo(a,'A1');

%datos = xlsread('MovimientosIdeales.xlsx','Hoja1');
% datosFlexionHombro = datos(:,1);
% datosFlexionCodo = datos(:,3);

datosFlexionCodo = 0;


%datosFlexionHombro = datosFlexionHombro*1/180;
%datosFlexionCodo = datosFlexionCodo*1/180;

writePosition(s1,datosFlexionCodo)


%datosFlexion = 0:10:length(datosFlexion);

% for i=1 : length(datosFlexionHombro)
%     writePosition(s1,datosFlexionHombro(i,1))
%     % writePosition(s2,datosFlexionCodo(i,1))
%        i=i+1;
%        pause(1)
% end

% for i=1 : length(datosFlexionCodo)
%     writePosition(s2,datosFlexionCodo(i,1))
%        i=i+1;
%        pause(1)
% end






   
    
    