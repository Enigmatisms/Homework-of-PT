% ʵ��7 ����ֲ�����̬�ֲ��Ĺ�ϵ

p = 0.5;

norm_ys = zeros(13, 21);
bin_ys = zeros(13, 21);
xs = zeros(13, 21);

cnt = 1;
% ȡn = 4��n = 100ʱ�ķֲ�
for n = 4:8:100
    mu = n * p;      
    x_range = round(mu);    % mu���ܲ�������
    sig = sqrt(n * p * (1 - p));
    x = (x_range - 10):1:(x_range + 10);
    norm_ys(cnt, :) = normpdf(x, mu, sig);
    bin_ys(cnt, :) = binopdf(x, n, p);
    xs(cnt, :) = x;
    cnt = cnt + 1;
end

hold on; axis on; grid on;
for n = 1:13
    plot(xs(n, :), norm_ys(n, :), "r");
    plot(xs(n, :), bin_ys(n, :), "b");
end
legend(["��̬�ֲ��ܶ�����Ⱥ", "����ֲ��ܶ�����Ⱥ"]);
xlim([xs(1, 1), xs(13, 21)]);
ylim([0, 0.5]);
xlabel("xȡֵ");
ylabel("�����ܶ�ֵ");
title("����ֲ�����̬�ֲ��Ľ��ƹ�ϵ");
