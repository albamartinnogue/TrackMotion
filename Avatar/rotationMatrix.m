function R = rotationMatrix(yaw,pitch,roll)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
matrixYaw = [cosd(yaw),-sind(yaw),0;...
    sind(yaw),cosd(yaw),0;0,0,1];
matrixPitch = [cosd(pitch),0,sind(pitch);...
    0,1,0;-sind(pitch),0,cosd(pitch)];
matrixRoll = [1,0,0;0,cosd(roll),-sind(roll);...
    0,sind(roll),cosd(roll)];
R = matrixYaw*matrixPitch*matrixRoll;
end