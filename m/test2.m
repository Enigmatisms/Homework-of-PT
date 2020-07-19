% ������������Լ���֤
% �Է���sigma^2 = 16/����δ֪Ϊ��
% �ⶨ���Ŷ�Ϊ95% 90% �������
% mԴ���ļ�û����ֵ����

% �趨����Ϊ u = 4
u           = 4;
sigma       = 4;
capacity    = 10;       % ��������
prob        = 0.95;
cnt = 0;                                        % �������������������
for i = 1:10000
    samples = normrnd(u, sigma, capacity, 1);       % ����ֵ
    [lb, ub] = confInterval(samples, capacity, sigma, prob);    % 95%���Ŷ�
    if((u < ub) && (u > lb))
        cnt = cnt + 1;
    end
end
fprintf("10000����������Ϊ%d�ĳ����У�%.2f%%�������������ʵ���������Ŷ�Ϊ%.2f\n",...
    capacity, cnt / 100, prob);

function [lb, ub] = confInterval(spls, cpc, sig, prob)
% spls һ�γ��������������۲�ֵ
% cpc ��������
% sig ��֪�ı�׼��
% prob ���Ŷ�
% @return ������������½�
    bound = norminv(0.5 + 0.5 * prob, 0, 1);    % ��׼��̬����
    spl_mean = mean(spls);
    ub = spl_mean + sig / sqrt(cpc) * bound;
    lb = spl_mean - sig / sqrt(cpc) * bound;
end


