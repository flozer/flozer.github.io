# Decap CMS - Painel de Administração

Este diretório contém a configuração do Decap CMS para gerenciar o conteúdo do blog.

## 🚀 Como Acessar

Acesse: **https://flozer.github.io/admin**

## ✨ Solução Atual: Cloudflare Worker

Este CMS usa **GitHub OAuth via Cloudflare Worker** para autenticação.

**Arquitetura:**
- **Backend:** GitHub (backend direto)
- **OAuth Proxy:** Cloudflare Worker (`decap-oauth.fernandolozer.workers.dev`)
- **Autenticação:** GitHub OAuth App
- **Hospedagem:** GitHub Pages

## 🔐 Autenticação

### Como Funciona (Já Configurado!)

A autenticação já está 100% configurada e funcional:

1. **GitHub OAuth App criado**
   - Application: "Decap CMS - flozer.github.io"
   - Callback URL: `https://decap-oauth.fernandolozer.workers.dev/callback`

2. **Cloudflare Worker deployado**
   - URL: `https://decap-oauth.fernandolozer.workers.dev`
   - Secrets configurados (GITHUB_OAUTH_ID e GITHUB_OAUTH_SECRET)

3. **Fluxo de Login:**
   - Você clica em "Login with GitHub"
   - Redireciona para Cloudflare Worker
   - Worker redireciona para GitHub OAuth
   - Você autoriza (permissões: repos públicos/privados)
   - Token é retornado para Decap CMS
   - ✨ Autenticado!

### Revogar Acesso (Se Necessário)

Se precisar reconectar:

1. Acesse: https://github.com/settings/applications
2. Procure: "Decap CMS - flozer.github.io"
3. Clique em "Revoke"
4. Faça login novamente no `/admin`

## 📝 Como Usar

### Criar um Novo Post

1. Acesse `/admin`
2. Faça login
3. Clique em "Posts" → "New Posts"
4. Preencha os campos:
   - **Título:** Título do post
   - **Data:** Data de publicação
   - **Categorias:** Lista de categorias (ex: Power BI, Scripts)
   - **Tags:** Lista de tags (ex: dax, powerbi)
   - **Imagem de Capa:** URL da imagem (opcional)
   - **Conteúdo:** Escreva em Markdown
5. Clique em "Publish" para publicar imediatamente
   - Ou "Save" para salvar como rascunho

### Upload de Imagens

- Ao inserir imagens no conteúdo, você pode:
  1. Clicar no ícone de imagem no editor
  2. Fazer upload de uma imagem local
  3. A imagem será salva automaticamente em `/assets/images/posts/`
  4. O caminho correto será inserido no Markdown

### Editar Posts Existentes

1. Acesse `/admin`
2. Clique em "Posts"
3. Selecione o post que deseja editar
4. Faça as alterações
5. Clique em "Publish"

## 📁 Estrutura de Arquivos

```
admin/
├── index.html      # Página principal do CMS
├── config.yml      # Configurações do Decap CMS
└── README.md       # Este arquivo
```

## ⚙️ Configuração

O arquivo [`config.yml`](config.yml) contém:

- **Backend:** Configuração do GitHub
- **Media Folder:** Onde as imagens são salvas (`/assets/images/posts/`)
- **Collections:** Tipos de conteúdo (Posts e Páginas)
- **Fields:** Campos disponíveis para cada tipo

## 🔧 Customização

Para adicionar novos campos aos posts, edite o arquivo [`config.yml`](config.yml) na seção `collections → posts → fields`.

## 📱 Mobile

O Decap CMS é responsivo e funciona perfeitamente em dispositivos móveis. Basta acessar `/admin` pelo navegador do celular.

## 🆘 Problemas Comuns

### Erro de Autenticação

- Verifique se o OAuth está configurado corretamente
- Certifique-se de estar usando a URL correta de callback

### Imagens não aparecem

- Verifique se a pasta `/assets/images/posts/` existe
- Confirme que o caminho no `config.yml` está correto

### Post não foi salvo

- Verifique se você tem permissões de escrita no repositório
- Confirme se a branch configurada está correta

## 📚 Documentação Oficial

- [Decap CMS](https://decapcms.org/)
- [Jekyll Integration](https://decapcms.org/docs/jekyll/)
- [GitHub Backend](https://decapcms.org/docs/github-backend/)
