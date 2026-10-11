#!/usr/bin/env bash
# ============================================================
# PUBLICAR a pagina Marcia Thais no GitHub
#   repositorio: kaizen-cury/marciathais  (Netlify publica sozinho)
# Dois cliques neste arquivo para enviar as alteracoes.
# So pede login quando existe alteracao nova para enviar.
# ============================================================
REPO="/Users/aritan/Claude/Projects/Programador | SITE E LANDING PAGE/marcia-thais"
URL="https://github.com/kaizen-cury/marciathais.git"
pausa(){ echo ""; read -r -p "Pode fechar esta janela. (Enter) " _; }
falhou(){ echo ""; echo "==================== NAO PUBLICOU ===================="; echo "$1"; echo "Tire um print desta janela e mande para o Claude."; pausa; exit 1; }

cd "$REPO" || falhou "Pasta nao encontrada: $REPO"
# limpa travas antigas do git deixadas por outras ferramentas
rm -f .git/*.lock .git/objects/*.lock .git/refs/remotes/origin/*.lock .git/stale-* 2>/dev/null || true

[ -d .git ] || { git init -q && git branch -M main; }
git remote get-url origin >/dev/null 2>&1 || git remote add origin "$URL"
git remote set-url origin "$URL"
git config credential.useHttpPath true

git add -A
if ! git diff --cached --quiet; then
  git commit -q -m "Atualizacao Marcia Thais $(date '+%d/%m/%Y %H:%M')" || falhou "Erro no commit."
fi

# Compara com o GitHub (repositorio publico: nao precisa de login para ler)
LOCAL=$(git rev-parse HEAD 2>/dev/null)
REMOTO=$(git ls-remote "$URL" refs/heads/main 2>/dev/null | cut -f1)
if [ -n "$REMOTO" ] && [ "$LOCAL" = "$REMOTO" ]; then
  echo "Ja esta tudo publicado. Nada novo para enviar."
  echo "https://github.com/kaizen-cury/marciathais  ->  https://marciathais.netlify.app"
  pausa; exit 0
fi

echo "Ha alteracoes novas. Enviando para $URL ..."
echo "(Se pedir login: Username = kaizen-cury | Password = TOKEN do GitHub)"
git pull --no-rebase --no-edit origin main >/dev/null 2>&1 || true
if git push -u origin main; then
  echo ""; echo "Publicado! O Netlify atualiza https://marciathais.netlify.app em 1 a 2 minutos."
  pausa
else
  falhou "O GitHub recusou o envio. Confira o login (kaizen-cury + token)."
fi
