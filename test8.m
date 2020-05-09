% (ʵ��8)f�ֲ����׼��̬�ֲ��Ľ��Ƴ̶�ʵ��
% Ϊ�����ڹ۲죬��׼��̬�ֲ�ֻȡ����Ϊ1�����������ɱ䣬�Ե�����λ�ù۲���f�ֲ����ߵĹ�ϵ
% ����ûʲô
clf;
mu = 0.8;
xs = (mu - 3):0.1:(mu + 3);
norm_y = normpdf(xs, mu, 1);

n1_ys = zeros(5, 46);
n2_ys = zeros(5, 46);
str_mat = strings(11);
str_mat(1) = sprintf("��̬�ֲ���mu = %f", mu);
cnt = 1;
x = 0:0.1:4.5;
for n2 = 1:5:21
    n1_ys(cnt, :) = fpdf(x, 6, n2);
    n2_ys(cnt, :) = fpdf(x, 21, n2);
    str_mat(2 * cnt) = sprintf("f(%d, %d)", 6, n2);
    str_mat(2 * cnt + 1) = sprintf("f(%d, %d)", 21, n2);
    cnt = cnt + 1;
end

plot(xs, norm_y);
hold on; axis on; grid on;
for i = 1:5
    plot(x, n1_ys(i, :));
    plot(x, n2_ys(i, :));
end
legend(str_mat(1:11), "Location",'best');
xlim([0, 4.5]);
ylim([0, 2]);
xlabel("xȡֵ");
ylabel("�����ܶ�ֵ");
title("f�ֲ�����̬�ֲ��Ĺ�ϵ");


