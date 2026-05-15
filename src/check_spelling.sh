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
    local wordlist="$2"
    local lang_name="$3"
    shift 3
    local -a files=("$@")

    echo "Checking spelling in $lang_name..."

    if [[ ${#files[@]} -eq 0 ]]; then
        echo "⚠️  No files to check"
        return 0
    fi

    local error_count=0

    for file in "${files[@]}"; do
        if [[ -f "$file" ]]; then
            local misspellings
            misspellings=$(aspell --lang="$lang" \
                                  --ignore-case \
                                  --mode=markdown \
                                  --encoding=utf-8 \
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

    export LANG=C.UTF-8

    local dir="$PWD/_posts"

    if [[ ! -d "$dir" ]]; then
        echo "⚠️  Directory not found: $dir"
        return 1
    fi

    # Collect Spanish and English files separately
    local spanish_files=()
    local english_files=()
    for f in "$dir"/*.md; do
        if [[ -f "$f" ]]; then
            if [[ "$f" == *_en.md ]]; then
                english_files+=("$f")
            else
                spanish_files+=("$f")
            fi
        fi
    done

    echo "─────────────────────────────────────────"
    check_spelling "es" "$PWD/.config/wordlist-es.txt" "Spanish posts" "${spanish_files[@]}"
    echo "─────────────────────────────────────────"
    echo ""

    echo "─────────────────────────────────────────"
    check_spelling "en" "$PWD/.config/wordlist-en.txt" "English posts" "${english_files[@]}"
    echo "─────────────────────────────────────────"
    echo ""

    if [[ $HAS_ERRORS -eq 0 ]]; then
        echo "✅ All spelling checks passed!"
        return 0
    else
        echo "❌ Some spelling checks failed"
        return 1
    fi
}

main "$@"
