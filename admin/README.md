# Decap CMS - Painel de Administração

Este diretório contém a configuração do Decap CMS para gerenciar o conteúdo do blog.

## 🚀 Como Acessar

Após o deploy, acesse: **https://flozer.github.io/admin**

## 🔐 Autenticação

### Primeira vez - Configurar OAuth GitHub

Para que o Decap CMS funcione, você precisa configurar a autenticação OAuth do GitHub:

#### Opção 1: Netlify Identity (Mais Simples - Recomendado)

1. Crie uma conta gratuita no [Netlify](https://www.netlify.com/)
2. Conecte seu repositório GitHub
3. Ative o Netlify Identity
4. Configure o Git Gateway
5. Pronto! Você poderá fazer login com email

#### Opção 2: GitHub OAuth App (Avançado)

Se preferir autenticação direta com GitHub:

1. Acesse: https://github.com/settings/developers
2. Clique em "New OAuth App"
3. Preencha:
   - **Application name:** Decap CMS - flozer.github.io
   - **Homepage URL:** https://flozer.github.io
   - **Authorization callback URL:** https://api.netlify.com/auth/done
4. Copie o Client ID e Client Secret
5. No Netlify: Site Settings → Access Control → OAuth → Install Provider
6. Cole as credenciais do GitHub

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
