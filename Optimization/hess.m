## Copyright (C) 2020 Mahardika Krisna I
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} g (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mahardika Krisna I <Mahardika Krisna I@DESKTOP-BDOMKSJ>
## Created: 2020-04-21

function ans = hess (x, eq)
  [dim col]=size(x);
   ans=zeros(dim,dim);
   
  if (eq==1)
    x1=x(1);
    x2=x(2);
    ans(1,1)=4-12.6*x1^2+5*x1^4;
    ans(1,2)=1;
    ans(2,1)=1;
    ans(2,2)=2;
    
  elseif (eq==2)
    x1=x(1);
    x2=x(2);
    ans(1,1)=-25.2*x1^2+8+10*x1^4;
    ans(1,2)=1;
    ans(2,1)=1;
    ans(2,2)=-8*+48*x2^2;
  
  else
    for i=1:dim
      if (i==1)
        ans(1,1)=6;
        ans(1,2)=-8*(i+1)*x(i+1);
      elseif(i < dim)
        ans(i,i-1)=ans(i-1,i);
        ans(i,i)=48*i*x(i)^2-8*i*x(i-1)+2*(i+1);
        ans(i,i+1)=-8*(i+1)*x(i+1);
      else
        ans(i,i-1)=ans(i-1,i);
        ans(i,i)=48*i*x(i)^2-8*i*x(i-1);
      endif
    endfor
  endif
  ans;
endfunction
