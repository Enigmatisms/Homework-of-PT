% ִ�����䳤�ȱ仯��ѡ��simga u ��δ֪����u���й��Ƶ�����
% mԴ���ļ�û����ֵ����

u       = 1;
sig     = 1;
% ���������̶�Ϊ25��p �� 0.85 �仯�� 0.99
ps = 0.85:0.01:0.99;
lens = zeros(11, 15);
sample = normrnd(u, sig, 1, 240);
for n = 220:2:240
    cnt = 1;
    for p = 0.85:0.01:0.99
        lens((n - 218)/2, cnt) = intervalLen(sample(1:n), p);
        cnt = cnt + 1;
    end
end
hold on; 
str_mat = strings(1, 11);
for n = 1:11
    plot(ps, lens(n, :));
    str_mat(n) = sprintf("��������n = %d", n * 2 + 18);
end
axis on; grid on;
xlim([0.85, 0.99]);
ylim([min(min(lens)) - 0.01, max(max(lens)) + 0.01]);
legend(str_mat, 'Location','best');
xlabel("���Ŷ�");
ylabel("�������䳤��");
title("��ͬ���Ŷ�/���������µ����䳤��ֵ");

function len = intervalLen(spl, prob)
% ����̬����u��sigmaδ֪ʱ��u���������䳤��
% spl ����ֵ����
% prob ���Ŷ�
    n = length(spl);
    bound = tinv(0.5 + 0.5 * prob, n - 1);    % t(n-1) ���Ϸ�λ��
    spl_std = std(spl);
    len = 2 * spl_std / sqrt(n) * bound;
end
