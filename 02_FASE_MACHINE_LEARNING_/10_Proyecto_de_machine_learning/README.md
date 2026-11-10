# Proyecto de machine learning: riesgo crediticio

Este proyecto cierra la fase de machine learning con una introducción educativa a la clasificación del impago. Su objetivo es mostrar cómo la exploración, la preparación de datos y la evaluación influyen en un problema de clasificación tabular.

El notebook compara clases predichas con datos sintéticos; no calcula ni calibra probabilidades de impago y no debe utilizarse para tomar decisiones crediticias reales.

## Recursos

| Recurso | Descripción |
| --- | --- |
| [Proyecto_de_machine_learning.ipynb](Proyecto_de_machine_learning.ipynb) | Notebook con el análisis, el preprocesamiento y la comparación de modelos. |
| [credit_risk.csv](credit_risk.csv) | Dataset local con variables financieras y laborales y la variable objetivo `Default`. |

El CSV incluye ingresos, préstamo, historial y variables categóricas, además de valores faltantes para practicar su tratamiento. La variable `LoanToIncome` ya está incluida. El notebook no genera el CSV si falta.

## Cómo ejecutarlo

1. Prepara Python y las dependencias siguiendo el [README principal](../../README.md#preparación-del-entorno).
2. Abre el [notebook](Proyecto_de_machine_learning.ipynb) en VS Code o Jupyter y selecciona el entorno preparado como kernel.
3. Configura esta carpeta como directorio de trabajo y ejecuta las celdas en orden. Consulta cómo [comprobarlo y cambiarlo](../../README.md#directorio-de-trabajo-de-los-proyectos).

El notebook busca sus recursos en el directorio de trabajo actual y sus antecesores; no los encuentra si se inicia desde la raíz del repositorio. Si falta el CSV, restáuralo en esta carpeta antes de ejecutar el proyecto.

## Flujo y resultados

1. Carga el CSV y explora sus tipos, valores faltantes, distribuciones y correlaciones.
2. Divide los datos de forma estratificada y ajusta la imputación, codificación y escala solo con la partición de entrenamiento.
3. Entrena y compara regresión logística, Random Forest y Gradient Boosting mediante accuracy, precision, recall y F1.
4. Ordena y visualiza las importancias de las variables del Random Forest para orientar la interpretación.

Al finalizar, deberías ver la tabla comparativa de los tres modelos y la visualización de importancias. Las métricas y variables relevantes sirven para plantear preguntas, no para establecer una política de concesión.

## Limitaciones

- El dataset es pequeño y sintético; no representa un sistema crediticio real ni sus requisitos regulatorios.
- El análisis exploratorio utiliza todos los datos antes de la división. Si influye en las decisiones de modelado, la prueba deja de ser completamente independiente de esas decisiones.
- Hay más ejemplos de `Default = Yes` que de `Default = No`. Aunque la división está estratificada, la distribución debe tenerse en cuenta al interpretar las métricas.
- La evaluación usa clases predichas sobre una sola partición; no sustituye la validación cruzada, la calibración de probabilidades ni un análisis de equidad.
- La importancia por reducción de impureza del Random Forest puede favorecer variables de alta cardinalidad y no demuestra causalidad.

[Volver al libro](../../README.md)
