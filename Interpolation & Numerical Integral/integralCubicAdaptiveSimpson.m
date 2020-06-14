
% menerima fungsi kubik x dan y untuk mencari panjang garis dari fungsi parametrik (x(t), y(t))
% fungsi x berbentuk d1 t^3 + c1 t^2 + b1 t + a1
% fungsi y berbentuk d2 t^3 + c2 t^2 + b2 t + a2
% batas-batas integral berada di range (x1, x2)
% parameter berikutnya (x1, x2) menyatakan batas integrasi
% fungsi ini sifatnya adaptive, jadi jika errornya masih kurang dari 10^(-6) akan membagi interval menjadi 2 secara rekursif
function [res] = integralCubicAdaptiveSimpson(d1, c1, b1, a1, d2, c2, b2, a2, t1, t2)
  epsilon = 0.000001;
  mid = (t1 + t2)/2;
  f_no_div = integralCubicSimpson(d1, c1, b1, a1, d2, c2, b2, a2, t1, t2);
  f_div = integralCubicSimpson(d1, c1, b1, a1, d2, c2, b2, a2, t1, mid) + integralCubicSimpson(d1, c1, b1, a1, d2, c2, b2, a2, mid, t2);
  err = 16/15 * abs(f_no_div - f_div);
  if (err < epsilon) 
    res = f_div;
  else
    res = integralCubicAdaptiveSimpson(d1, c1, b1, a1, d2, c2, b2, a2, t1, mid) + integralCubicAdaptiveSimpson(d1, c1, b1, a1, d2, c2, b2, a2, mid, t2);
  endif
  endfunction

