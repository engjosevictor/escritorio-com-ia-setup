---
name: setup-escritorio
description: >
  Configura o sistema do escritório de engenharia pro seu jeito de trabalhar.
  Faz perguntas sobre quem você é, quem atende, o que mais entrega e como
  trabalha, e gera AGENTS.md, memória, estrutura de pastas e lista de MCPs
  pro seu escritório. Use quando o aluno chamar /setup-escritorio, quando
  `_contexto/empresa.md` estiver vazio ou ausente, ou quando disser
  "configurar o sistema", "primeira vez", "setup".
---

# /setup-escritorio — Configuração do Sistema do Escritório

## Verificação inicial

Antes de qualquer coisa, verifique se `_contexto/empresa.md` existe e tem conteúdo real (não apenas o template).

- Se **não existe ou está vazio**: inicia o fluxo de onboarding abaixo.
- Se **já tem conteúdo**: informa ao usuário que o setup já foi feito e pergunta se quer refazer ou apenas atualizar alguma parte.

---

## Onboarding (primeira vez)

Comece com uma mensagem curta de boas-vindas:

> "Boa. Vou te fazer algumas perguntas pra configurar o sistema pro seu escritório. Responde com calma, quanto mais específico, melhor o sistema vai trabalhar pra ti."

Faça as perguntas em sequência, uma por vez, em conversa natural. Não liste todas de uma vez. Espere a resposta de cada uma antes de ir pra próxima.

### Pergunta 1
"Qual é o seu nome e o nome do seu escritório?"

### Pergunta 2 — Verificação de histórico

"Você já usa o Claude Code ou o Codex há algum tempo, ou é a primeira vez?"

**Se já usa Claude Code ou Codex há algum tempo:** perguntar:

> "Quer que eu tente carregar o que você já tem configurado em outros projetos, ou prefere configurar do zero aqui?"

- **Se quiser carregar:** executar o bloco **"Carregamento de contexto existente"** abaixo antes de continuar.
- **Se preferir do zero:** continua normalmente pra Pergunta 3.

**Se for a primeira vez:** perguntar:

> "Você usa outro assistente de IA com frequência, ChatGPT, Claude na web, Gemini? Se sim, consigo pegar o contexto de lá pra não precisar responder tudo do zero."

- **Se não usa outro assistente:** continua normalmente pra Pergunta 3.
- **Se usa:** executar o bloco **"Importação de contexto de outro assistente"** abaixo antes de continuar.

---

#### Bloco: Carregamento de contexto existente (Claude Code ou Codex anterior)

Tentar ler, nessa ordem:
1. `~/.claude/CLAUDE.md` — CLAUDE.md global (se existir)
2. Arquivos de memória em `~/.claude/projects/` — procurar por arquivos relevantes (escritório, clientes, preferências)
3. `AGENTS.md` ou `CLAUDE.md` na raiz de algum projeto que o usuário já tenha usado com Codex (o Codex lê o mesmo tipo de arquivo de instrução, se o usuário indicar o caminho de um projeto anterior, ler o `AGENTS.md` de lá)

Com o que encontrar, montar um resumo e apresentar ao usuário:

> "Encontrei isso no que você já tem configurado:
>
> - **Nome / escritório:** [extraído]
> - **O que atende:** [extraído]
> - **Tom de voz:** [extraído]
> - **Ferramentas:** [extraído]
> - *(... outras informações encontradas)*
>
> Está correto? Quer ajustar alguma coisa ou completar o que faltou?"

Aguardar confirmação ou correções do usuário. Após confirmar, **pular as perguntas já respondidas** e continuar apenas com o que ficou em aberto.

Se não encontrar nada relevante, informar:

> "Não encontrei contexto salvo de outros projetos. Vamos configurar do zero, leva poucos minutos."

E continuar normalmente pra Pergunta 3.

---

#### Bloco: Importação de contexto de outro assistente (ChatGPT, Claude web, Gemini, etc.)

Mostrar ao usuário o seguinte prompt pra copiar e colar no assistente que ele usa:

---

> **Copia esse prompt e cola no seu assistente de IA:**
>
> ```
> Preciso exportar o contexto do meu escritório das nossas conversas para configurar uma nova ferramenta. Por favor, responda com o que sabe sobre mim nas seguintes categorias, se não souber algo, deixe em branco:
>
> NOME: [seu nome completo]
> ESCRITÓRIO: [nome do escritório ou razão social]
> O QUE FAZ: [tipo de projeto que você projeta e pra quem, em 1-2 frases]
> PRINCIPAIS ENTREGAS: [o que você mais produz ou entrega no dia a dia: proposta, orçamento, memorial, projeto executivo, acompanhamento de obra]
> CLIENTES: [arquitetos, construtoras, pessoa física, órgão público, ou combinação]
> EQUIPE: [trabalha solo ou tem equipe, quem são]
> FERRAMENTAS: [softwares de cálculo e desenho, CRM, planilhas, ferramentas que você usa com frequência]
> IDENTIDADE VISUAL: [cores, fonte, logo que aparecem em proposta/contrato, se já tem definido]
> TOM DE VOZ: [como você prefere escrever pra cliente e em prospecção]
> O QUE EVITAR: [o que te incomoda em textos ou respostas de IA]
> OUTROS DETALHES: [qualquer outro contexto relevante sobre você ou seu escritório]
> ```

---

Após mostrar o prompt, dizer:

> "Cola isso no [nome do assistente que o usuário mencionou] e traz a resposta aqui."

Aguardar o usuário colar a resposta. Com o que vier:

1. Extrair todas as informações da resposta
2. Montar um resumo e apresentar pro usuário confirmar:

