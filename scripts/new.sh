#!/usr/bin/env bash
# scripts/new.sh - scaffold de conteúdo pra willliam.dev (Hugo + Hextra)
#
# Uso:
#   ./scripts/new.sh post "Título do post"
#   ./scripts/new.sh doc "Título" [subsecao/opcional]
#   ./scripts/new.sh project "Nome do projeto"
#
# Requer: hugo (extended). Roda a partir da raiz do repo.

set -euo pipefail

# Garante que sed trate acentos (UTF-8 multi-byte) como um caractere só,
# em vez de corromper bytes individuais em locale C.
if [[ -z "${LC_ALL:-}" ]]; then
  if locale -a 2>/dev/null | grep -qi '^C\.utf8$'; then
    export LC_ALL="C.utf8"
  elif locale -a 2>/dev/null | grep -qi '^en_US\.utf8$'; then
    export LC_ALL="en_US.UTF-8"
  fi
fi

TYPE="${1:-}"
TITLE="${2:-}"
EXTRA="${3:-}"

usage() {
  echo "Uso: $0 <post|doc|project> \"Título\" [subsecao/para/doc]"
  exit 1
}

[[ -z "$TYPE" || -z "$TITLE" ]] && usage

if ! command -v hugo >/dev/null 2>&1; then
  echo "Erro: 'hugo' não encontrado no PATH. Instale o Hugo Extended."
  exit 1
fi

slugify() {
  # remove acentos comuns do pt-br explicitamente (não depende de locale,
  # ao contrário de iconv//TRANSLIT, que falha silenciosamente em vários setups)
  local s
  s=$(printf '%s' "$1" | sed \
    -e 's/[ÁÀÂÃÄáàâãä]/a/g' \
    -e 's/[ÉÈÊËéèêë]/e/g' \
    -e 's/[ÍÌÎÏíìîï]/i/g' \
    -e 's/[ÓÒÔÕÖóòôõö]/o/g' \
    -e 's/[ÚÙÛÜúùûü]/u/g' \
    -e 's/[Çç]/c/g' \
    -e 's/[Ññ]/n/g')
  s=$(printf '%s' "$s" | tr '[:upper:]' '[:lower:]')
  printf '%s' "$s" | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//'
}

SLUG="$(slugify "$TITLE")"
if [[ -z "$SLUG" ]]; then
  echo "Não consegui gerar um slug a partir de '$TITLE'."
  exit 1
fi

case "$TYPE" in
  post)
    PATH_REL="content/blog/${SLUG}/index.md"
    ;;
  doc)
    SUBDIR=""
    if [[ -n "$EXTRA" ]]; then
      SUBDIR="${EXTRA%/}/"
    fi
    PATH_REL="content/docs/${SUBDIR}${SLUG}/index.md"
    ;;
  project)
    PATH_REL="content/projects/${SLUG}/index.md"
    ;;
  *)
    echo "Tipo desconhecido: '$TYPE' (use post, doc ou project)"
    usage
    ;;
esac

if [[ -e "$PATH_REL" ]]; then
  echo "Já existe: $PATH_REL"
  exit 1
fi

# hugo escolhe o archetype pelo primeiro segmento da seção
# (content/blog -> archetypes/blog.md, content/docs -> archetypes/docs.md, etc)
hugo new "$PATH_REL"

# Corrige o título real no frontmatter (o archetype usa o nome do slug por padrão)
ESCAPED_TITLE=$(printf '%s' "$TITLE" | sed 's/[&/\]/\\&/g')
if [[ "$(uname)" == "Darwin" ]]; then
  sed -i '' "s/^title: .*/title: \"${ESCAPED_TITLE}\"/" "$PATH_REL"
else
  sed -i "s/^title: .*/title: \"${ESCAPED_TITLE}\"/" "$PATH_REL"
fi

echo "Criado: $PATH_REL"

if [[ "$TYPE" == "project" ]]; then
  echo "Lembrete: adicione um card em content/projects/_index.md apontando pra /projects/${SLUG}/"
fi

if command -v code >/dev/null 2>&1; then
  code "$PATH_REL"
fi
