# 📈 Estacionariedad en Series de Tiempo con R

Repositorio con ejemplos reproducibles para comprender y aplicar las principales pruebas de estacionariedad utilizadas en econometría y análisis de series de tiempo.

El objetivo es entender la intuición estadística detrás de cada una de ellas y su correcta interpretación.

---

## Contenido

- Introducción a la estacionariedad
- Tendencia determinística vs tendencia estocástica
- Simulación de procesos estacionarios y no estacionarios
- Prueba Dickey-Fuller (DF)
- Prueba Dickey-Fuller Aumentada (ADF)
- Prueba Phillips-Perron (PP)
- Prueba KPSS
- Comparación entre pruebas
- Ejemplos completos en R

---

## ¿Qué es la estacionariedad?

Una serie estacionaria es aquella cuyas propiedades estadísticas no cambian a lo largo del tiempo.

En particular:

- media constante (o alrededor de una tendencia determinística)
- varianza constante
- autocovarianza que depende únicamente del rezago

La estacionariedad es uno de los supuestos fundamentales para la construcción de modelos ARIMA, VAR, VECM y numerosas técnicas econométricas.

---

| Tipo de prueba sobre la serie               | Modelo ADF                                        |
| ------------------------------------------- | ------------------------------------------------- |
| Oscila alrededor de 0                       | $\Delta y_t=\gamma y_{t-1}+\cdots$                |
| Oscila alrededor de una media distinta de 0 | $\Delta y_t=\alpha+\gamma y_{t-1}+\cdots$         |
| Presenta una tendencia lineal visible       | $\Delta y_t=\alpha+\beta t+\gamma y_{t-1}+\cdots$ |

---

## Pruebas implementadas

| Prueba | Hipótesis nula | Hipótesis alternativa |
|----------|---------------|-----------------------|
| Dickey-Fuller | Existe raíz unitaria | Serie estacionaria |
| ADF | Existe raíz unitaria | Serie estacionaria |
| Phillips-Perron | Existe raíz unitaria | Serie estacionaria |
| KPSS | Serie estacionaria | Serie no estacionaria |

---

## Organización del repositorio

```
Estacionariedad/

│
├── Datos/
│
├── Simulaciones/
│
├── Dickey_Fuller/
│
├── Phillips_Perron/
│
├── KPSS/
│
├── Graficos/
│
└── README.md
```

---

## Ejemplo

```r
library(urca)

adf <- ur.df(
    bd_ts,
    type="trend",
    selectlags="AIC"
)

summary(adf)
```

---

## Interpretación de la prueba ADF

La hipótesis principal es

$$H_0:\gamma=0$$

La serie posee una raíz unitaria.

Si

$$\tau<\tau_{crítico}$$

se rechaza la hipótesis nula.

Los estadísticos φ (phi) corresponden a pruebas de restricciones conjuntas sobre los componentes determinísticos del modelo (constante y tendencia).

---

## Referencias

Dickey, D. A., & Fuller, W. A. (1979). Distribution of the Estimators for Autoregressive Time Series with a Unit Root.

Dickey, D. A., & Fuller, W. A. (1981). Likelihood Ratio Statistics for Autoregressive Time Series with a Unit Root.

Hamilton, J. D. (1994). Time Series Analysis.

---

## Licencia

MIT License