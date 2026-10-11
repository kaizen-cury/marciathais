#!/usr/bin/env bash
# ============================================================
# PUBLICAR a pagina Marcia Thais no GitHub
#   repositorio: kaizen-cury/marciathais
# Dois cliques neste arquivo para enviar as alteracoes.
# Na 1a vez o Git pode pedir login: use a conta kaizen-cury
# (ou uma conta com acesso de escrita ao repositorio).
# ============================================================
set -e
REPO="/Users/aritan/Claude/Projects/Programador | SITE E LANDING PAGE/marcia-thais"
URL="https://github.com/kaizen-cury/marciathais.git"
cd "$REPO"
rm -f .git/*.lock 2>/dev/null || true

if [ ! -d .git ]; then
  git init
  git branch -M main
fi
git remote get-url origin >/dev/null 2>&1 || git remote add origin "$URL"
git remote set-url origin "$URL"

git add -A
if git diff --cached --quiet; then
  echo "Nenhuma alteracao nova para publicar."
else
  git commit -m "Atualizacao Marcia Thais $(date '+%d/%m/%Y %H:%M')"
fi

# traz o que existir no GitHub (ex.: README criado la) para evitar push recusado
git pull --no-rebase --no-edit --allow-unrelated-histories origin main 2>/dev/null || true

git push -u origin main && echo "" && echo "Publicado! github.com/kaizen-cury/marciathais"
read -r -p "Pode fechar esta janela. (Enter) " _
