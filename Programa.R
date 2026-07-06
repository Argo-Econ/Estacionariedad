# ------------------------------------------------------------------------/
# Pruebas de estacionariedad -----------------------------------------------
# # Arturo Yesid Gonzalez
# ------------------------------------------------------------------------/

# carga de librerias

pacman::p_load(readxl, TSA, tsoutliers, TSstudio, dplyr
               , MASS, nortest, FinTS, xts, stats, tseries, urca)


# Importacion datos ----
#------------------------------------------------------------------------------#
Datos_ent <- read_xlsx(path = "BD.xlsx"
                        ,sheet = "BD",range = "a1:b256"
                        ,col_names = T)

bd_xts <- Datos_ent$Comercio %>% xts(order.by = as.Date(Datos_ent$Fecha))
bd_ts  <- ts(Datos_ent$Comercio, start = c(2005,1), frequency=12)

ts_plot(bd_xts)
windows()
plot(bd_ts)

# Prueba de Dickey - Fuller -----------------------------------------------
# Prueba paquete stats siempre evalua proceso con constante y tendencia
# por defecto asume que la serie tiene tendencia lineal visible

# Δy_t = alpha + beta*t + gamma y_t-1+ delta_1 Δy_t-1+ ... +delta_k Δy_t-k + u_t
adf.test(x = bd_ts,alternative = "stationary")


# Prueba separada ---------------------------------------------------------
# ADF con tendencia deterministica
# Δz_t = alpha + beta*t + gamma z_t-1+ delta_1 Δz_t-1 + u_t

# H0: gamma = 0 (raiz unitaria, no estacionaria)
# H1: gamma < 0 (estacionaria pero alrededor de tendencia deterministica)

# Regla para phi3 t-value < valor_critico prueba. entonces se rechaza H0
# -8.698 < -3.98.  se rechaza H0

# Regla para phi2 y phi3 F-value > Critical value. entonces rechazo H0
# phi2 esta evaluando de manera conjunta, H0: alpha=0, beta=0, gamma=0
# phi3 esta evaluando de manera conjunta, H0: beta=0 y gamma=0
adf_tend <- ur.df(bd_ts, type = "trend", selectlags = c("AIC"))
summary(adf_tend)

# ADF con solo constante
# Δz_t = alpha + gamma z_t-1+ delta_1 Δz_t-1 + u_t
# phi3 esta evaluando de manera conjunta, H0: alpha=0 y gamma=0
adf_const <- ur.df(bd_ts, type = "drift", selectlags = c("AIC"))
summary(adf_const)

# ADF sin constante ni tendencia
# Δz_t = gamma z_t-1+ delta_1 Δz_t-1 + ... + delta_6 Δz_t-6  + u_t
adf_nada <- ur.df(bd_ts, type = "none", lags = 6)
summary(adf_nada)


# Pruebas complementarias --------------------------------------------------

# Test de Kwiatkowski-Phillips-Schmidt-Shin (KPSS)
kpss.test(bd_ts, null = "Trend") # H0: serie estacionaria alrededor de una tendencia
kpss.test(bd_ts, null = "Level") # H0: serie estacionaria alrededor de una constante

# Test de raiz unitaria de Phillips–Perron
pp.test(bd_ts,type = "Z(t_alpha)")   # H0: serie no estacionaria alrededor de una tendencia deterministica
pp.test(bd_ts,type = "Z(alpha)")     # H0: serie no estacionaria alrededor de una tendencia deterministica








