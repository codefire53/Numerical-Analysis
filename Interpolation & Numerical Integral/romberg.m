function ans = romberg (a,b,j)
  eps=0.0000001;
  R=zeros(j+1,j+1);
  ans = 0;
  for i=0:j
    for k=i:j
      if i==0
        subinterval=2^k;
        h=(b-a)/subinterval;
        R(k+1,i+1)=  f(a)+f(b);
        for p=1:2^k-1
          R(k+1,i+1)= R(k+1,i+1) + 2*f(a+p*h);
        endfor
        R(k+1,i+1)= R(k+1,i+1)*h/2;
      else 
        R(k+1,i+1) = ((4^i)*R(k+1,i)-R(k,i))/(4^i-1);
      endif
    endfor
    if (i > 0 && abs(R(i+1,i+1) - R(i,i)) < eps)
      ans = R(i+1,i+1);
      break;
    endif
  endfor
disp(R);    
endfunction
