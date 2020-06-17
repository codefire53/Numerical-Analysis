function [x,y_newton,y_spline]=plot_uas() 
  x=linspace(1,5,5);
  y_newton=zeros(1,5);
  y_spline=zeros(1,5);
  for i=1:size(x)(2)
    a=0;
    b=0;
    c=0;
    d=0;
    lower=0;
    y_newton(i)=1+0.5*(x(i)-2)*(x(i)-1)+0.33*(x(i)-3)*(x(i)-2)*(x(i)-1)+0.375*(x(i)-4)*(x(i)-3)*(x(i)-2)*(x(i)-1);
    if(x(i) < 2)
      a=1;
      b=-0.30357;
      d=0.30357;
      lower=1;
    elseif (x(i) < 3)
      a=1;
      b=0.60614;
      c=0.91071;
      d=-0.51786;
      lower=2;
    elseif (x(i) < 4)
      a=2;
      b=0.875;
      c=-0.64286;
      d=3.76786;
      lower=3;
    else
      a=6;
      b=10.89286;
      c=10.66071;
      d=-3.55357;
      lower=4;
    endif
    y_spline(i)=a+b*(x(i)-lower)+c*(x(i)-lower)^2+d*(x(i)-lower);
  endfor
  close all;
  figure(1);
  plot(x,y_newton,x,y_spline);
  title("Plot");

endfunction