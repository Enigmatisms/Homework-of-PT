function out = supergeo(N, M, n, k)
%�����ηֲ� �ܹ�N����Ʒ��M����Ʒ��ȡn����ȡ��k����Ʒ�ĸ���
%supergeo(N, M, n, k), return����ֵ
out = nchoosek(M, k)*nchoosek(N-M, n-k)/nchoosek(N, n);
end