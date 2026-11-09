# Proyecto de Deep Learning: Detección de Defectos Industriales con CNN

## Papel de este proyecto dentro del libro

Este proyecto cierra la fase de deep learning y conecta la teoría de tensores, dataloaders, entrenamiento y CNN en un ejemplo visual pequeño. Su función es mostrar que la entrada, la arquitectura y la evaluación deben entenderse juntas.

El mapa global del repositorio se presenta en [README.md](../../README.md).

## Qué resuelve este proyecto

El notebook construye un clasificador visual sencillo para distinguir piezas correctas de piezas defectuosas. La idea central no es alcanzar un benchmark alto, sino mostrar con claridad cómo se conectan datos de imagen, arquitectura convolucional, entrenamiento y evaluación dentro de un flujo local.

## Por qué existe esta carpeta

La carpeta concentra un ejemplo de visión por computador que puede ejecutarse sin descargar datasets ni depender de servicios externos. Las imágenes necesarias están aquí; también hace falta preparar el entorno y las dependencias del repositorio.

## Navegación de la carpeta

| Recurso | Función | Por qué existe |
| --- | --- | --- |
| [Proyecto_de_deep_learning.ipynb](Proyecto_de_deep_learning.ipynb) | Notebook principal | explicar transforms, dataloaders, red, loss, optimizador y evaluación |
| [data/train](data/train) | Imágenes de entrenamiento | ajustar parámetros del modelo tras excluir duplicados de prueba |
| [data/test](data/test) | Conjunto de prueba | evaluar sobre imágenes que no se usan en el entrenamiento |
| [data/train/ok](data/train/ok) y [data/train/defect](data/train/defect) | Clases de entrenamiento | permitir a ImageFolder inferir etiquetas automáticamente |
| [data/test/ok](data/test/ok) y [data/test/defect](data/test/defect) | Clases de evaluación | proporcionar imágenes para ejecutar la evaluación |

## Por qué las imágenes están diseñadas así

- El dataset local contiene dos clases: ok y defect.
- Las imágenes sintéticas locales están almacenadas en RGBA; ImageFolder las carga en RGB y el notebook las prepara a 128x128.
- Las imágenes ok representan una pieza con patrón limpio.
- Las imágenes defect incluyen una marca anómala visible sobre ese patrón base.
- El dataset es pequeño a propósito para que el notebook pueda entrenar con rapidez y mostrar el flujo dentro del proyecto.

## Cómo se relaciona el código con los archivos

1. La primera celda de código busca el notebook y las carpetas `data/train` y `data/test` desde el directorio de trabajo actual y sus antecesores.
2. El bloque de transforms unifica tamaño y escala de píxeles para que la red reciba entradas consistentes.
3. ImageFolder recorre [data/train](data/train) y [data/test](data/test) para asignar etiquetas según el nombre de la carpeta.
4. Se excluyen del entrenamiento las imágenes cuyos píxeles RGB coinciden con imágenes de prueba, sin modificar los archivos; DataLoader crea los lotes de ambas particiones.
5. La CNN transforma la imagen en representaciones intermedias y termina produciendo logits para dos clases.

## Por qué el flujo del notebook está organizado así

- Primero se fija la entrada porque en visión la forma y normalización del dato condicionan las operaciones posteriores.
- Después se define la arquitectura, la función de pérdida y el optimizador.
- El entrenamiento aparece antes de la evaluación para observar los resultados del modelo después de ajustar sus pesos.
- La semilla manual ayuda a reproducir el ejemplo, aunque los resultados pueden variar entre entornos.

## Qué debería entender el lector al terminar

- Que una CNN aprende a partir de imágenes, etiquetas y una regla explícita de optimización.
- Que train y test cumplen funciones distintas y deben contener ejemplos independientes para evaluar generalización.
- Que una accuracy alta en un dataset simple no equivale automáticamente a robustez industrial real.

## Comprobación rápida

Una ejecución correcta de este proyecto deja tres señales claras:

- La primera celda de código encuentra el notebook y las carpetas de datos; no genera las imágenes si faltan.
- El entrenamiento produce una secuencia corta de pérdidas por época sin errores de forma entre tensores y capas densas.
- La evaluación final devuelve accuracy y una matriz de confusión legible para las clases ok y defect.

Para validarlo, prepara el entorno indicado en el [README principal](../../README.md), abre [Proyecto_de_deep_learning.ipynb](Proyecto_de_deep_learning.ipynb) y ejecuta sus celdas en orden. Configura esta carpeta como directorio de trabajo: la búsqueda solo revisa el directorio actual y sus antecesores, por lo que no encuentra el proyecto si se ejecuta desde la raíz del repositorio.

## Limitaciones deliberadas

- El dataset es sintético, pequeño y visualmente sencillo: contiene 36 archivos de entrenamiento y 12 de prueba.
- Los 12 archivos de prueba tienen una copia en entrenamiento. El notebook excluye esas copias por coincidencia exacta de píxeles RGB y entrena con 24 imágenes; el filtrado no detecta variantes similares que no sean idénticas.
- La red es compacta y no pretende representar una solución productiva de inspección industrial.
- La evaluación es intencionalmente ligera: se apoya en accuracy y una matriz de confusión final, pero no incorpora validación por épocas ni análisis visual detallado de errores.

## Nota operativa

Si la carpeta `data` no estuviera completa, la referencia correcta es restaurar sus archivos dentro del propio proyecto antes de volver a ejecutar el notebook.
