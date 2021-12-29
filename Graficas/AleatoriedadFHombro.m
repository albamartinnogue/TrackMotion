function [xnHF,ynHF,mHF,xRHF] = AleatoriedadFHombro (app, noise)
            %Creacion de la grafica
            xHF = 0:0.1:1;
            xnHF = xHF+ 0,01*rand(1,11);
            xnHF(1) = 0;
            xnHF(end)=1;
            xRHF = 0:0.001:1;
            yHF = [40,42,45,50,56,60,56,50,45,42,40];
            ynHF = yHF + 3*rand(1,11);
            ynHF(1) = yHF(1);
            ynHF(end) = yHF(end);
            maxim= 1.10;
            minim= 0.8;%el rango pongo el que vea apropiado
            duration = minim+(maxim-minim)*rand(1);
            ppHF= makima(xnHF*duration,ynHF);
            mHF= ppval(ppHF, xRHF*duration);

            if noise == 1
                mHF = mHF + 3*rand(1,1001);
                %Filtrado
                xHFFiltrar = xRHF*duration;
                yHFFiltrar = mHF;
                [Asgolay,window] = smoothdata(yHFFiltrar,'sgolay');
                
                 %Empezar y acabar con la misma Y
                Asgolay(1) = yHF(1);
                Asgolay(end) = yHF(end);
                
                %plot(app.FHombro,xHFFiltrar,Asgolay,'r')

                i = 1;
                while i<length(xHFFiltrar)
                    plot(app.FHombro,xHFFiltrar(1:i),Asgolay(1:i))
                    i = i+4;
                    pause(0.01)
                end

                %Guardar variables en el workspace
                %assignin('base','nombre wokspace',variable)
                assignin('base','xHFFiltrar',xHFFiltrar)
                assignin('base','Asgolay',Asgolay)
                x = xHFFiltrar';
                y = Asgolay';

                %Escribir en un excel
                T = table (x, y);
                assignin('base','T',T)

                L = {'Variable x','Variable y'};
                C = table2cell(T);
                assignin('base','L',L)
                assignin('base','C',C)

                %Concateno en la matriz cell la legenda de cada columna
                A = [L;C];
                assignin('base','A',A)

                %crea y reescribe
                xlswrite('datosHF.xlsx',A,'xlswrite','A2');

            end



        end