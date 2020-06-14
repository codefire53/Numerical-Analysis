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
## @deftypefn {} {@var{retval} =} armijo_line (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mahardika Krisna I <Mahardika Krisna I@DESKTOP-BDOMKSJ>
## Created: 2020-04-20

function alpha = armijo_line (x,p,eq)
  betha=0.1;
  alpha=1;
  tau=0.5;
  g=grad(x,eq);
  eps=1e-5;
  objF=f(x,eq);
  while f(x + alpha*p,eq) > objF + alpha*betha*g.'*p;
    alpha=tau*alpha;
    if alpha < eps
      break;
    endif;
  endwhile;
alpha=alpha;
endfunction
