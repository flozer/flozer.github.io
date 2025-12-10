# Guia Completo: Decap CMS

> **Sistema de Gerenciamento de Conteúdo para criar posts de qualquer lugar**
> Implementado em: Dezembro 2025
> Autor: Fernando Lozer

---

## 📚 Índice

1. [O Que é o Decap CMS](#o-que-é-o-decap-cms)
2. [Como Funciona](#como-funciona)
3. [Arquitetura da Implementação](#arquitetura-da-implementação)
4. [Estrutura de Arquivos](#estrutura-de-arquivos)
5. [Configuração Detalhada](#configuração-detalhada)
6. [Como Usar](#como-usar)
7. [Autenticação](#autenticação)
8. [Workflow de Criação de Posts](#workflow-de-criação-de-posts)
9. [Upload de Imagens](#upload-de-imagens)
10. [Troubleshooting](#troubleshooting)
11. [Referências](#referências)

---

## O Que é o Decap CMS

### Visão Geral

**Decap CMS** (anteriormente conhecido como **Netlify CMS**) é um sistema de gerenciamento de conteúdo (CMS) **headless** e **open-source** que funciona com geradores de sites estáticos como Jekyll, Hugo, Next.js, etc.

### Por Que Implementamos?

**Problema:**
- Criar posts em Jekyll exige:
  - Acesso ao computador com ambiente configurado
  - Editor de código
  - Conhecimento de Git
  - Formatação manual de front matter YAML

**Solução: Decap CMS**
- ✅ Interface web acessível de qualquer lugar
- ✅ Editor visual de Markdown
- ✅ Funciona em mobile e desktop
- ✅ Commits automáticos no GitHub
- ✅ Preview antes de publicar
- ✅ Upload de imagens integrado

### Características Principais

| Característica | Descrição |
|---------------|-----------|
| **Git-based** | Todo conteúdo fica no Git (não precisa de banco de dados) |
| **Open Source** | Gratuito e código aberto |
| **Headless** | Separação entre conteúdo e apresentação |
| **Markdown** | Editor visual + código Markdown |
| **Mobile-friendly** | Interface responsiva |
| **Zero infraestrutura** | Arquivos estáticos hospedados no próprio site |

---

## Como Funciona

### Fluxo Simplificado

```
┌─────────────────┐
│   Você acessa   │
│ flozer.github.  │
│    io/admin     │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Faz login com  │
│     GitHub      │
│   (OAuth App)   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Interface do   │
│   Decap CMS     │
│   carrega no    │
│   navegador     │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Cria/edita     │
│  post usando    │
│  editor visual  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Clica "Publish" │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Decap CMS usa  │
│   GitHub API    │
│  para criar     │
│  commit         │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ GitHub Actions  │
│  faz deploy     │
│  automático     │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Post publicado │
│   no site!      │
└─────────────────┘
```

### Tecnologias Envolvidas

1. **Frontend (Interface)**
   - Decap CMS (JavaScript app)
   - Carrega via CDN: `unpkg.com/decap-cms@^3.0.0`
   - Renderiza em Single Page Application (SPA)

2. **Backend (Git)**
   - GitHub API para ler/escrever arquivos
   - OAuth para autenticação
   - Commits automáticos

3. **Conteúdo**
   - Arquivos Markdown em `_posts/`
   - Front matter YAML
   - Imagens em `assets/images/posts/`

---

## Arquitetura da Implementação

### Diagrama de Componentes

```
flozer.github.io/
│
├── admin/                          # 🆕 Decap CMS
│   ├── index.html                  # Interface do CMS
│   ├── config.yml                  # Configurações
│   └── README.md                   # Documentação de uso
│
├── assets/images/posts/            # 🆕 Imagens dos posts
│   └── .gitkeep                    # Mantém pasta no Git
│
├── _posts/                         # Posts (gerenciados pelo CMS)
│   ├── 2025-01-20-welcome.md
│   └── 2025-01-23-scripts-dax.md
│
├── _config.yml                     # Configuração Jekyll
└── docs/                           # Documentação
    └── decap-cms-guide.md          # 📖 Este arquivo
```

### Componentes Criados

#### 1. `admin/index.html`
```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="robots" content="noindex" />
  <title>Decap CMS - Admin</title>
</head>
<body>
  <script src="https://unpkg.com/decap-cms@^3.0.0/dist/decap-cms.js"></script>
</body>
</html>
```

**O que faz:**
- Carrega a biblioteca do Decap CMS via CDN
- Renderiza a interface completa do CMS
- Lê configurações de `config.yml`

**Meta tags importantes:**
- `robots: noindex` - Evita indexação por motores de busca
- `viewport` - Responsividade mobile

#### 2. `admin/config.yml`
Arquivo de configuração principal (detalhado na próxima seção)

#### 3. `assets/images/posts/`
Pasta dedicada para armazenar imagens dos posts criados via CMS

---

## Estrutura de Arquivos

### admin/index.html

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="robots" content="noindex" />
  <title>Decap CMS - Admin</title>
</head>
<body>
  <!-- Include the script that builds the page and powers Decap CMS -->
  <script src="https://unpkg.com/decap-cms@^3.0.0/dist/decap-cms.js"></script>
</body>
</html>
```

**Características:**
- Página HTML mínima
- Carrega Decap CMS da CDN oficial
- Versão `^3.0.0` (compatibilidade com versões 3.x)

---

## Configuração Detalhada

### admin/config.yml - Análise Completa

```yaml
# ============================================
# BACKEND - Configuração do GitHub
# ============================================
backend:
  name: github                      # Tipo: GitHub (também suporta GitLab, Bitbucket)
  repo: flozer/flozer.github.io     # Seu repositório
  branch: main                      # Branch onde posts serão salvos

# ============================================
# MÍDIA - Upload de Imagens
# ============================================
media_folder: "assets/images/posts"   # Pasta física onde imagens são salvas
public_folder: "/assets/images/posts" # URL pública para acessar as imagens

# ============================================
# PUBLICAÇÃO
# ============================================
publish_mode: editorial_workflow      # Permite rascunhos antes de publicar
                                     # Opcões: simple | editorial_workflow

# ============================================
# LOCALIZAÇÃO
# ============================================
locale: pt                           # Interface em Português

# ============================================
# COLLECTIONS - Tipos de Conteúdo
# ============================================
collections:
  # --------------------------------------------
  # POSTS DO BLOG
  # --------------------------------------------
  - name: "posts"                    # Identificador interno
    label: "Posts"                   # Nome exibido na interface
    folder: "_posts"                 # Pasta onde posts são salvos
    create: true                     # Permite criar novos posts
    slug: "{{year}}-{{month}}-{{day}}-{{slug}}" # Formato do nome do arquivo
    editor:
      preview: true                  # Habilita preview ao vivo

    # Campos do Post
    fields:
      # Layout (oculto, valor fixo)
      - {
          label: "Layout",
          name: "layout",
          widget: "hidden",
          default: "post"
        }

      # Título
      - {
          label: "Título",
          name: "title",
          widget: "string"
        }

      # Data de Publicação
      - {
          label: "Data de Publicação",
          name: "date",
          widget: "datetime",
          format: "YYYY-MM-DD HH:mm:ss ZZ",
          date_format: "DD/MM/YYYY",
          time_format: "HH:mm"
        }

      # Categorias (lista)
      - {
          label: "Categorias",
          name: "categories",
          widget: "list",
          required: false,
          hint: "Ex: Power BI, Scripts"
        }

      # Tags (lista)
      - {
          label: "Tags",
          name: "tags",
          widget: "list",
          required: false,
          hint: "Ex: dax, powerbi, scripts"
        }

      # Imagem de Capa (objeto)
      - label: "Imagem de Capa"
        name: "image"
        widget: "object"
        required: false
        fields:
          - {
              label: "URL da Imagem",
              name: "path",
              widget: "string",
              required: false,
              hint: "URL da imagem (Unsplash, upload, etc)"
            }
          - {
              label: "Texto Alternativo",
              name: "alt",
              widget: "string",
              required: false
            }

      # Conteúdo (Markdown)
      - {
          label: "Conteúdo",
          name: "body",
          widget: "markdown"
        }

  # --------------------------------------------
  # PÁGINAS ESTÁTICAS
  # --------------------------------------------
  - name: "pages"
    label: "Páginas"
    files:
      - label: "Sobre"
        name: "about"
        file: "_tabs/about.md"
        fields:
          - { label: "Layout", name: "layout", widget: "hidden", default: "page" }
          - { label: "Ícone", name: "icon", widget: "string", default: "fas fa-info-circle" }
          - { label: "Ordem", name: "order", widget: "number", default: 4 }
          - { label: "Título", name: "title", widget: "string" }
          - { label: "Conteúdo", name: "body", widget: "markdown" }
```

### Widgets Disponíveis

| Widget | Descrição | Exemplo |
|--------|-----------|---------|
| `string` | Campo de texto simples | Título do post |
| `text` | Campo de texto multi-linha | Descrição |
| `markdown` | Editor Markdown com preview | Conteúdo do post |
| `datetime` | Seletor de data e hora | Data de publicação |
| `list` | Lista de valores | Categorias, Tags |
| `object` | Objeto com sub-campos | Imagem (path + alt) |
| `hidden` | Campo oculto | Layout |
| `number` | Campo numérico | Ordem da página |
| `boolean` | Checkbox verdadeiro/falso | Publicado? |
| `image` | Upload de imagem | Foto de capa |
| `file` | Upload de arquivo | PDF, DOC |
| `select` | Dropdown de seleção | Categoria fixa |

### Slug Pattern

```yaml
slug: "{{year}}-{{month}}-{{day}}-{{slug}}"
```

**Variáveis disponíveis:**
- `{{year}}` - Ano (2025)
- `{{month}}` - Mês (01, 02, ..., 12)
- `{{day}}` - Dia (01, 02, ..., 31)
- `{{slug}}` - Título convertido em slug (minúsculas, sem espaços)
- `{{hour}}`, `{{minute}}`, `{{second}}`

**Exemplo:**
- Título: "Meu Novo Post Sobre DAX"
- Data: 2025-12-09
- Arquivo gerado: `2025-12-09-meu-novo-post-sobre-dax.md`

---

## Como Usar

### 1. Acessar o CMS

**URL:** https://flozer.github.io/admin

### 2. Fazer Login

1. Clique em "Login with GitHub"
2. Autorize o aplicativo OAuth
3. Você será redirecionado para o painel

### 3. Interface Principal

```
┌─────────────────────────────────────────────┐
│  Decap CMS                        [Logout]  │
├─────────────────────────────────────────────┤
│                                             │
│  📝 Posts         📄 Páginas               │
│                                             │
│  ┌──────────────────────────────────────┐  │
│  │  [+ New Posts]                       │  │
│  │                                      │  │
│  │  📄 Scripts Úteis DAX (23/01/2025)  │  │
│  │  📄 Boas-Vindas (20/01/2025)        │  │
│  │  📄 Atalhos DAX (22/06/2020)        │  │
│  └──────────────────────────────────────┘  │
│                                             │
└─────────────────────────────────────────────┘
```

### 4. Criar Novo Post

1. Clique em **"Posts"** no menu lateral
2. Clique em **"New Posts"**
3. Preencha os campos
4. Escreva o conteúdo em Markdown
5. Clique em **"Publish"** (ou **"Save"** para rascunho)

---

## Autenticação

### O Problema da Autenticação

O Decap CMS precisa de **permissões para escrever no seu repositório GitHub**. Para isso, existem duas opções:

### Opção 1: Netlify Identity + Git Gateway (Recomendado)

**Mais fácil e rápido**

#### Passo a Passo:

1. **Criar conta no Netlify**
   - Acesse: https://app.netlify.com/signup
   - Faça login com GitHub

2. **Conectar repositório**
   - New Site from Git → GitHub
   - Selecione: `flozer/flozer.github.io`
   - Build settings: deixe padrão para Jekyll
   - Deploy site

3. **Ativar Netlify Identity**
   - Site Settings → Identity
   - Clique em "Enable Identity"

4. **Configurar Git Gateway**
   - Identity → Services → Git Gateway
   - Clique em "Enable Git Gateway"

5. **Convidar usuários**
   - Identity → Invite users
   - Digite seu email
   - Aceite o convite por email

6. **Atualizar config.yml**
   ```yaml
   backend:
     name: git-gateway
     branch: main
   ```

**Pronto!** Agora você pode fazer login com email/senha.

### Opção 2: GitHub OAuth App (Avançado)

**Autenticação direta com GitHub**

#### Passo a Passo:

1. **Criar OAuth App no GitHub**
   - Acesse: https://github.com/settings/developers
   - OAuth Apps → New OAuth App

2. **Preencher informações**
   ```
   Application name: Decap CMS - flozer.github.io
   Homepage URL: https://flozer.github.io
   Authorization callback URL: https://api.netlify.com/auth/done
   ```

3. **Copiar credenciais**
   - Copie: Client ID
   - Gere: Client Secret

4. **Configurar no Netlify**
   - Site Settings → Access Control → OAuth
   - Install Provider → GitHub
   - Cole Client ID e Client Secret

5. **Manter config.yml**
   ```yaml
   backend:
     name: github
     repo: flozer/flozer.github.io
     branch: main
   ```

**Nota:** Esta opção requer Netlify apenas para o servidor OAuth.

### Comparação

| Característica | Netlify Identity | GitHub OAuth |
|----------------|------------------|--------------|
| **Facilidade** | ⭐⭐⭐⭐⭐ Muito fácil | ⭐⭐⭐ Médio |
| **Configuração** | 5 minutos | 15 minutos |
| **Usuários** | Email/senha | Conta GitHub |
| **Convites** | Por email | Direto GitHub |
| **Custo** | Grátis até 1000 usuários | Grátis |

---

## Workflow de Criação de Posts

### Modo Editorial (Configurado)

```yaml
publish_mode: editorial_workflow
```

Este modo cria **3 estados** para seus posts:

#### 1. **Draft (Rascunho)**
- Post salvo mas não publicado
- Visível apenas no CMS
- Não commitado no Git ainda

#### 2. **In Review (Em Revisão)**
- Post pronto para revisão
- Pull Request criado no GitHub
- Ainda não publicado

#### 3. **Ready (Publicado)**
- Commit realizado
- Post publicado no site
- Disponível publicamente

### Fluxo Visual

```
[Criar Post] → [Save Draft] → [Draft]
                                  │
                                  ▼
                            [Set to Review]
                                  │
                                  ▼
                             [In Review]
                                  │
                                  ▼
                              [Publish]
                                  │
                                  ▼
                          [Commit no GitHub]
                                  │
                                  ▼
                        [GitHub Actions Deploy]
                                  │
                                  ▼
                          [Post Publicado!]
```

### Modo Simples (Alternativa)

```yaml
publish_mode: simple
```

- Apenas 2 estados: Rascunho ou Publicado
- Ao clicar em "Publish", faz commit imediatamente
- Mais direto, sem Pull Requests

---

## Upload de Imagens

### Configuração Atual

```yaml
media_folder: "assets/images/posts"
public_folder: "/assets/images/posts"
```

### Como Fazer Upload

#### Dentro do Editor de Post:

1. **Via botão de imagem**
   - Clique no ícone de imagem na toolbar
   - Selecione arquivo do seu computador
   - Imagem é uploadada automaticamente
   - Markdown inserido: `![alt text](/assets/images/posts/nome-imagem.jpg)`

2. **Arrastar e soltar**
   - Arraste imagem para o editor
   - Drop na área de conteúdo
   - Upload automático

3. **Via biblioteca de mídia**
   - Clique em "Media" no menu superior
   - Upload de múltiplas imagens
   - Gerenciamento de arquivos existentes

### Estrutura Gerada

```
assets/images/posts/
├── minha-foto-1.jpg
├── screenshot-2025-12-09.png
└── diagrama-arquitetura.svg
```

### Otimização de Imagens

**Recomendações:**
- Comprimir imagens antes do upload (TinyPNG, Squoosh)
- Usar formatos modernos: WebP, AVIF
- Dimensões máximas: 1920x1080 para posts
- Nomes descritivos: `dax-studio-interface.png` ✅ vs `IMG_1234.png` ❌

---

## Troubleshooting

### Problema: Não consigo fazer login

**Solução:**
1. Verifique se OAuth está configurado
2. Confirme callback URL: `https://api.netlify.com/auth/done`
3. Limpe cache do navegador
4. Tente em aba anônima

### Problema: Erro ao salvar post

**Possíveis causas:**
1. **Sem permissão no repositório**
   - Verifique se você é owner/collaborator

2. **Branch incorreta**
   - Confirme em `config.yml`: `branch: main`

3. **Nome de arquivo duplicado**
   - Verifique se já existe post com mesmo slug

### Problema: Imagens não aparecem

**Solução:**
1. Confirme que `media_folder` existe
2. Verifique permissões de escrita
3. Confirme `public_folder` no config
4. Verifique console do navegador (F12)

### Problema: Preview não funciona

**Solução:**
1. Verifique se `editor.preview: true` está configurado
2. Limpe cache do navegador
3. Recarregue a página `/admin`

### Problema: CMS não carrega

**Solução:**
1. Verifique se `/admin/index.html` existe
2. Confirme CDN está acessível: https://unpkg.com/decap-cms@^3.0.0/dist/decap-cms.js
3. Verifique console JavaScript (F12)
4. Confirme `config.yml` está válido (YAML syntax)

### Validar YAML

Use: https://www.yamllint.com/

```yaml
# ✅ Correto
backend:
  name: github

# ❌ Errado (indentação)
backend:
name: github
```

---

## Manutenção e Atualizações

### Atualizar Decap CMS

**Versão atual:** 3.0.0

Para atualizar, edite `admin/index.html`:

```html
<!-- Versão específica -->
<script src="https://unpkg.com/decap-cms@3.1.0/dist/decap-cms.js"></script>

<!-- Última versão 3.x -->
<script src="https://unpkg.com/decap-cms@^3.0.0/dist/decap-cms.js"></script>

<!-- Última versão (não recomendado) -->
<script src="https://unpkg.com/decap-cms@latest/dist/decap-cms.js"></script>
```

### Adicionar Novos Campos aos Posts

Edite `admin/config.yml`:

```yaml
fields:
  # ... campos existentes ...

  # Novo campo: Autor
  - {
      label: "Autor",
      name: "author",
      widget: "string",
      default: "Fernando Lozer"
    }

  # Novo campo: Featured (destaque)
  - {
      label: "Post em Destaque?",
      name: "featured",
      widget: "boolean",
      default: false
    }
```

### Adicionar Novos Tipos de Conteúdo

```yaml
collections:
  # ... posts existentes ...

  # Nova collection: Projetos
  - name: "projetos"
    label: "Projetos"
    folder: "_projetos"
    create: true
    slug: "{{slug}}"
    fields:
      - { label: "Título", name: "title", widget: "string" }
      - { label: "Descrição", name: "description", widget: "text" }
      - { label: "URL", name: "url", widget: "string" }
      - { label: "Conteúdo", name: "body", widget: "markdown" }
```

---

## Customizações Avançadas

### Custom Previews

Você pode customizar como o preview é exibido adicionando JavaScript:

```html
<!-- admin/index.html -->
<script src="https://unpkg.com/decap-cms@^3.0.0/dist/decap-cms.js"></script>
<script>
  // Custom preview template
  CMS.registerPreviewTemplate("posts", ({ entry, widgetFor }) => {
    return `
      <article>
        <h1>${entry.getIn(['data', 'title'])}</h1>
        <time>${entry.getIn(['data', 'date'])}</time>
        <div>${widgetFor('body')}</div>
      </article>
    `;
  });
</script>
```

### Widgets Personalizados

Criar widget customizado para campo específico:

```javascript
const MyCustomWidget = {
  // Widget control
  control: ({ value, onChange }) => {
    return `<input type="text" value="${value}" />`;
  },

  // Widget preview
  preview: ({ value }) => {
    return `<strong>${value}</strong>`;
  }
};

CMS.registerWidget('my-widget', MyCustomWidget);
```

---

## Segurança

### Boas Práticas

1. **Nunca exponha credenciais**
   - Client Secret deve ficar no Netlify
   - Não commite tokens no Git

2. **Use HTTPS**
   - GitHub Pages já fornece
   - Essencial para OAuth

3. **Permissões mínimas**
   - OAuth App com escopo mínimo necessário
   - Apenas write access no repositório

4. **Noindex na página admin**
   - `<meta name="robots" content="noindex">`
   - Evita indexação do CMS

5. **Branch protection**
   - Configure branch rules no GitHub
   - Require pull request reviews (opcional)

---

## Performance

### Otimizações

1. **CDN Caching**
   - Decap CMS carregado via unpkg.com (CDN)
   - Cache automático do navegador

2. **Lazy Loading**
   - Interface carrega apenas quando acessada
   - Não impacta performance do site público

3. **Imagens**
   - Use formatos modernos (WebP)
   - Comprima antes do upload
   - Considere usar CDN para imagens (Cloudinary, imgix)

---

## Backup e Migração

### Backup

Como tudo está no Git, seu backup é automático:

```bash
# Clone completo do repositório
git clone https://github.com/flozer/flozer.github.io.git

# Backup inclui:
# - Todos os posts (_posts/)
# - Todas as imagens (assets/images/)
# - Configurações (admin/config.yml)
```

### Migração para Outro CMS

Se quiser migrar no futuro:

1. **Posts estão em Markdown padrão**
   - Compatível com qualquer gerador estático
   - Front matter YAML padrão

2. **Imagens estão organizadas**
   - Pasta dedicada: `assets/images/posts/`
   - Fácil de mover

3. **Exportação**
   - Não há lock-in
   - Dados sempre acessíveis via Git

---

## Comparação com Alternativas

| CMS | Gratuito | Mobile | Git-based | Open Source |
|-----|----------|--------|-----------|-------------|
| **Decap CMS** | ✅ | ✅ | ✅ | ✅ |
| Jekyll Admin | ✅ | ❌ | ✅ | ✅ |
| Forestry | ⚠️ Parcial | ✅ | ✅ | ❌ |
| Siteleaf | ⚠️ Limitado | ✅ | ✅ | ❌ |
| WordPress | ✅ | ✅ | ❌ | ✅ |
| Ghost | ❌ | ✅ | ❌ | ✅ |

**Decap CMS foi escolhido por:**
- ✅ 100% gratuito e open-source
- ✅ Funciona perfeitamente com GitHub Pages
- ✅ Mobile-friendly
- ✅ Commits diretos no Git (sem banco de dados externo)
- ✅ Comunidade ativa

---

## Recursos Adicionais

### Documentação Oficial

- **Site oficial:** https://decapcms.org/
- **Documentação:** https://decapcms.org/docs/intro/
- **GitHub:** https://github.com/decaporg/decap-cms
- **Widgets:** https://decapcms.org/docs/widgets/

### Comunidade

- **GitHub Discussions:** https://github.com/decaporg/decap-cms/discussions
- **Discord:** https://decapcms.org/chat
- **Stack Overflow:** Tag `decap-cms`

### Exemplos

- **Starter Templates:** https://github.com/decaporg/jekyll-decap-cms
- **Showcase:** https://decapcms.org/docs/examples/

---

## Próximos Passos

### Melhorias Futuras

1. **Custom Widgets**
   - Widget para inserir scripts reutilizáveis
   - Widget para escolher ícones FontAwesome

2. **Integração com Unsplash**
   - Buscar imagens direto do Unsplash
   - Inserir automaticamente com atribuição

3. **Preview Template Customizado**
   - Visualizar post com estilo do tema Chirpy
   - Preview mais fiel ao resultado final

4. **Shortcuts de Teclado**
   - Atalhos para Markdown (Ctrl+B para bold)
   - Snippets para blocos comuns

5. **Automações**
   - Auto-gerar slug otimizado
   - Sugerir tags baseadas no conteúdo
   - Validação de front matter

---

## Conclusão

O **Decap CMS** foi implementado com sucesso e agora você pode:

✅ Criar posts de **qualquer lugar** (mobile/desktop)
✅ Usar uma **interface visual** intuitiva
✅ Fazer **upload de imagens** facilmente
✅ Ver **preview** antes de publicar
✅ Gerenciar **rascunhos**
✅ Tudo com **commits automáticos** no GitHub

**Sem precisar:**
- ❌ Instalar Ruby/Jekyll localmente
- ❌ Usar editor de código
- ❌ Conhecer Git commands
- ❌ Formatar front matter manualmente

---

## Histórico de Alterações

| Data | Versão | Alteração |
|------|--------|-----------|
| 2025-12-09 | 1.0 | Implementação inicial do Decap CMS |

---

## Autor

**Fernando Lozer**
Analytics Engineer | Dados | IA
📧 fernandolozer@live.com
🔗 [LinkedIn](https://www.linkedin.com/in/fernandolozer)
🌐 [Blog](https://flozer.github.io)

---

**📖 Última atualização:** 09/12/2025
