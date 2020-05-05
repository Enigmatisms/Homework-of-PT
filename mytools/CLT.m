function out = CLT(n, p, x)
% De Moivre-Laplace 中心极限定理 极限分布
% n 贝努里试验总次数
% p 试验成功概率
% x 试验成功次数小于等于x
inter = (x - n * p) / sqrt(n * p * (1 - p));
out = normval(inter, 1);
end