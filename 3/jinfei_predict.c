#include <stdio.h>
#include <stdlib.h>
#include <math.h>

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
    double gaozhong_jinfei[8] = {91.5254,
                                 97.4366,
                                 92.5165,
                                 94.8163,
                                 103.3552,
                                 104.5238,
                                 103.4368,
                                 103.7186};
    double daxue_jinfei[8] = {112.5077,
                              115.7238,
                              120.6006,
                              127.4309,
                              114.9781,
                              122.4476,
                              120.7671,
                              125.1818};
    double year[8] = {2016,
                      2017,
                      2018,
                      2019,
                      2020,
                      2021,
                      2022,
                      2023};

    // 计算最小二乘

    double ave_year, ave_yiwujiaoyu_jinfei, ave_gaozhong_jinfei, ave_daxue_jinfei;
    double sum_year = 0, sum_yiwujiaoyu_jinfei = 0, sum_gaozhong_jinfei = 0, sum_daxue_jinfei = 0;
    double sum_year2 = 0, sum_yiwujiaoyu2 = 0, sum_gaozhong2 = 0, sum_daxue2 = 0;
    double sum_year_yiwujiaoyu = 0, sum_year_gaozhong = 0, sum_year_daxue = 0;
    double k_yiwujiaoyu, k_gaozhong, k_daxue, b_yiwujiaoyu, b_gaozhong, b_daxue;
    double r_yiwujiaoyu, r_gaozhong, r_daxue;
    int i;
    for (i = 0; i < 8; i++)
    {
        sum_year += year[i];
        sum_yiwujiaoyu_jinfei += yiwujiaoyu_jinfei[i];
        sum_gaozhong_jinfei += gaozhong_jinfei[i];
        sum_daxue_jinfei += daxue_jinfei[i];
        sum_year2 += year[i] * year[i];
        sum_yiwujiaoyu2 += yiwujiaoyu_jinfei[i] * yiwujiaoyu_jinfei[i];
        sum_gaozhong2 += gaozhong_jinfei[i] * gaozhong_jinfei[i];
        sum_daxue2 += daxue_jinfei[i] * daxue_jinfei[i];
        sum_year_yiwujiaoyu += year[i] * yiwujiaoyu_jinfei[i];
        sum_year_gaozhong += year[i] * gaozhong_jinfei[i];
        sum_year_daxue += year[i] * daxue_jinfei[i];
    }
    ave_year = sum_year / 8;
    ave_yiwujiaoyu_jinfei = sum_yiwujiaoyu_jinfei / 8;
    ave_gaozhong_jinfei = sum_gaozhong_jinfei / 8;
    ave_daxue_jinfei = sum_daxue_jinfei / 8;
    k_yiwujiaoyu = (sum_year_yiwujiaoyu - 8 * ave_year * ave_yiwujiaoyu_jinfei) / (sum_year2 - 8 * ave_year * ave_year);
    k_gaozhong = (sum_year_gaozhong - 8 * ave_year * ave_gaozhong_jinfei) / (sum_year2 - 8 * ave_year * ave_year);
    k_daxue = (sum_year_daxue - 8 * ave_year * ave_daxue_jinfei) / (sum_year2 - 8 * ave_year * ave_year);

    b_yiwujiaoyu = ave_yiwujiaoyu_jinfei - k_yiwujiaoyu * ave_year;
    b_gaozhong = ave_gaozhong_jinfei - k_gaozhong * ave_year;
    b_daxue = ave_daxue_jinfei - k_daxue * ave_year;

    r_yiwujiaoyu = (sum_year_yiwujiaoyu - 8 * ave_year * ave_yiwujiaoyu_jinfei) / sqrt((sum_year2 - 8 * ave_year * ave_year) * (sum_yiwujiaoyu2 - 8 * ave_yiwujiaoyu_jinfei * ave_yiwujiaoyu_jinfei));
    r_gaozhong = (sum_year_gaozhong - 8 * ave_year * ave_gaozhong_jinfei) / sqrt((sum_year2 - 8 * ave_year * ave_year) * (sum_gaozhong2 - 8 * ave_gaozhong_jinfei * ave_gaozhong_jinfei));
    r_daxue = (sum_year_daxue - 8 * ave_year * ave_daxue_jinfei) / sqrt((sum_year2 - 8 * ave_year * ave_year) * (sum_daxue2 - 8 * ave_daxue_jinfei * ave_daxue_jinfei));

    for ( i = 1; i <= 3; i++)
    {
        printf("预测%d年：义务教育：%lf, 高中：%lf, 大学：%lf\n", 2023 + i, k_yiwujiaoyu * (2023 + i) + b_yiwujiaoyu, k_gaozhong * (2023 + i) + b_gaozhong, k_daxue * (2023 + i) + b_daxue);
    }
    printf("相关系数：义务教育：%lf, 高中：%lf, 大学：%lf\n", r_yiwujiaoyu, r_gaozhong, r_daxue);
    return 0;
}
