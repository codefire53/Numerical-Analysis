function ans = simpson_komposit (a,b,subinterval)
  h=(b-a)/subinterval;
  ans = f(a)+f(b);
  k=1;
  for i=a+h:b-h:h
    if(mod(k,2)!=0)
      ans = ans + 4*f(i);
    else
      ans = ans + 2*f(i);
    endif
  endfor
  ans = ans*h/3;
endfunction
