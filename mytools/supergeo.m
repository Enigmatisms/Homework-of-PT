function out = supergeo(N, M, n, k)
%超几何分布 总共N件产品。M件次品，取n件，取出k件次品的概率
%supergeo(N, M, n, k), return概率值
out = nchoosek(M, k)*nchoosek(N-M, n-k)/nchoosek(N, n);
end