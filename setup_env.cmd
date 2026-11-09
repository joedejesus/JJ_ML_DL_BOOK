@echo off
setlocal
cd /d "%~dp0"

if exist "venv" (
    if not exist "venv\Scripts\python.exe" (
        echo ERROR: La carpeta venv existe pero no contiene un entorno de Python valido.
        echo Revisa su contenido antes de continuar.
        goto :error
    )
    echo Usando el entorno venv existente.
) else (
    echo Creando entorno virtual...
    python -m venv venv
    if errorlevel 1 goto :error
)

echo Instalando dependencias...
"venv\Scripts\python.exe" -m pip install -r requirements.txt
if errorlevel 1 goto :error

echo Comprobando dependencias instaladas...
"venv\Scripts\python.exe" -m pip check
if errorlevel 1 goto :error

echo Entorno preparado. Selecciona venv como kernel para los notebooks.
exit /b 0

:error
exit /b 1
