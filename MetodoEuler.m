function [] = Main()
  disp("Ingrese los valores iniciales de (x,y)");
  prompt = ("a = xo = ");
  xinicial = input(prompt);
  prompt = ("yo = ");
  yinicial = input(prompt);
  
  
  disp("\nIngrese N y xfinal");
  prompt = ("N = ");
  n = input(prompt);
  prompt = ("b = xf = ");
  xfinal = input(prompt);
  
  delta = (xfinal-xinicial)/n;
  printf("\nCalculo de Delta\n Delta = (b-a)/n \n");
  printf("Delta = %f\n",delta);
  
  Calculo(delta,xinicial,yinicial,n);
 endfunction
function [] = Calculo(delta, xinicial, yinicial, n)
  array_x = zeros(1,n+1);
  array_y = zeros(1,n+1);
 
  band = true;
  for i = 1: n+1
    
    if(band == false)
      disp("\nCalculo de x:")
      printf("\n x = a + i * Delta");
      printf("\n x = %f + %d * %f",xinicial,round(i),delta);
      array_x(i) = xinicial+ (i-1)*delta; 
      printf("\n x = %f \n" , array_x(i));
      
      array_y(i) = array_y(i-1) + delta*expresion;
      disp("\nCaculo de y:")
      printf("\n y = y(n-1) + Delta * Funcion");
      printf("\n y = %f + %f * %f",array_y(i-1), delta, expresion)
      printf("\n y = %f \n" , array_y(i));
      
    else
      array_y(i) = yinicial;
      array_x(i) = xinicial;
      band = false;
    endif
    if(i == n+1)
      break;
    else
      expresion = (array_y(i))^(1/2) * array_x(i);
      printf("\nCalculo de Funcion: ");
      printf("\n \t\ty(n-1)^1/2*x(n-1)")
      printf("\n funcion = (%f)^1/2 * %f \n", array_y(i), array_x(i));
      printf("\n funcion = %f \n", expresion);
    endif
  endfor
  disp("\nx:");
  fprintf(" %f ",(array_x));
  disp("\ny:");
  fprintf(" %f ",(array_y));
  disp("");
endfunction

