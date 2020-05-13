% ʵ��9 �����ֲ������
n = 4;      % ���ɶ�
cpc = 1000; % ��������
normrnds = myrand(n * cpc); 
nums = zeros(1, cpc);
for i = 1:cpc
    %nums(i) = rndchi2(n);      % ����ʹ�����ú���������̬�ֲ������
    nums(i) = rangedRndchi2(normrnds, 4 * (i - 1) + 1, 4 * i);
end
figure(1);
hist(nums, round(cpc / 50));
grid on; axis on;
xlabel("�����ȡֵ��Χ");
ylabel("Ƶ��");
str = sprintf("���ɶ�Ϊ%d,��������Ϊ%d�Ŀ��������ֱ��ͼ", n, cpc);
title(str);
figure(2);
hist(myrand(cpc), 20);
grid on; axis on;
xlabel("�����ȡֵ��Χ");
ylabel("Ƶ��");
str = sprintf("�Լ�ʵ�ֵı�׼��̬�ֲ�(�������� %d)�����", cpc);
title(str);


% matlab ���ú�����chi2rnd�������ɿ����������������Ͳ�ʹ����

function out = rndchi2(n)
% ���ɶ�Ϊn�Ŀ��������, Ĭ�Ϸ���������
% ʹ�����õ�normrnd ʵ�ֵĿ��������
x = normrnd(0, 1, 1, n);
out = norm(x, 2) ^ 2;              % ���������
end

function out = rangedRndchi2(rnds, s, e)
% ����̬�ֲ�������б���п�����ת��
% rnd ��̬����
% s ��ʼλ��
% e ��ֹλ��
out = norm(rnds(1, s:e), 2) ^ 2;
end

function out = myrand(n)
% �Լ�д����̬�����
% n size
rnd = zeros(1, n);
sd = seed();
x = floor(sd / 3);
for i = 1:n
    x = mod(101 * x + 7, seed);
    rnd(i) = norminv(x / seed);     % ��̬�ֲ�������
end
out = rnd;
end

function out = seed()
% ���ݵ�ǰʱ���������������
date_vec = clock();
out = date_vec(1) ^ 2;
for i = 2:2:4
    out = out + (date_vec(i) + date_vec(i + 1)) ^ 2;
end
out = out + ceil(date_vec(6) ^ 3);
end