> "Com base no que você trouxe, aqui está o que vou usar pra configurar:
>
> - **Nome / escritório:** [extraído]
> - **O que atende:** [extraído]
> - **Tom de voz:** [extraído]
> - **Ferramentas:** [extraído]
> - *(... demais campos preenchidos)*
>
> Está correto? Tem algo pra corrigir ou adicionar?"

3. Aguardar confirmação ou ajustes
4. **Pular as perguntas já respondidas** e continuar apenas com o que ficou em branco ou incerto (tipicamente: identidade visual, se não foi mencionada)

---

### Pergunta 3
"O que você mais produz no dia a dia do escritório? Pode ser mais de uma coisa."

*(Exemplos: proposta comercial, orçamento, contrato, memorial descritivo, projeto executivo, planilha de quantitativo, acompanhamento de obra, relatório técnico)*

### Pergunta 4
"Quem você atende hoje? Arquitetos, construtoras, pessoa física, prefeitura ou órgão público, mais de um tipo?"

*(Pode responder livremente, inclusive se for uma combinação)*

### Pergunta 4.5 — Foco atual

"E qual é o seu principal foco agora? O que você tá tentando resolver ou conquistar nos próximos meses?"

*(Pode ser fechar mais clientes, organizar o fluxo de orçamento e contrato, sair da dependência de indicação, estruturar a prospecção ativa, contratar um estagiário, entregar um projeto grande no prazo, qualquer coisa que esteja na cabeça)*

### Pergunta 5
"Quais ferramentas você usa hoje no escritório? Cita as principais."

*(Exemplos: Eberick, TQS, AutoCAD, SMath Studio, Excel/Google Sheets pra orçamento, Notion, Google Drive, Gmail, WhatsApp Business, algum CRM, qualquer uma que use com frequência)*

### Pergunta 6 — Identidade visual de documento

"Seu escritório tem identidade visual pra proposta, orçamento e contrato? Logo, cores, CREA/CAU no rodapé? Se sim, como prefere compartilhar?"

Apresentar as opções de forma natural, não como lista formal:

> "Pode me mandar o link do seu site, jogar o logo e algum documento antigo na pasta `dados/` e me dizer o nome dos arquivos, descrever em texto mesmo (cores, nome que aparece na assinatura, registro no CREA/CAU), ou dizer que ainda não tem definido. Qualquer uma dessas funciona."

**Se compartilhar URL:**
- Buscar o conteúdo do site com WebFetch
- Analisar: cores dominantes, tipografia aparente, estilo geral
- Apresentar o que foi detectado antes de preencher o design-guide:
  > "Vi no seu site: fundo [cor], destaque em [cor], tipografia sem serifa. Bate com a identidade que você usa em documento?"
- Ajustar conforme feedback e preencher `[Nome do Escritório] OS/Marca/design-guide.md`

**Se compartilhar imagens (logo, print de proposta antiga, etc.):**
- Pedir pro usuário colocar os arquivos na pasta `dados/` e informar os nomes
- Ler os arquivos como imagem
- Analisar cores, estilo, padrões visuais
- Apresentar o que foi detectado antes de preencher, igual ao fluxo de URL

**Se descrever em texto:**
- Usar a descrição diretamente pra preencher `[Nome do Escritório] OS/Marca/design-guide.md`

**Se ainda não tiver definido:**
- Preencher o `[Nome do Escritório] OS/Marca/design-guide.md` com campos em branco e orientações pra preencher depois
- Mencionar brevemente: "Sem problema, você preenche quando tiver. O Claude usa um visual neutro de documento técnico até lá."

**Logo (perguntar em todos os casos acima):**

Após resolver cores e estilo, perguntar:

> "Tem o logo do escritório em PNG ou SVG? Se tiver, joga na pasta `dados/` e me diz o nome do arquivo (depois eu levo pra pasta `Marca/` do escritório). Se tiver uma versão pra fundo escuro e outra pra fundo claro, manda as duas."

- Se o usuário fornecer: preencher a seção **Logo** do `[Nome do Escritório] OS/Marca/design-guide.md` com o caminho do arquivo e a variação (se houver)
- Se não tiver logo: deixar a seção Logo em branco no design-guide

Essa parte cobre só o que aparece em documento de cliente (proposta, orçamento, contrato, relatório, link de acompanhamento de obra).

### Pergunta 6.5 — Identidade visual de marketing

"E pra conteúdo e redes sociais (Instagram, YouTube, site), você já tem uma identidade visual definida, ou usa a mesma do documento?"

Trate como pergunta padrão, não condicional: todo escritório que prospecta cliente novo acaba precisando de algum conteúdo (mesmo que seja só o Instagram do escritório), então vale perguntar sempre, não só se o usuário trouxer o assunto sozinho.

- **Se usa a mesma identidade do documento:** não duplica nada, só marca no `[Nome do Escritório] OS/Marca/design-guide.md` que a mesma paleta/logo vale pros dois usos.
- **Se tem uma identidade diferente pra conteúdo** (cores mais vivas, fonte diferente, tom mais informal): seguir o mesmo fluxo de coleta da Pergunta 6 (URL, imagem, descrição em texto, ou "ainda não tenho"), e preencher uma seção separada **Identidade de conteúdo** no `[Nome do Escritório] OS/Marca/design-guide.md`, pra não misturar com o que vale em documento técnico.
- **Se ainda não produz conteúdo:** perguntar se é algo que pretende estruturar (isso ajuda a decidir se a pasta `conteudo/` entra na estrutura de pastas do passo 6, ou se fica de fora até o escritório realmente precisar dela).

### Pergunta 7
"Como você prefere que o Claude escreva pros seus textos? O que mais incomoda em textos gerados por IA?"

