function ypr = eulerAngles(R)
ypr(1) = atan2d(R(2,1),R(1,1)); %yaw z
ypr(2) = -asind(R(3,1)); %pich y
ypr(3) = atan2d(R(3,2),R(3,3)); %row x -->
end
 
%atand devuelve la tangente inversa en grados 
