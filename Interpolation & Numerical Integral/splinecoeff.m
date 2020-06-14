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
## @deftypefn {} {@var{retval} =} splinecoeff (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mahardika Krisna I <Mahardika Krisna I@DESKTOP-BDOMKSJ>
## Created: 2020-05-16

function coeff = splinecoeff (tdata, fdata)
    n=length(fdata);
    coeff = zeros(n,4);
    coeff(:,1)=fdata';
    df=[]; %f(t) delta
    dt=[]; %t delta
    for i=1:n-1
      df = [df fdata(i+1)-fdata(i)];
      dt = [dt tdata(i+1)-tdata(i)];
    endfor
  
    %Init A matrix
    A=zeros(n,n);
    %Endpoint condition
    A(1,1)=1;
    A(n,n)=1;
    %Init b vector
    b=zeros(n,1);
    for i=2:n-1
      A(i,i-1:i+1)=[dt(i-1) 2*(dt(i)+dt(i-1)) dt(i)];
      b(i)=3*(df(i)/dt(i) - df(i-1)/dt(i-1));
    endfor
    %Find "c" value vector
    coeff(:,3)=A\b;
    %Find "b" & "d' value vector for each function
    for i=1:n-1
      %Find b
      coeff(i,2)=df(i)/dt(i) - dt(i)*(2*coeff(i,3)+coeff(i+1,3))/3;
      %Find d
      coeff(i,4)=(coeff(i+1,3)-coeff(i,3))/(3*dt(i));
    endfor
    coeff;
endfunction
