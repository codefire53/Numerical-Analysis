##Program untuk mencari interpolasi hermite, algoritmanya hampir sama
##seperti interpolasi newton, hanya saja titik x perlu diduplikasi 2x (menjadi copied_x)
## dan y awal berisi nilai f(x) dan f'(x).
##Notes: Program ini memerlukan fungsi df untuk mencari nilai f'(x)
function [coeffs,ans] = hermite_interpolation (x, y, t)
  copied_x=zeros(1,2*size(x)(2));
  copied_y=zeros(1,2*size(x)(2));
  coeffs=zeros(1,2*size(x)(2));
  #Index pada proses doubling di x dan y
  index_copied=1;
  #Proses doubling di x dan y
  for i=1:size(x)(2)
    for j=1:2
      copied_x(index_copied)=x(i);
      #Memasukkan nilai f(x) pada awalnya
      if (j==1 && i==1)
        copied_y(index_copied)=y(i);
      #Memasukkan nilai selisih f(x)
      elseif (j==1)
        copied_y(index_copied)=(y(i)-y(i-1))/(x(i)-x(i-1));
      #Memasukkan nilai f'(x)
      else
        copied_y(index_copied)=df(x(i));
      endif
      index_copied = index_copied + 1;
    endfor
  endfor
  coeffs(1)=y(1);
  coeffs(2)=copied_y(2);
  disp(copied_y);
  for i=3:size(coeffs)(2)
    tmp=copied_y;
    for j=i:size(coeffs)(2)
      copied_y(j)=(tmp(j)-tmp(j-1))/(copied_x(j)-copied_x(j-i+1));
      if(i==j)
        coeffs(i)=copied_y(i);
      endif
    endfor
    disp(copied_y);
  endfor
  multiply_temp=1;
  ans=0;
  
  for i=1:size(coeffs)(2)
      ans = ans + coeffs(i)*multiply_temp;
      multiply_temp = multiply_temp*(t - copied_x(i));
  endfor
endfunction
