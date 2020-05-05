function out = bin(n, p, k)
out = nchoosek(n, k)*(p^k)*((1-p)^(n-k));
end