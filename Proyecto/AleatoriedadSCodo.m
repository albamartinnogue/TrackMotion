function [xnCS,ynCS,yCSF,xCSF] =  AleatoriedadSCodo(app,noise, duration, metrica)

            %Creacion grafica
            xCS = 0:0.1:1;
            xnCS = xCS+ 0.01*rand(1,11);
            xnCS(1) = 0;
            xnCS(end)=1;
            xRCS = 0:0.001:1;
            yCS = [25,28,35,42,52,51,54,25,17,10,25];
            ynCS = yCS + 5*rand(1,11);
            ynCS(1) = yCS(1);
            ynCS(end) = yCS(end);
%             maxim= 1.10;
%             minim= 0.8;
%             duration = minim+(maxim-minim)*rand(1);
            ppCS= makima(xnCS*duration,ynCS);
            mCS= ppval(ppCS, xRCS*duration);


            if noise == 1
                mCS = mCS + 3*rand(1,1001);
                %Filtrado
                xCSFiltrar = xRCS*duration;
                yCSFiltrar = mCS;
                [Asgolay,window] = smoothdata(yCSFiltrar,'sgolay');
                
                 %Empezar y acabar con la misma Y
                Asgolay(1) = yCS(1);
                Asgolay(end) = yCS(end);
                
                 %Devuelvo por mHA la señal filtrada asgolay para poder
                %usarla fuera
                mCS=Asgolay;
            else
                Asgolay=mCS;
            end
                %plot(app.SCodo,xCSFiltrar,Asgolay,'r')

%                 i = 1;
%                 while i<length(xCSFiltrar)
%                     plot(app.SCodo,xCSFiltrar(1:i),Asgolay(1:i))
%                     i = i+4;
%                     pause(0.01)
%                 end

                %Guardar variables en el workspace
                %assignin('base','nombre wokspace',variable)
                assignin('base','xCSFiltrar',xCSFiltrar)
                assignin('base','Asgolay',Asgolay)
                xCSF = xCSFiltrar';
                yCSF = Asgolay';

                %Escribir en un excel
                T = table (xCSF, yCSF);
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
                xlswrite('datosCS.xlsx',A,'xlswrite','A2');
               
                elseif (metrica == 'c') %cantidad
                xlswrite('datosCSC.xlsx',A,'xlswrite','A2');
                
                else (metrica == 'cl') %calidad    
                xlswrite('datosCSCl.xlsx',A,'xlswrite','A2');
                
                end

            end
