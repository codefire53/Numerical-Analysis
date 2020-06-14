function ans = segiempat_komposit (a, b, subinterval)
  h=(b-a)/n;
  ans=0;
  for i=a:b-h:h
    ans=ans+f(i);
  endfor
  ans=ans*h;
endfunction
