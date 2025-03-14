#!/bin/bash
# Script para calcular el interés simple

# Verificar que se han proporcionado los argumentos necesarios
if [ $# -ne 3 ]; then
    echo "Uso: $0 principal tasa tiempo"
    echo "principal: cantidad principal (monto inicial)"
    echo "tasa: tasa de interés anual en porcentaje"
    echo "tiempo: período de tiempo en años"
    exit 1
fi

# Asignar argumentos a variables
principal=$1
rate=$2
time=$3

# Verificar que los argumentos son números
if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: El principal debe ser un número positivo"
    exit 1
fi

if ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: La tasa debe ser un número positivo"
    exit 1
fi

if ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: El tiempo debe ser un número positivo"
    exit 1
fi

# Calcular el interés simple
interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc)

# Mostrar el resultado
echo "Principal: $principal"
echo "Tasa de interés anual: $rate%"
echo "Tiempo (años): $time"
echo "Interés simple: $interest"

# Calcular el monto total
total=$(echo "scale=2; $principal + $interest" | bc)
echo "Monto total: $total"
