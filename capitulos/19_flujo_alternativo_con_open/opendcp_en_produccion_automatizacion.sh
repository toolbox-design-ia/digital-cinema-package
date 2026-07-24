#!/usr/bin/env bash
# Bloque impreso en la seccion: OpenDCP en producción: automatización, remediación y umbrale
# Ajusta las rutas de entrada/salida a tu proyecto antes de ejecutar.

# 1. Codificación JPEG 2000
opendcp_j2k --input /entrada/frames/ \
            --output /trabajo/j2c/ \
            --rate 24 \
            --bw 250

# 2. Wrapping MXF — pista de imagen
opendcp_mxf --encoder j2c \
            --input /trabajo/j2c/ \
            --output /trabajo/video.mxf \
            --rate 24

# 3. Wrapping MXF — pista de audio
opendcp_mxf --encoder wav \
            --input /entrada/audio/ \
            --output /trabajo/audio.mxf

# 4. Generación de manifiestos
opendcp_xml --input /trabajo/video.mxf /trabajo/audio.mxf \
            --output /salida/dcp/ \
            --title "Título de la producción" \
            --kind feature \
            --lang es-419
