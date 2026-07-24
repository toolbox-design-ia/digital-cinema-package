#!/usr/bin/env bash
# Bloque impreso en la seccion: Anatomía de un script de empaquetado
# Ajusta las rutas de entrada/salida a tu proyecto antes de ejecutar.

TIMESTAMP=$(date -u +%Y%m%dT%H%M%SZ)
LOG_FILE="$SALIDA/log_${TIMESTAMP}.txt"

echo "[${TIMESTAMP}] Iniciando empaquetado DCP" | tee -a "$LOG_FILE"

dcpomatic2_cli \
    --make-dcp /proyectos/PELICULA_FTR/pelicula_v03.dcpomatic \
    --output "$SALIDA" \
    2>&1 | tee -a "$LOG_FILE"

echo "[$(date -u +%Y%m%dT%H%M%SZ)] Empaquetado completado" | tee -a "$LOG_FILE"
