random5 = @() randi(5); %% Función dada: número aleaotorio del 1 al 5


for k = 1:20    %% Este for sirve para comprobar la función random7
    disp(random7(random5))
end

N = 200000;                 % número de pruebas >10000
v = zeros(N,1);

for k = 1:N
    v(k) = random7(random5);
end

% Conteo de frecuencias
counts = histcounts(v, 0.5:1:7.5);   % 7 bins centrados en 1..7
disp(counts)
disp(counts / N)                     % proporciones

% Gráfico
figure;
histogram(v, 0.5:1:7.5);
xticks(1:7);
xlabel('Valor');
ylabel('Frecuencia');
title('Distribución de random7');


function x = random7(random5) %% Nueva función para generar número aleatorio del 1 al 7
   while true
    n = (random5() - 1) * 5 + random5();  %% Necesitamos tener más de 5 números. Además, para que sea distribución uniforme, no se pueden repetir números.
    if n <= 21
        x = mod(n-1,7) + 1; %% Nos quedamos con los números menores o iguales a 21 (mayor múltiplo de 7) y obtenemos módulo para generar los números deseados.
        return
    end
   end
end


