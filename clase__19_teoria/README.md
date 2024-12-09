# ALGORITMOS DE CLASIFICACION

## 1. Introducción a la Clasificación
La clasificación es un problema de aprendizaje supervisado donde el objetivo es predecir la categoría o etiqueta de una instancia basándose en sus características. El modelo aprende de un conjunto de datos etiquetados para hacer predicciones sobre nuevos datos no vistos.

## 2. K-Nearest Neighbors (KNN)

### Fundamentos del Algoritmo
- Es un método de clasificación no paramétrico y basado en instancias
- Funciona bajo el principio de "similitud entre instancias"
- No genera un modelo explícito, sino que clasifica basándose en la proximidad

### Funcionamiento:
1. Calcula la distancia entre el punto a clasificar y todos los puntos del conjunto de entrenamiento
2. Selecciona los K vecinos más cercanos
3. Asigna la etiqueta por votación mayoritaria entre esos K vecinos

### Características:
- Simple de implementar
- No hace suposiciones sobre la distribución de los datos
- Sensible a la selección de K y la métrica de distancia
- Computacionalmente costoso con grandes conjuntos de datos

## 3. Random Forest

### Fundamentos del Algoritmo
- Es un método de ensamble basado en árboles de decisión
- Construye múltiples árboles de decisión durante el entrenamiento
- Combina las predicciones de todos los árboles para mejorar precisión y reducir sobreajuste

### Funcionamiento:
1. Genera múltiples árboles de decisión usando muestreo Bootstrap
2. En cada árbol, selecciona un subconjunto aleatorio de características
3. Cada árbol vota para la clase final
4. La clase más votada se considera la predicción

### Características:
- Robusto a ruido y outliers
- Maneja bien relaciones no lineales
- Permite estimar la importancia de características
- Funciona bien en diversos tipos de problemas

## 4. Regresión Logística

### Fundamentos del Algoritmo
- A pesar de su nombre, es un método de clasificación
- Predice la probabilidad de pertenencia a una clase
- Utiliza la función logística (sigmoidea) para transformar la salida

### Funcionamiento:
1. Calcula una combinación lineal de características
2. Aplica la función logística para obtener una probabilidad entre 0 y 1
3. Establece un umbral (típicamente 0.5) para decidir la clase

### Características:
- Interpretable
- Trabaja bien con problemas linealmente separables
- Útil para problemas de clasificación binaria
- Permite estimar probabilidades

## 5. Support Vector Machines (SVM)

### Fundamentos del Algoritmo
- Busca encontrar el hiperplano óptimo que separe las clases
- Maximiza el margen entre diferentes clases
- Puede manejar espacios de características de alta dimensionalidad

### Funcionamiento:
1. Encuentra el hiperplano que maximiza la distancia entre clases
2. Utiliza vectores de soporte (puntos cercanos al hiperplano)
3. Puede usar kernels para manejar datos no linealmente separables

### Características:
- Efectivo en espacios de alta dimensión
- Robusto cuando hay clara separación entre clases
- Funciona bien con conjuntos de datos pequeños
- Puede ser computacionalmente costoso

## 6. Consideraciones Generales en Clasificación

### Métricas de Evaluación:
- Precisión
- Recall
- F1-Score 
- Matriz de Confusión
- Curva ROC
- Área bajo la curva (AUC)

### Selección de Algoritmo:
La elección depende de:
- Tamaño del conjunto de datos
- Dimensionalidad
- Naturaleza de las características
- Complejidad computacional requerida

---

| Algoritmo | Sensibilidad a Outliers | Sensibilidad a Distribución de Datos | Descripción Adicional |
|-----------|-------------------------|---------------------------------------|----------------------|
| KNN | Alta | Moderada-Alta | - Muy sensible a outliers por usar distancia directa<br>- Requiere normalización de datos<br>- Sensible a distribuciones no uniformes |
| Random Forest | Baja | Baja | - Robusto a outliers por promediar múltiples árboles<br>- Tolera distribuciones no normales<br>- Maneja bien datos con diferentes escalas |
| Regresión Logística | Moderada | Moderada | - Sensible a outliers en variables lineales<br>- Asume cierta distribución de probabilidad<br>- Mejor en datos con distribución cercana a normal |
| SVM | Moderada-Baja | Moderada | - Menos sensible a outliers con kernels adecuados<br>- Funciona bien con distribuciones no lineales<br>- Efectivo en espacios de alta dimensión |

Información adicional sobre la sensibilidad:

## Análisis Detallado de Sensibilidad

### KNN (K-Nearest Neighbors)
- **Outliers**: Extremadamente vulnerable
  - Un solo punto atípico puede alterar significativamente la clasificación
  - Requiere técnicas de preprocesamiento como:
    * Eliminación de outliers
    * Normalización de datos
    * Selección cuidadosa de K

### Random Forest
- **Outliers**: Muy resistente
  - Múltiples árboles mitigan el impacto de puntos atípicos
  - Técnicas de bootstrap ayudan a reducir influencia de datos extremos
  - Puede identificar y minimizar impacto de outliers

### Regresión Logística
- **Distribución**: Sensible a distribuciones no normales
  - Funciona mejor con distribuciones cercanas a normales
  - Puede requerir transformaciones de variables
  - Los outliers pueden sesgar los coeficientes del modelo

### SVM (Support Vector Machines)
- **Distribución**: Adaptable a diferentes distribuciones
  - Kernels no lineales ayudan a manejar distribuciones complejas
  - Menos dependiente de suposiciones de distribución
  - Margen de separación reduce impacto de puntos extremos

## Recomendaciones Prácticas

