library(ggplot2)
data <- data.frame(
  total_population = c(2668.1,2641.9,2612.5,2567,2526.1,2484.4,2447.5,2399.4,2375.4,2347.7,2339.4),
  urb_rate=c(55.7,56.8,57.6,58.8,59.7,60.9,61.6,62.6,63.4,63.7,64.7),
  year_06_16 = c(208854,206101,181824,183275,215452,179536,157597,147468,182207,161618,151683),
  year_97_07=c(320591,312226,283832,270874,235714,224050,196018,200158,214292,208854,206101),
  year_95_05=c(334368,327036,320591,312226,283832,270874,235714,224050,196018,200158,214292),
  compulsory=c(2006861, 1891687, 1875284, 1868488, 1846909, 1862507, 1840219, 1809959, 1752226, 1703864, 1686234),
  high=c(385344,565780,540500,534065,545557,529391,536306,547321,581167,582427,560100),
  higher=c(599526,618273,632723,642263,643872,658327,700145,726957,755552,710245,715922)
)

output_dir <- "d:/JianMoXiaosai/2/plot"  # 修改为希望保存图形的目录
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)  # 如果目录不存在，则创建
}



cor_value1 <- cor(data$total_population, data$compulsory, method = "pearson")
print(paste("人口总量与义务教育阶段Pearson相关系数:", round(cor_value1, 3)))

cor_value2 <- cor(data$total_population, data$high, method = "pearson")
print(paste("人口总量与高中阶段Pearson相关系数:", round(cor_value2, 3)))

cor_value3 <- cor(data$total_population, data$higher, method = "pearson")
print(paste("人口总量与高等教育阶段Pearson相关系数:", round(cor_value3, 3)))

cor_value4 <- cor(data$year_06_16, data$compulsory, method = "pearson")
print(paste("06-16年出生人数与义务教育阶段Pearson相关系数:", round(cor_value4, 3)))

cor_value5 <- cor(data$year_97_07, data$high, method = "pearson")
print(paste("97-07年出生人数与高中阶段Pearson相关系数:", round(cor_value5, 3)))

cor_value6 <- cor(data$year_95_05, data$higher, method = "pearson")
print(paste("95-05年出生人数与高等教育阶段Pearson相关系数:", round(cor_value6, 3)))

cor_value7 <- cor(data$urb_rate, data$compulsory, method = "pearson")
print(paste("城镇化率与义务教育阶段Pearson相关系数:", round(cor_value7, 3)))

cor_value8 <- cor(data$urb_rate, data$high, method = "pearson")
print(paste("城镇化率与高中阶段Pearson相关系数:", round(cor_value8, 3)))

cor_value9 <- cor(data$urb_rate, data$higher, method = "pearson")
print(paste("城镇化率与高等教育阶段Pearson相关系数:", round(cor_value9, 3)))

plot(data$total_population, data$compulsory,
     main = "Scatterplot with Pearson Correlation",
     xlab = "total_population", ylab = "compulsory")
abline(lm(data$compulsory ~ data$total_population), col = "red")


ggplot(data, aes(x = total_population, y = compulsory)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = paste("Pearson r =", round(cor_value1, 3)))


p_original <- last_plot()
ggsave(file.path(output_dir, "total_population~compulsory.png"), plot = p_original, width = 8, height = 6, dpi = 300)

plot(data$total_population, data$high,
     main = "Scatterplot with Pearson Correlation",
     xlab = "total_population", ylab = "high")
abline(lm(data$high ~ data$total_population), col = "red")



ggplot(data, aes(x = total_population, y = high)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = paste("Pearson r =", round(cor_value2, 3)))


p_original <- last_plot()
ggsave(file.path(output_dir, "total_population~high.png"), plot = p_original, width = 8, height = 6, dpi = 300)

plot(data$total_population, data$higher,
     main = "Scatterplot with Pearson Correlation",
     xlab = "total_population", ylab = "higher")
abline(lm(data$higher ~ data$total_population), col = "red")



ggplot(data, aes(x = total_population, y = higher)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = paste("Pearson r =", round(cor_value3, 3)))


p_original <- last_plot()
ggsave(file.path(output_dir, "total_population~higher.png"), plot = p_original, width = 8, height = 6, dpi = 300)

plot(data$total_population, data$compulsory,
     main = "Scatterplot with Pearson Correlation",
     xlab = "total_population", ylab = "compulsory")
abline(lm(data$compulsory ~ data$total_population), col = "red")



ggplot(data, aes(x = year_06_16, y = compulsory)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = paste("Pearson r =", round(cor_value4, 3)))


p_original <- last_plot()
ggsave(file.path(output_dir, "year_06_16~compulsory.png"), plot = p_original, width = 8, height = 6, dpi = 300)

plot(data$total_population, data$compulsory,
     main = "Scatterplot with Pearson Correlation",
     xlab = "total_population", ylab = "compulsory")
abline(lm(data$compulsory ~ data$total_population), col = "red")



ggplot(data, aes(x = year_97_07, y = high)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = paste("Pearson r =", round(cor_value5, 3)))


p_original <- last_plot()
ggsave(file.path(output_dir, "year_97_07~high.png"), plot = p_original, width = 8, height = 6, dpi = 300)

plot(data$year_95_05, data$higher,
     main = "Scatterplot with Pearson Correlation",
     xlab = "year_95_05", ylab = "higher")
abline(lm(data$higher ~ data$year_95_05), col = "red")



ggplot(data, aes(x = year_95_05, y = higher)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = paste("Pearson r =", round(cor_value6, 3)))


p_original <- last_plot()
ggsave(file.path(output_dir, "year_95_05~higher.png"), plot = p_original, width = 8, height = 6, dpi = 300)

plot(data$urb_rate, data$compulsory,
     main = "Scatterplot with Pearson Correlation",
     xlab = "urb_rate", ylab = "compulsory")
abline(lm(data$compulsory ~ data$urb_rate), col = "red")



ggplot(data, aes(x = urb_rate, y = compulsory)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = paste("Pearson r =", round(cor_value7, 3)))


p_original <- last_plot()
ggsave(file.path(output_dir, "urb_rate~compulsory.png"), plot = p_original, width = 8, height = 6, dpi = 300)

plot(data$urb_rate, data$high,
     main = "Scatterplot with Pearson Correlation",
     xlab = "urb_rate", ylab = "high")
abline(lm(data$high ~ data$urb_rate), col = "red")



ggplot(data, aes(x = urb_rate, y = high)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = paste("Pearson r =", round(cor_value8, 3)))


p_original <- last_plot()
ggsave(file.path(output_dir, "urb_rate~high.png"), plot = p_original, width = 8, height = 6, dpi = 300)

plot(data$total_population, data$compulsory,
     main = "Scatterplot with Pearson Correlation",
     xlab = "total_population", ylab = "compulsory")
abline(lm(data$compulsory ~ data$total_population), col = "red")



ggplot(data, aes(x = urb_rate, y = higher)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = paste("Pearson r =", round(cor_value8, 3)))


p_original <- last_plot()
ggsave(file.path(output_dir, "urb_rate~higher.png"), plot = p_original, width = 8, height = 6, dpi = 300)