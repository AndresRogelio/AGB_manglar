# Cálculo de Biomasa Aérea de Manglares (AGB)

Este repositorio contiene un script en R que calcula la biomasa aérea de los manglares (AGB) utilizando ecuaciones alométricas basadas en el diámetro a la altura del pecho (DBH) de los árboles. Se utilizan datos de un inventario de manglares en Juan Díaz para realizar este análisis.

## Contenido

- **plot1manglar.Rdata**: Archivo de datos que contiene la información de inventario del manglar.
- **Script R**: Código para calcular la AGB usando dos ecuaciones alométricas.

## Ecuaciones Utilizadas

1. **Ecuación de Day et al. (1987)**:
   \[
   AGB = \exp(-1.5852) \times (DBH)^{2.3023}
   \]

2. **Ecuación de Fromard et al. (1998)**:
   \[
   AGB = 0.14 \times (DBH)^{2.4}
   \]

## Requisitos

- R (versión 3.5 o superior)
- Paquetes requeridos:
  - `dplyr`
  - `ggplot2`

## Cómo Usar

1. Asegúrate de tener los paquetes necesarios instalados. Puedes instalar los paquetes requeridos con:
   ```r
   install.packages(c("dplyr", "ggplot2"))
   ```
2. Abre R y establece el directorio de trabajo donde se encuentran los archivos:
   ```r
   setwd("C:/R/")
   ```
3. Carga los datos y ejecuta el script para calcular la AGB:
   ```r
   load("plot1manglar.Rdata")
   ```
## Resultados
El script imprimirá en la consola la cantidad de biomasa sobre el suelo en megagramos (Mg) para una hectárea de bosque de manglar cercano a la torre meteorológica de Juan Díaz, utilizando ambas ecuaciones alométricas.

## Contribuciones
Las contribuciones son bienvenidas. Si tienes sugerencias o mejoras, no dudes en crear un pull request o abrir un issue.

## Referencias
- **Datos de Inventario**: Los datos utilizados provienen de un inventario de manglares en Juan Díaz, almacenados en el archivo `plot1manglar.Rdata`.

- **Ecuaciones Alométricas**:
  1. Day, J., Conner, W., Ley-Lou, F., Day, R., & Machado, A. (1987). *The productivity and composition of mangrove forests, Laguna de Términos, México*. Aquatic Botany, 27, 267-284. [DOI:10.1016/0304-3770(87)90050-0](https://doi.org/10.1016/0304-3770(87)90050-0)
  
  2. Fromard, F., Puig, H., Mougin, E., Marty, G., Betoulle, J. L., & Cadamuro, L. (1998). *Structure, above-ground biomass and dynamics of mangrove ecosystems: New data from French Guiana*. Oecologia, 115(1-2), 39-53. [DOI:10.1007/s004420050489](https://doi.org/10.1007/s004420050489)
