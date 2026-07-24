#!/usr/bin/env bash
# Bloque impreso en la seccion: Anatomía de un script de empaquetado
# Ajusta las rutas de entrada/salida a tu proyecto antes de ejecutar.

# Exit codes:
# 0  = éxito completo
# 1  = directorio de entrada no encontrado
# 2  = recuento de frames incorrecto
# 3  = espacio insuficiente
# 4  = herramienta no encontrada en PATH
# 10 = empaquetado fallido
# 11 = validación Clairmeta fallida

clairmeta check "$SALIDA"/*.dcp 2>&1 | tee -a "$LOG_FILE"
CLAIRMETA_EXIT=${PIPESTATUS[0]}

if (( CLAIRMETA_EXIT != 0 )); then
    echo "ERROR: validación Clairmeta fallida (código $CLAIRMETA_EXIT)" | tee -a "$LOG_FILE"
    exit 11
fi

echo "[$(date -u +%Y%m%dT%H%M%SZ)] Validación superada. DCP listo para entrega." | tee -a "$LOG_FILE"
