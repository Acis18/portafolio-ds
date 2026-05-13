# ----------------------------------------------------------
# P02 — Diagnóstico de calidad ENOE 2024-T1
# Fuente: INEGI, ENOE 2024 T1
# URL: https://www.inegi.org.mx/programas/enoe/15ymas/
# Fecha de descarga: 12/05/2026
# Autor: Angel Acis Delgadillo Ramos
# ---------------------------------------------------------

library(foreign)
library(janitor)
library(skimr)
library(tidyverse)
library(here)

# ----LECTURA----------------------------------------------

enoe <- foreign::read.dbf(here::here("data/raw/ENOE_SDEMT124.dbf"))
enoe <- janitor::clean_names(enoe)

# ----DIMENSION Y ESTRUCTURA-------------------------------


cat("Filas:", nrow(enoe), "\n")
cat("Columnas:", ncol(enoe), "\n")

stopifnot(nrow(enoe) >= 300000 & nrow(enoe) <= 500000)
cat("QA Dimensiones: PASADO\n")

#----COMPLETITUD-------------------------------------------

enoe |>
  skim() |>
  dplyr::filter(n_missing > 0)

#----VARIABLES CLAVE -Rangos y NAs-------------------------

#clase1: condicion de actividad primera categoria
#dur_est: Duracion de estudios
#ingocup: ingreso mensual de los ocupados
#"eda": edad de los encuestados
#sex: sexo de los encuestados
#ent: entidad
#rama: sector de actividad economica para ocupados
#anios_esc: años de escolaridad
#hrsocup: horas trabajadas

variables_clave <- c("clase1","dur_est","ingocup","eda","sex","ent","rama",
"anios_esc","hrsocup")

enoe |>
  dplyr::select(any_of(variables_clave)) |>
  skimr::skim()

#La colmuna de edades esta importada como factores, es necesario transformales a numericos

enoe <- enoe |>
  dplyr::mutate(eda = as.numeric(as.character(eda)))

#Se verifica que la conversion sea correcta.

class(enoe$eda)
range(enoe$eda, na.rm = TRUE)

#REGLA GENERAL PARA ESTOS MICRODATOS:
# El valor 99 en variables demográficas siempre es código de no respuesta, 
# nunca un valor real.

#----CONSISTENCIA LOGICA-----------------------------------
# Criterio de consistencia: si eda >= 15 y clase1 == 1 (ocupado), 
# entonces hrsocup > 0 debe ser verdadero

inconsistencias <- enoe |>
  dplyr::filter(eda >= 15 & clase1 == 1 & hrsocup == 0 )

n_inconsistencias <- nrow(inconsistencias)
pct_inconsistencias <- n_inconsistencias / nrow(enoe) * 100

cat("Inconsistencias logicas encontradas:", n_inconsistencias, "\n")
cat("Porcentaje total:", round(pct_inconsistencias, 3), "%\n")

# HALLAZGO: 12,965 ocupados con cero horas (3.059% del total)
# Interpretación: ausencias temporales válidas (vacaciones, 
# incapacidad, huelga). Tasa dentro del rango esperado (< 5%).
# No se consideran errores de captura.

#----TABLAS DE FRECUENCIA----------------------------------

#Distribucion por sexo
enoe |> dplyr::count(sex) |> dplyr::mutate(pct = n /sum(n) * 100)

#Distribucion por entidad
enoe |> dplyr::count(ent) |> dplyr::arrange(desc(n))

# Distribucion por rama de actividad
enoe |> dplyr::count(rama) |> dplyr::arrange(desc(n))


#----QA FINAL----------------------------------------------
#Verificacion del numero adecuado de filas.
stopifnot(nrow(enoe) >= 300000 & nrow(enoe) <= 500000)
cat("QA filas: PASADO\n")

#Verificacion que las entidades esten dentro del rango
codigos_validos <- sprintf("%02d", 1:32)
stopifnot(all(enoe$ent %in% codigos_validos, na.rm = TRUE))
cat("QA entidades: PASADO\n")

#Verificando la integridad de la varible de ocupaciones
stopifnot(sum(is.na(enoe$clase1)) == 0)
cat("QA ocupaciones sin NA's: PASADO\n")

# Verificar que los valores válidos de anios_esc (excluyendo código 99)
# no superan 25 años, que es el máximo razonable de escolaridad formal.
stopifnot(all(enoe$anios_esc[enoe$anios_esc != 99] <= 25, na.rm = TRUE))
cat("QA anios_esc: PASADO\n")

#Fin del diagnostico
cat("\nDiagnostico completado. Archivo listo para analisis.\n")
