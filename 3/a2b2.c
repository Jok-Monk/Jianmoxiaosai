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
    double gaozhong_jinfei[8] = {91.5254,
                                 97.4366,
                                 92.5165,
                                 94.8163,
                                 103.3552,
                                 104.5238,
                                 103.4368,
                                 103.7186};
    double shengxuelv[8] = {0.595614502,
                            0.638704982,
                            0.644444444,
                            0.829654152,
                            0.686863673,
                            0.849723255,
                            0.775398727,
                            0.749869334};

    // 计算最小二乘
    double a2, b2, r;
    linear(8, gaozhong_jinfei, shengxuelv, &a2, &b2, &r);
    printf("gao zhong jin fei: k = %f, b = %f, r = %f\n", a2, b2, r);
    return 0;
}