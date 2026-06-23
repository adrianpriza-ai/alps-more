#!/usr/bin/env bash

# Probe a pacman repo mirror by downloading its sync DB.
# Prints elapsed seconds on success; exits non-zero if unusable.
probe_repo_mirror() {
    local db_url="$1"
    local probe_file="$2"
    local min_size="${3:-50000}"
    local format="${4:-any}"

    local stats code size time
    stats=$(curl \
        -sS \
        -f \
        -L \
        --connect-timeout 3 \
        --max-time 15 \
        -o "$probe_file" \
        -w "%{http_code}|%{size_download}|%{time_total}" \
        "$db_url" 2>/dev/null) || return 1

    IFS='|' read -r code size time <<< "$stats"

    [[ "$code" == "200" && "$size" -ge "$min_size" ]] || return 1

    case "$format" in
        gzip)
            [[ "$(head -c 2 "$probe_file" 2>/dev/null)" == $'\x1f\x8b' ]] || return 1
            ;;
        zstd)
            [[ "$(head -c 2 "$probe_file" 2>/dev/null)" == $'\x28\xb5' ]] || return 1
            ;;
    esac

    rm -f "$probe_file"
    printf '%s' "$time"
}
