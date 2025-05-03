library(ggplot2)
data <- data.frame(
   yiwujiaoyu_jinfei = c(267.4522,279.8679,271.8626,269.5978,289.6829,286.3879,270.2604,282.4349,283.648811,285.083363,286.517915),
    gaozhong_jinfei = c(91.5254,97.4366,92.5165,94.8163,103.3552,104.5238,103.4368,103.7186,107.482982,109.386723,111.290463),
    daxue_jinfei = c(112.5077,115.7238,120.6006,127.4309,114.9781,122.4476,120.7671,125.1818,125.688096,126.962185,128.236273),
    year = c(2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026)
)

output_dir <- "d:/JianMoXiaosai/3/plot"  # 修改为希望保存图形的目录
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)  # 如果目录不存在，则创建
}
plot(data$year, data$yiwujiaoyu_jinfei,
     main = "Scatterplot with Pearson Correlation",
     xlab = "Year", ylab = "义务教育经费")
abline(lm(data$yiwujiaoyu_jinfei ~ data$year), col = "red")



ggplot(data, aes(x = year, y = yiwujiaoyu_jinfei)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = paste("Pearson r =", round(cor(r_yiwujiaoyu, data$yiwujiaoyu_jinfei), 3)))


p_original <- last_plot()
ggsave(file.path(output_dir, "yiwujiaoyu.png"), plot = p_original, width = 8, height = 6, dpi = 300)

plot(data$year, data$gaozhong_jinfei,
     main = "Scatterplot with Pearson Correlation",
     xlab = "Year", ylab = "高中经费")
abline(lm(data$gaozhong_jinfei ~ data$year), col = "red")



ggplot(data, aes(x = year, y = gaozhong_jinfei)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = paste("Pearson r =", round(cor(data$gaozhong_jinfei, data$yiwujiaoyu_jinfei), 3)))


p_original <- last_plot()
ggsave(file.path(output_dir, "gaozhong.png"), plot = p_original, width = 8, height = 6, dpi = 300)

plot(data$year, data$daxue_jinfei,
     main = "Scatterplot with Pearson Correlation",
     xlab = "Year", ylab = "大学经费")
abline(lm(data$daxue_jinfei ~ data$year), col = "red")



ggplot(data, aes(x = year, y = gaozhong_jinfei)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red")
  labs(title = paste("daxue"))


p_original <- last_plot()
ggsave(file.path(output_dir, "daxue.png"), plot = p_original, width = 8, height = 6, dpi = 300)