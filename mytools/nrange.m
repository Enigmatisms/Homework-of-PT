function out = nrange(x1, x2)
%��׼��̬�ֲ��ķֲ�������һ�������ϵĸ���ֵ
out = normval(x2, 1) - normval(x1, 1);
% fprintf("P{x<%f} = %f\n", x, out);
end