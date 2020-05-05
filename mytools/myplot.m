function myplot(ratio)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
x = -30:30;
y = [];
for k = -30:30
    y = [y, ratio * sin(k * ratio * pi)/(k * pi * ratio)];
end
scatter(x, y, "*"); xlim([-31, 31]); ylim([-0.5, 1]);
end

