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
## @deftypefn {} {@var{retval} =} bfgs (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mahardika Krisna I <Mahardika Krisna I@DESKTOP-BDOMKSJ>
## Created: 2020-04-20
% Notes: eq==1 => three-hump, eq==2 => six-hump, eq==3 => dixon9500
function [t,xk,f_xk] = bfgs(x,eq)
  g=grad(x,eq);
  [r c]=size(g);
  Bk=eye(r);
  tol=1e-6;
  xk=x;
  counter=0;
  tic;
  while norm(g,inf) > tol && counter < 500
    g=grad(xk,eq);
    xk_1=xk;
    p=Bk\(-1*g);
    a=armijo_line(xk,p,eq);
    sk=a*p;
    xk=xk_1+sk;
    yk=grad(xk,eq)-grad(xk_1,eq);
    Bk= Bk + (yk*yk.')/(yk.'*sk) - (Bk*sk*sk.'*Bk)/(sk.'*Bk*sk);
    counter+=1
    xk
  endwhile
  t=toc;
  xk=xk;
  f_xk=f(xk,eq);
endfunction
