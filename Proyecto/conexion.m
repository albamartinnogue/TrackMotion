puerto = serialport("COM7",115200);
configureTerminator(puerto,"CR/LF",1);
puerto.UserData = struct('Data',[],'Count',1);
readline(puerto)
write(puerto, 's','string')
for i = 1:5
    readline(puerto);
end
flush(puerto);
puerto.UserData.Data=[];
i = 0;
while(i<9000)
    readData(puerto);
    i=i+1;
end
x = puerto.UserData.Data(:,1);
y = puerto.UserData.Data(:,2);
z = puerto.UserData.Data(:,3);
%coloresplot(x)
hold on
plot(y,'r')
hold on
plot(z,'g')