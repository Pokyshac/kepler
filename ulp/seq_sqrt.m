function res = seq_sqrt(a, q)
  k = length(a);
 ## approximation funk = a - 1 / x^2
 ## return sqrt(a) where a = [a1, a2, a3, ...]

 ## x_n+1 = x_n /2 * (3 - a * x_n^2)
 if (k <= 2^q)
    a = [a, zeros(1, 2^q - k)];
 endif

 ## calk 1 / sqrt(a)
    v = w = res = zeros(1, 2^q);
    res(1) =  sqrt(1 / a(1));
    for i = 0:q-1
      num = 2^(i);
      v(1:num*2) = MultE(a(1:2*num), MultE(res(1:num), res(1:num), 2*num), 2*num);

      w(1:num*2) = SubE([3.], -v(1:2*num), 2*num);

      res(1:num*2) = MultE(res(1:num), w(1:2*num), 2*num);
    endfor
 res = abs(res / 2); 
 ## sqrt(a) = a * (1 / sqrt(a))
 res = MultE(a, res, 2^q);

endfunction
