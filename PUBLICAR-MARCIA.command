#!/usr/bin/env bash
# ============================================================
# PUBLICAR a pagina Marcia Thais no GitHub
#   repositorio: kaizen-cury/marciathais
# Dois cliques neste arquivo para enviar as alteracoes.
# ============================================================
REPO="/Users/aritan/Claude/Projects/Programador | SITE E LANDING PAGE/marcia-thais"
URL="https://github.com/kaizen-cury/marciathais.git"
pausa(){ echo ""; read -r -p "Pode fechar esta janela. (Enter) " _; }
falhou(){ echo ""; echo "==================== NAO PUBLICOU ===================="; echo "$1"; echo "Tire um print desta janela e mande para o Claude."; pausa; exit 1; }

cd "$REPO" || falhou "Pasta nao encontrada: $REPO"
rm -f .git/*.lock 2>/dev/null || true

[ -d .git ] || { git init -q && git branch -M main; }
git remote get-url origin >/dev/null 2>&1 || git remote add origin "$URL"
git remote set-url origin "$URL"

# Login separado para este repositorio (nao reaproveita a conta jorn4da).
# Na 1a vez o Mac pede:  Username = kaizen-cury   Password = TOKEN do GitHub (nao a senha)
git config credential.useHttpPath true

git add -A
if git diff --cached --quiet; then
  echo "Nenhuma alteracao nova para commitar."
else
  git commit -q -m "Atualizacao Marcia Thais $(date '+%d/%m/%Y %H:%M')" || falhou "Erro no commit."
fi

echo "Enviando para $URL ..."
git pull --no-rebase --no-edit --allow-unrelated-histories origin main >/dev/null 2>&1 || true
if git push -u origin main; then
  echo ""; echo "Publicado! https://github.com/kaizen-cury/marciathais"
  pausa
else
  falhou "O GitHub recusou o envio. Quase sempre e login: a conta usada nao tem acesso ao kaizen-cury/marciathais."
fi
