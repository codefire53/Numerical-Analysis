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
## @deftypefn {} {@var{retval} =} function3_test (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mahardika Krisna I <Mahardika Krisna I@DESKTOP-BDOMKSJ>
## Created: 2020-04-27

function function3_test (n)
  avg_fk1=0;
  avg_fk2=0;
  avg_fk3=0;
  avg_t1=0;
  avg_t2=0;
  avg_t3=0;
  n1=0;
  n2=0;
  n3=0;
  domain_x=zeros(20,1);
  size=1;
  for i=-10:2:10
    domain_x(size)=i;
    size++;
  endfor
  for sample=1:5

    % cari sample sampai tidak ketemu vektor 0 semua
    A=zeros(n,1);
    while(A == zeros(n, 1))
      for k=1:n
        p=randi(length(domain_x));
        A(k)=domain_x(p);
      endfor
    endwhile

    disp("starting values:")
    A

    disp("newton");
    [t1,xk1,fk1]=newton(A,3);
     if(!isnan(fk1))
       avg_t1+=t1;
       avg_fk1+=fk1;
       n1++;
       disp("converges to"), disp(xk1)
       disp("f(x) = "), disp(fk1)

     endif
     disp("end newton")
     disp("")

     disp("steepest descend")
     [t2,xk2,fk2]=steepest_descent(A,3);
      if(!isnan(fk2))
       avg_t2+=t2;
       avg_fk2+=fk2;
       n2++;
       disp("converges to"), disp(xk2)
       disp("f(x) = "), disp(fk2)
      endif
     disp("end steepest descend")
     disp("")

     disp("BFGS")
     [t3,xk3,fk3]=bfgs(A,3);
     if(!isnan(fk3))
       avg_t3+=t3;
       avg_fk3+=fk3;
       n3++;
       disp("converges to"), disp(xk3)
       disp("f(x) = "), disp(fk3)
     endif
     disp("end BFGS")
     disp("")
  endfor

  % displaying performances
  disp("algorithm performances:")
  if(n1 > 0)
    disp("Newton");
    disp(avg_t1/n1);
    disp(avg_fk1/n1);
  endif
  if(n2 > 0)
    disp("Steepest Descent");
     disp(avg_t2/n2);
    disp(avg_fk2/n2);
  endif
  if(n3 > 0)
    disp("BFGS");
     disp(avg_t3/n3);
    disp(avg_fk3/n3);
  endif
  n1
  n2
  n3
endfunction
