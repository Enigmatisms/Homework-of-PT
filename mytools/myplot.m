function myplot(ratio)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
x = -30:30;
y = [];
for k = -30:30
    y = [y, ratio * sin(k * ratio * pi)/(k * pi * ratio)];
end
scatter(x, y, "*"); xlim([-31, 31]); ylim([-0.5, 1]);
end

