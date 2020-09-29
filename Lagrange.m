x = [-3 -2 5 -1 0];
y = [45 10 -235 -1 0];

function [] = lagrange(x,y, valor)
  punto_en_x = valor;
  n = length(x) - 1;
  L = zeros(length(x),length(x));
  
  for i  = 1: n+1
    disp(strcat("Para L(", int2str(i),  "): "));
    numerador =1;
    numerador_str_sin_valor= "";
    numerador_str_con_valor= "";
    for j = 1: n+1
      if i~=j
        numerador_str_sin_valor = strcat(numerador_str_sin_valor, "[(x - x", int2str(j),")/(x", int2str(i), " - x", int2str(j),")]");
        disp(numerador_str_sin_valor);
        numerador_str_con_valor = strcat(numerador_str_con_valor,"[(x -  ", num2str(x(j)),")/(", num2str(x(i)), " -  ", num2str(x(j)),")]");
        
        numerador = conv(numerador,poly(x(j))/(x(i)-x(j)));
        
        if length(numerador_str_con_valor) > 0  
        numerador_str_con_valor = strcat(numerador_str_con_valor," * ");
        numerador_str_sin_valor = strcat(numerador_str_sin_valor," * ");
       
        endif
      endif
      
     endfor
     disp("");
     disp(strcat("L(",int2str(i),")= ",numerador_str_con_valor, " 1"));
     
     disp("");
     
     disp(strcat("Se agrega L(", int2str(i), ")"));
     L(i,:) = numerador;
     disp(L(i,:));
     disp("");
  endfor
  
  disp("Cada Fila de esta Mariz L represanta L(n)");
  disp(L);
  
  disp("");
  
  R= y*L;
  num_str_sin_valor = "";
  num_str_con_valor = "";
  
  for i = 1 : n+1
    fila = L(i,:);
    disp("");
    num_str_sin_valor = strcat(num_str_sin_valor,"y(",int2str(i),")*L(",int2str(i),")");
    disp(strcat("Y(", int2str(i),"): " ));
    disp(y(i));
    disp(strcat("L(",int2str(i),"): "));
    disp(L(i,:));
    disp(strcat("y(",int2str(i),")*L(",int2str(i),"): "));
    disp(y(i)*L(i,:));
    if(i~=n)
      num_str_sin_valor = strcat(num_str_sin_valor, " + ");
    endif
  endfor
  disp("Hacemos la suma de todos los polinomios y nos da P(x)= ");
  disp(R);
  disp("");
   o = '';
  for i= 1 :length(R)
      if i == length(R)
        o = strcat(o, int2str(R(i)));
      else
        o =strcat(o, int2str(R(i)),"*X^",int2str(length(R)-i));
      end
      if(i ~= 1 && i ~= length(R) && R(i+1)>=0)
        o = strcat(o, "+");
      end
  endfor
  
  disp("formula:");
  disp(o);
  o_x = "";
  disp(strcat("Le damos el valor x = ", int2str(punto_en_x)," para obtener punto P(x)"));
  punto_en_y = polyval(R,punto_en_x);
  
  for i = 1: length(o)
    if(o(i)=="X")
      o_x = strcat(o_x, "(",int2str(punto_en_x),")");
     else
      o_x = strcat(o_x, o(i));
    endif
  endfor
  disp(o_x);
  disp(strcat("P(",int2str(punto_en_x),")= ",num2str(punto_en_y)));
  
 
  title('Grafica Lagrange');
  
  zoom on; hold on; xlabel('x'); ylabel('y');
  grid on;
  
  fplot(o);
  plot(x,y,"*");
  hold off;
  
  
endfunction
