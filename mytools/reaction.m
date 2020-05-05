function out = reaction(w)
    n = norm(1/(2+w*1i));
    out = 20*log10(n);
end