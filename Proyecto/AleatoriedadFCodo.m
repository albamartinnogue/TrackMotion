function [xnCF,ynCF,yCFF,xCFF] = AleatoriedadFCodo(app,noise, duration, metrica)
            %Creacion grafica
            xCF = 0:0.1:1;
            xnCF = xCF+ 0.01*rand(1,11);
            xnCF(1) = 0;
            xnCF(end)=1;
            xRCF = 0:0.001:1;
            yCF = [67,70,89,108,115,120,115,107,83,72,67];
            ynCF = yCF + 5*rand(1,11);
            ynCF(1) = yCF(1);
            ynCF(end) = yCF(end);
%             maxim= 1.10;
%             minim= 0.8;
%             duration = minim+(maxim-minim)*rand(1);
            ppCF= makima(xnCF*duration,ynCF);
            mCF= ppval(ppCF, xRCF*duration);

            if noise == 1
                mCF = mCF + 3*rand(1,1001);
                %Filtrado
                xCFFiltrar = xRCF*duration;
                yCFFiltrar = mCF;
                [Asgolay,window] = smoothdata(yCFFiltrar,'sgolay');
                
                 %Empezar y acabar con la misma Y
                Asgolay(1) = yCF(1);
                Asgolay(end) = yCF(end);
                
                %Devuelvo por mHA la señal filtrada asgolay para poder
                %usarla fuera
                mCF=Asgolay;
            else
                Asgolay=mCF;
            end
                %plot(app.FCodo,xCFFiltrar,Asgolay,'r')

%                 i = 1;
%                 while i<length(xCFFiltrar)
%                     plot(app.FCodo,xCFFiltrar(1:i),Asgolay(1:i))
%                     i = i+4;
%                     pause(0.01)
%                 end

                %Guardar variables en el workspace
                %assignin('base','nombre wokspace',variable)
                assignin('base','xCFFiltrar',xCFFiltrar)
                assignin('base','Asgolay',Asgolay)
                xCFF = xCFFiltrar';
                yCFF = Asgolay';

                %Escribir en un excel
                T = table (xCFF, yCFF);
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
                xlswrite('datosCF.xlsx',A,'xlswrite','A2');
               
                elseif (metrica == 'c') %cantidad
                xlswrite('datosCFC.xlsx',A,'xlswrite','A2');
                
                else (metrica == 'cl') %calidad    
                xlswrite('datosCFCl.xlsx',A,'xlswrite','A2');
                
                end

            end