# Seguridad

## Alcance

JJ ML DL BOOK es un libro práctico de ciencia de datos, machine learning, deep learning y NLP orientado al estudio, la revisión técnica y la experimentación no comercial. Sus notebooks ejecutan código y pueden cargar datos, modelos o dependencias locales o externos. Esos recursos deben revisarse antes de utilizarlos, especialmente fuera del entorno educativo previsto.

Este documento explica cómo reportar problemas de seguridad o usos inseguros detectados en el repositorio.

## Qué debe reportarse

Conviene reportar, entre otros, problemas como:

- ejecución inesperada o insegura de código o comandos
- exposición accidental de credenciales, datos personales o información sensible
- dependencias, datasets o modelos que introduzcan riesgos conocidos o no esperados
- instrucciones de instalación o ejecución que puedan causar pérdidas de datos o usos inseguros
- resultados o ejemplos que puedan inducir a usar el material en contextos sensibles sin las precauciones necesarias

## Qué no debe publicarse en abierto de entrada

Si el hallazgo puede facilitar abuso, exponer datos o empeorar el riesgo antes de corregirse, no publiques primero todos los detalles en un issue abierto.

En esos casos, prioriza una divulgación responsable y limitada al titular del repositorio o al canal privado que GitHub pueda ofrecer para reportes de seguridad.

## Cómo reportarlo

Si el repositorio tiene habilitada la notificación privada de vulnerabilidades en GitHub, utiliza la opción de reportar una vulnerabilidad desde su pestaña **Security**.

Si esa opción no está disponible, contacta con el titular del repositorio por una vía privada asociada a su perfil público antes de abrir un issue con detalles técnicos completos. No se garantiza que exista un canal privado alternativo ni un plazo de respuesta.

Para incidencias no sensibles, dudas de endurecimiento o propuestas generales de mejora, sí puede abrirse un issue normal o una Discussion con contexto suficiente y sin publicar material que aumente el riesgo.

## Qué incluir en el reporte

Un reporte útil debería incluir, en la medida de lo posible:

- descripción clara del problema
- componente afectado
- pasos de reproducción
- impacto potencial
- condiciones necesarias para que ocurra
- propuesta de mitigación o contención, si existe

Evita adjuntar credenciales, datos personales o archivos de terceros; comparte solo la información mínima necesaria para reproducir el problema.

## Expectativas y límites

Este repositorio no ofrece compromisos formales de SLA, soporte continuo ni plazos garantizados de respuesta. Aun así, los reportes razonables y bien documentados se revisarán con prioridad proporcional al riesgo y al alcance del problema.

## Relación con la licencia y el descargo de responsabilidad

La existencia de esta política de seguridad no implica garantía de ausencia de fallos ni aptitud para entornos sensibles. Consulta [LICENSE](LICENSE) para las limitaciones legales, restricciones de uso y descargo de responsabilidad aplicables al proyecto. Para las reglas generales de participación, revisa también [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) y [CONTRIBUTING.md](CONTRIBUTING.md).