*(Exemplos: "direto, sem enrolação, sem bullet points desnecessários" / "odeio travessão e 'mergulhe de cabeça'" / "pode ser mais técnico com arquiteto, mais simples com o cliente final")*

### Pergunta 8
"Tem equipe no escritório ou é você que toca tudo?"

*(Pode mencionar sócio, estagiário, parceiro técnico, freelas se tiver)*

---

## Bloco: Estrutura de pastas do escritório

A partir daqui, as perguntas servem pra montar a estrutura de pastas real do aluno: uma pasta raiz com o nome do escritório (ex. `Nome do Escritório OS/`), e dentro dela uma subpasta por frente de trabalho, cada uma com sua própria pergunta. Continue em conversa natural, uma pergunta de cada vez.

Introduza o bloco com uma frase curta:

> "Agora vou te perguntar sobre cada parte do escritório pra montar a pasta certa pra cada uma."

### Pergunta 9 — Projetos
"Você já tem algum projeto rodando, ou algum projeto antigo que queira deixar guardado numa pasta central?"

Explicar que essa pasta não é só arquivo técnico:

> "Essa pasta também serve pra guardar a conversa de WhatsApp com o cliente e a gravação de reunião relacionada a cada projeto, não só o arquivo de cálculo ou desenho."

Se o usuário citar um projeto específico (em andamento ou antigo), anotar o nome pra criar a subpasta dele dentro de `Projetos/`.

### Pergunta 10 — Marca
Essa pergunta complementa o que já foi coletado nas Perguntas 6 e 6.5 (cores, logo, identidade de documento e de conteúdo). Aqui o objetivo é só organizar o que o usuário já tem dentro da pasta `Marca/` do escritório, e cobrir o caso de quem ainda não sabe definir as cores.

"Você tem o logo e as cores do escritório já definidos? Se tiver, me manda o que já existe que eu guardo tudo dentro da pasta `Marca/`."

Seguir o mesmo padrão de recebimento de arquivo já usado na Pergunta 6 (arquivo em `dados/`, ou descrever em texto mesmo).

**Se o usuário mandar o logo**, perguntar também pela tipografia:

> "E a fonte que você usa em documento ou no logo, tem alguma definida? Pode me dizer o nome dela, ou mandar um exemplo de onde ela aparece."

**Se o usuário não souber a fonte**, deixar em aberto sem travar o resto do setup:

> "Sem problema, deixa em branco por enquanto, você define isso depois e eu atualizo o `Marca/design-guide.md` quando tiver."

Preencher o campo de tipografia do `design-guide.md` com o que for informado, ou deixar como pendência comentada se o usuário não souber ainda.

**Se o usuário não sabe definir as cores do escritório** (disse "não tenho definido" ou só tem uma ideia vaga), oferecer:

> "Se você não tem certeza das cores, pode me mandar uma referência, uma foto, um link de algo que você gosta, ou um print, que eu avalio e monto uma paleta próxima disso."

Seguir o mesmo padrão de recebimento de arquivo (arquivo em `dados/`, link via WebFetch, ou descrição em texto).

### Pergunta 11 — Site
"Você já tem um site do escritório? Pretende reformular ele, ou ainda não tem nenhum?"

Em seguida:

"E sobre hospedagem e domínio: já tem contratado, com qual provedor, ou ainda não tem nada disso?"

Conforme a resposta:
- **Se planeja reformular ou criar site e ainda não tem hospedagem/domínio resolvido, ou tem mas o site ainda não está no ar:** anotar em `tarefas.md` uma próxima atividade de conectar a hospedagem via FTP, mencionando que a skill `deploy-hostinger` já existe pra isso quando o aluno estiver pronto pra subir o site.
- **Se já tem site no ar e não pretende mexer por enquanto:** só registrar o status em `_contexto/empresa.md`, sem gerar tarefa.

### Pergunta 12 — Conteudo
"Quais redes sociais você usa ou pretende usar pro escritório? Instagram, YouTube, LinkedIn, alguma outra?"

Em seguida:

"E qual é o objetivo com isso? Atrair cliente novo, construir autoridade técnica, documentar obra, ou outra coisa?"

Conforme a resposta:
- **Se o usuário já tem perfil ativo numa rede:** pedir pra ele mandar um print do Instagram (ou da rede que usar) pra guardar como referência, seguindo o mesmo padrão de receber arquivo em `dados/` já usado na Pergunta 6.
- **Se ainda não tem perfil ativo:** só registrar a intenção, sem pedir print.

### Pergunta 13 — Gestao
"Quer que eu já crie uma pasta de Gestão aqui?"

Explicar o propósito:

> "É onde vai morar o aplicativo de gestão do escritório: orçamento, contrato e projeto no mesmo fluxo. O Módulo 2 do curso instala o CRM direto dentro dela."

- **Se sim:** criar a pasta (vazia, com README).
- **Se não, ou "ainda não"**: não criar agora, mencionar que pode ser criada a qualquer momento quando o aluno chegar no Módulo 2.

### Pergunta 14 — Estudos
"Você já tem algum curso, arquivo no Notion ou outro app, Word, PDF de estudo, pós-graduação feita ou em andamento, ou alguma norma técnica que você consulta com frequência?"

Conforme a resposta, criar uma subpasta dentro de `Estudos/` pra cada curso, pós ou norma que o usuário mencionar, nomeada com o nome real dele (não usar nomes genéricos tipo "curso1" ou "pos-graduacao"). Se o usuário não citar nada no momento, não criar `Estudos/` ainda, deixar como pendência fácil de criar depois.

### Pergunta 15 — Portfolio
"Você já tem um portfólio, material que mostra projeto entregue pra apresentar pra cliente, arquiteto ou construtora? E pretende reformular ele?"

