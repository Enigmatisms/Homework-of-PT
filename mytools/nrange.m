function out = nrange(x1, x2)
%标准正态分布的分布函数在一个区间上的概率值
out = normval(x2, 1) - normval(x1, 1);
% fprintf("P{x<%f} = %f\n", x, out);
end