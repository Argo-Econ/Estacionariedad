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

## Tipos de estacionariedad

### Estacionaria en nivel

$$y_t=\mu+u_t$$

La serie fluctúa alrededor de una media constante.

---

### Estacionaria alrededor de una tendencia

$$y_t=\beta_0+\beta_1t+u_t$$

La serie presenta una tendencia determinística, pero las desviaciones respecto a dicha tendencia son estacionarias.

---

### Tendencia estocástica

$$y_t=y_{t-1}+u_t$$

Los choques tienen efectos permanentes y la serie posee una raíz unitaria.

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