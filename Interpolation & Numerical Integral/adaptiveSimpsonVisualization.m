% modifikasi dari program pathcalculator.m
% fungsi ini memplot patahan-patahan dari adaptive simpson yang dilakukan oleh program
% warna berbeda menyatakan sebuah patahan utuh yang dihitung dengan 1 rumus simpson
function adaptiveSimpsonVisualization(n)
    plot([-1 1],[0,0],'k',[0 0],[-1 1],'k');hold on
    t=0:.02:1;
    %[x,y]=ginput(1); % get one mouse click
    xdata = zeros(1,n);
    ydata = zeros(1,n);
    for i=1:n
      [x,y] = ginput(1) % get n mouse clicks
      plot(x, y, 'bo', "markersize", 15);
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
      [linelength, intervals] = integralCubicAdaptiveSimpsonModified(d_x(i), c_x(i), b_x(i), a_x(i), d_y(i), c_y(i), b_y(i), a_y(i), 0, tdata(i+1)- tdata(i));
      pathSumSimpson += linelength;
      number_of_intervals = rows(intervals);
      for j= 1:number_of_intervals
        t1 = intervals(j, 1)+tdata(i);
        t2 = intervals(j, 2)+tdata(i);
        t_test=linspace(t1, t2,range);
        x_plot=d_x(i)*(t_test.-tdata(i)).^3 + c_x(i)*(t_test.-tdata(i)).^2+ b_x(i)*(t_test.-tdata(i))+a_x(i);
        y_plot=d_y(i)*(t_test.-tdata(i)).^3 +c_y(i)*(t_test.-tdata(i)).^2+b_y(i)*(t_test.-tdata(i))+a_y(i);
        plot(x_plot, y_plot, "linewidth", 5);
      endfor
      
    endfor
    
    title(cstrcat("Simpson approximation of plot: ", mat2str(pathSumSimpson)))
    
  endfunction

% Fungsi modifikasi dari integralCubicAdaptiveSimpson (integralCubicAdaptiveSimpson.m) yang mengembalikan semua patahan-patahannya.
% nilainya disimpan di intervals sebagai [(a1, b1), (a2, b2), (a3, b3)] dimana (ai, bi) adalah titik mulai dan titik akhir dari sebuah interval
function [res, intervals] = integralCubicAdaptiveSimpsonModified(d1, c1, b1, a1, d2, c2, b2, a2, t1, t2)
  epsilon = 0.000001;
  mid = (t1 + t2)/2;
  f_no_div = integralCubicSimpson(d1, c1, b1, a1, d2, c2, b2, a2, t1, t2);
  f_div = integralCubicSimpson(d1, c1, b1, a1, d2, c2, b2, a2, t1, mid) + integralCubicSimpson(d1, c1, b1, a1, d2, c2, b2, a2, mid, t2);
  err = 16/15 * abs(f_no_div - f_div);
  if (err < epsilon) 
    res = f_div;
    intervals = [t1 t2];
  else
    [sum1, interval1] = integralCubicAdaptiveSimpsonModified(d1, c1, b1, a1, d2, c2, b2, a2, t1, mid);
    [sum2, interval2] = integralCubicAdaptiveSimpsonModified(d1, c1, b1, a1, d2, c2, b2, a2, mid, t2);
    res = sum1 + sum2;
    intervals = [interval1; interval2];
  endif
  endfunction
