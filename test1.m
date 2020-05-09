% ������ʵ������1���Ƚ϶���ֲ������ɷֲ��Լ�CLT
% mԴ���ļ���û����ֵ����
do_plot = 1;     % �Ƿ���е���ͼ����ƣ�0 false | 1 true
n_step  = 1;
n       = 10 * n_step;
p_step  = 0.1;
p       = 1* p_step;
x_max   = 14;
fig_num = 1;
if(do_plot)
    figure(1);
    fig_num = fig_num + 1;
end
proxError(n, p, x_max, do_plot);    % ���ƹ̶�n,p��ͼ��
% �̶� p = 0.02 | n in range(5, 20) �� ���ͼ��
errors_p = zeros(1, 15);
errors_clt = zeros(1, 15);
for n = 1:15
    [e_p, e_clt] = proxError(n, p, x_max, 0);
    errors_p(n) = e_p;
    errors_clt(n) = e_clt;
end
figure(fig_num);
ns = 1:1:15;
plot(ns, errors_p, "b");
hold on; axis on; grid on;
plot(ns, errors_clt, "r");
gb = max( max(errors_p), max(errors_clt) ) + 0.1; 
xlim([1, 15]);
ylim([0, gb]);
legend(["���ɷֲ��������", "���ļ��޶���������"]);
xlabel("n"); ylabel("���");
str = sprintf("���ֲַ���p = %fʱ��ͬn�¶�Ӧͼ������֮������", p);
title(str);
fig_num = fig_num + 1;

%�̶�n = 20 ʱ, p = 0.01:0.03:0.43
n = 20
errors_p = zeros(1, 15);
errors_clt = zeros(1, 15);
cnt = 1;
for p = 0.01:0.03:0.43
    [e_p, e_clt] = proxError(n, p, x_max, 0);
    errors_p(cnt) = e_p;
    errors_clt(cnt) = e_clt;
    cnt = cnt + 1;
end
figure(fig_num);
ps = 0.01:0.03:0.43;
plot(ps, errors_p, "b");
hold on; axis on; grid on;
plot(ps, errors_clt, "r");
gb = max( max(errors_p), max(errors_clt) ) + 0.1; 
xlim([0, 0.43]);
ylim([0, gb]);
legend(["���ɷֲ��������", "���ļ��޶���������"]);
xlabel("n"); ylabel("���");
str = sprintf("���ֲַ���n = %dʱ��ͬp�¶�Ӧͼ������֮������", n);
title(str);

function [e_sum_p, e_sum_clt] = proxError(n, p, x_max, do_plot)
clf;
bin_y   = zeros(1, x_max);
p_y     = zeros(1, x_max);
clt_y   = zeros(1, x_max);
xs = 0:1:x_max;
for x = 0:x_max
    bin_y(x+1) = binocdf(x, n, p);
    p_y(x+1) = poisscdf(x, n*p);
    clt_y(x+1) = CLT(n, p, x);
end
if(do_plot)
    % ���ι̶�n�� p���ߵĻ���
    plot(xs, bin_y, "b");
    hold on; axis on; grid on;
    plot(xs, p_y, "k");
    plot(xs, clt_y, "r");
    xlim([0, x_max]);
    ylim([0, 1]);
    legend(["����ֲ�", "���ɷֲ�����", "���ļ��޶������"]);
    xlabel("P(X < x)"); ylabel("����ֵ");
    str = sprintf("�Զ���ֲ������ֽ��ƵıȽ�, n = %d, p = %f", n, p);
    title(str);
end
error_p = p_y - bin_y;          % ���ɽ����������
error_clt = clt_y - bin_y;      % clt�����������
e_sum_p = norm(error_p, 1);   % ���ɽ�����ȡ1-����
e_sum_clt = norm(error_clt, 1); % clt�������
end   % end of the function

function out = CLT(n, p, x)
% De Moivre-Laplace ���ļ��޶��� ���޷ֲ�
% n ��Ŭ�������ܴ���
% p ����ɹ�����
% x ����ɹ�����С�ڵ���x (�����ļ��޶��������phi(inter),inter�ļ������)
inter = (x - n * p) / sqrt(n * p * (1 - p));
out = normcdf(inter);
end
