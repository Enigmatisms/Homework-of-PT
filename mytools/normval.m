function out = normval(x, left)
% ��׼��̬�ֲ��ķֲ�����
% normalval(x, left)
% x ��������ȡֵ, left = 1������ ��(x), ������1 - ��(x)
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

