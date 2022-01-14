function [xnMA,ynMA,yMAF,xMAF] = AleatoriedadAbdMuneca(app,noise, duration, metrica)
            %Creacion grafica
            xMA = 0:0.1:1;
            xnMA = xMA+ 0.01*rand(1,11);
            xnMA(1) = 0;
            xnMA(end)=1;
            xRMA = 0:0.001:1;
            yMA = [5,6,10,12,15,16,15,12,9,6,5];
            ynMA = yMA + 5*rand(1,11);
            ynMA(1) = yMA(1);
            ynMA(end) = yMA(end);
%             maxim= 1.10;
%             minim= 0.8;
%             duration = minim+(maxim-minim)*rand(1);
            ppMA= makima(xnMA*duration,ynMA);
            mMA= ppval(ppMA, xRMA*duration);

            if noise == 1
                mMA = mMA + 3*rand(1,1001);
                %Filtrado
                xMAFiltrar = xRMA*duration;
                yMAFiltrar = mMA;
                [Asgolay,window] = smoothdata(yMAFiltrar,'sgolay');
                
                %Empezar y acabar con la misma Y
                Asgolay(1) = yMA(1);
                Asgolay(end) = yMA(end);
                 %Devuelvo por mHA la señal filtrada asgolay para poder
                %usarla fuera
                mMA=Asgolay;
            else
                Asgolay=mMA;
            end
                %plot(app.AMuneca,xMAFiltrar,Asgolay,'r')

%                 i = 1;
%                 while i<length(xMAFiltrar)
%                     plot(app.AMuneca,xMAFiltrar(1:i),Asgolay(1:i))
%                     i = i+4;
%                     pause(0.01)
%                 end

                %Guardar variables en el workspace
                %assignin('base','nombre wokspace',variable)
                assignin('base','xMAFiltrar',xMAFiltrar)
                assignin('base','Asgolay',Asgolay)
                xMAF = xMAFiltrar';
                yMAF = Asgolay';

                %Escribir en un excel
                T = table (xMAF, yMAF);
                assignin('base','T',T)

                L = {'Variable x','Variable y'};
                C = table2cell(T);
                assignin('base','L',L)
                assignin('base','C',C)

                %Concateno en la matriz cell la legenda de cada columna
                A = [L;C];
                assignin('base','A',A)

                
                if (metrica == 't')  %tiempo 
                %crea y reescribe
                xlswrite('datosMA.xlsx',A,'xlswrite','A2');
               
                elseif (metrica == 'c') %cantidad
                xlswrite('datosMAC.xlsx',A,'xlswrite','A2');
                
                else (metrica == 'cl') %calidad    
                xlswrite('datosMACl.xlsx',A,'xlswrite','A2');
                
                end
        end