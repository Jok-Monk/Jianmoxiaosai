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
    *r = (sum_xy-n*ave_x*ave_y)/(sqrt((sum_x2-n*ave_x*ave_x)*(sum_y2-n*ave_y*ave_y)));
    
}
int main()
{
    double yiwujiaoyu_jinfei[8] = {267.4522,
                                   279.8679,
                                   271.8626,
                                   269.5978,
                                   289.6829,
                                   286.3879,
                                   270.2604,
                                   282.4349};
    double yiwujiaoyu_shengshibi[8] = {15.2484,
                                       15.1697,
                                       15.2071,
                                       15.1852,
                                       15.0664,
                                       14.8433,
                                       14.7879,
                                       14.8826};

    // 计算最小二乘
    double k_yiwujiaoyu, b_yiwujiaoyu, r_yiwujiaoyu;
    linear(8, yiwujiaoyu_jinfei, yiwujiaoyu_shengshibi, &k_yiwujiaoyu, &b_yiwujiaoyu, &r_yiwujiaoyu);
    printf("yiwujiaoyu_jinfei: k = %f, b = %f, r = %f\n", k_yiwujiaoyu, b_yiwujiaoyu, r_yiwujiaoyu);
    return 0;
}