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
## @deftypefn {} {@var{retval} =} rk3 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mahardika Krisna I <Mahardika Krisna I@DESKTOP-BDOMKSJ>
## Created: 2020-06-13

function ans = rk4 (t0,y0,h,upper_bound)
  numberOfSteps = ceil((upper_bound - t0)/h);
  yn=y0;
  tn=t0;
  ans(1,1)=tn;
  ans(1,2)=yn;
  for i=1:numberOfSteps
    k1=f_d(tn,yn);
    k2=f_d(tn+h,yn+h*k1);
    tn=tn+h;
    yn=yn+h*(k1+k2)/2;
    disp(h);
    ans(i+1,1)=tn;
    ans(i+1,2)=yn;
  endfor
  ans;
endfunction