1. **Preprocesamiento de Datos**
   - Normalización
   - Detección y tratamiento de outliers
   - Análisis exploratorio previo

2. **Validación Cruzada**
   - Usar técnicas como K-Fold
   - Evaluar rendimiento en diferentes condiciones de datos

3. **Selección de Características**
   - Reducir dimensionalidad
   - Eliminar variables poco informativas



---

## Tipos de Kernels en SVM

### 1. Kernel Lineal
- Función más simple
- Ideal para datos linealmente separables
- Ecuación: K(x,y) = x^T * y
- Menor complejidad computacional
- Mejor cuando hay pocas características

### 2. Kernel Polinómico
- Permite límites de decisión no lineales
- Parámetros: grado del polinomio
- Ecuación: K(x,y) = (γx^T * y + r)^d
- Bueno para capturar relaciones no lineales simples

### 3. Kernel Radial (RBF - Gauss)
- Más utilizado en problemas no lineales
- Alta flexibilidad para diferentes distribuciones
- Ecuación: K(x,y) = exp(-γ||x-y||^2)
- Parámetro γ controla el radio de influencia
- Muy efectivo en reconocimiento de patrones complejos

### 4. Kernel Sigmoidal
- Similar a redes neuronales
- Útil en problemas de clasificación no lineal
- Ecuación: K(x,y) = tanh(γx^T * y + r)
- Sensible a ajuste de hiperparámetros

### 5. Kernel Exponencial
- Similar al RBF
- Decaimiento más suave
- Ecuación: K(x,y) = exp(-||x-y|| / 2σ^2)
- Menos común que el RBF

## Consideraciones al Seleccionar Kernel

1. Características del conjunto de datos
2. Número de características
3. Distribución de los datos
4. Complejidad computacional
5. Interpretabilidad del modelo

### Recomendaciones Prácticas

- Comenzar con Kernel Lineal
- Probar Kernel RBF si no funciona lo lineal
- Usar validación cruzada para ajuste de hiperparámetros
- Comparar rendimiento entre diferentes kernels


---
# Métricas de Evaluación en Clasificación

## 1. Precisión (Precision)
### Definición
Mide la proporción de predicciones positivas correctas entre todas las predicciones positivas.

### Fórmula
```
Precisión = VP / (VP + FP)
```
- VP (Verdaderos Positivos): Casos positivos correctamente identificados
- FP (Falsos Positivos): Casos negativos incorrectamente clasificados como positivos

### Ejemplo
En un sistema de detección de spam:
- 100 emails revisados
- 80 identificados como spam
- 70 son realmente spam
- Precisión = 70/80 = 0.875 (87.5%)

## 2. Recall (Sensibilidad)
### Definición
Mide la proporción de casos positivos reales que fueron correctamente identificados.

### Fórmula
```
Recall = VP / (VP + FN)
```
- VP (Verdaderos Positivos): Casos positivos correctamente identificados
- FN (Falsos Negativos): Casos positivos no detectados

### Ejemplo
En diagnóstico médico:
- 100 pacientes con enfermedad
- 80 diagnosticados correctamente
- Recall = 80/100 = 0.8 (80%)

## 3. F1-Score
### Definición
Medida armónica que combina precisión y recall

### Fórmula
```
F1 = 2 * (Precisión * Recall) / (Precisión + Recall)
```

### Ejemplo
- Precisión: 0.8
- Recall: 0.7
- F1-Score = 2 * (0.8 * 0.7) / (0.8 + 0.7) = 0.74

## 4. Matriz de Confusión
### Definición
Tabla que resume predicciones de un modelo de clasificación

### Estructura
```
                Predicho
               +     -
Real     +    VP    FN
         -    FP    VN
```
- VP: Verdaderos Positivos
- VN: Verdaderos Negativos
- FP: Falsos Positivos
- FN: Falsos Negativos

### Ejemplo
Detección de fraude:
```
                Fraude    No Fraude
Fraude Real     70         30
No Fraude       10        890
```

## 5. Curva ROC (Receiver Operating Characteristic)
### Definición
Representa el rendimiento de un clasificador binario
- Muestra la tasa de verdaderos positivos vs tasa de falsos positivos
- Útil para comparar rendimiento de modelos

### Interpretación
- Área cercana a 1: Modelo excelente
- Área cercana a 0.5: Modelo aleatorio
- Área cercana a 0: Modelo muy malo

## 6. Área Bajo la Curva (AUC)
### Definición
Medida agregada del rendimiento del modelo
- Valores entre 0 y 1
- 1: Clasificación perfecta
- 0.5: Clasificación aleatoria

### Interpretación
- AUC > 0.9: Excelente
- 0.8-0.9: Muy bueno
- 0.7-0.8: Bueno
- 0.6-0.7: Regular
- < 0.6: Pobre

## Volumen de Datos por Algoritmo

### 1. KNN
- Volumen óptimo: 1,000 - 10,000 instancias
- No recomendado para conjuntos muy grandes
- Requiere memoria para almacenar todos los puntos

### 2. Random Forest
- Volumen óptimo: 10,000 - 100,000 instancias
- Robusto con grandes volúmenes
- Mejor rendimiento con más datos

### 3. Regresión Logística
- Volumen óptimo: 5,000 - 50,000 instancias
- Funciona bien con datos moderados
- Sensible a la calidad de los datos

### 4. SVM
- Volumen óptimo: 1,000 - 50,000 instancias
- Eficiente con características reducidas
- Computacionalmente intensivo en grandes volúmenes

## Recomendaciones Generales

1. Más datos no siempre significa mejor modelo
2. Calidad de los datos es crucial
3. Validación cruzada para evaluar rendimiento
4. Balancear precisión, recall y complejidad
