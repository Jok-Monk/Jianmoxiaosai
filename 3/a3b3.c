/*计算Q3t=a3*F3t+b3的相关系数a3,b3*/
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void linear(int n, double *x, double *y, double *k, double *b, double *r)
{
    double sum_x = 0, sum_y = 0, sum_x2 = 0, sum_y2 = 0, sum_xy = 0;
    for (int i = 0; i < n; i++)
    {
        sum_x += x[i];
        sum_y += y[i];
        sum_x2 += x[i] * x[i];
        sum_y2 += y[i] * y[i];
        sum_xy += x[i] * y[i];
    }
    double ave_x = sum_x / n;
    double ave_y = sum_y / n;
    *k = (n * sum_xy - sum_x * sum_y) / (n * sum_x2 - sum_x * sum_x);
    *b = ave_y - (*k) * ave_x;
    *r = (sum_xy - n * ave_x * ave_y) / (sqrt((sum_x2 - n * ave_x * ave_x) * (sum_y2 - n * ave_y * ave_y)));
}
int main()
{
    double daxue_jinfei[8] = {112.5077, 115.7238, 120.6006, 127.4309, 114.9781, 122.4476, 120.7671, 125.1818};
    double zhaoshengshu[8] = {17.3218, 17.1239, 17.5543, 20.3888, 18.9064, 20.6308, 22.2706, 21.2078};

    // 计算最小二乘
    double a3, b3, r;
    linear(8, daxue_jinfei, zhaoshengshu, &a3, &b3, &r);
    printf("daxue_jinfei~zhaoshengshu: k = %f, b = %f, r = %f\n", a3, b3, r);
    return 0;
}