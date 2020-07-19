#! /usr/bin/python3
#-*-coding:utf-8-*-
# 生产测试
# author: hqy on 2020.5.7
# matlab 真的是慢出一种境界

# 实验5 - 产品检验
# 问题背景：某工厂生产一件精密仪器的合格率为90%
# 规定生产一批仪器进行验收检查时，需要这一批仪器中至少有10000件合格品才能出厂
# 为了符合质量检查要求，规定生产n件仪器后，至少要有99%的概率保证合格，工厂才进行验收
# 问最少生产多少件可以有99%的概率，这些产品中有10000件合格？
# 即求抽样的样本容量最小值
# 中心极限定理的验证

# 运行依赖项
## python numpy 库
## python scipy 库

from random import random
import numpy as np
from scipy.stats import norm
from scipy.optimize import fsolve


n0 = 10000          #至少有10000件合格品
threshold = norm.ppf(0.01) #正态分布函数的反函数，求P = 0.01对应的下分位数                   

#一个和中心极限定理有关的方程
def eqa_toSolve(x, *args):
    return (args[0] - 0.9 * x) / np.sqrt(x) / 0.3 - args[1]

#解这个方程
res = fsolve(eqa_toSolve, x0 = n0, args = (n0, threshold) )

#解得的最小生产件数
n = int(np.ceil(res))
print("由中心极限定理计算出的最小件数:%d\n"%n)

# 模拟实际生产：次数 sample_times 次
sample_times = 5000
qualified_cnt = 0
for i in range(sample_times):
    cnt = 0
    for j in range(n):
        # 模拟90%的合格率，若合格则cnt自增
        if random() > 0.1:
            cnt += 1
    if cnt >= n0:
        qualified_cnt += 1

print("%d次抽样中，生产%d件产品时，有%d件以上合格品的概率为%f\n"%(sample_times, n, n0, qualified_cnt / sample_times))
