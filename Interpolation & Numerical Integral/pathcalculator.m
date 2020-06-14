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
## @deftypefn {} {@var{retval} =} pathcalculator (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mahardika Krisna I <Mahardika Krisna I@DESKTOP-BDOMKSJ>
## Created: 2020-05-16

% Program ini hanya membaca input koordinat yang diklik
% n adalah jumlah titik yang displine

function pathcalculator(n)
    plot([-1 1],[0,0],'k',[0 0],[-1 1],'k');hold on
    t=0:.02:1;
    %[x,y]=ginput(1); % get one mouse click
    xdata = zeros(1,n);
    ydata = zeros(1,n);
    for i=1:n
      [x,y] = ginput(1) % get n mouse clicks
      plot(x, y, 'bo');
      xdata(i) = x;
      ydata(i) = y;   
    endfor
    
    %domain array
    tdata = []
    for i=1:n
      tdata = [tdata i]
    endfor
    coeff_x=splinecoeff(tdata,xdata);
    coeff_y=splinecoeff(tdata,ydata);
    tdata
    coeff_x
    coeff_y
    %convert to var
    a_x=coeff_x(:,1);
    a_y=coeff_y(:,1);
    b_x=coeff_x(:,2);
    b_y=coeff_y(:,2);
    c_x=coeff_x(:,3);
    c_y=coeff_y(:,3);
    d_x=coeff_x(:,4);
    d_y=coeff_y(:,4);
    %Do plotting
    range=30000;
    x=[];y=[];
    pathSumSimpson = 0;
    for i=1:n-1
      t_test=linspace(tdata(i),tdata(i+1),range);
      x_plot=d_x(i)*(t_test.-tdata(i)).^3 + c_x(i)*(t_test.-tdata(i)).^2+ b_x(i)*(t_test.-tdata(i))+a_x(i);
      y_plot=d_y(i)*(t_test.-tdata(i)).^3 +c_y(i)*(t_test.-tdata(i)).^2+b_y(i)*(t_test.-tdata(i))+a_y(i);
      x=[x; x_plot(1:range)'];y=[y;y_plot(1:range)'];
      pathSumSimpson += integralCubicAdaptiveSimpson(d_x(i), c_x(i), b_x(i), a_x(i), d_y(i), c_y(i), b_y(i), a_y(i), 0, tdata(i+1)- tdata(i));
    endfor
    plot(xdata,ydata,'bo',x,y,'color','red');
    title(cstrcat("Simpson approximation of plot: ", mat2str(pathSumSimpson)))
    
  endfunction