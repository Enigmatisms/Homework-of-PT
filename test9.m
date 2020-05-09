% ʵ��9 �����ֲ������
n = 4;      % ���ɶ�
cpc = 1000; % ��������
nums = zeros(1, cpc);
for i = 1:cpc
    nums(i) = rndchi2(n);
end
hist(nums, round(cpc / 50));
grid on; axis on;
xlabel("�����ȡֵ��Χ");
ylabel("Ƶ��");
str = sprintf("���ɶ�Ϊ%d,��������Ϊ%d�Ŀ��������ֱ��ͼ", n, cpc);
title(str);


% matlab ���ú�����chi2rnd�������ɿ����������������Ͳ�ʹ����

function out = rndchi2(n)
% ���ɶ�Ϊn�Ŀ��������, Ĭ�Ϸ���������
x = normrnd(0, 1, 1, n);
out = sum(x .* x);              % ���������
end
