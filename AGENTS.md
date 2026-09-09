# AGENTS.md - willliam.dev

Site estático em Hugo usando o tema [Hextra](https://github.com/imfing/hextra), em `pt-br`.
Hextra foi escolhido por ser um tema de documentação: sidebar, busca embutida, cards,
callouts, tabs — sem precisar montar um portfólio "bonitão" do zero.

O objetivo deste arquivo é permitir que um agente de IA (ou eu mesmo, seis meses depois)
crie posts, docs e projetos sem eu precisar lembrar de frontmatter, estrutura de pasta ou
sintaxe de shortcode toda vez. **Ideia central: eu penso no conteúdo, o agente cuida do
scaffold.**

## Quick Reference

| Ação                          | Comando                                             |
| ------------------------------ | ---------------------------------------------------- |
| Servidor local (com drafts)    | `hugo server -D --disableFastRender`                |
| Build produção                 | `hugo --gc --minify`                                |
| Novo post de blog              | `./scripts/new.sh post "Título do post"`            |
| Nova doc/snippet                | `./scripts/new.sh doc "Título" [subseção/opcional]` |
| Novo projeto                   | `./scripts/new.sh project "Nome do projeto"`        |

Também dá pra rodar tudo isso via **Command Palette do VSCode → "Run Task"**
(veja `.vscode/tasks.json`).

## Project Structure

```
blog/
├── content/
│   ├── _index.md              # Home
│   ├── cv.md                  # Currículo
│   ├── contact.md             # Contato
│   ├── blog/
│   │   ├── _index.md          # Listagem do blog (Hextra blog layout)
│   │   └── <slug>/index.md    # Um post = um page bundle
│   ├── docs/
│   │   ├── _index.md          # Seção "Snippets" no menu — código da faculdade,
│   │   │                      #   dotfiles, configs do Omarchy/Linux, notas técnicas
│   │   └── <subseção>/<slug>/index.md
│   └── projects/
│       ├── _index.md          # Grid de cards apontando pros projetos
│       └── <slug>/index.md
├── archetypes/                # Templates de frontmatter (ver abaixo)
├── scripts/
│   └── new.sh                 # Scaffold de conteúdo novo
├── assets/css/                # Overrides de CSS do Hextra
├── i18n/                      # Strings traduzidas
├── static/                    # Imagens, favicon, etc.
├── .vscode/                   # Tasks e snippets do editor
├── hugo.yaml
└── go.mod / go.sum             # Hextra é importado como Hugo module
```

## Convenções de conteúdo

### Posts (`content/blog/`)

- Um post = uma pasta (page bundle): `content/blog/meu-post/index.md`.
  Isso permite colocar imagens do post na mesma pasta e referenciar com
  caminho relativo (`![alt](foto.png)`).
- Frontmatter mínimo (ver `archetypes/blog.md`):
  ```yaml
  ---
  title: "Título do post"
  date: 2026-09-07T14:30:00-03:00
  description: "Uma ou duas frases pra SEO e preview de link."
  tags:
    - hugo
  draft: true
  ---
  ```
- `draft: false` só quando for publicar de verdade.
- `description` importa: é o texto usado no preview de compartilhamento
  (Open Graph/Twitter Card) configurado no `hugo.yaml`.

### Docs / Snippets (`content/docs/`)

Esta é a seção "faz-tudo": código da faculdade, dotfiles, configs do Omarchy,
anotações de estudo. Uso o padrão de documentação do Hextra:

- Cada subárea vira uma subpasta com seu próprio `_index.md`
  (ex.: `content/docs/omarchy/_index.md`, `content/docs/faculdade/algoritmos/_index.md`).
- `weight` no frontmatter controla a ordem na sidebar (menor aparece primeiro).
- Frontmatter mínimo (ver `archetypes/docs.md`):
  ```yaml
  ---
  title: "Título"
  weight: 10
  description: "Do que se trata essa página."
  draft: true
  ---
  ```
- Sugestão de organização por assunto, não por data:
  ```
  content/docs/
  ├── omarchy/
  │   ├── _index.md
  │   ├── instalacao/index.md
  │   └── dotfiles/index.md
  ├── linux/
  │   └── _index.md
  └── faculdade/
      ├── _index.md
      └── algoritmos-e-estruturas/index.md
  ```

### Projetos (`content/projects/`)

- `content/projects/_index.md` deve conter um grid `{{< cards >}}` linkando pra
  cada projeto (veja o snippet `hcards` no VSCode — seção "Shortcodes" abaixo).
- Cada projeto é uma página própria em `content/projects/<slug>/index.md`,
  com frontmatter (ver `archetypes/projects.md`):
  ```yaml
  ---
  title: "Nome do projeto"
  date: 2026-09-07
  description: "O que o projeto faz, em uma frase."
  tags:
    - go
    - cli
  repo: "https://github.com/willliamdev/xxx"
  demo: ""
  draft: true
  ---
  ```

## Criando conteúdo novo

**Sempre usar `./scripts/new.sh`** em vez de criar arquivos/pastas na mão — ele:

1. Gera o slug a partir do título (removendo acentos, minúsculas, hifens).
2. Cria a pasta certa dentro de `content/<tipo>/...`.
3. Roda `hugo new`, que já aplica o archetype certo (Hugo escolhe o archetype
   pelo nome da seção — `blog`, `docs` ou `projects` — automaticamente).
4. Preenche a `date` e o `title` reais.
5. Abre o arquivo no VSCode (se o comando `code` estiver disponível no PATH).

```bash
./scripts/new.sh post "Migrando meu blog pra Hugo"
./scripts/new.sh doc "Configurando o Omarchy do zero" omarchy/instalacao
./scripts/new.sh project "Meu projeto de compiladores"
```

Depois disso, a única coisa que falta é escrever o corpo — sem se preocupar
com frontmatter ou onde o arquivo vai.

## Shortcodes do Hextra (referência rápida)

O tema já vem com esses shortcodes. Uso constante pra fugir do markdown puro
sem reinventar HTML. Também tem snippets no VSCode pra cada um (veja
`.vscode/willliamdev-blog.code-snippets` — digite o prefixo e dá Tab).

| Prefixo VSCode | Shortcode                                              | Uso                                   |
| --------------- | ------------------------------------------------------- | -------------------------------------- |
| `hcards`        | `{{< cards >}} {{< card ... >}} {{< /cards >}}`          | Grid de cards (usado em `projects`)    |
| `hcallout`      | `{{< callout type="info/warning/error" >}}...{{< /callout >}}` | Caixa de aviso/nota                |
| `htabs`         | `{{< tabs items="a,b" >}} {{< tab >}}...{{< /tab >}} {{< /tabs >}}` | Conteúdo em abas (ex: comandos por SO) |
| `hsteps`        | `{{< steps >}} ### Passo 1 ... {{< /steps >}}`           | Tutorial passo a passo                |
| `hfiletree`     | `{{< filetree/folder >}}...{{< /filetree/folder >}}`     | Árvore de arquivos (ótimo pra dotfiles) |
| `hicon`         | `{{< icon name="github" >}}`                             | Ícone inline                           |
| `hdetails`      | `<details><summary>...</summary>...</details>`           | Bloco expansível (bom pra código longo) |

Documentação completa: https://imfing.github.io/hextra/docs/guide/shortcodes/

## Configuração (`hugo.yaml`)

- Idioma: `pt-br` (`defaultContentLanguage`)
- `markup.goldmark.renderer.unsafe: true` — HTML cru é permitido no markdown
  (necessário pra alguns shortcodes/embeds custom).
- Menu principal já mapeia `/projects`, `/blog`, `/docs` (rotulado "Snippets"),
  `/cv`, `/contact` — novas seções de topo exigem entrada manual em
  `hugo.yaml > menu.main`.
- Hextra é importado como **Hugo Module** (`go.mod`), não como submódulo —
  `hugo mod get -u github.com/imfing/hextra` pra atualizar o tema.

## Gotchas

1. **Hugo Extended obrigatório** — o tema usa SCSS/Tailwind, o binário normal
   do Hugo não builda.
2. **Page bundles**: qualquer post/projeto com imagem própria deve ser uma
   pasta com `index.md` dentro (não um `.md` solto), senão as imagens
   relativas não resolvem.
3. **`draft: true` por padrão** nos archetypes — sempre lembrar de mudar pra
   `false` antes do build final de produção (`hugo` sem `-D` já ignora
   drafts, então em produção eles simplesmente não aparecem até você mudar).
4. **Ordem na sidebar de `docs`** é controlada por `weight`, não por nome de
   arquivo nem data.
5. **Nomes de seção = nomes de archetype**: se eu criar uma seção nova em
   `content/` (ex: `content/uses/`), preciso criar `archetypes/uses.md`
   também, senão o `hugo new` cai no `archetypes/default.md` genérico.

## Quando um agente for ajudar a escrever conteúdo

- Rodar `./scripts/new.sh` primeiro, nunca criar o arquivo/frontmatter na mão.
- Não inventar `tags` ou `description` fora do que eu pedir — perguntar ou
  deixar como placeholder se não tiver certeza.
- Preferir os shortcodes do Hextra (tabela acima) a HTML cru quando o
  conteúdo pedir (comparação por abas, aviso, passo a passo).
- Não mexer em `content/blog/_index.md`, `content/docs/_index.md` ou
  `content/projects/_index.md` além de adicionar um card novo em `projects`
  quando um projeto novo for criado — essas páginas são "índices", não posts.
- Não commitar com `draft: true` → `false` sem eu confirmar que o texto está
  pronto pra publicar.