Ampliar o escopo um pouco além de portfólio em sentido estrito:

> "Também vale guardar aqui qualquer outro material de marketing e divulgação dos serviços do escritório, apresentação comercial, deck, qualquer coisa que você usa pra se vender."

- **Se já tiver algum material desses:** pedir pra ele colocar o arquivo em `dados/` e informar o nome, mesmo padrão já usado nas Perguntas 6, 10 e 12.
- **Se ainda não tiver:** só registrar a intenção, sem pedir arquivo.

### Pergunta 16 — Pergunta final
"Tem mais alguma pasta que você ache interessante criar além dessas?"

Criar conforme o usuário descrever, seguindo o mesmo padrão de README curto nas pastas maiores que ele pedir.

---

## Processamento das respostas

Com todas as respostas, detecte o perfil principal:

**Perfis possíveis:**
- `escritorio-tecnico` — engenheiro ou arquiteto solo, ou escritório técnico pequeno, atende clientes externos (arquitetos, construtoras, pessoa física, órgão público) com projeto/cálculo/laudo como entrega central
- `agencia` — atende múltiplos clientes, tem processos de entrega recorrentes fora do escopo técnico de engenharia
- `freelancer` — trabalha solo, vende serviço próprio, não necessariamente técnico de projeto
- `empresa` — escritório maior com equipe organizada por setores (técnico, comercial, administrativo)
- `profissional-clt` — usa pra produtividade pessoal e carreira, sem operação de clientes própria

*(Um perfil pode ter características de outro, use o que melhor descreve o uso principal. Pra quem respondeu com entregas de projeto estrutural/arquitetônico, cálculo, memorial ou laudo e atende clientes externos, `escritorio-tecnico` é o padrão)*

---

## O que gerar

### 1. Atualizar `AGENTS.md` na raiz

O conteúdo real do contexto fica em `AGENTS.md` (funciona tanto com Claude Code quanto com outros agentes); `CLAUDE.md` na raiz é só um ponteiro de uma linha (`@AGENTS.md`), se ainda não existir, criar os dois.

Substitua o conteúdo placeholder pelo AGENTS.md real do usuário:

```markdown
# [Nome do Escritório] — Sistema do Escritório

## O que é esse workspace
[uma ou duas frases descrevendo o que essa pasta representa pro escritório do usuário]

**Estrutura de pastas:**
[lista das pastas criadas e o que vai em cada uma, gerada conforme o perfil detectado]

## Sobre o escritório
[descrição em 2-4 linhas com o que foi dito: tipo de projeto, região, CREA/CAU se mencionado]

## O que mais fazemos aqui
[lista das principais entregas: propostas, orçamentos, contratos, memoriais, projetos, acompanhamento]

## Clientes e contexto
[quem atende, externo ou interno, tamanho e tipo de obra]

## Tom de voz
[como escrever, o que evitar, exemplos se mencionou]

## Ferramentas conectadas
[lista das ferramentas que usa, atualizar conforme MCPs forem instalados]

---

## Contexto do negócio

No início de toda conversa, ler os seguintes arquivos (se existirem e estiverem configurados):

1. `_contexto/empresa.md` — quem é o usuário, o que faz, como funciona o escritório
2. `_contexto/preferencias.md` — tom de voz, estilo de escrita, o que evitar
3. `_contexto/estrategia.md` — foco atual, prioridades, o que pode esperar

Usar essas informações como base pra qualquer resposta ou decisão. Ao sugerir prioridades, formatos ou abordagens, considerar o foco atual descrito em `estrategia.md`.

Pra qualquer documento de cliente (proposta, orçamento, contrato, relatório), consultar `[Nome do Escritório] OS/Marca/design-guide.md` como referência de estilo.

Não é necessário listar o que foi lido nem confirmar a leitura. Apenas usar o contexto naturalmente.

---

## Fluxo de trabalho

Antes de executar qualquer tarefa, verificar se existe uma skill relevante em `.claude/skills/` ou `.claude/commands/`.
Se encontrar, seguir as instruções da skill.
Se não encontrar, executar a tarefa normalmente.

Ao concluir uma tarefa que não tinha skill mas parece repetível (o usuário provavelmente vai pedir de novo no futuro, ex. montar outro memorial parecido, responder outra objeção de prospecção parecida), perguntar:

> "Isso pode virar uma skill pra próxima vez. Quer que eu crie?"

Não perguntar pra tarefas pontuais ou perguntas simples. Só quando o padrão de repetição for claro.

---

## Aprender com correções

Quando o usuário corrigir algo, melhorar uma resposta ou dar uma instrução que parece permanente (frases como "na verdade é assim", "não faça mais isso", "prefiro assim", "sempre que...", "evita...", "da próxima vez..."), perguntar:

> "Quer que eu salve isso pra não precisar repetir?"

Se sim, identificar onde faz mais sentido salvar:

- **Sobre o escritório** (quem são os clientes, como funciona o fluxo, serviços, região de atuação) → adicionar em `_contexto/empresa.md`
- **Sobre preferências e estilo** (tom de voz, formato de resposta, o que evitar) → adicionar em `_contexto/preferencias.md`
- **Sobre prioridades e foco atual** (projetos em andamento, metas do momento, prazos) → adicionar em `_contexto/estrategia.md`
- **Regra de comportamento nessa pasta** (onde salvar arquivos, como nomear, fluxos específicos) → adicionar no próprio `AGENTS.md`

Salvar com uma linha nova clara, sem reformatar o arquivo inteiro. Confirmar o que foi salvo mostrando a linha adicionada.

Não perguntar se a correção for óbvia de contexto imediato. Só perguntar quando a informação tiver valor duradouro.

---

## Manter contexto atualizado

Ao terminar uma tarefa que mudou algo relevante no projeto (novo cliente, novo processo, ferramenta instalada, estrutura de pastas alterada), perguntar:

> "Isso mudou algo no teu contexto. Quer que eu atualize os arquivos de memória?"

Se sim, identificar o que precisa atualizar:

- **Novo cliente, serviço, ferramenta, equipe** → `_contexto/empresa.md`
- **Mudança de prioridade ou foco** → `_contexto/estrategia.md`
- **Correção de tom ou estilo** → `_contexto/preferencias.md`
- **Nova pasta, regra de organização, skill criada** → `AGENTS.md`
- **Mudança visual (cores, fontes, logo de documento)** → `[Nome do Escritório] OS/Marca/design-guide.md`

Mostrar o que vai mudar antes de salvar. Não reformatar o arquivo inteiro, só adicionar ou editar a linha relevante.

**Quando NÃO perguntar:**
- Tarefas pontuais que não mudam o contexto (ex: escrever um orçamento avulso)
- Perguntas simples ou conversas sem ação
- Mudanças que já foram salvas pelo bloco "Aprender com correções"

---

## Criação de skills

Quando o usuário pedir pra criar uma nova skill de engenharia (ex. padrão de memorial, checklist de entrega, roteiro de prospecção):

1. Perguntar: "Essa skill é específica desse escritório ou vai ser útil em qualquer projeto?"
   - Específica desse escritório → salvar em `.claude/skills/nome-da-skill/SKILL.md` (local)
   - Útil em qualquer projeto → salvar em `~/.claude/skills/nome-da-skill/SKILL.md` (global)
2. Ler `_contexto/empresa.md` e `_contexto/preferencias.md` pra calibrar o conteúdo da skill ao contexto do escritório
3. Se a skill precisar de arquivos de apoio (modelos, planilhas de referência, exemplos de cláusula), criar dentro da pasta da skill
4. Seguir o fluxo da skill-creator nativa do Claude Code
```

