function out = binDist(n, p, x)
% ����ֲ��ķֲ�����
% n, p ����ֲ�����
% x P{X<= x} ���뷶Χ
    x = round(x);       % ����
    if(x > n)
        out = 1.0;
    else
        sum = 0.0;
        for i = 0:x
            sum = sum + bin(n, p, i);        %bin Ϊ�ֲ��ɣ���0��x�ۼ�
        end
        out = sum;
    end
end