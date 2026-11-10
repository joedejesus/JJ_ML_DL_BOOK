# Proyecto de ciencia de datos: abandono de clientes

Este proyecto cierra la fase de matemáticas y ciencia de datos con un caso educativo de análisis del abandono de clientes. Su objetivo es conectar la exploración de datos y su preparación con la comparación e interpretación de modelos de clasificación.

El notebook utiliza datos sintéticos para estudiar qué variables se relacionan con el abandono de un servicio. No está diseñado para tomar decisiones sobre clientes reales.

## Recursos

| Recurso | Descripción |
| --- | --- |
| [Proyecto_de_ciencia_de_datos.ipynb](Proyecto_de_ciencia_de_datos.ipynb) | Notebook con el análisis, la preparación de datos y los modelos. |
| [telco_churn.csv](telco_churn.csv) | Dataset local con información de clientes y la variable objetivo `Churn`. |

El CSV incluye variables demográficas, de contrato, servicio y facturación, así como valores faltantes que permiten practicar su tratamiento. Los datos necesarios están en esta carpeta; el notebook no genera el CSV si falta.

## Cómo ejecutarlo

1. Prepara Python y las dependencias siguiendo el [README principal](../../README.md#preparación-del-entorno).
2. Abre el [notebook](Proyecto_de_ciencia_de_datos.ipynb) en VS Code o Jupyter y selecciona el entorno preparado como kernel.
3. Configura esta carpeta como directorio de trabajo y ejecuta las celdas en orden. Consulta cómo [comprobarlo y cambiarlo](../../README.md#directorio-de-trabajo-de-los-proyectos).

El notebook busca sus recursos en el directorio de trabajo actual y sus antecesores; no los encuentra si se inicia desde la raíz del repositorio. Si falta el CSV, restáuralo en esta carpeta antes de ejecutar el proyecto.

## Flujo y resultados

1. Carga el CSV y explora sus tipos, valores faltantes, distribuciones y correlaciones.
2. Divide los datos de forma estratificada y ajusta la imputación y la codificación solo con la partición de entrenamiento. Excluye el identificador `customerID` y crea `Tenure_ratio` como `tenure / (MonthlyCharges + 1)`.
3. Entrena y compara regresión logística, árbol de decisión y Random Forest mediante accuracy, precision, recall y F1.
4. Ordena y visualiza las importancias de las variables del Random Forest para orientar la interpretación.

Al finalizar, deberías ver la tabla comparativa de los tres modelos y la visualización de importancias. Los resultados son una oportunidad para analizar el flujo, no una recomendación de negocio.

## Limitaciones

- El dataset es pequeño y sintético; no representa toda la complejidad de un servicio real.
- El análisis exploratorio utiliza todos los datos antes de la división. Si influye en las decisiones de modelado, la prueba deja de ser completamente independiente de esas decisiones.
- La evaluación utiliza una sola partición, aunque estratificada; no sustituye la validación cruzada ni una selección formal de hiperparámetros.
- La importancia por reducción de impureza del Random Forest puede favorecer variables de alta cardinalidad y no demuestra causalidad.

[Volver al libro](../../README.md)