### 2. Criar `_contexto/empresa.md`

```markdown
# Contexto do Escritório — [Nome]

**Nome:** [nome do usuário]
**Escritório:** [nome do escritório]
**O que faz:** [descrição: tipo de projeto, sistema estrutural ou especialidade, região de atuação]
**Perfil:** [escritorio-tecnico / agencia / freelancer / empresa / profissional-clt]
**Atende clientes:** [sim/não/ambos, tipo: arquitetos, construtoras, pessoa física, órgão público]
**Equipe:** [solo / com equipe, detalhe se mencionou]
**Registro profissional:** [CREA/CAU, se mencionado]
**Ferramentas:** [lista]
**Principais entregas:** [lista do que mais produz: proposta, orçamento, contrato, memorial, projeto, acompanhamento]

## Contexto adicional
[qualquer informação relevante que surgiu nas respostas]
```

### 3. Criar `_contexto/estrategia.md`

```markdown
# Foco Atual — [Nome]

## Fase
[Em que fase o escritório está agora, estruturando o fluxo comercial, crescendo a carteira, formalizando processo, etc]

## Prioridade principal
[O que foi dito como foco principal agora]

## O que pode esperar
[O que não é prioridade no momento, ajuda o Claude a não sugerir fora de hora]

## Contexto com prazo
[Datas ou eventos relevantes mencionados, se houver: entrega de projeto, prazo de proposta, etc]

---
*Atualize esse arquivo quando suas prioridades mudarem.*
```

### 4. Criar `_contexto/preferencias.md`

```markdown
# Preferências de Comunicação

## Tom de voz
[como o Claude deve escrever pros outputs desse usuário: proposta, e-mail, mensagem de prospecção]

## O que evitar
[lista do que incomoda, palavras proibidas, construções a evitar]

## Estilo geral
[formal/informal, curto/longo, com/sem bullet points, mais técnico com colega engenheiro/arquiteto, mais simples com cliente final]

## Preferências adicionais
[qualquer outra preferência mencionada]
```

### 5. Pré-preencher `[Nome do Escritório] OS/Marca/design-guide.md`

Esse arquivo mora dentro da pasta `Marca/` criada no passo 6, junto com o logo. Gerar a pasta (passo 6) antes de preencher este arquivo, mesmo que a numeração venha antes na lista.

Esse guia aqui é enxuto de propósito: serve pra calibrar documento de cliente (proposta, orçamento, contrato, relatório técnico, link de acompanhamento de obra), não pra feed de rede social. Se o usuário descreveu cores e estilo, preencha com o que foi dito. Se não tem identidade definida, preencha com campos em branco e um comentário orientando como preencher depois.

Campos a cobrir, seção **Identidade de documento**:
- Cores (principal e de destaque, se tiver)
- Tipografia (se usa alguma fonte específica em documento)
- Logo (caminho do arquivo, variação clara/escura)
- Dados de assinatura (nome completo, registro CREA/CAU, cargo) pra constar em proposta/contrato

Se a Pergunta 6.5 trouxer identidade de conteúdo diferente da de documento, criar também uma seção **Identidade de conteúdo**, com os mesmos campos (cor, tipografia, logo) só que calibrados pro uso em rede social/site. Se o usuário respondeu que usa a mesma identidade dos dois casos, não duplicar, só anotar isso no topo da seção de documento ("vale também pra conteúdo").

Em ambos os casos, manter este aviso no topo do arquivo (logo abaixo do título):

```
> Você pode editar esse arquivo a qualquer momento.
> As skills de proposta, orçamento e contrato leem a seção de Identidade de documento antes de gerar qualquer documento.
> Skills de conteúdo (se o escritório usar) leem a seção de Identidade de conteúdo.
```

