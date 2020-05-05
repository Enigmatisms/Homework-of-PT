function out = normval(x, left)
% 标准正态分布的分布函数
% normalval(x, left)
% x 是期望的取值, left = 1表明求 φ(x), 否则求1 - φ(x)
syms x_ yy_;
% y_ = 1/sqrt(2*pi)*exp(-x_*x_/2);
yy_ = (7186705221432913*2^(1/2)*pi^(1/2)*(erf((2^(1/2)*x_)/2) + 1))/36028797018963968;
if left == 1
    out = double(subs(yy_, x));
else    
    out = 1 - double(subs(yy_, x));
end
% fprintf("P{x<%f} = %f\n", x, out);
end

