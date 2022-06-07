puerto = serialport("COM9",115200);
configureTerminator(puerto,"LF",4);
puerto.UserData = struct('Data',[],'Count',1);
readline(puerto)
write(puerto, 's','string')
for i = 1:100
    readline(puerto);
end
flush(puerto);
puerto.UserData.Data=[];
muestras = 3900;
x1 = 1:5 :muestras;
n = numel(x1);
i = 1;
while(i<muestras)
    readData(puerto);
    x = puerto.UserData.Data(:,1);
    plot(x1(1:i),x(1:i),'r');
drawnow;
% y = puerto.UserData.Data(:,2);
% plot(x1(1:i),y(1:i),'g');
% drawnow;
% z = puerto.UserData.Data(:,3);
% plot(x1(1:i),z(1:i),'b');
% drawnow;
    i=i+1;
end
%Escribir en excel
M = [x,y,z];
xlswrite('PruebaExcel.xlsx',M)