### 6. Escolher estrutura de pastas

Antes de criar qualquer pasta, **mostrar ao usuário o que você pensou** e deixar ele ajustar.

Pra perfil `escritorio-tecnico` (o padrão esperado neste curso), a estrutura não é mais uma lista fixa: ela é montada com base nas respostas do bloco **Estrutura de pastas do escritório** (Perguntas 9 a 16). Tudo mora dentro de uma pasta raiz com o nome do escritório informado na Pergunta 1 (ex. `Nome do Escritório OS/`), com uma subpasta por frente de trabalho. Pra outros perfis, seguir os templates de referência mais abaixo.

Depois de coletar as respostas do bloco, apresentar o resumo antes de criar:

> "Com base no que você me contou, vou montar essa estrutura dentro de `[Nome do Escritório] OS/`:
>
> ```
> [lista de pastas que serão criadas, já refletindo o que foi dito em cada pergunta]
> ```
>
> Quer ajustar alguma coisa antes de eu criar?"

**Estrutura do escritório técnico (padrão deste curso):**

```
[Nome do Escritório] OS/
  Projetos/
    README.md
    <subpasta por projeto citado na Pergunta 9>
  Marca/
    README.md
  Site/
    README.md
  Conteudo/
    README.md
  Gestao/              # só se a Pergunta 13 for "sim"
    README.md
  Estudos/             # só se a Pergunta 14 trouxer algum curso/pós/norma
    README.md
    <subpasta por curso/pós/norma citado, nomeada de verdade>
  Portfolio/
    README.md
MAPA-DE-PASTAS.md
```

Regras de criação por subpasta:

- **`Projetos/`** — sempre criada. Se o usuário citou um projeto específico na Pergunta 9, criar a subpasta dele já com esse nome. Deixar claro no README que a pasta aceita arquivo técnico, conversa de WhatsApp e gravação de reunião do mesmo projeto, tudo junto.
- **`Marca/`** — sempre criada. É onde o arquivo de logo e as referências de cor coletadas nas Perguntas 6, 6.5 e 10 vão fisicamente morar (se o usuário já tinha mandado o logo antes da Pergunta 10, mover/salvar o arquivo pra dentro dessa pasta agora), junto com o `design-guide.md` (passo 5), que agora vive dentro dela em vez de na raiz do workspace.
- **`Site/`** — sempre criada. README resume status do site, hospedagem e domínio coletados na Pergunta 11. Se ficou pendência de conectar FTP, isso vai pra `tarefas.md`, não pro README (README é estático, descreve a pasta; tarefas.md é a lista viva de pendências).
- **`Conteudo/`** — sempre criada. Guarda os prints de referência pedidos na Pergunta 12, se houver.
- **`Gestao/`** — condicional: só criar se a resposta da Pergunta 13 for afirmativa. Fica vazia até o aluno chegar no Módulo 2 do curso.
- **`Estudos/`** — condicional: só criar se a Pergunta 14 trouxer pelo menos um curso, pós ou norma citado. Cada um vira uma subpasta com o nome real (nunca nome genérico).
- **`Portfolio/`** — sempre criada. Guarda o material de portfólio (projetos entregues pra mostrar a cliente/arquiteto/construtora) e também apresentação comercial, deck ou qualquer material de divulgação dos serviços do escritório, coletados na Pergunta 15.
- **Pastas extras da Pergunta 16** — criar conforme descrito, com README se for uma pasta grande (mesmo padrão das demais).

Gerar um `README.md` curto dentro de cada subpasta maior (`Projetos/`, `Marca/`, `Site/`, `Conteudo/`, `Gestao/`, `Estudos/`, `Portfolio/`), explicando o que vai ali e como usar no dia a dia. Modelo de referência pra cada uma:

**`Projetos/README.md`**
```markdown
# Projetos

Uma pasta por projeto, em andamento ou arquivado. Guarda não só o arquivo técnico (projeto, memorial, planilha de quantitativo), mas também a conversa de WhatsApp com o cliente e a gravação de reunião relacionada àquele projeto, pra manter o histórico inteiro num lugar só.

Ao começar um projeto novo, crie uma subpasta com o nome do cliente ou do projeto.
```

**`Marca/README.md`**
```markdown
# Marca

Logo do escritório e as variações que você já usa no dia a dia (fundo claro, fundo escuro, versão quadrada pra ícone ou avatar de rede social).

A paleta de cor e a tipografia usadas em documento e conteúdo ficam descritas em texto no `design-guide.md`, aqui dentro desta mesma pasta.
```

**`Site/README.md`**
```markdown
# Site

Status do site institucional do escritório: se já existe, se está em reformulação, e os dados de hospedagem e domínio (provedor contratado, se houver). Quando estiver pronto pra subir ou atualizar o site, a skill `deploy-hostinger` cuida do deploy via FTP.
```

**`Conteudo/README.md`**
```markdown
# Conteudo

Redes sociais que o escritório usa ou pretende usar, os objetivos por trás da criação de conteúdo, e referências salvas (print de perfil, post que serviu de inspiração). Comece aqui antes de criar a primeira peça.
```

**`Gestao/README.md`**
```markdown
# Gestao

Aqui mora o aplicativo de gestão do escritório, instalado pelo Módulo 2 do curso: orçamento, contrato e projeto no mesmo fluxo, com CRM próprio. Antes do Módulo 2, essa pasta fica vazia.
```

**`Estudos/README.md`**
```markdown
# Estudos

Curso, pós-graduação, norma técnica ou qualquer material de estudo que você consulta com frequência. Cada subpasta leva o nome real do curso, pós ou norma, criada conforme você for adicionando material novo.
```

