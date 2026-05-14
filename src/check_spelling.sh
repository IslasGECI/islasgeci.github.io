#!/usr/bin/env bash
# ==========================================
# Título: Verificador de ortografía del blog
# Contexto (Por qué): Las entradas del blog, guías de estilo y
#   protocolos deben pasar verificación de ortografía con aspell
#   para mantener calidad profesional.
# Descripción (Qué / Cómo): Ejecuta verificación de ortografía
#   con aspell para archivos markdown en español, usando el
#   diccionario personalizado del proyecto.
# Entradas: Archivos markdown en _posts/
# Salidas: Mensajes de error a stdout; código de salida 0 si pasa,
#   1 si falla
# Dependencias: aspell
# ==========================================

# Rastrear si hay errores
HAS_ERRORS=0

# ==========================================
# FUNCIÓN: Verificar ortografía con aspell
# ==========================================
check_spelling() {
    local lang="$1"
    local directory="$2"
    local wordlist="$3"
    local lang_name="$4"

    echo "Checking spelling in $lang_name ($directory/*.md)..."

    local error_count=0

    for file in "$directory"/*.md; do
        if [[ -f "$file" ]]; then
            local misspellings
            misspellings=$(aspell --lang="$lang" \
                                  --ignore-case \
                                  --mode=markdown \
                                  --personal="$wordlist" \
                                  list < "$file" | sort -u)

            if [[ -n "$misspellings" ]]; then
                echo "❌ Spelling errors in $file:"
                echo "$misspellings" | while read -r word; do
                    echo "   → $word"
                done
                ((error_count++))
                HAS_ERRORS=1
            fi
        fi
    done

    if [[ $error_count -eq 0 ]]; then
        echo "✅ No spelling errors found in $lang_name files"
    fi
}

# ==========================================
# ENTRADA PRINCIPAL
# ==========================================
main() {
    echo "============================================"
    echo "Blog Spellcheck"
    echo "============================================"
    echo ""

    WORDLIST="$PWD/.github/config/.wordlist.txt"

    local directories=("_posts")

    for dir in "${directories[@]}"; do
        if [[ ! -d "$dir" ]]; then
            echo "⚠️  Directory not found: $dir"
            continue
        fi

        echo "─────────────────────────────────────────"
        check_spelling "es" "$dir" "$WORDLIST" "$dir"
        echo "─────────────────────────────────────────"
        echo ""
    done

    if [[ $HAS_ERRORS -eq 0 ]]; then
        echo "✅ All spelling checks passed!"
        return 0
    else
        echo "❌ Some spelling checks failed"
        return 1
    fi
}

main "$@"
