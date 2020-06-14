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

function ans = grad (x, eq)
  [dim col]=size(x);
   ans=zeros(dim,col);
   
  if(eq==1)
    x1=x(1);
    x2=x(2);
    ans(1)=4*x1-4.2*x1^3+x1^5+x2;
    ans(2)=x1+2*x2;
    
  elseif (eq==2)
    x1=x(1);
    x2=x(2);
    ans(1)=-8.4*x1^3+8*x1+2*x1^5+x2;
    ans(2)=x1-8*x2+16*x2^3;
  
  else
    for i=1:dim
      if (i==1)
        ans(i)=2*(x(i)-1)+(-2)*(i+1)*(2*x(i+1)^2-x(i));
      elseif(i < dim)
        ans(i)=8*i*x(i)*(2*x(i)^2-x(i-1))+(-2)*(i+1)*(2*x(i+1)^2-x(i));
      else
        ans(i)=8*i*x(i)*(2*x(i)^2-x(i-1));
      endif
    endfor
  endif
  % real_ans = zeros(col, dim)
  % for i=1:dim
  %   real_ans(i, 1) = ans(i);
  % endfor
  % ans = real_ans;
  ans;
endfunction
