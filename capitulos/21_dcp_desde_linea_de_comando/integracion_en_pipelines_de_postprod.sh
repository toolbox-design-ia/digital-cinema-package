#!/usr/bin/env bash
# Bloque impreso en la seccion: Integración en pipelines de postproducción
# Ajusta las rutas de entrada/salida a tu proyecto antes de ejecutar.

# Generación en paralelo de versiones de idioma
for VERSION in ES_51 EN_51 FR_51 DE_51; do
    IDIOMA="${VERSION%%_*}"
    AUDIO="${VERSION##*_}"
    ./create_dcp.sh \
        --idioma   "$IDIOMA" \
        --audio    "$AUDIO" \
        --entrada  "/mnt/origen/PELICULA_FTR" \
        --salida   "/mnt/entregas/PELICULA_FTR_${VERSION}" \
        >> "/var/log/dcp/lote_$(date -u +%Y%m%d).log" 2>&1 &
done
wait   # Esperar a que terminen todos los workers en paralelo
