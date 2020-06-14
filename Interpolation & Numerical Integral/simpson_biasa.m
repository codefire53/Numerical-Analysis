function ans = simpson_biasa (a, b)
  c=(a+b)/2;
  ans=((b-a)/6)*(f(a)+4*f(c)+f(b));
endfunction
