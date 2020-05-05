% ²¨ÌØÍ¼
a = [1, 10, 100, 1000, 10000, 100000, 1000000];
b = [];
c = [];
for i = 1:7
  t = a(i);
  tmp1 = 10*(log10(1+t^2/100) - log10(1+t^2));
  tmp2 = acos((1-t^2/10)/(1+t^2));
  b = [b, tmp1];
  c = [c, tmp2];
end
plot(a, b, "b"); hold on; axis on;
plot(a, c, "r");