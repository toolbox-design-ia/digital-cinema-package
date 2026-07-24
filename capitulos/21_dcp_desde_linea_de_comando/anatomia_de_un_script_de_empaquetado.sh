#!/usr/bin/env bash
# Bloque impreso en la seccion: Anatomía de un script de empaquetado
# Ajusta las rutas de entrada/salida a tu proyecto antes de ejecutar.

ENTRADA="/mnt/origen/j2c_secuencia"
SALIDA="/mnt/entregas/dcp"
FRAMES_ESPERADOS=129600
ESPACIO_MINIMO_GB=150

# Verificar existencia y contenido de la entrada
[[ -d "$ENTRADA" ]] || { echo "ERROR: directorio de entrada no encontrado: $ENTRADA"; exit 1; }
frames_presentes=$(find "$ENTRADA" -name "*.j2c" | wc -l)
(( frames_presentes == FRAMES_ESPERADOS )) || \
    { echo "ERROR: frames en entrada: $frames_presentes (esperados: $FRAMES_ESPERADOS)"; exit 2; }

# Verificar espacio disponible
espacio=$(df -BG "$SALIDA" | awk 'NR==2 {print $4}' | tr -d 'G')
(( espacio >= ESPACIO_MINIMO_GB )) || \
    { echo "ERROR: espacio insuficiente ($espacio GB, mínimo $ESPACIO_MINIMO_GB GB)"; exit 3; }

# Verificar herramientas
command -v dcpomatic2_cli >/dev/null || { echo "ERROR: dcpomatic2_cli no en PATH"; exit 4; }
command -v clairmeta     >/dev/null || { echo "ERROR: clairmeta no en PATH";     exit 4; }
