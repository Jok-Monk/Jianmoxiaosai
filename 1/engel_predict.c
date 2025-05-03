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
    double year[11] = {2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023};
    double engel[11] = {30.9,30.8,30.6,30.1,29.3,28.4,28.2,30.2,29.8,30.5,29.8};

    // 计算最小二乘
    double a2, b2, r;
    linear(11, year, engel, &a2, &b2, &r);
    double engel_predict[3];
    for (int i = 1; i <= 3; i++)
    {
        engel_predict[i-1] = a2 * (2023 + i) + b2;
        printf("预测%d年：%lf\n", 2023 + i, engel_predict[i-1]);
    }
    printf("engel: k = %f, b = %f, r = %f\n", a2, b2, r);
    return 0;
}