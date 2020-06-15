#Fungsi Adaptive Runge Kutta Fehlberg Adaptive
#Source: https://math.okstate.edu/people/yqwang/teaching/math4513_fall11/Notes/rungekutta.pdf

function ans = rkf (t0,y0,h,upper_bound)
  ans=zeros(ceil((upper_bound-t0)/h),2);
  eps=0.0001;
  t=t0;
  y=y0;
  ans(1,1)=t;
  ans(1,2)=y;
  i=2;
  while t < upper_bound
    h = min(h, upper_bound-t);
    k1=f_d(t,y);
    k2 = h*f_d(t+h/4, y+h*k1/4);
    k3 = h*f_d(t+3*h/8, y+h*(3*k1/32+9*k2/32));
    k4 = h*f_d(t+12*h/13, y+h*(1932*k1/2197-7200*k2/2197+7296*k3/2197));
    k5 = h*f_d(t+h, y+h*(439*k1/216-8*k2+3680*k3/513-845*k4/4104));
    k6 = h*f_d(t+h/2, y+h*(-8*k1/27+2*k2-3544*k3/2565+1859*k4/4104-11*k5/40));
    w1 = y + h*(25*k1/216+1408*k3/2565+2197*k4/4104-k5/5);
    w2 = y + h*(16*k1/135+6656*k3/12825+28561*k4/56430-9*k5/50+2*k6/55);
    R = abs(w1-w2);
    delta=0.84*(eps/R)^(1/4);
    if R <= eps
      t=t+h;
      y=w1;
      ans(i,1)=t;
      ans(i,2)=y;
      i=i+1;
      h=delta*h;
    else
      h=delta*h;
    endif
  end
  ans;
endfunction
