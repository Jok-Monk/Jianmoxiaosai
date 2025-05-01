from statsmodels.tsa.arima.model import ARIMA
import pmdarima as pm

# 自动选择ARIMA参数
model = pm.auto_arima(
    y=train_data['入学人数'],
    X=train_data[['出生率滞后6年', '政策哑变量']],
    seasonal=True, m=12,
    stepwise=True, trace=True
)

# 预测未来值（需提供外生变量未来数据）
forecasts, conf_int = model.predict(
    n_periods=5,
    X=future_exog_data,
    return_conf_int=True
)