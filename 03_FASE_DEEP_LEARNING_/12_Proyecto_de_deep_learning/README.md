# Proyecto de deep learning: detección de defectos con CNN

Este proyecto cierra la fase de deep learning con un clasificador visual que distingue piezas correctas de piezas defectuosas. Su objetivo es conectar la preparación de imágenes, los dataloaders, una red neuronal convolucional y su evaluación en un ejemplo local.

Las imágenes son sintéticas y el modelo es pequeño: el proyecto está pensado para aprender el flujo, no para inspección industrial real.

## Recursos

| Recurso | Descripción |
| --- | --- |
| [Proyecto_de_deep_learning.ipynb](Proyecto_de_deep_learning.ipynb) | Notebook de preparación, entrenamiento y evaluación. |
| [data/train](data/train) | Imágenes de entrenamiento, organizadas en las clases `ok` y `defect`. |
| [data/test](data/test) | Imágenes de prueba, organizadas en las mismas clases. |

Las imágenes locales están almacenadas en RGBA; `ImageFolder` las carga en RGB y el notebook las prepara a 128 × 128 píxeles. No es necesario descargar un dataset externo. El notebook no genera las imágenes si faltan.

## Cómo ejecutarlo

1. Prepara Python y las dependencias siguiendo el [README principal](../../README.md#preparación-del-entorno).
2. Abre el [notebook](Proyecto_de_deep_learning.ipynb) en VS Code o Jupyter y selecciona el entorno preparado como kernel.
3. Configura esta carpeta como directorio de trabajo y ejecuta las celdas en orden. Consulta cómo [comprobarlo y cambiarlo](../../README.md#directorio-de-trabajo-de-los-proyectos).

El notebook busca sus recursos en el directorio de trabajo actual y sus antecesores; no los encuentra si se inicia desde la raíz del repositorio. Si falta algún recurso, restaura los archivos de `data` antes de ejecutar el proyecto.

## Flujo y resultados

1. Carga las imágenes y aplica las transformaciones necesarias para unificar su tamaño y escala.
2. Excluye del entrenamiento las imágenes cuyos píxeles RGB coinciden exactamente con imágenes de prueba, sin modificar los archivos, y crea los lotes con `DataLoader`.
3. Define la CNN, la función de pérdida y el optimizador, y entrena el modelo.
4. Evalúa el modelo con accuracy y una matriz de confusión para las clases `ok` y `defect`.

Durante la ejecución deberías ver las pérdidas por época y, al final, las métricas de prueba. Se fija una semilla para ayudar a reproducir el ejemplo, aunque los resultados pueden variar entre entornos.

## Limitaciones

- El dataset es pequeño y visualmente sencillo: contiene 36 archivos de entrenamiento y 12 de prueba.
- Los 12 archivos de prueba tienen una copia exacta en entrenamiento. El notebook excluye esas copias y entrena con 24 imágenes; el filtrado no detecta variantes similares que no sean idénticas.
- Una accuracy alta en este ejemplo no demuestra robustez en un entorno industrial.
- La evaluación no incluye validación por épocas ni análisis visual detallado de errores.

[Volver al libro](../../README.md)
