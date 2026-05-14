#!/usr/bin/env bash
# ==========================================
# Título: Validador de estilo de entradas del blog
# Contexto (Por qué): Las entradas del blog deben cumplir con
#   restricciones de legibilidad: cada línea debe terminar con
#   puntuación adecuada y cada oración debe tener ≤25 palabras.
# Descripción (Qué / Cómo): Valida que cada línea termine con
#   puntuación adecuada y que todas las oraciones sean ≤25 palabras.
#   Itera sobre archivos Markdown en los directorios del proyecto.
# Entradas: Archivos markdown en _posts/
# Salidas: Mensajes de error a stdout; código de salida 0 si pasa,
#   1 si falla
# Dependencias: grep, egrep, wc, bash
# ==========================================

# Rastrear si hay errores
HAS_ERRORS=0

# ==========================================
# VERIFICACIÓN 1: Las líneas terminan con puntuación adecuada
# ==========================================
check_line_endings() {
    local file="$1"

    echo "Checking line endings in: $file"

    local lines_without_period
    lines_without_period=$(egrep -v ":$" "$file" | \
                           egrep -v "\.$" | \
                           egrep -v "\?$" | \
                           egrep -v "^1\. " | \
                           egrep -v "^\W" | \
                           egrep -v "^author: " | \
                           egrep -v "^layout: " | \
                           egrep -v "^tags: " | \
                           egrep -v "^title: " || true)

    if [[ -n "$lines_without_period" ]]; then
        echo "❌ Lines without proper punctuation:"
        echo "$lines_without_period"
        HAS_ERRORS=1
    fi
}

# ==========================================
# VERIFICACIÓN 2: Las oraciones tienen ≤25 palabras
# ==========================================
check_sentence_length() {
    local file="$1"
    local max_words=25

    echo "Checking sentence length in: $file"

    local line_count=0
    local violations=0

    for pattern in "\.$" "^\W" ":$" "\?$" "^1\. "; do
        while IFS= read -r line; do
            ((line_count++))
            local word_count
            word_count=$(echo "$line" | wc -w)

            if [[ $word_count -gt $max_words ]]; then
                echo "❌ Line $line_count exceeds $max_words words ($word_count words):"
                echo "   $line"
                ((violations++))
                HAS_ERRORS=1
            fi
        done < <(egrep "$pattern" "$file" || true)
    done

    if [[ $violations -eq 0 ]]; then
        echo "✅ All sentences are ≤$max_words words"
    fi
}

# ==========================================
# ENTRADA PRINCIPAL
# ==========================================
main() {
    echo "============================================"
    echo "Style Checker"
    echo "============================================"
    echo ""

    local directories=("_posts")
    local file_count=0

    for dir in "${directories[@]}"; do
        if [[ ! -d "$dir" ]]; then
            echo "⚠️  Directory not found: $dir"
            continue
        fi

        for file in "$dir"/*.md; do
            if [[ -f "$file" ]]; then
                ((file_count++))
                echo ""
                echo "─────────────────────────────────────────"
                check_line_endings "$file"
                echo ""
                check_sentence_length "$file"
                echo "─────────────────────────────────────────"
            fi
        done
    done

    if [[ $file_count -eq 0 ]]; then
        echo "⚠️  No markdown files found"
        HAS_ERRORS=1
    fi

    echo ""
    if [[ $HAS_ERRORS -eq 0 ]]; then
        echo "✅ All style checks passed!"
        return 0
    else
        echo "❌ Some style checks failed"
        return 1
    fi
}

main "$@"
