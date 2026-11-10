# Proyecto de NLP y transformers: clasificación de tickets

Este proyecto cierra la fase de NLP y transformers con un clasificador de tickets de soporte. Su objetivo es mostrar cómo se relacionan los textos etiquetados, el tokenizador, el modelo, el ajuste y la inferencia en un flujo local.

Los datos son sintéticos y la evaluación es limitada. Las predicciones no deben considerarse fiables para gestionar tickets reales.

## Recursos

| Recurso | Descripción |
| --- | --- |
| [Proyecto_de_nlp_y_transformers.ipynb](Proyecto_de_nlp_y_transformers.ipynb) | Notebook de tokenización, entrenamiento, evaluación e inferencia. |
| [tickets_train.jsonl](tickets_train.jsonl) | Ejemplos etiquetados para entrenamiento y validación. |
| [tickets_test.jsonl](tickets_test.jsonl) | Ejemplos reservados para prueba. |
| [local_bert](local_bert) | Configuración, tokenizador y pesos del modelo local. |
| `bert_tickets/` | Directorio de salida que puede crear el entrenamiento. |

Las etiquetas representan acceso y autenticación (`0`), facturación y cobros (`1`) y errores técnicos (`2`). Los datos y el modelo están incluidos localmente; el notebook no los genera si faltan.

## Cómo ejecutarlo

1. Prepara Python y las dependencias siguiendo el [README principal](../../README.md#preparación-del-entorno).
2. Abre el [notebook](Proyecto_de_nlp_y_transformers.ipynb) en VS Code o Jupyter y selecciona el entorno preparado como kernel.
3. Configura esta carpeta como directorio de trabajo y ejecuta las celdas en orden. Consulta cómo [comprobarlo y cambiarlo](../../README.md#directorio-de-trabajo-de-los-proyectos).

El notebook busca sus recursos en el directorio de trabajo actual y sus antecesores; no los encuentra si se inicia desde la raíz del repositorio. Si faltan los JSONL o el contenido de `local_bert`, restáuralos en esta carpeta antes de ejecutar el proyecto.

## Flujo y resultados

1. Carga los archivos JSONL y separa de forma estratificada 6 de los 18 ejemplos iniciales de entrenamiento para validación.
2. Carga el tokenizador y el modelo locales, y convierte los textos en IDs y máscaras de atención con relleno y truncamiento a 128 tokens.
3. Ajusta el clasificador durante dos épocas y evalúa el conjunto de validación al final de cada una.
4. Evalúa los 6 ejemplos de prueba y realiza una inferencia, mostrando la categoría predicha y una puntuación softmax.

Al finalizar, deberías ver los tamaños de las particiones —12 de entrenamiento, 6 de validación y 6 de prueba—, las métricas `eval_loss` y `eval_accuracy`, y una categoría legible para el ticket de ejemplo. Que el notebook termine sin errores no garantiza que las predicciones sean útiles.

El entrenamiento configura `bert_tickets/` como directorio de salida, pero utiliza `save_strategy="no"` y no guarda automáticamente checkpoints ni los pesos ajustados. La inferencia utiliza el modelo entrenado en memoria.

## Limitaciones

- El dataset es pequeño y sintético; no cubre la variedad de tickets reales. No hay textos exactamente repetidos entre los archivos de entrenamiento y prueba.
- Validación y prueba contienen solo dos ejemplos por clase, por lo que sus métricas son muy sensibles a cada predicción. En una ejecución de referencia en CPU se obtuvieron 2 aciertos de 6 en prueba; el resultado puede variar.
- El modelo local es compacto y no se ha comprobado el origen ni el preentrenamiento de sus pesos. La coincidencia entre el tamaño y los IDs del vocabulario no demuestra que las representaciones sean útiles.
- `tokenizer.json` reproduce los 121 tokens de `vocab.txt` en el mismo orden y conserva los acentos. En el entorno probado hubo tokens desconocidos: 2 de 104 en entrenamiento, 1 de 44 en validación y 4 de 47 en prueba, antes de añadir tokens especiales. Textos nuevos pueden contener más.
- La evaluación no incluye análisis por clase, matriz de confusión ni calibración. La puntuación softmax no es necesariamente una probabilidad calibrada.
- La inferencia coloca los tensores en el dispositivo del modelo. La ejecución comprobada fue en CPU; el uso de GPU no se ha verificado.

[Volver al libro](../../README.md)
