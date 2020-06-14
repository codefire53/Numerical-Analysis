function ans = trapzeoid_komposit(a, b, subinterval)
  h=(b-a)/subinterval;
  ans = (f(a)+f(b))/2;
  for i=a+h:b-h:h
    ans = ans + f(i);
  endfor
  ans = ans*h;
  
endfunction
