function out = poissonDist(n, p, x)
%���ɷֲ��ֲ�����
    lambda = n * p;
    x = round(x);
    sum = 0.0;
    for i = 0:1:x
       sum = sum + poisson(lambda, i);
    end
    out = sum;
end