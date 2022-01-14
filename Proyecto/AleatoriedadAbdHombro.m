function [xnHA,ynHA,yHAF,xHAF] = AleatoriedadAbdHombro (app, noise, duration, metrica)
            %Cracion graficas
            xHA = 0:0.1:1;
            xnHA = xHA+ 0.01*rand(1,11);
            xnHA(1) = 0;
            xnHA(end)=1;
            xRHA = 0:0.001:1;
            yHA = [10,14,19,26,31,33,30,26,21,16,10];
            ynHA = yHA + 5*rand(1,11);
            ynHA(1) = yHA(1);
            ynHA(end) = yHA(end);
%             maxim= 4;
%             minim= 1;% el rango pongo el que vea apropiado
%             duration = minim+(maxim-minim)*rand(1);
            ppHA= makima(xnHA*duration,ynHA);
            mHA= ppval(ppHA, xRHA*duration);

            if noise == 1

                mHA = mHA + 3*rand(1,1001);

                %Filtrado
                xHAFiltrar = xRHA*duration;
                yHAFiltrar = mHA;
                [Asgolay,window] = smoothdata(yHAFiltrar,'sgolay');
                
                %Empezar y acabar con la misma Y
                Asgolay(1) = yHA(1);
                Asgolay(end) = yHA(end);
                
                %Devuelvo por mHA la señal filtrada asgolay para poder
                %usarla fuera
                mHA=Asgolay;
            else
                Asgolay=mHA;
            end
                %plot(app.AHombro,xHAFiltrar,Asgolay,'r')

                %i = 1;
                %{
                while i<length(xHAFiltrar)
                    plot(app.AHombro,xHAFiltrar(1:i),Asgolay(1:i))
                    i = i+4;
                    pause(0.01)
                end
%}
                %Guardar variables en el workspace
                %assignin('base','nombre wokspace',variable)
                assignin('base','xHAFiltrar',xHAFiltrar)
                assignin('base','Asgolay',Asgolay)
                xHAF = xHAFiltrar';
                yHAF = Asgolay';

                %Escribir en un excel
                T = table (xHAF, yHAF);
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
                xlswrite('datosHA.xlsx',A,'xlswrite','A2');
               
                elseif (metrica == 'c') %cantidad
                xlswrite('datosHAC.xlsx',A,'xlswrite','A2');
                
                else (metrica == 'cl') %calidad    
                xlswrite('datosHACl.xlsx',A,'xlswrite','A2');
                
                end

            end
 



