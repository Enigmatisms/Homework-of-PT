% ʵ��4 �����غ�����(����)�صĹ�ϵ
% ����̬�ֲ�����Ϊ��
% mԴ���ļ�û����ֵ����

clf;
u   = 2.0;
sig = 2.0;
x_max = 2000;
sample = normrnd(u, sig, 1, x_max);
xs = 10:2:x_max;
cpc = (x_max - 10)/2 + 1;
us = u * ones(1, cpc);
sigs = sig^2 * ones(1, cpc);
means = zeros(1, cpc);
stds = zeros(1, cpc);
cnt = 1;
for i = 10:2:x_max
    means(cnt) = mean(sample(1:i));
    stds(cnt) = std(sample(1:i))^2;
    cnt = cnt + 1;
end

% �����Ĺ�ϵ
figure(1)
plot(xs, means, "b");
hold on; axis on; grid on;
plot(xs, us, "r");
xlim([10, x_max]);
ylim([min(min(means)) - 0.1, max(max(means)) + 0.1]);
legend(["������ֵ", "��ʵ����"], 'Location','best');
xlabel("��������");
ylabel("�ؼ���ֵ");
title("������ֵ�����������Ĺ�ϵ");

% ����Ĺ�ϵ
figure(2)
plot(xs, stds, "b");
hold on; axis on; grid on;
plot(xs, sigs, "r");
xlim([10, x_max]);
ylim([min(min(stds)) - 0.1, max(max(stds)) + 0.1]);
legend(["��������", "��ʵ����"], 'Location','best');
xlabel("��������");
ylabel("�ؼ���ֵ");
title("�������������������Ĺ�ϵ");


