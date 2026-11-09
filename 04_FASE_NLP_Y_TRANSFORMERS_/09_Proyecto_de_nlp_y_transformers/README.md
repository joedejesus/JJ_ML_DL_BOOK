# Proyecto de NLP y Transformers: Clasificación de Tickets de Soporte

## Papel de este proyecto dentro del libro

Este proyecto cierra la fase de NLP y transformers y funciona como culminación del recorrido completo del libro. Su papel es demostrar que un sistema moderno de texto no depende solo del modelo, sino de la coherencia entre dataset, tokenizador, configuración, entrenamiento e inferencia.

La visión global del repositorio se presenta en [README.md](../../README.md).

## Qué resuelve este proyecto

El notebook construye un flujo local de clasificación de tickets de soporte con transformers. La pregunta central es cómo pasar de texto bruto a una categoría operativa útil para un equipo de soporte. El valor del caso está en conectar dataset, tokenización, modelo, fine-tuning, evaluación e inferencia dentro de una misma historia. El tamaño del dataset y la evaluación limitada impiden considerar fiables las predicciones para un uso real.

## Por qué existe esta carpeta

La carpeta existe para demostrar que un proyecto de transformers puede ejecutarse con recursos locales dentro del repositorio. En lugar de depender de descargas en tiempo de ejecución, aquí se agrupan los textos etiquetados y un modelo local con su tokenizador, de modo que el lector pueda ver y entender todos los componentes del flujo.

## Navegación de la carpeta

| Recurso | Función | Por qué existe |
| --- | --- | --- |
| [Proyecto_de_nlp_y_transformers.ipynb](Proyecto_de_nlp_y_transformers.ipynb) | Notebook principal | mostrar el recorrido desde texto hasta predicción |
| [tickets_train.jsonl](tickets_train.jsonl) | Dataset de entrenamiento | ajustar el modelo con ejemplos etiquetados |
| [tickets_test.jsonl](tickets_test.jsonl) | Dataset de evaluación | evaluar el modelo con ejemplos distintos a los de entrenamiento |
| [local_bert](local_bert) | Modelo y tokenizador locales | ejecutar el flujo sin depender de internet |
| `bert_tickets/` | Directorio de salida configurado para el entrenamiento | alojar las salidas locales que pueda crear Trainer |

## Por qué los datos y el modelo local están diseñados así

- Los tickets están etiquetados con tres clases numéricas.
- La clase 0 representa incidencias de acceso o autenticación.
- La clase 1 representa problemas de facturación o cobros.
- La clase 2 representa errores técnicos o fallos de aplicación.
- El dataset es pequeño y controlado a propósito: permite que el fine-tuning corra con rapidez en local y hace visible la relación entre textos y etiquetas.
- La carpeta [local_bert](local_bert) agrupa pesos, configuración y tokenización locales. La coherencia de estos recursos debe comprobarse antes de interpretar el resultado.

## Cómo se relaciona el código con los archivos

1. La primera celda de código busca esta carpeta desde el directorio de trabajo actual y sus antecesores, y comprueba que los JSONL y el directorio del modelo local existan.
2. `load_dataset` lee [tickets_train.jsonl](tickets_train.jsonl) y [tickets_test.jsonl](tickets_test.jsonl). El notebook separa 6 de los 18 ejemplos de entrenamiento para validación, de forma estratificada.
3. `BertTokenizer.from_pretrained` carga el tokenizador local desde [local_bert](local_bert).
4. `dataset.map` transforma texto en IDs y máscaras de atención, con relleno y truncamiento a 128 tokens.
5. `BertForSequenceClassification.from_pretrained` carga el modelo local para clasificación.
6. `Trainer` une argumentos, dataset y modelo para ejecutar un fine-tuning de dos épocas, evaluando el conjunto de validación al final de cada una.
7. `output_dir=str(PROJECT_DIR / "bert_tickets")` configura la carpeta de salida local. El notebook usa `save_strategy="no"`, por lo que no guarda checkpoints automáticamente durante el entrenamiento.
8. La última parte evalúa el conjunto de prueba reservado y realiza una inferencia sobre un ticket de ejemplo.

