#!/usr/bin/env bash
# Bloque impreso en la seccion: Validación técnica desde terminal
# Ajusta las rutas de entrada/salida a tu proyecto antes de ejecutar.

# Contar frames en la secuencia de origen
FRAMES_ORIGEN=$(find "$ENTRADA" -name "*.j2c" | wc -l)

# Obtener frames del MXF resultante
FRAMES_MXF=$(asdcp-info "$SALIDA"/video_track.mxf \
             | grep "Duration" \
             | awk '{print $2}')

if [[ "$FRAMES_ORIGEN" != "$FRAMES_MXF" ]]; then
    echo "ERROR: discrepancia de frames (origen: $FRAMES_ORIGEN, MXF: $FRAMES_MXF)"
    exit 12
fi
