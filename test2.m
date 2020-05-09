% 置信区间估计以及验证
% 以服从sigma^2 = 16/期望未知为例
% 测定置信度为95% 90% 两种情况
% m源码文件没有数值滑块

% 设定期望为 u = 4
u           = 4;
sigma       = 4;
capacity    = 10;       % 样本容量
prob        = 0.95;
cnt = 0;                                        % 包含期望的区间计数器
for i = 1:10000
    samples = normrnd(u, sigma, capacity, 1);       % 样本值
    [lb, ub] = confInterval(samples, capacity, sigma, prob);    % 95%置信度
    if((u < ub) && (u > lb))
        cnt = cnt + 1;
    end
end
fprintf("10000次样本容量为%d的抽样中，%.2f%%的区间包含了真实期望，置信度为%.2f\n",...
    capacity, cnt / 100, prob);

function [lb, ub] = confInterval(spls, cpc, sig, prob)
% spls 一次抽样的所有样本观测值
% cpc 样本容量
% sig 已知的标准差
% prob 置信度
% @return 置信区间的上下界
    bound = norminv(0.5 + 0.5 * prob, 0, 1);    % 标准正态区间
    spl_mean = mean(spls);
    ub = spl_mean + sig / sqrt(cpc) * bound;
    lb = spl_mean - sig / sqrt(cpc) * bound;
end


