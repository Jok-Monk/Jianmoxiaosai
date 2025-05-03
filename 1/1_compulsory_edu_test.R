# ----------------------
# 步骤1：加载必要包
# ----------------------
library(tseries)    # 单位根检验
library(forecast)   # ARIMA建模与预测
library(ggplot2)    # 高级绘图
library(zoo)        # 滚动统计量计算
library(ggcorrplot) # 相关矩阵可视化
library(dplyr)      # 数据操作
library(gridExtra)  # 多图排版
library(urca)       # 协整检验

# ----------------------
# 步骤2：设置输出目录
# ----------------------
# 指定保存图形的目录
output_dir <- "d:/JianMoXiaosai/compulsory_edu_plots"  # 修改为您希望保存图形的目录
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)  # 如果目录不存在，则创建
}

# ----------------------
# 步骤3：数据准备（用户需修改部分）
# ----------------------
# 示例数据（用户需替换为自己的数据）
df <- data.frame(
  time = c(2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023),  # 年份
  y = c(2006861, 1891687, 1875284, 1868488, 1846909, 1862507, 1840219, 1809959, 1752226, 1703864, 1686234), # 在校生人数
  x1 = c(30.9,30.8,30.6,30.1,29.3,28.4,28.2,30.2,29.8,30.5,29.8), # 恩格尔系数（%）
  x2 = c(208854,206101,181824,183275,215452,179536,157597,147468,182207,161618,183698) # 06-16出生人数（人）
)

# 将目标变量和外生变量转换为时间序列对象
ts_y <- ts(df$y, start = min(df$time), frequency = 1)
ts_x1 <- ts(df$x1, start = min(df$time), frequency = 1)
ts_x2 <- ts(df$x2, start = min(df$time), frequency = 1)

# ----------------------
# 步骤4：绘制原始序列图
# ----------------------
p_original <- ggplot(data.frame(time = df$time, value = df$y), aes(x = time, y = value)) +
  geom_line(color = "blue", linewidth = 0.8) +
  labs(title = "原始时间序列图", x = "年份", y = "在校生人数") +
  theme_minimal()

# 保存原始序列图
ggsave(file.path(output_dir, "original_series_plot.png"), plot = p_original, width = 8, height = 6, dpi = 300)

# ----------------------
# 步骤5：绘制一次差分图
# ----------------------
# 计算一次差分
diff_y1 <- diff(ts_y, differences = 1)

p_diff1 <- ggplot(data.frame(time = df$time[-1], value = diff_y1), aes(x = time, y = value)) +
  geom_line(color = "green", linewidth = 0.8) +
  labs(title = "一次差分时间序列图", x = "年份", y = "一次差分值") +
  theme_minimal()

# 保存一次差分图
ggsave(file.path(output_dir, "first_difference_plot.png"), plot = p_diff1, width = 8, height = 6, dpi = 300)

diff_x1_1 <- diff(ts_x1, differences = 1)

p_diffx11 <- ggplot(data.frame(time = df$time[-1], value = diff_x1_1), aes(x = time, y = value)) +
  geom_line(color = "green", linewidth = 0.8) +
  labs(title = "x1一次差分时间序列图", x = "年份", y = "一次差分值") +
  theme_minimal()

# 保存一次差分图
ggsave(file.path(output_dir, "first_difference_plot_x1.png"), plot = p_diffx11, width = 8, height = 6, dpi = 300)

diff_x2_1 <- diff(ts_x2, differences = 1)

p_diffx21 <- ggplot(data.frame(time = df$time[-1], value = diff_x2_1), aes(x = time, y = value)) +
  geom_line(color = "green", linewidth = 0.8) +
  labs(title = "x2一次差分时间序列图", x = "年份", y = "一次差分值") +
  theme_minimal()

# 保存一次差分图
ggsave(file.path(output_dir, "first_difference_plot_x2.png"), plot = p_diffx21, width = 8, height = 6, dpi = 300)
# ----------------------
# 步骤6：绘制两次差分图
# ----------------------
# 计算两次差分
diff_y2 <- diff(ts_y, differences = 2)

p_diff2 <- ggplot(data.frame(time = df$time[-c(1, 2)], value = diff_y2), aes(x = time, y = value)) +
  geom_line(color = "purple", linewidth = 0.8) +
  labs(title = "两次差分时间序列图", x = "年份", y = "两次差分值") +
  theme_minimal()

# 保存两次差分图
ggsave(file.path(output_dir, "second_difference_plot.png"), plot = p_diff2, width = 8, height = 6, dpi = 300)

diff_x1_2 <- diff(ts_x1, differences = 2)

p_diffx12 <- ggplot(data.frame(time = df$time[-c(1, 2)], value = diff_x1_2), aes(x = time, y = value)) +
  geom_line(color = "purple", linewidth = 0.8) +
  labs(title = "x1两次差分时间序列图", x = "年份", y = "两次差分值") +
  theme_minimal()

# 保存两次差分图 x1
ggsave(file.path(output_dir, "second_difference_plot_x1.png"), plot = p_diffx12, width = 8, height = 6, dpi = 300)

diff_x2_2 <- diff(ts_x2, differences = 2)

p_diffx22 <- ggplot(data.frame(time = df$time[-c(1, 2)], value = diff_x2_2), aes(x = time, y = value)) +
  geom_line(color = "purple", linewidth = 0.8) +
  labs(title = "两次差分时间序列图", x = "年份", y = "两次差分值") +
  theme_minimal()

