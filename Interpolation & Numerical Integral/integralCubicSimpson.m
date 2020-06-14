% menerima fungsi kubik x dan y untuk mencari panjang garis dari fungsi parametrik (x(t), y(t))
% fungsi x berbentuk d1 t^3 + c1 t^2 + b1 t + a1
% fungsi y berbentuk d2 t^3 + c2 t^2 + b2 t + a2
% batas-batas integral berada di range (x1, x2)
% parameter berikutnya (x1, x2) menyatakan batas integrasi
% fungsi ini adalah fungsi helper untuk integralCubicAdaptiveSimpson, hanya menghitung aproksimasi simpson pada suatu interval
function [res] = integralCubicSimpson(d1, c1, b1, a1, d2, c2, b2, a2, t1, t2)
    mid = (t1 + t2)/2;
    ft2 = approximation(d1, c1, b1, a1, d2, c2, b2, a2, t2);
    ft1 = approximation(d1, c1, b1, a1, d2, c2, b2, a2, t1);
    fmid = approximation(d1, c1, b1, a1, d2, c2, b2, a2, mid);
    res = (t2 - t1)/6 * (ft2 + ft1 + 4*fmid);
  endfunction


% mencari nilai turunan dari fungdi dx^3 + cx^2 + bx + a lalu dikuadratkan
function [res] = differentialSquared(d, c, b, a, t)
  res = 3*d*t^2 + 2*c*t + b;
  res = res*res;
endfunction

% mencari nilai dari fungsi sqrt((dx/dt)^2 + (dy/dt)^2) pada titik t
function [res] = approximation(d1, c1, b1, a1, d2, c2, b2, a2, t)
  res = sqrt(differentialSquared(d1, c1, b1, a1, t) + differentialSquared(d2, c2, b2, a2, t));
endfunction

