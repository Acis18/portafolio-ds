# Portafolio de Ciencia de Datos — Angel Acis Delgadillo Ramos

Científico de datos con formación en Matemáticas y especialización en análisis
estadístico. Este repositorio concentra 25 proyectos aplicados desarrollados 
con microdatos oficiales del INEGI, cubriendo desde estadística descriptiva 
hasta estimación en áreas pequeñas a nivel municipal con datos censales.

Todos los proyectos siguen estándares de reproducibilidad completa, diseño
muestral correcto y calidad de publicación oficial.

## Proyectos destacados

- Estimación de pobreza a nivel municipal combinando el Censo 2020 y la
  ENIGH 2022 mediante modelos de área pequeña (Fay-Herriot) y XGBoost
- Dashboard interactivo del mercado laboral mexicano con datos ENOE en
  tiempo real, desplegado públicamente en Shiny
- Paquete R documentado `{inegitools}` con funciones para procesamiento
  reproducible de encuestas INEGI
- Modelos predictivos de pobreza de ingresos y percepción de inseguridad
  con Random Forest y XGBoost sobre microdatos ENIGH y ENVIPE
- Análisis de panel longitudinal del efecto del salario mínimo sobre la
  informalidad laboral en México 2023–2024

## Stack tecnológico

- **Lenguaje:** R 4.3+
- **Diseño muestral:** survey, srvyr
- **Machine learning:** tidymodels, xgboost, ranger
- **Series de tiempo:** fable, tsibble
- **Visualización:** ggplot2, leaflet, Shiny
- **Reportes:** Quarto, gt, kableExtra
- **Reproducibilidad:** renv, here, testthat
- **Control de versiones:** Git + GitHub Actions

## Fuentes de datos

| Encuesta | Cobertura | Uso en el portafolio |
|----------|-----------|----------------------|
| ENOE 2023–2024 | Nacional trimestral | Mercado laboral, informalidad, panel |
| ENIGH 2022 | Nacional bienal | Pobreza de ingresos, ML |
| Censo 2020 | Universal municipal | Estimación en áreas pequeñas |
| ENVIPE 2023 | Nacional anual | Percepción de inseguridad, XGBoost |

## Estructura del repositorio
portafolio-ds/
├── R/              # Funciones compartidas y reutilizables
├── practicas/      # 25 proyectos individuales documentados
├── data/
│   ├── raw/        # Microdatos originales (excluidos por tamaño)
│   └── processed/  # Datos procesados intermedios
├── outputs/        # Reportes, visualizaciones y modelos exportados
├── docs/           # Diccionarios de datos y notas metodológicas
└── tests/          # Tests unitarios con testthat

## Reproducibilidad

Todos los proyectos usan `{renv}` para control exacto de dependencias.
Para reproducir cualquier análisis:

```r
renv::restore()
```

Los microdatos del INEGI no se incluyen en el repositorio por su volumen.
Cada proyecto documenta la fuente exacta, la URL de descarga y la fecha
de adquisición de los datos.

## Índice de proyectos

| ID | Proyecto | Datos | Técnicas |
|----|----------|-------|----------|
| P01 | Ambiente reproducible | — | renv, Git, VSCode |
| P02 | Diagnóstico de calidad ENOE | ENOE 2024-T1 | QA, janitor, skimr |
| P03 | Perfil del mercado laboral | ENOE 2024-T1 | Estadística descriptiva, ggplot2 |
| P04 | Integración de tablas ENOE | ENOE 2024-T1 | Joins, validación de cardinalidad |
| P05 | Simulación Ley de Grandes Números | ENOE 2024-T1 | Monte Carlo, gganimate |
| P06 | Pipeline multi-trimestre | ENOE 2024 T1–T3 | purrr, funciones, testthat |
| P07 | Boletín ejecutivo laboral | ENOE 2024 T1–T3 | Quarto, gt, GitHub Actions |
| P08 | Bootstrap ingreso mediano | ENOE 2024-T2 | Bootstrap BCa, inferencia |
| P10 | Brechas salariales por sexo | ENOE 2024-T2 | Pruebas de hipótesis, ANOVA |
| P12 | Primer diseño muestral | ENOE 2024-T1 | survey, DEFF |
| P13 | Diseño muestral correcto ENOE | ENOE 2024-T1 | svydesign, calibración |
| P14 | Indicadores laborales oficiales | ENOE 2024-T1 | Estimación por dominios, sf |
| P15 | Jóvenes NINI por entidad | ENOE 2024-T1 | Subpoblaciones, mapas |
| P17 | Determinantes del ingreso | ENOE 2024-T2 | svyglm, Mincer |
| P18 | Predictores de informalidad | ENOE 2024-T2 | Regresión logística, ROC |
| P19 | Paquete {inegitools} | — | Paquete R, roxygen2, CI |
| P20 | Selección de modelo ingreso | ENOE 2024 T1–T2 | Lasso, Ridge, CV |
| P21 | Panel salario mínimo | ENOE Panel 2023–2024 | Efectos fijos, fixest |
| P22 | Pronóstico desocupación | BIE INEGI 2005–2024 | ARIMA, ETS, fable |
| P23 | Pobreza con Random Forest | ENIGH 2022 | tidymodels, ranger, SHAP |
| P24 | Inseguridad con XGBoost | ENVIPE 2023 | XGBoost, SHAP, calibración |
| Dashboard | Monitor Laboral México | ENOE 2024 | Shiny, leaflet, mxmaps |
| PF | SAE pobreza municipal | Censo 2020 + ENIGH 2022 | Fay-Herriot, XGBoost, sae |

## Contacto

- **Email:** adelgadillo747@gmail.com
- **GitHub:** https://github.com/Acis18

## Licencia

MIT — Angel Acis Delgadillo Ramos, 2026