# 保存两次差分图
ggsave(file.path(output_dir, "second_difference_plot_x2.png"), plot = p_diffx22, width = 8, height = 6, dpi = 300)
# ----------------------
# 步骤7：绘制三次差分图
# ----------------------
# 计算三次差分
diff_y3 <- diff(ts_y, differences = 3)

p_diff3 <- ggplot(data.frame(time = df$time[-c(1, 2, 3)], value = diff_y3), aes(x = time, y = value)) +
  geom_line(color = "orange", linewidth = 0.8) +
  labs(title = "三次差分时间序列图", x = "年份", y = "三次差分值") +
  theme_minimal()

# 保存三次差分图
ggsave(file.path(output_dir, "third_difference_plot.png"), plot = p_diff3, width = 8, height = 6, dpi = 300)

diff_x1_3 <- diff(ts_x1, differences = 3)

p_diffx13 <- ggplot(data.frame(time = df$time[-c(1, 2, 3)], value = diff_x1_3), aes(x = time, y = value)) +
  geom_line(color = "orange", linewidth = 0.8) +
  labs(title = "x1三次差分时间序列图", x = "年份", y = "三次差分值") +
  theme_minimal()

# 保存三次差分图 x1
ggsave(file.path(output_dir, "third_difference_plot_x1.png"), plot = p_diffx13, width = 8, height = 6, dpi = 300)

diff_x2_3 <- diff(ts_x2, differences = 3)

p_diffx23 <- ggplot(data.frame(time = df$time[-c(1, 2, 3)], value = diff_x2_3), aes(x = time, y = value)) +
  geom_line(color = "orange", linewidth = 0.8) +
  labs(title = "x2三次差分时间序列图", x = "年份", y = "三次差分值") +
  theme_minimal()

# 保存三次差分图 x2
ggsave(file.path(output_dir, "third_difference_plot_x2.png"), plot = p_diffx23, width = 8, height = 6, dpi = 300)
# ----------------------
# 步骤8：构建包含外生变量的回归模型
# ----------------------
# 使用外生变量回归目标变量
reg_model <- lm(ts_y ~ ts_x1 + ts_x2)

# 提取回归残差
residuals_y <- residuals(reg_model)

# ----------------------
# 步骤9：平稳性检验（基于残差）
# ----------------------
# 对残差进行单位根检验
adf_test <- adf.test(residuals_y)
kpss_test <- kpss.test(residuals_y, null = "Level")

# 输出平稳性检验结果
cat("ADF检验结果:\n")
print(adf_test)
cat("\nKPSS检验结果:\n")
print(kpss_test)

# ----------------------
# 步骤10：自动差分直到平稳
# ----------------------
# 确定差分次数（基于残差）
adf_diff <- ndiffs(residuals_y, test = "adf")   # ADF检验建议的差分次数
kpss_diff <- ndiffs(residuals_y, test = "kpss") # KPSS检验建议的差分次数

# 选择最大差分次数
best_diff <- max(adf_diff, kpss_diff)
cat("\nADF建议差分次数:", adf_diff, "\n")
cat("KPSS建议差分次数:", kpss_diff, "\n")
cat("最终选择的差分次数:", best_diff, "\n")

# 对残差进行差分
if (best_diff > 0) {
  diff_residuals <- diff(residuals_y, differences = best_diff)
} else {
  diff_residuals <- residuals_y  # 如果不需要差分，直接使用原始残差
}

# 绘制差分后的残差时间序列图
p_diff <- ggplot(data.frame(time = seq_along(diff_residuals), value = diff_residuals), aes(x = time, y = value)) +
  geom_line(color = "red", linewidth = 0.8) +
  labs(title = "差分后残差时间序列图", x = "时间", y = "差分残差") +
  theme_minimal()

# 保存差分后的残差图
ggsave(file.path(output_dir, "diff_residuals_plot.png"), plot = p_diff, width = 8, height = 6, dpi = 300)

# ----------------------
# 步骤11：构建包含外生变量的ARIMAX模型
# ----------------------
# 准备外生变量矩阵
xreg_matrix <- cbind(x1 = df$x1, x2 = df$x2)

# 自动选择ARIMAX模型
best_model <- auto.arima(
  ts_y,
  xreg = xreg_matrix,
  seasonal = FALSE,      # 假设无季节性
  stepwise = FALSE,      # 禁用逐步搜索，进行全面搜索
  approximation = FALSE, # 使用精确计算
  trace = TRUE           # 显示搜索过程
)

# 输出最佳模型参数
cat("\n最佳ARIMAX模型参数:\n")
print(best_model)

# ----------------------
# 步骤12：模型诊断
# ----------------------
# 检查残差是否为白噪声
checkresiduals(best_model)

# 保存残差诊断图
ggsave(file.path(output_dir, "residuals_diagnostics.png"), width = 8, height = 6, dpi = 300)

# ----------------------
# 步骤13：预测未来值
# ----------------------
# 预测未来3年的数据
forecast_result <- forecast(best_model, xreg = matrix(c(29, 183698, 29, 179900, 29, 163200), ncol = 2, byrow = TRUE), h = 3)

# 绘制预测结果
p_forecast <- autoplot(forecast_result) +
  labs(title = "未来3年在校生人数预测", x = "年份", y = "在校生人数") +
  theme_minimal()

# 保存预测结果图
ggsave(file.path(output_dir, "forecast_plot.png"), plot = p_forecast, width = 8, height = 6, dpi = 300)

# 输出预测结果
cat("\n预测未来3年的在校生人数:\n")
print(forecast_result)