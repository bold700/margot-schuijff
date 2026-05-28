#!/usr/bin/env bash
# ==============================================================
# Margot Schuijff — deploy naar TransIP via rsync over SSH
# --------------------------------------------------------------
# Gebruik:
#   ./deploy.sh             actual deploy (vraagt bevestiging)
#   ./deploy.sh --dry-run   toon wat er zou veranderen, niets uploaden
#   ./deploy.sh -y          deploy zonder bevestiging (voor scripts)
# ==============================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ---- Argumenten (eerst, zodat --help ook werkt zonder config) -
DRY_RUN=""
SKIP_CONFIRM=""
for arg in "$@"; do
  case "$arg" in
    --dry-run|-n) DRY_RUN="--dry-run" ;;
    -y|--yes)     SKIP_CONFIRM="1" ;;
    -h|--help)
      sed -n '2,10p' "$0"
      exit 0
      ;;
  esac
done

# ---- Config laden --------------------------------------------
CONFIG_FILE="$SCRIPT_DIR/deploy.config"

if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "❌ Geen deploy.config gevonden."
  echo "   Maak 'm aan door deploy.config.example te kopiëren:"
  echo "     cp deploy.config.example deploy.config"
  echo "   Vul daarna je TransIP SSH-gegevens in."
  exit 1
fi

# shellcheck source=/dev/null
source "$CONFIG_FILE"

# ---- Validatie -----------------------------------------------
: "${SSH_HOST:?SSH_HOST niet gezet in deploy.config}"
: "${SSH_USER:?SSH_USER niet gezet in deploy.config}"
: "${SSH_PORT:=22}"
: "${REMOTE_PATH:?REMOTE_PATH niet gezet in deploy.config}"

# ---- Wat we WEL en NIET uploaden -----------------------------
EXCLUDES=(
  --exclude='.git/'
  --exclude='.gitignore'
  --exclude='.github/'
  --exclude='deploy.sh'
  --exclude='deploy.config'
  --exclude='deploy.config.example'
  --exclude='serve.py'
  --exclude='README.md'
  --exclude='docs/'
  --exclude='*.bak'
  --exclude='.DS_Store'
  --exclude='node_modules/'
  --exclude='/tmp/'
)

# ---- Overzicht tonen -----------------------------------------
echo "─────────────────────────────────────────────────"
echo "  Deploy → ${SSH_USER}@${SSH_HOST}:${REMOTE_PATH}"
echo "  Poort:   ${SSH_PORT}"
echo "  Bron:    ${SCRIPT_DIR}"
if [[ -n "$DRY_RUN" ]]; then
  echo "  Modus:   DRY-RUN (niets wordt geüpload)"
else
  echo "  Modus:   LIVE — bestaande remote-bestanden worden overschreven,"
  echo "           remote-bestanden die lokaal niet bestaan worden VERWIJDERD"
fi
echo "─────────────────────────────────────────────────"

# ---- Bevestiging ---------------------------------------------
if [[ -z "$DRY_RUN" && -z "$SKIP_CONFIRM" ]]; then
  read -r -p "Doorgaan? [y/N] " confirm
  case "$confirm" in
    y|Y|yes|YES|ja|JA) ;;
    *) echo "Geannuleerd."; exit 0 ;;
  esac
fi

# ---- Rsync ---------------------------------------------------
rsync \
  --archive \
  --verbose \
  --compress \
  --human-readable \
  --delete \
  --delete-after \
  --itemize-changes \
  $DRY_RUN \
  "${EXCLUDES[@]}" \
  -e "ssh -p ${SSH_PORT}" \
  "${SCRIPT_DIR}/" \
  "${SSH_USER}@${SSH_HOST}:${REMOTE_PATH}/"

# ---- Klaar ---------------------------------------------------
echo ""
if [[ -n "$DRY_RUN" ]]; then
  echo "✓ Dry-run klaar. Run ./deploy.sh zonder --dry-run om écht te deployen."
else
  echo "✓ Deploy klaar. Check https://www.margotschuijff.nl"
fi
