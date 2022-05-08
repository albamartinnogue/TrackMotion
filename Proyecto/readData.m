function readData(src,~)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
data = readline(src);
data=split(data);
data =str2double(data);

src.UserData.Data(size(src.UserData.Data,1)+1,:)= data;

src.UserData.Count = src.UserData.Count + 1;

if src.UserData.Count > 100001
    configureCallback(src,"off");
    plot(scr.UserData.Data(2:end));
end
end

