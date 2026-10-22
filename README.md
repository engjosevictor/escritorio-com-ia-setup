# setup-escritorio

Skill do Claude Code que configura o sistema de IA do seu escritório de engenharia ou arquitetura. Faz uma entrevista curta sobre quem você é, quem atende, o que mais entrega e como trabalha, e gera a estrutura de pastas, o arquivo de instrução do sistema e a identidade visual do escritório, tudo calibrado pro teu jeito de trabalhar.

Parte do curso **Escritório de Engenharia com IA**, de José Victor Macedo (@engjosevictor).

## Instalação

Com o [Claude Code](https://claude.com/claude-code) instalado, clone esse repositório direto pra pasta de skills:

```
git clone https://github.com/engjosevictor/escritorio-com-ia-setup.git ~/.claude/skills/setup-escritorio
```

## Uso

Dentro do projeto do seu escritório no Claude Code, rode:

```
/setup-escritorio
```

Ou simplesmente diga "configurar o sistema" ou "primeira vez" numa conversa nova, a skill dispara sozinha.

A entrevista leva poucos minutos e gera:
- `AGENTS.md` e `CLAUDE.md` na raiz, o cérebro do sistema
- `_contexto/empresa.md`, `_contexto/estrategia.md`, `_contexto/preferencias.md`
- a estrutura de pastas do escritório (clientes, propostas, projetos, prospecção, marca, site, conteúdo, estudos, portfólio)
- `MAPA-DE-PASTAS.md`, um índice de tudo que foi criado

## Faz parte de algo maior

Essa skill é a base. O curso completo ensina a instalar um CRM pronto pro fluxo de orçamento, contrato e projeto, e a criar as próprias skills de engenharia (proposta comercial, memorial descritivo, checklist técnico) em cima dessa base.
