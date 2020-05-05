function out = geo(n, p)
%几何分布概率，n次独立的伯努利实验,每次成功的概率为p，第n次才成功的概率
out = p*((1-p)^(n-1));
end