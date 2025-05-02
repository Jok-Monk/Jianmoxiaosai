output_dir <- "d:/JianMoXiaosai/predict_plots"
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}

# 输入数据与模型拟合
time <- c(2013:2023)
engel <- c(30.9,30.8,30.6,30.1,29.3,28.4,28.2,30.2,29.8,30.5,29.8)
data <- data.frame(year = time, students = engel)
model <- lm(engel ~ year, data = data)

# 预测
future_years <- data.frame(year = c(2024:2026))
predictions <- predict(model, newdata = future_years, interval = "confidence")
result <- cbind(future_years, predictions)

# 生成可视化图形（优化版）
library(ggplot2)
library(ggrepel)  # 加载防重叠标签包

plot <- ggplot(data, aes(year, engel)) +
  # 历史数据展示
  geom_point(color = "#E74C3C", size = 4, alpha = 0.8) +          # 更醒目的红色
  geom_smooth(method = "lm", formula = y ~ x, 
              color = "#2980B9", fill = "#85C1E9",               # 调整渐变色
              linewidth = 1.2, alpha = 0.3) +
  
  # 预测数据展示
  geom_point(data = result, aes(y = fit),
             color = "#27AE60", size = 5, shape = 18) +          # 菱形标记
             
  # 智能标签布局
  geom_label_repel(
    data = result,
    aes(y = fit, 
        label = sprintf("%.0f\n(%.0f-%.0f)", fit, lwr, upr)),    # 格式化数字
    nudge_x = 1.2,                                              # 增大横向偏移
    nudge_y = c(-500, 500, -500),                            # 交替纵向偏移
    direction = "both",                                         # 允许双向调整
    segment.color = "#34495E",                                  # 深灰色连接线
    box.padding = 0.8,
    size = 4,
    min.segment.length = 0.3,                                   # 显示短连接线
    force = 25
  ) +
  
  # 坐标轴优化
  scale_x_continuous(breaks = seq(2013, 2026, 1)) +             # 显示所有年份
  scale_y_continuous(labels = scales::comma) +                  # 千位分隔符
  
  # 可视化主题
  labs(
    title = "恩格尔系数预测",
    subtitle = "基于线性回归模型（2013-2023年数据）",
    x = "年份",
    y = "恩格尔系数"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    axis.title = element_text(color = "#2C3E50"),
    panel.grid.minor = element_blank()
  )

# 高质量保存（适应长标签）
ggsave(
  filename = file.path(output_dir, "engel_coefficient_predict_plot.png"),
  plot = plot,
  width = 14,                    # 加宽画布适应标签
  height = 8,
  dpi = 400,                     # 提升分辨率
  bg = "white"                   # 确保背景为白色
)