## Por qué el flujo del notebook está organizado así

- Primero se fijan recursos locales porque en NLP con transformers el entorno y los recursos son parte del sistema, no solo el código.
- La tokenización aparece antes del modelo porque el transformer no acepta texto crudo.
- El formateo a tensores aparece antes del entrenamiento porque Trainer necesita un dataset compatible con PyTorch.
- La inferencia aparece al final porque solo cobra sentido una vez que el lector entiende de dónde salen el tokenizador, las etiquetas y los logits.

## Qué debería entender el lector al terminar

- Que un proyecto de transformers depende de la coherencia entre dataset, tokenizador, configuración y pesos.
- Que entrenar y hacer inferencia son fases distintas del mismo sistema.
- Que una predicción útil en soporte requiere etiquetas bien definidas y ejemplos representativos, no solo un modelo que ejecute.

## Comprobación rápida

Una ejecución del proyecto permite comprobar que:

- la primera celda de código encuentra los JSONL y el directorio [local_bert](local_bert); no genera esos recursos si faltan
- el dataset tokenizado contiene 12 ejemplos de entrenamiento, 6 de validación y 6 de prueba sin depender de internet
- la evaluación muestra `eval_loss`, `eval_accuracy` y el tamaño de las particiones
- la inferencia traduce la clase predicha a una categoría legible: acceso_autenticacion, facturacion_cobros o error_tecnico

Si quieres validarlo, abre [Proyecto_de_nlp_y_transformers.ipynb](Proyecto_de_nlp_y_transformers.ipynb) y ejecuta sus celdas en orden desde esta carpeta usando los recursos locales. Que el notebook termine sin errores no garantiza que las predicciones sean útiles.

## Limitaciones deliberadas

- El dataset es pequeño y sintético; sirve para enseñar el flujo, no para cubrir toda la complejidad de un centro de soporte real. Contiene 18 ejemplos de entrenamiento y 6 de prueba, sin textos exactamente repetidos entre ambas particiones.
- El modelo local es compacto y pensado para ejecución rápida, no para competir con un BERT grande de producción.
- La validación y la prueba contienen solo dos ejemplos por clase; sus métricas son muy sensibles a cada predicción y no permiten estimar el rendimiento real.
- En la ejecución de referencia en CPU, la exactitud de prueba fue de 2 aciertos de 6. Este resultado es solo una comprobación del ejemplo y puede variar entre entornos.
- La evaluación es ligera y no incluye análisis por clase, matriz de confusión ni calibración.
- La puntuación mostrada como confianza es una salida softmax, no una probabilidad necesariamente calibrada.

## Limitaciones detectadas en los recursos y la ejecución

- El vocabulario de `tokenizer.json` reproduce los 121 tokens de `vocab.txt` en el mismo orden y conserva los acentos. En el entorno probado aparecen 2 tokens desconocidos de 104 en entrenamiento, 1 de 44 en validación y 4 de 47 en prueba, antes de añadir tokens especiales; textos nuevos pueden contener más.
- La inferencia traslada los tensores al dispositivo del modelo. La ejecución comprobada se realizó en CPU; el uso de GPU no se ha verificado.
- No se ha comprobado el origen ni el preentrenamiento de los pesos locales. La correspondencia de tamaño e IDs con el vocabulario no demuestra que las representaciones sean útiles o estén preentrenadas.

## Nota operativa

Si faltaran los JSONL o el contenido de [local_bert](local_bert), la referencia correcta es restaurarlos dentro del propio proyecto antes de volver a ejecutar el notebook. La carpeta `bert_tickets/` es una salida regenerable y puede no existir o permanecer vacía. El notebook utiliza el modelo entrenado en memoria para la inferencia; no guarda automáticamente los pesos ajustados.
