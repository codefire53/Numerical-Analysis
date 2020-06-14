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
## @deftypefn {} {@var{retval} =} newton (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mahardika Krisna I <Mahardika Krisna I@DESKTOP-BDOMKSJ>
## Created: 2020-04-20
% Notes: eq==1 => three-hump, eq==2 => six-hump, eq==3 => dixon
function [t,xk,f_xk] = newton (x,eq)
  tol=1e-6;
  xk=x;
  d=grad(xk,eq);
  tic;
  counter = 0;
  while norm(d,inf) > tol && counter < 500
    d=grad(xk,eq);
    H=hess(xk,eq);
    sk=H\(-1*d);
    xk=xk+sk;
    counter+=1
  endwhile
  t=toc;
  xk=xk;
  f_xk=f(xk,eq);

endfunction