**`Portfolio/README.md`**
```markdown
# Portfolio

Material que mostra projeto entregue, pra apresentar pra cliente, arquiteto ou construtora: fotos de obra, render, página de portfólio. Também guarda apresentação comercial, deck e qualquer material de divulgação dos serviços do escritório.
```

Estruturas padrão por outro perfil (referência, quando o aluno não se encaixa em `escritorio-tecnico`):

**Agência / freelancer:**
```
clientes/
  _modelo-cliente/
    briefing.md
    proposta.html
briefings/
propostas/
conteudo/
tarefas.md
```

**Empresa (por setor):**
```
tecnico/
  projetos/
comercial/
  propostas/
administrativo/
  financeiro/
operacoes/
dados/
tarefas.md
```

**Profissional / carreira:**
```
trabalho/
  projetos/
  reunioes/
anotacoes/
curriculo/
tarefas.md
```

### 7. Recomendar MCPs e ferramentas

Cruzar com as ferramentas que o usuário citou na Pergunta 5, priorizando os conectores que sustentam a operação do escritório, não os de criação de conteúdo:

- **Gmail** — ler e responder e-mail de cliente/arquiteto/construtora direto do Claude. Comando: `claude mcp add gmail -- npx -y @gongrzhe/server-gmail-autoauth-mcp`
- **Google Calendar** — agendar reunião de apresentação de proposta, prazo de entrega. Comando: `claude mcp add google-calendar -- npx -y @cocal/google-calendar-mcp`
- **Google Drive** — ler briefing, projeto de referência, planilha de orçamento que já mora no Drive. Comando: `claude mcp add google-drive -- npx -y @isaacphi/mcp-gdrive`
- **Notion** — se o usuário já usa Notion como base de clientes ou tarefas. Comando: `claude mcp add notion -- npx -y @notionhq/notion-mcp-server`

Confirme o nome exato do pacote antes de rodar o comando (os conectores MCP mudam de versão com frequência), ou oriente o usuário a buscar "[ferramenta] MCP" se o comando acima não funcionar mais.

Não ofereça por padrão conectores de publicação em rede social (ex. publicação/agendamento de post, Canva) nesse perfil: eles só entram se o próprio usuário disser que também toca uma frente de conteúdo ativa.

Para cada ferramenta relevante que o usuário usa e que tem um MCP ou conector disponível no catálogo:
- Mostrar o que o conector faz
- Mostrar o comando de instalação
- Perguntar se quer instalar agora

Exemplo:

> "Vi que você usa Gmail pra falar com cliente. Tem um conector que deixa o Claude ler e responder e-mail direto. Quer que eu instale?"

Se o usuário aceitar, rodar o comando de instalação do MCP.
Se preferir depois, anotar em `tarefas.md`:

```
## MCPs pra instalar depois
- [ ] Gmail — `claude mcp add gmail -- npx -y @gongrzhe/server-gmail-autoauth-mcp`
```

Se o usuário mencionar uma ferramenta que não está no catálogo (comum em engenharia: software de cálculo, CRM próprio), informar:

> "Não tenho um conector pronto pra [ferramenta], mas isso normalmente funciona bem como arquivo local que o Claude lê direto (planilha, PDF, DXF) em vez de precisar de um MCP. Se depois você achar que existe um MCP pra ela, me passa que eu instalo."

### 8. Instalar a skill de manutenção `atualizar`

Essa skill já nasce instalada junto com o setup, sem o aluno precisar clonar um segundo repositório. Criar o arquivo `.claude/skills/atualizar/SKILL.md` no workspace do aluno com o conteúdo completo abaixo (copiar exatamente, sem adaptar nada ao perfil do usuário, a skill já é genérica):

```markdown
---
name: atualizar
description: >
  Varredura completa pra sincronizar o AGENTS.md e os arquivos de contexto
  do escritório com o estado real do workspace (pastas, skills instaladas,
  MCPs conectados, mudanças recentes). Use quando o aluno chamar
  /atualizar, ou disser "atualiza o contexto", "roda uma varredura",
  "será que o AGENTS.md está desatualizado", ou sempre que o indicador de
  contexto restante do Claude Code estiver ficando baixo numa conversa longa,
  antes do auto-compactamento acontecer.
---

# /atualizar — Manutenção de Contexto do Escritório

Este é um comando para sincronizar a documentação do escritório com o estado real dele, e também pra não perder informação importante de uma conversa longa antes do sistema resumir sozinho (auto-compactamento). Quanto mais cedo rodar, antes do indicador de contexto restante chegar perto do fim, melhor: o resumo automático guarda só o essencial, e o que não foi salvo em arquivo até lá se perde. O processo ocorre em cinco etapas:

**Levantamento do estado atual:** Lista a estrutura de pastas do escritório (`[Nome do Escritório] OS/Projetos/`, `Marca/`, `Site/`, `Conteudo/`, `Gestao/`, `Estudos/`, `Portfolio/`, e qualquer subpasta de cliente, proposta, orçamento ou contrato que já exista), skills instaladas (`.claude/skills/` e `~/.claude/skills/`), MCPs conectados, arquivos recentemente modificados e mudanças não commitadas (se o workspace usar Git).

**Leitura dos arquivos de contexto:** Examina `AGENTS.md` (ou `CLAUDE.md`, se for o arquivo principal usado), `_contexto/empresa.md`, `_contexto/estrategia.md`, `_contexto/preferencias.md` e `[Nome do Escritório] OS/Marca/design-guide.md`, focando no que cada um deveria registrar: quem é o escritório e o que entrega, foco atual, tom de voz e identidade visual de documento.

**Comparação:** Verifica se as pastas, skills e ferramentas documentadas no `AGENTS.md` correspondem à realidade do workspace; identifica cliente novo, projeto novo, ferramenta conectada ou skill criada que ainda não apareceu nos arquivos de contexto; identifica também decisões ou correções importantes que surgiram na conversa atual e ainda não foram salvas em nenhum arquivo.

**Diagnóstico:** Apresenta um relatório estruturado mostrando o que está em dia, o que precisa atualização e o que falta configurar. Se a varredura foi disparada por causa do indicador de contexto restante (e não por pedido direto do aluno), avisar isso na abertura do relatório, ex. "Rodando antes do resumo automático, pra não perder o que decidimos nessa conversa."

**Aplicação de correções:** Propõe mudanças específicas para aprovação do aluno, alterando apenas as linhas relevantes de cada arquivo, sem reformatar documentos inteiros.

**Princípios:** Não inventa informação que não apareceu no workspace nem na conversa. Questiona em caso de dúvida em vez de assumir. Respeita a preferência do aluno sobre aprovar cada mudança antes de salvar. Evita atualizações desnecessárias em workspaces recém-configurados (ex. logo depois de rodar o setup inicial).
```

