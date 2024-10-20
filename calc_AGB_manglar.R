# Fichero para calcular AGB manglar
#Indicar la dirección a la carpeta de trabajo
setwd("C:/R/")
# Revisar la dirección a la carpeta de trabajo
getwd()
# crear un objeto con los datos de inventario del manglar de Juan Díaz
# (llamar los datos)
load("plot1manglar.Rdata")
# datos1  <-  read.csv("data_manglar.csv", header = TRUE,sep = ";")
# Crear las funciones para el cálculo de la AGB
# aplicar las ecuaciones específicas para las medidas de
# diámetro a la altura del pecho para cada caso (línea) 
# para estimar la biomasa sobre el suelo en Kg.

# Ecuación alométrica: AGB = EXP(-1.5852)*(DBH)^2.3023
# Day, J., W. Conner, F. Ley-Lou, R. Day y A. Machado. 1987.
# Theproductivity and composition of mangrove forests, Laguna de
# Términos, México. Aquatic Botany 27: 267-284.

agb.AVICGE  <-  function (dbh) {exp(-1.5852) * (dbh/10)^2.3023}

# Ecuación alométrica: AGB = 0.14*(DBH)^2.4
# Fromard, F., Puig, H., Mougin, E., Marty, G., Betoulle, J. L.,
# & Cadamuro, L. (1998). Structure, above-ground biomass and dynamics
# of mangrove ecosystems: New data from French Guiana.
# Oecologia, 115(1-2), 39-53. https://doi.org/10.1007/s004420050489

agb.AVICGE2  <-  function (dbh) {0.14 * (dbh/10)^2.4}

# Se realizan los cálculos de la AGB y se incluyen dos columnas al objeto
# con los datos
# Hago una copia de dfplot1
datos1 <- dfplot1

# crear variables que estimaron el AGB
datos1$agb_data <- agb.AVICGE(datos1$dbh)
datos1$agb_data2 <- agb.AVICGE2(datos1$dbh)
# Revisar
head(datos1)

# Se calcula la AGB para cada 400 m²
aggregate(cbind(agb_data, agb_data2) ~ cuadrat, data = datos1, FUN = sum, na.rm = TRUE)

# Se extrapola a un valor promedio de la AGB para una hectárea
resumen_agb <- aggregate(cbind(agb_data,agb_data2) ~ cuadrat, data = datos1, FUN = sum, na.rm = TRUE)

# promedio de AGB en 400 m²
promedio_agb_sub <- as.data.frame(sapply(resumen_agb[ ,2:3], FUN = mean))
promedio_agb_sub
# 
 XX <- promedio_agb_sub * 25/100
agbDay <-  round(XX[1,1], 1)
agbFromard<- round(XX[2,1], 1)

cat("La cantidad de biomasa sobre el suelo usando la ecuación de Day et al. fue de: ", agbDay, "Mg " ,"para una hectárea de bosque de manglar que esta cercano a a la torre meteorológica de Juan Díaz")
cat("La cantidad de biomasa sobre el suelo usando la ecuación de Fromard et al. fue de: ", agbFromard, "Mg ", "para una hectárea de bosque de manglar que esta cercano a a la torre meteorológica de Juan Díaz")



