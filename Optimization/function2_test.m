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
## @deftypefn {} {@var{retval} =} function1_test (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mahardika Krisna I <Mahardika Krisna I@DESKTOP-BDOMKSJ>
## Created: 2020-04-27

function function2_test ()
  avg_fk1=0;
  avg_fk2=0;
  avg_fk3=0;
  avg_t1=0;
  avg_t2=0;
  avg_t3=0;
  n1=0;
  n2=0;
  n3=0;
  for i=-3:3
    for j=-2:2
      A=[i;j];
      [t1,xk1,fk1]=newton(A,2);
      if (!isnan(fk1))
        avg_fk1+=fk1;
        avg_t1+=t1;
        n1++;
      endif
      % [t2,txk2,fk2]=steepest_descent(A,2);
      %  if (!isnan(fk2))
      %   avg_t2+=t2;
      %   avg_fk2+=fk2;
      %   n2++;
      %  endif
      [t3,xk3,fk3]=bfgs(A,2);
      if (!isnan(fk2))
        avg_t3+=t3;
        avg_fk3+=fk3;
        n3++;
      endif
    endfor
  endfor
 if(n1 > 0)
    disp("Newton");
    disp(avg_t1/n1);
    disp(avg_fk1/n1);
  endif
  % if(n2 > 0)
  %   disp("Steepest Descent");
  %    disp(avg_t2/n2);
  %   disp(avg_fk2/n2);
  % endif
  if(n3 > 0)
    disp("BFGS");
     disp(avg_t3/n3);
    disp(avg_fk3/n3);
  endif
endfunction
