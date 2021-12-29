 function [xnMF,ynMF,mMF,xRMF] = AleatoriedadFMuneca(app,noise)
            %Creacion grafica
            xMF = 0:0.1:1;
            xnMF = xMF+ 0,01*rand(1,11);
            xnMF(1) = 0;
            xnMF(end)=1;
            xRMF = 0:0.001:1;
            yMF = [27,25,23,20,21,20,22,20,23,25,27];
            ynMF = yMF + 5*rand(1,11);
            ynMF(1) = yMF(1);
            ynMF(end) = yMF(end);
            maxim= 1.10;
            minim= 0.8;%el rango pongo el que vea apropiado
            duration = minim+(maxim-minim)*rand(1);
            ppMF= makima(xnMF*duration,ynMF);
            mMF= ppval(ppMF, xRMF*duration);

            if noise == 1
                mMF = mMF + 3*rand(1,1001);
                %Filtrado
                xMFFiltrar = xRMF*duration;
                yMFFiltrar = mMF;
                [Asgolay,window] = smoothdata(yMFFiltrar,'sgolay');
                
                 %Empezar y acabar con la misma Y
                Asgolay(1) = yMF(1);
                Asgolay(end) = yMF(end);
                
                % plot(app.FMuneca,xMFFiltrar,Asgolay,'r')

                i = 1;
                while i<length(xMFFiltrar)
                    plot(app.FMuneca,xMFFiltrar(1:i),Asgolay(1:i))
                    i = i+4;
                    pause(0.01)
                end


                %Guardar variables en el workspace
                %assignin('base','nombre wokspace',variable)
                assignin('base','xMFFiltrar',xMFFiltrar)
                assignin('base','Asgolay',Asgolay)
                x = xMFFiltrar';
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
                xlswrite('datosMF.xlsx',A,'xlswrite','A2');

            end
        end