### 9. Gerar `MAPA-DE-PASTAS.md` na raiz do workspace do aluno

Último arquivo a ser gerado, depois que toda a estrutura de pastas (seção 6) já estiver criada. Funciona como índice único: quem abrir o projeto pela primeira vez entende rápido onde fica cada coisa, sem precisar abrir pasta por pasta.

Listar só o que foi realmente criado (pular `Gestao/` ou `Estudos/` se não entraram, incluir qualquer pasta extra da Pergunta 16), com uma linha explicando o propósito de cada uma. Modelo:

```markdown
# Mapa de Pastas — [Nome do Escritório]

Índice rápido de onde fica cada coisa nesse workspace. Atualize essa lista sempre que criar ou renomear uma pasta grande.

## [Nome do Escritório] OS/
- `Projetos/` — projeto em andamento ou arquivado, junto com conversa de WhatsApp e gravação de reunião de cada um
- `Marca/` — logo, variações, referência de cor do escritório e o `design-guide.md` que as skills leem pra gerar documento e conteúdo
- `Site/` — status do site institucional, hospedagem e domínio
- `Conteudo/` — redes sociais, objetivos de conteúdo e referências salvas
- `Gestao/` — aplicativo de gestão do escritório (Módulo 2 do curso) [incluir só se criada]
- `Estudos/` — [listar as subpastas reais criadas, ex. "NBR 6118, Pós em Estruturas de Concreto"] [incluir só se criada]
- `Portfolio/` — material de portfólio e divulgação dos serviços do escritório
[demais pastas da Pergunta 16, se houver]

## Fora da pasta do escritório
- `_contexto/` — quem você é, foco atual e preferências de tom, lido no início de toda conversa
- `dados/` — arquivos soltos pra análise (imagem, planilha, print)
- `tarefas.md` — pendências e próximos passos anotados pelo sistema
```

Esse arquivo só se aplica (nesse formato) ao perfil `escritorio-tecnico`. Pra outros perfis, adaptar a lista de pastas pro template que foi efetivamente usado.

---

## Mensagem final

Após gerar todos os arquivos, envie uma mensagem de encerramento:

> "[Nome], seu sistema tá configurado.
>
> Aqui está o que foi criado:
> - AGENTS.md — o Claude agora sabe quem você é, o que seu escritório entrega e onde fica cada coisa
> - _contexto/ — escritório, preferências e foco atual salvos
> - `[Nome do Escritório] OS/` — estrutura de pastas completa (Projetos, Marca, Site, Conteudo[, Gestao][, Estudos], Portfolio), cada uma com seu README, e a identidade visual em `Marca/design-guide.md` [preenchida / pronta pra preencher]
> - MAPA-DE-PASTAS.md — índice de tudo que foi criado, pra não se perder na estrutura
> - [N] MCPs instalados / [N] anotados pra instalar depois
> - `/atualizar` já instalado — use antes do indicador de contexto restante zerar numa conversa longa, pra não perder decisão importante no resumo automático
>
> **Duas coisas importantes antes de continuar:**
>
> 1. Se você tiver chaves de API, guarde sempre num arquivo chamado `.env`, ele já está protegido e nunca vai ser enviado pro GitHub por engano.
>
> 2. Pra não perder seu trabalho, conecte esse workspace ao GitHub assim que possível. Leva poucos minutos e depois o sistema salva automaticamente.
>
> **Próximo passo:** o módulo 2 do curso instala o CRM do escritório (orçamento, contrato e projeto no mesmo fluxo) em cima dessa base, e o módulo 3 te mostra como criar a primeira skill de engenharia específica do seu jeito de trabalhar."

---

## Regras

- Tom direto e humano, sem excesso de entusiasmo
- Não use listas com bullet points nas perguntas, faça em conversa
- Se o usuário der respostas vagas, faz uma pergunta de acompanhamento antes de continuar
- Gera os arquivos todos de uma vez no final, não um a um durante as perguntas
- Após gerar, mostra a mensagem final resumida, não lista cada linha de cada arquivo
- Esse setup é sobre operação do escritório (cliente, proposta, projeto, prospecção). Fora do bloco **Estrutura de pastas do escritório** (Perguntas 9 a 16, que são perguntas padrão pra todo aluno, incluindo Marca, Site, Conteudo e Portfolio), não ofereça perguntas extras de conteúdo/marca pessoal, só se o usuário trouxer isso primeiro
- Nas perguntas de upload de arquivo (Perguntas 6, 10, 12 e 15), sempre seguir o mesmo padrão: arquivo em `dados/`, usuário informa o nome
