# Portafolio de Ciencia de Datos — Angel Acis Delgadillo Ramos

Repositorio activo donde documento mis proyectos de análisis aplicado con
microdatos oficiales del INEGI. El portafolio crece de manera continua
conforme desarrollo nuevos análisis.

Cada proyecto sigue estándares de reproducibilidad completa: control de
dependencias con `{renv}`, rutas relativas con `{here}` y control de
versiones semántico con Git.

## Proyectos

| ID | Proyecto | Datos | Técnicas |
|----|----------|-------|----------|
| P01 | Ambiente reproducible | — | renv, Git, GitHub Pages |
| P02 | Diagnóstico de calidad ENOE 2024-T1 | ENOE 2024-T1 | QA, janitor, skimr |
| P03 | Perfil del mercado laboral mexicano | ENOE 2024-T1 | Estadística descriptiva, ggplot2 |

## Stack tecnológico

- **Lenguaje:** R 4.3+
- **Manipulación de datos:** tidyverse (dplyr, tidyr, readr, purrr)
- **Visualización:** ggplot2, scales, colorspace
- **Datos INEGI:** haven, janitor, skimr
- **Reproducibilidad:** renv, here
- **Reportes:** Quarto
- **Control de versiones:** Git + GitHub

## Fuentes de datos

| Encuesta | Cobertura | Uso actual |
|----------|-----------|------------|
| ENOE 2024-T1 | Nacional trimestral | Diagnóstico de calidad, mercado laboral |

## Estructura del repositorio

```
portafolio-ds/
├── _quarto.yml     # Configuración del sitio Quarto
├── index.qmd       # Página principal del portafolio
├── practicas/      # Proyectos individuales documentados en Quarto
├── R/              # Funciones compartidas y reutilizables
├── data/           # Microdatos originales (excluidos por .gitignore)
├── outputs/        # Visualizaciones y tablas exportadas
├── docs/           # Sitio renderizado (GitHub Pages)
└── tests/          # Tests unitarios con testthat
```

## Reproducibilidad

Todos los proyectos usan `{renv}` para control exacto de dependencias.
Para reproducir cualquier análisis:

```r
renv::restore()
```

Los microdatos del INEGI no se incluyen en el repositorio por su volumen.
Cada proyecto documenta la fuente exacta, la URL de descarga y la fecha
de adquisición.

## Contacto

- **Email:** adelgadillo747@gmail.com
- **GitHub:** github.com/Acis18
- **Portafolio:** acis18.github.io/portafolio-ds

## Licencia

MIT — Angel Acis Delgadillo Ramos, 2025
