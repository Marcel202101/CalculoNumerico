function [] = Main()
  pkg symbolic load;
  syms x;
  
  fprintf("f(x): \n")
  fun = x * log(x);
  disp(fun);
  
  prompt = ("Ingrese el valor de a: ");
  a = input(prompt);
  prompt = ("Ingrese el valor de b: ");
  b = input(prompt);
  
  continuar = 'y';
  
  while(continuar == 'y')
    prompt = ("Valor de n: ");
    n = input(prompt);
    delta = (b-a)/n;
    
    acum = calculo(fun,delta,a,b);
  
    res = (delta/3 )* acum;
    disp("");
    disp('Resultado:');
    disp(res);
    disp("");
    prompt = ("Desea seguir ingresando valores para n(y/n): ");
    continuar = input(prompt, 's');
   
  endwhile
endfunction

function [acum] = calculo(fun,delta,a,b)
  x = a;
  cadena ='';
  acum = eval(fun);
  band = true;
  cadena = strcat(cadena,num2str(x),"*ln(", num2str(x),")");
  x = a + delta;
  while(x<b)
    if(band == true)
      acum = acum + 4 * eval(fun);
      band = false;
      cadena = strcat(cadena,"+ 4*[",num2str(x),"*ln(", num2str(x),")]");
    else
      acum = acum + 2 * eval(fun);
      band = true;
      cadena = strcat(cadena,"+ 2*[",int2str(x),"*ln(", num2str(x),")]");
    endif
    x = x + delta; 
  endwhile
  cadena = strcat(cadena,"+ [",num2str(x),"*ln(", num2str(x),")] * (", num2str(delta), "/3)");
  disp(cadena);
  acum = acum + eval(fun);
endfunction
