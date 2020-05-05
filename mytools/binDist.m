function out = binDist(n, p, x)
% 二项分布的分布函数
% n, p 二项分布参数
% x P{X<= x} 输入范围
    x = round(x);       % 近似
    if(x > n)
        out = 1.0;
    else
        sum = 0.0;
        for i = 0:x
            sum = sum + bin(n, p, i);        %bin 为分布律，对0到x累加
        end
        out = sum;
    end
end