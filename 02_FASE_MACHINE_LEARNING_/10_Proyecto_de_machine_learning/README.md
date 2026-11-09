# Proyecto de Machine Learning: Predicción de Riesgo Crediticio

## Papel de este proyecto dentro del libro

Este proyecto cierra la fase de machine learning y actúa como puente entre la preparación del dato y la toma de decisiones modelizadas. Su función es demostrar que el preprocesamiento no es un detalle auxiliar, sino una condición estructural para que un pipeline tabular tenga sentido en un problema de riesgo.

El mapa general del libro vive en [README.md](../../README.md).

## Qué resuelve este proyecto

El notebook presenta una primera aproximación educativa a la clasificación del riesgo crediticio. La pregunta de fondo es si un conjunto de variables financieras, laborales y de endeudamiento permite clasificar el impago de un cliente. El ejemplo compara clases predichas, pero no calcula ni calibra probabilidades de impago. Su valor pedagógico no está solo en entrenar un clasificador, sino en mostrar por qué el preprocesamiento es una condición previa para que el modelado tenga sentido.

## Por qué existe esta carpeta

La carpeta encapsula un caso local y reproducible de clasificación tabular aplicado a crédito. El lector puede seguir la secuencia sin descargar datos externos, utilizando el entorno y las dependencias del repo.

## Navegación de la carpeta

| Recurso | Función | Por qué existe |
| --- | --- | --- |
| [Proyecto_de_machine_learning.ipynb](Proyecto_de_machine_learning.ipynb) | Notebook principal del proyecto | articular EDA, preprocesamiento, entrenamiento e interpretación |
| [credit_risk.csv](credit_risk.csv) | Dataset local del caso | sostener un flujo tabular reproducible y suficientemente variado |

## Por qué el dataset está diseñado así

- Incluye variables como ingresos, importe del préstamo, score crediticio, antigüedad laboral, deuda previa, retrasos en pagos y atributos categóricos del perfil del cliente.
- La variable objetivo es Default con valores Yes o No.
- Se han incluido valores faltantes en columnas numéricas y categóricas para que el notebook tenga que tratarlos de forma explícita.
- La variable LoanToIncome ya viene incluida y representa una relación entre el importe del préstamo y los ingresos.

## Cómo se relaciona el código con los archivos

1. La primera celda de código busca el notebook y el CSV desde el directorio de trabajo actual y sus antecesores, y carga el CSV local.
2. El EDA revisa estructura, nulos, distribuciones y correlaciones para detectar fricciones del dataset.
3. El bloque de preprocesamiento separa entrenamiento y prueba, y ajusta la imputación, codificación y escala solo con entrenamiento.
4. El bloque de modelado entrena tres enfoques distintos y compara su comportamiento.
5. El bloque final usa las importancias del Random Forest para pasar de predicción a interpretación.

## Por qué el flujo del notebook está organizado así

- El orden sigue una secuencia de trabajo: primero entender el dato, después transformarlo y solo entonces entrenar.
- El escalado aparece porque los modelos lineales son sensibles a magnitudes distintas entre variables.
- La codificación one-hot representa las variables categóricas numéricamente sin inventar un orden artificial.
- La comparación entre LogisticRegression, RandomForestClassifier y GradientBoostingClassifier permite observar diferencias entre un modelo lineal, un ensamble por bagging y otro por boosting.

## Qué debería entender el lector al terminar

- Que el rendimiento final depende tanto del algoritmo como de la versión del dataset que construyes antes de entrenar.
- Que un problema crediticio no se resuelve solo con accuracy: requiere interpretar errores, variables relevantes y estabilidad del pipeline.
- Que la importancia de variables sirve para abrir preguntas de negocio, no para cerrar automáticamente una política de concesión.

## Comprobación rápida

Una ejecución correcta de este proyecto deja tres señales claras:

- La primera celda de código encuentra el notebook y el CSV local; no genera el CSV si falta.
- La comparativa de modelos muestra LogisticRegression, RandomForest y GradientBoosting con Accuracy, Precision, Recall y F1.
- El bloque final ordena y visualiza las importancias de las variables del Random Forest.

Para validarlo, prepara el entorno indicado en el [README principal](../../README.md), abre [Proyecto_de_machine_learning.ipynb](Proyecto_de_machine_learning.ipynb) y ejecuta sus celdas en orden. Configura esta carpeta como directorio de trabajo: la búsqueda solo revisa el directorio actual y sus antecesores, por lo que no encuentra el proyecto si se ejecuta desde la raíz del repositorio.

## Limitaciones deliberadas

- El dataset es sintético y compacto; sirve para practicar el flujo, no para representar un sistema crediticio real ni sus requisitos regulatorios.
- El análisis exploratorio utiliza el dataset completo antes de separar las particiones. Si se emplea para tomar decisiones de modelado, la prueba deja de ser completamente independiente de esas decisiones.
- El dataset contiene más ejemplos de `Default = Yes` que de `Default = No`. Aunque la división está estratificada, las métricas deben interpretarse teniendo en cuenta esa distribución.
- La evaluación usa clases predichas sobre una sola partición; no sustituye una validación cruzada, calibración de probabilidades ni análisis de equidad.
- La importancia final se basa en la reducción de impureza del Random Forest y no demuestra causalidad; puede favorecer variables de alta cardinalidad.

## Nota operativa

El proyecto está pensado para ejecutarse con los recursos locales de esta carpeta y con el entorno del repo. Si faltara el CSV, la referencia correcta es restaurarlo dentro del propio proyecto antes de volver a ejecutar el notebook.
