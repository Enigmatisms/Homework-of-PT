function out = CLT(n, p, x)
% De Moivre-Laplace ���ļ��޶��� ���޷ֲ�
% n ��Ŭ�������ܴ���
% p ����ɹ�����
% x ����ɹ�����С�ڵ���x
inter = (x - n * p) / sqrt(n * p * (1 - p));
out = normval(inter, 1);
end