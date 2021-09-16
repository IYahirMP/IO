# Nestlé, produce y distribuye dos tipos de café a los supermercados del país:
# cafeinado y descafeinado. Para este mes Nestlé tiene 650 toneladas
# de grano de café en inventario y tiene programadas hasta 70 horas de
# tiempo de procesamiento para el tostado. Cada tonelada de café cafeinado
# necesita dos toneladas de grano, cuatro horas de tostado y produce una
# ganancia de $19,000. Cada tonelada de café descafeinado necesita una
# y media tonelada de grano, pero necesita seis horas de tostado y produce
# una ganancia de $23,000. Plantee un modelo de programación lineal que
# le permita a Nestlé planearsu producción para este mes.

# Paso 1: Identificar las variables de decisión o variables básicas.
# x1 = Toneladas de café cafeinado
# x2 = Toneladas de café descafeinado

# Paso 2: Identificar los coeficientes de contribución
# c1 = 19 K$/Ton.Café cafeinado
# c2 = 23 K$/Ton.Café descafeinado

# Paso 3: Armar función objetivo
# Maximizar Z = 19x1 + 23x2
# Z se expresa en miles de pesos.

# Paso 4: Identificar los parámetros
# b1 = 650 Ton. Café de grano en inventario (Material máximo a usar)
# b2 = 70 hrs de tiempo de procesamiento para tostado máximas.

# Paso 5: Identificar el lado izquierdo de las restricciones
# a11 = 2 toneladas de grano p/Ton.Café cafeinado
# a12 = 1.5 toneladas de grano p/Ton. Café descafeinado
# a21 = 4 horas de tostado p/Ton. Café cafeinado
# a22 = 6 horas de tostado p/Ton. Café descafeinado

# Paso 6: Armar las restricciones
# 2x1 + 1.5x2 <= 650
# 4x1 + 6x2 <= 70

# Paso 7: No negatividad
# x1, x2 >= 0

# Paso 8: Armar el modelo

# Maximizar Z = 19x1 + 23x2
# s.a.
# 2x1 + 1.5x2 <= 650    (1)
# 4x1 +   6x2 <= 70     (2)
# x1, x2 >= 0

# Paso 9: Solución por el método gráfico

library(matlib)

# Se crea una matriz con el lado izquierdo de las restricciones
a <- matrix(c(2,4,1.5,6), nrow=2, ncol=2)
# Se crea un vector con los parámetros
b <- c(650, 70)
# Se grafica
plotEqn(a, b, xlim=c(-10, 100), ylim=c(-10,500))

# El área factible se encuentra entre la restricción (2)[la línea roja]
# y los ejes coordenados:
# Intersección A: Entre ambos ejes coordenados (0,0)
# Intersección B: Entre la línea roja y el eje x1.
# Intersección C: Entre la línea roja y el eje x2.

# Solución A: (0,0)

# Solución B: Es la intersección entre
# x1       = 0
# 4x1 +6x2 = 70

# Se crea una matriz con el lado izquierdo de las ecuaciones
aB <- matrix(c(1,4,0,6), nrow=2, ncol=2)
# Se crea un vector con el lado derecho de las ecuaciones
bB <- c(0,70)
# Se resuelve el sistema de ecuaciones
sB <- solve(aB,bB)
# La solución está en el par ordenado
sB

# Solucion C: Es la intersección entre
# 4x1 +6x2 = 70
#       x2 = 0

# Se crea una matriz con el lado izquierdo de las ecuaciones
aC <- matrix(c(4,0,6,1), nrow=2, ncol=2)
# Se crea un vector con el lado derecho de las ecuaciones
bC <- c(70,0)
# Se resuelve el sistema de ecuaciones
sC <- solve(aC,bC)
# La solución está en el par ordenado
sC


# Por último, hay que buscar los puntos donde la función se maximice.
# Para esto se evalúa la función objetivo en los puntos que corresponden
# a cada solución FEV del modelo.

# Para calcular los valores de Z en las intersecciones A, B y C, se
# define una matriz con ambos pares ordenados:
# A(0, 0)
# B(0, 11.7)
# C(17.5, 0)
solFEV <- matrix(c(0,0, 17.5, 0, 11.7, 0), nrow = 3, ncol = 2)

# Posteriormente se define un vector columna con los coeficientes de la funcion
# objetivo: Z = 19x1 + 23x2

ci <- matrix(c(19, 23), nrow = 2, ncol = 1)

# Para obtener el valor de la función objetivo, se multiplican ambas matrices:

z <- solFEV%*%ci

# Mostrar el vector Z
z

# Cada fila corresponde a Z para una de las soluciones FEV en el orden
# en que se definieron. La solución con mayor beneficio corresponde al punto
# C(17.5, 0), con una producción de 17.5 toneladas de café cafeinado
# con un beneficio total de $332,500.

