#Program untuk mencari interpolasi newton dengan input:
#x: titik-titik interpolasi di x ukuran 1xn
#y: titik-titik interpolasi di y ukuran 1xn
#t: titik yang ingin dicari nilai fungsi interpolasinya
#dan output:
#coeffs: koefisien interpolasi
#f(t): Nilai fungsi interpolasi di titik t

function [coeffs,ans] = newton_interpolation (x,y,t)
  coeffs=zeros(1,size(x)(2));
  coeffs(1)=y(1);
  for i=2:size(coeffs)(2)
    tmp=y;
    for j=i:size(coeffs)(2)
      y(j)=(tmp(j)-tmp(j-1))/(x(j)-x(j-i+1));
      if(i==j)
        coeffs(i)=y(i);
      endif
    endfor
  endfor
  multiply_temp=1;
  ans=0;
  for i=1:size(coeffs)(2)
      ans = ans + coeffs(i)*multiply_temp;
      multiply_temp = multiply_temp*(t - x(i));
  endfor
endfunction
