A = [16 -12 8; -12 18 -6; 8 -6 8]; % Inicializando 
b = [76; -66; 46];
L= zeros(3);
[f,c] = size(A);

disp('A:');
disp(A);
disp(" ");

disp("Para Saber Si A es Definida Positiva Sacamos los determinantes de sus Menores Principales:");
A1 = A(1,1);
A2 = zeros(2);
for j=1:2
  for i=1:2
    A2(i,j) = A(i,j);
  endfor
endfor
disp("A1");
disp(A1);
disp("A2");
disp(A2);
disp("A3");
disp(A);
disp("");
disp(strcat("det(A1): ", int2str(det(A1))," det(A2): ", int2str(det(A2))," det(A3): ", int2str(det(A))));
if(det(A)>0 && det(A1)>0 && det(A2)> 0)
  band_cholesky=true;
else
  band_cholesky=false;
end

disp('');

if(band_cholesky)
    disp('Descomposicion Cholesky: ');
    disp("A:");
    disp(A);
    disp("");
    for j=1:c
        for i=1:f
            if i>=j
                if j == i
                    pos = A(i,j);
                    disp(strcat('Se extrae de A(', int2str(i), ',', int2str(j), '): ', int2str(pos)));
                    n = j-1;
                    while (n)>0
                        pos = pos - (L(i,n))^2;
                        disp(strcat(' Eso se resta con L(', int2str(i), ',', int2str(n), ')^2: (', int2str(L(i,n)), ')^2 =', int2str((L(i,n)^2))));
                        n = n-1;
                        if(n>0)
                        disp("Seguido");
                        end
                    end
                    L(i,j)= sqrt(pos);
                    disp(strcat(' =',int2str(pos)));
                    disp(strcat('Se le Saca la raiz a lo antes hecho y quedaria L(', int2str(i), ',', int2str(j), '): ', int2str(L(i,j))));
                    diag = L(i,j);  
                else
                    if (j==1)
                        L(i,j)= A(i,j)/diag;
                        disp(strcat('Se extrae de A(', int2str(i), ',', int2str(j), '): ', int2str(A(i,j))));
                        disp(strcat('Y se le divide la diagonal que se encuentra en su Columna, L(', int2str(j), ',', int2str(j), '): ' ,int2str(diag)));
                        disp(strcat('Dando asi L(',int2str(i),',', int2str(j),') = ', int2str(L(i,j)) ));
                        
                    elseif (j==2)
                        L(i,j) = (A(i,j)- (L(i,j-1)*L(i-1,j-1)))/diag;
                        disp(strcat('Se extrae de A(', int2str(i), ',', int2str(j), '): ', int2str(A(i,j))));
                        disp(strcat('Luego se le sustrae L(',int2str(i),',',int2str(j-1),')= ', int2str(L(i,j-1)), ' y L(',int2str(i-1),',',int2str(j-1),')= ', int2str(L(i-1,j-1))));
                        disp(strcat('Y se le divide la diagonal que se encuentra en su Columna, L(', int2str(j), ',', int2str(j), '): ' ,int2str(diag)));
                        disp(strcat('Dando asi L(',int2str(i),',', int2str(j),') = ', int2str(L(i,j)) ));    
                    end
                end
                disp(L);
            else
                L(i,j) = 0;
            end
        end
    end
    
    disp('Matriz A');
    disp(A);
    
    disp('Matriz L');
    disp(L);
    
    disp('Para Obtener Los Valores de Y...');
    disp("Trasponemos L: L'");
    disp(L');
    disp("Y lo multiplicamos con el Vector Columna B");
    
    disp("Vector Columna b");
    disp(b);
    
    y = L\b;
    disp("L' * b = Y");
    disp('Dando asi Los Valores de Y: ');
    disp(y);
    
    disp('Para Obtener Los Valores de X...');
    disp("Tomamos la Matriz L y la multiplicamos por los Valores de Y");
    disp("L' * Y = X'");
    disp("Siendo x1 = x, x2 = y, x3 = z");
    x = ((L')^-1)*y;
    
    disp('Dando asi Los Valores de X: ');
    
    for i=1:f
        if(i==1)
            var = 'x';
        elseif(i==2)
            var = 'y';
        else
            var = 'z';
        end    
        disp(strcat(int2str(var), '= ', int2str(x(i))));
    end
else
  disp("Los determinantes de los menores principales son menor o igual que 0, no se puede hacer la factorizacion Cholesky")
end