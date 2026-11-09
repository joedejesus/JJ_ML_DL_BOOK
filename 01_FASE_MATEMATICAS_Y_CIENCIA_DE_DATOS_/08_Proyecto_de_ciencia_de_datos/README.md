# Proyecto de Ciencia de Datos: Análisis de Fuga de Clientes

## Papel de este proyecto dentro del libro

Este proyecto cierra la fase de matemáticas aplicadas y ciencia de datos. Su función es demostrar que el trabajo previo sobre lectura de datos, nulos, distribuciones y transformaciones desemboca en una pregunta de negocio concreta: qué factores se asocian al abandono de un servicio y cómo utilizar esa información en una decisión útil.

Para ver el mapa general del repositorio, consulta [README.md](../../README.md).

## Qué resuelve este proyecto

El notebook presenta un flujo de churn analysis con una orientación claramente de negocio. No se limita a entrenar modelos: primero examina la estructura del dato, después trata valores faltantes, construye una variable derivada y finalmente compara varios clasificadores antes de cerrar con una lectura de importancia de variables.

## Por qué existe esta carpeta

Esta carpeta encapsula el caso y sus datos. El lector no necesita descargar datos externos ni reconstruir recursos manualmente, pero sí preparar el entorno de Python y las dependencias del repositorio.

## Navegación de la carpeta

| Recurso | Función | Por qué existe |
| --- | --- | --- |
| [Proyecto_de_ciencia_de_datos.ipynb](Proyecto_de_ciencia_de_datos.ipynb) | Notebook principal | articular EDA, feature engineering, modelado e interpretación final |
| [telco_churn.csv](telco_churn.csv) | Dataset local del proyecto | dar una fuente tabular reproducible para todo el flujo |

## Por qué el dataset está diseñado así

- Incluye identificador de cliente, variables demográficas, contrato, soporte, servicio y facturación.
- La variable objetivo es Churn con valores Yes o No.
- Aparecen valores faltantes en columnas como MonthlyCharges, TechSupport o TotalCharges para que el notebook pueda ilustrar la imputación.
- El dataset es compacto y sintético a propósito: permite ejecutar el proyecto con rapidez dentro del repo y practicar las decisiones clave del flujo.

## Cómo se relaciona el código con los archivos

1. La primera celda de código busca el notebook y el CSV desde el directorio de trabajo actual y sus antecesores, y carga el CSV local.
2. El bloque de EDA revisa estructura, nulos, distribuciones y correlaciones del dataset cargado.
3. El bloque de feature engineering separa entrenamiento y prueba, ajusta la imputación y codificación con entrenamiento y transforma ambas particiones.
4. El bloque de modelado ajusta varios clasificadores y compara rendimiento.
5. El bloque final usa la importancia de variables para devolver una lectura más cercana a negocio.

## Por qué el flujo del notebook está organizado así

- El EDA aparece primero porque entender tipos, nulos y distribuciones ayuda a tomar decisiones antes de modelar.
- La imputación y la codificación se ajustan solo con los datos de entrenamiento; el identificador `customerID` se excluye de las variables predictoras.
- La variable derivada Tenure_ratio muestra una forma de relacionar permanencia y gasto mensual: divide `tenure` entre `MonthlyCharges + 1`.
- La comparación entre LogisticRegression, DecisionTreeClassifier y RandomForestClassifier permite ver tres enfoques de modelado distintos: lineal, árbol simple y ensamble.

## Qué debería entender el lector al terminar

- Que un proyecto de ciencia de datos no empieza en el algoritmo, sino en la lectura del dato.
- Que las decisiones de preparación condicionan directamente lo que el modelo puede aprender.
- Que una métrica final sin interpretación de variables deja el caso incompleto desde el punto de vista de negocio.

## Comprobación rápida

Una ejecución correcta de este proyecto deja tres señales claras:

- La primera celda de código encuentra el notebook y el CSV local; no genera el CSV si falta.
- La tabla de evaluación compara LogisticRegression, DecisionTree y RandomForest con Accuracy, Precision, Recall y F1.
- El bloque final ordena y visualiza las importancias de las variables del Random Forest.

Para validarlo, prepara el entorno indicado en el [README principal](../../README.md), abre [Proyecto_de_ciencia_de_datos.ipynb](Proyecto_de_ciencia_de_datos.ipynb) y ejecuta sus celdas en orden. Configura esta carpeta como directorio de trabajo: la búsqueda solo revisa el directorio actual y sus antecesores, por lo que no encuentra el proyecto si se ejecuta desde la raíz del repositorio.

## Limitaciones deliberadas

- El dataset es sintético y pequeño; sirve para practicar un flujo realista, no para representar toda la complejidad de una telco real.
- El análisis exploratorio utiliza el dataset completo antes de separar las particiones. Si se emplea para tomar decisiones de modelado, la prueba deja de ser completamente independiente de esas decisiones.
- La división está estratificada, pero la comparación usa una sola partición; no sustituye una validación cruzada o una selección formal de hiperparámetros.
- La importancia final se basa en la reducción de impureza del Random Forest, puede favorecer variables de alta cardinalidad y debe leerse como orientación inicial, no como evidencia causal.

## Nota operativa

El proyecto está pensado para ejecutarse tal como está versionado en esta carpeta. Si faltara el CSV, la referencia correcta es restaurarlo dentro del propio proyecto antes de volver a ejecutar el notebook.
