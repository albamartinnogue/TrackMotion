function CreacionAvatar(YPRhombro,YPRcodo,YPRwrist)
% YPRwrist = [pronosupinacion,flexoextension,0]
% YPRcodo = [0,0,flexion]
% YPRhombro = [rotacion,abduccion,flexoextension]
% cadenaCinematica([30,0,15],[15,10,15],[0,0,45],[0,34,0]);

%CREAMOS EL AVATAR
f = [1 2 3 4; 5 6 7 8;1 2 6 5;2 3 7 6;3 4 8 7;4 1 5 8];
color = [1 0 0;0 1 0;0 0 1;1 1 0;1 0 1;1 1 1];
torso = [30,-10,10;30,40,10;90,40,10;90,-10,10;30,-10,120;30,40,120;90,40,120;90,-10,120];
brazo = [10,0,60;10,30,60;30,30,60;30,0,60;10,0,120;10,30,120;30,30,120;30,0,120];
antebrazo = [12,5,10;12,25,10;28,25,10;28,5,10;12,5,60;12,25,60;28,25,60;28,5,60];
mano = [10,10,-10;10,20,-10;30,20,-10;30,10,-10;10,10,10;10,20,10;30,20,10;30,10,10];
cuello = [50,0,120;50,30,120;70,30,120;70,0,120;50,0,140;50,30,140;70,30,140;70,0,140];
cabeza = [30,-10,140;30,40,140;90,40,140;90,-10,140;30,-10,180;30,40,180;90,40,180;90,-10,180];

figure
patch('faces',f,'vertices',torso,'FaceVertexCData',color,'FaceColor','flat')
patch('faces',f,'vertices',brazo,'FaceVertexCData',color,'FaceColor','flat')
patch('faces',f,'vertices',antebrazo,'FaceVertexCData',color,'FaceColor','flat')
patch('faces',f,'vertices',mano,'FaceVertexCData',color,'FaceColor','flat')
patch('faces',f,'vertices',cuello,'FaceVertexCData',color,'FaceColor','flat')
patch('faces',f,'vertices',cabeza,'FaceVertexCData',color,'FaceColor','flat')

view([180,3])
axis image

%CREAMOS MATRICES DE ROTACION 
% Aplicamos una rotación del torso de 90 grados hacia la derecha
% Eso se traduce en un Yaw = -90
Rhombro = rotationMatrix(YPRhombro(1),YPRhombro(2),YPRhombro(3));
Rcodo = rotationMatrix(YPRcodo(1),YPRcodo(2),YPRcodo(3));
Rwrist = rotationMatrix(YPRwrist(1),YPRwrist(2),YPRwrist(3));

manoRotada = applyRotationNx3(applyRotationNx3(applyRotationNx3(mano,...
    sum(antebrazo(1:4,:))/4,Rwrist),sum(brazo(1:4,:))/4,Rcodo),(brazo(7,:)+brazo(8,:))/2,Rhombro);

%LOS DOS PUNTOS SIGNIFICAN, TODOSS LOS PUNTOS EN LA DIMENSION 
antebrazoRotado = applyRotationNx3(applyRotationNx3(antebrazo,...
    sum(brazo(1:4,:))/4,Rcodo),(brazo(7,:)+brazo(8,:))/2,Rhombro);
brazoRotado = applyRotationNx3(brazo,...
    (brazo(7,:)+brazo(8,:))/2,Rhombro);

%LA ROTACION DEL TORSO LA TENGO QUE APLICAR A TODOS MIS COMPONENES 
%EL APPLYROTATION CONSTA DE : MODEL, MATRIZ DE ROTACION Y CENTRO DE ROTACION 
%CENTRO DE ROTACION : SUMO LOS PUNTOS / CANTIDAD DE PUNTOS 
%ENCADENO LOS CENTROS DE ROTACION --> CADENA CINEMATICA 
figure
patch('faces',f,'vertices',brazoRotado,'FaceVertexCData',color,'FaceColor','flat')
patch('faces',f,'vertices',antebrazoRotado,'FaceVertexCData',color,'FaceColor','flat')
patch('faces',f,'vertices',manoRotada,'FaceVertexCData',color,'FaceColor','flat')
patch('faces',f,'vertices',torso,'FaceVertexCData',color,'FaceColor','flat')
patch('faces',f,'vertices',cuello,'FaceVertexCData',color,'FaceColor','flat')
patch('faces',f,'vertices',cabeza,'FaceVertexCData',color,'FaceColor','flat')

view([180,3])
axis image

end
