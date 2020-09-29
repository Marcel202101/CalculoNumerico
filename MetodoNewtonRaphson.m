pkg load symbolic;
function [] = Main()
  prompt = "Valor de N: "
  N = input(prompt);
  
  graficar(N);
  x1 = estimar(N);
  fprintf("Valor Aproximado de x1 = %f\n", x1)
  syms x;
  
  f_1 = e^x * x - N; #Funcion, esto pueden cambiarlo a conveniencia
  disp(x - ((f_1))/diff(f_1));
  
  r = calculo (x1,0,f_1);
  
  
  prompt = ("Desea tomar otro valor de n? (y/n)");
  p = input(prompt, 's');
  
  if(p == 'y')
    Main()
  endif
  
endfunction

function [] = graficar(N)
  #Esta grafica si desean Cambiarla deberan cambiar la funcion que esta en este fplot()
  hold on;
  fplot(strcat("e^x * x -", int2str(N)));
  
  
endfunction

function [] = graficar_r(r)
  r_x = [r,r];
  r_y = [-1000,1000];
  plot(r_x,r_y);
 
endfunction

function [cercano] = estimar(N)
  intentos = [-2,-1,0,1,2];
  band = true;
  for i = 1: length(intentos)
    if(band)
      cercano = intentos(i);
      band = false;
    else
      x = intentos(i);
      if((abs((e^cercano)*cercano-N)) > abs((e^x)*x-N))
        cercano = x;
      endif 
    endif
  endfor
endfunction

function [xi_1] = calculo (xi,xi_1,f_1)

  syms x;
  
  tem = x - ((f_1))/diff(f_1);
  
  x = xi;
  xi_1 = eval(tem);
  
  if( xi ~= xi_1)
    
    fprintf("\t\txi = %f\n", xi);
    
    xi = xi_1;
    xi_1= x;
    calculo(xi,xi_1,f_1);
   else
    disp("");
    
    fprintf('Resultado = %f\n',xi_1);
    
   end
endfunction
