library(ggplot2)
data <- data.frame(
  daxue_jinfei=c(112.5077,
        115.7238,
        120.6006,
                                127.4309,
                                114.9781,
                                122.4476,
                                120.7671,
                                125.1818),
                          gaodenjiaoyu_zhaosheng=c(173218,
        171239,
        175543,
        203888,
        189064,
        206308,
        222706,
        212078)      
)
output_dir <- "d:/JianMoXiaosai/3/plot"  # 修改为希望保存图形的目录
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)  # 如果目录不存在，则创建
}
plot(data$daxue_jinfei, data$gaodenjiaoyu_zhaosheng,
     main = "Scatterplot with Pearson Correlation",
     xlab = "Daxue Jinfei", ylab = "Gaoden Jiaoyu Zhaosheng")
abline(lm(data$gaodenjiaoyu_zhaosheng ~ data$daxue_jinfei), col = "red")



ggplot(data, aes(x = daxue_jinfei, y = gaodenjiaoyu_zhaosheng)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = paste("Pearson r =", round(cor(data$daxue_jinfei, data$gaodenjiaoyu_zhaosheng), 3)))


p_original <- last_plot()
ggsave(file.path(output_dir, "a3b3.png"), plot = p_original, width = 8, height = 6, dpi = 300)