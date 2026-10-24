#!/usr/bin/env bash
# Ponte Claude Code <-> Codex: espelha .claude/skills em .agents/skills via symlink.
# Idempotente, seguro rodar de novo a qualquer momento.
set -e

ROOT="$(pwd)"
CLAUDE_SKILLS="$ROOT/.claude/skills"
AGENTS_DIR="$ROOT/.agents"
AGENTS_SKILLS="$AGENTS_DIR/skills"

if [ ! -d "$CLAUDE_SKILLS" ]; then
  echo "Aviso: pasta .claude/skills nao encontrada em $ROOT, nada pra ligar ainda."
  exit 0
fi

mkdir -p "$AGENTS_DIR"

if [ -L "$AGENTS_SKILLS" ]; then
  # Ja e um link. Confirma que aponta pro lugar certo, senao recria.
  CURRENT_TARGET="$(readlink "$AGENTS_SKILLS")"
  if [ "$CURRENT_TARGET" != "$CLAUDE_SKILLS" ]; then
    rm "$AGENTS_SKILLS"
    ln -s "$CLAUDE_SKILLS" "$AGENTS_SKILLS"
    echo "Ponte atualizada: .agents/skills -> .claude/skills"
  else
    echo "Ponte ja existe e aponta pro lugar certo: .agents/skills -> .claude/skills"
  fi
elif [ -e "$AGENTS_SKILLS" ]; then
  echo "Aviso: $AGENTS_SKILLS ja existe e nao e um link simbolico. Nada foi alterado, confira manualmente."
  exit 1
else
  ln -s "$CLAUDE_SKILLS" "$AGENTS_SKILLS"
  echo "Ponte criada: .agents/skills -> .claude/skills"
fi
