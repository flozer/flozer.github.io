# Sveltia CMS - Painel de Administração

Este diretório contém a configuração do [Sveltia CMS](https://sveltiacms.app/en/docs) (sucessor do Decap/Netlify CMS) para gerenciar o conteúdo do blog.

## 🚀 Como Acessar

Acesse: **https://flozer.github.io/admin/**

## 🏗️ Arquitetura

- **CMS:** Sveltia CMS carregado via unpkg com **versão fixa** (veja `index.html`)
- **Backend:** GitHub (`flozer/flozer.github.io`, branch `main`)
- **OAuth Proxy:** Cloudflare Worker (`decap-oauth.fernandolozer.workers.dev`), o mesmo usado antes com o Decap
- **Hospedagem:** GitHub Pages, deploy via GitHub Actions a cada push na `main`

## 🔐 Autenticação

O login usa o GitHub OAuth App "Decap CMS - flozer.github.io" através do Cloudflare Worker. O Sveltia é compatível com OAuth clients feitos para o Decap, então nada mudou aqui.

Para revogar o acesso: https://github.com/settings/applications → "Decap CMS - flozer.github.io" → Revoke.

## 📝 Fluxo de Publicação (Editorial Workflow)

Cada post novo ou editado **não** vai direto para a `main`:

1. **Rascunho:** ao salvar, o CMS cria uma branch e um pull request. O site não muda.
2. **Em revisão / Pronto:** mova o card no painel "Editorial Workflow" para organizar.
3. **Publicar:** o CMS faz o merge do PR na `main`, e o GitHub Actions publica o site.

Assim os rascunhos não poluem o histórico da `main` nem disparam deploy a cada salvamento.

O campo **"Publicado no site?"** (`published`) só serve para tirar do ar um post que já foi publicado.

## ✍️ Editor de Conteúdo

O campo **Conteúdo** abre em **modo Markdown** (raw). Use esse modo para posts com sintaxe do Chirpy:

- Caixas de dica: `{: .prompt-tip }`, `{: .prompt-info }`, `{: .prompt-warning }`
- Includes: `{% include script-file.html ... %}`
- Separadores `---`

O modo visual (rich text) pode reescrever essa sintaxe. Troque de modo pelo seletor na barra de ferramentas.

## 🔗 Nomes de Arquivo e URLs

- Slugs são gerados só em ASCII: "Introdução ao Git" → `2026-10-18-introducao-ao-git.md`
- O prefixo de data vem do campo **Data de Publicação**
- Imagens enviadas também têm o nome normalizado e ficam em `assets/images/posts/` (limite de 500 KB)

## 📁 Estrutura de Arquivos

```
admin/
├── index.html         # Carrega o Sveltia CMS (versão fixa)
├── config.yml         # Configuração do CMS
├── README.md          # Este arquivo
└── GUIA-COMPLETO.md   # Guia histórico da implantação com Decap CMS
```

## ⬆️ Atualizar o Sveltia CMS

O Sveltia ainda está em beta (0.x) e lança versões com frequência. Para atualizar:

1. Veja as versões em https://www.npmjs.com/package/@sveltia/cms?activeTab=versions
2. Troque o número em `admin/index.html`
3. Teste localmente (`bundle exec jekyll serve` e abra `http://localhost:4000/admin/`) antes de publicar

## 🆘 Problemas Comuns

- **Erro de autenticação:** confira se o Worker está no ar e se o callback do OAuth App é `https://decap-oauth.fernandolozer.workers.dev/callback`.
- **Post não aparece no site:** verifique se o PR foi publicado (merge na `main`) e se `published` está marcado.
- **Formatação quebrada:** edite o post no modo Markdown.

## 📚 Documentação

- [Sveltia CMS](https://sveltiacms.app/en/docs)
- [Integração com Jekyll](https://sveltiacms.app/en/docs/frameworks/jekyll)
- [Editorial Workflow](https://sveltiacms.app/en/docs/workflows/editorial)
- [Migração do Decap CMS](https://sveltiacms.app/en/docs/migration/netlify-decap-cms)
