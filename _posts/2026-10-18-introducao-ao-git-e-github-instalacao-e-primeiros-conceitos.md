---
title: "Introdução ao Git e GitHub: Instalação e Primeiros Conceitos"
description: "Primeiro post da série de Git para quem trabalha com dados: a diferença entre Git e GitHub, a instalação no Windows, Mac e Linux e a configuração inicial."
date: 2026-10-18 10:00:00 -0300
categories: [Git, Fundamentos]
tags: [git, github, versionamento, tutorial, introducao]
image:
  path: /assets/images/posts/git-github-capa.png
  alt: "Git + GitHub: instalação e primeiros conceitos"
pin: false
published: true
---

Se você trabalha com dados, provavelmente já viu (ou criou 😅) uma pasta assim:

```text
relatorio_vendas.pbix
relatorio_vendas_v2.pbix
relatorio_vendas_v2_FINAL.pbix
relatorio_vendas_v2_FINAL_agora_vai.pbix
```

Funciona... até alguém perguntar **o que mudou** da v2 para a FINAL, ou até você precisar voltar para a versão de semana passada.

O **Git** e o **GitHub** resolvem exatamente esse problema. Eles guardam um histórico de versões do seu projeto: você grava uma versão sempre que fizer uma alteração importante e pode navegar por esse histórico e recuperar qualquer ponto dele quando precisar.

> **Para quem é este post?** Escrevi pensando principalmente em quem trabalha com dados (Data Engineers, Analytics Engineers, Analistas de BI etc.). Mas se você é dev, também vai ser útil, porque provavelmente o Git já faz parte do seu dia a dia. 😉
{: .prompt-info }

Esta série de 9 artigos quer ajudar quem precisa usar o Git no dia a dia: sair do absoluto zero e chegar a um conhecimento sólido da ferramenta. Bora começar! 🚀

## 1 – Git vs GitHub

Antes de instalar qualquer coisa, precisamos separar o que é o quê. É comum achar que são a mesma coisa, mas não são.

**Git (o motor local)**

O Git é um programa que você instala no **seu computador**. Ele acompanha as mudanças nos arquivos do seu projeto.

- **Analogia:** o Git é uma **máquina do tempo**. Ele permite salvar "checkpoints" do projeto e voltar para qualquer um deles a qualquer momento.

**GitHub (a nuvem)**

O GitHub é um site onde você hospeda os projetos que usam Git.

- **Analogia:** se o Git é a máquina do tempo, o GitHub é o **cofre na nuvem**. É onde você guarda uma cópia dos seus checkpoints, compartilha com o time e colabora.

![Diagrama mostrando o Git no computador e o GitHub na nuvem, sincronizados com git push e git pull](/assets/2026-10-18-introducao-ao-git-e-github-instalacao-e-primeiros-conceitos/1-git-vs-github.png)

| | Git | GitHub |
|---|---|---|
| **O que é** | Um programa | Um site / plataforma |
| **Onde roda** | No seu computador | Na nuvem |
| **Precisa de internet?** | Não | Sim |
| **Para que serve** | Versionar o projeto | Backup, colaboração e revisão |

> **Resumo:** você usa o Git para versionar o projeto no seu computador e o GitHub para guardar uma cópia na nuvem e trabalhar junto com o time.
{: .prompt-tip }

> O GitHub não é o único lugar para hospedar repositórios Git. Existem também o **Azure DevOps**, o **GitLab** e o **Bitbucket**. Quem trabalha com Microsoft Fabric vai encontrar a integração com Git, que funciona com Azure DevOps e GitHub. O que você aprender nesta série vale para todos eles.
{: .prompt-info }

## 2 – Instalação no Windows

No Windows, o terminal padrão (CMD ou PowerShell) tem comandos um pouco diferentes dos do Linux e do Mac. Por isso, recomendo usar o **Git Bash**, que já vem junto com o Git: os comandos que você vai ver nesta série (e na maioria dos tutoriais) funcionam igualzinho nele.

Você pode instalar de duas formas:

- **Pelo site:** acesse [git-scm.com/downloads/win](https://git-scm.com/downloads/win) e baixe o **Git for Windows/x64 Setup** (ou o **ARM64 Setup**, se o seu computador tiver processador ARM)
- **Pelo terminal:** abra o PowerShell e rode o comando abaixo

```powershell
winget install --id Git.Git -e --source winget
```

O instalador tem muitas telas e dá para dar "Next" na maioria delas. Mas **preste atenção em três**:

- **Select Components:** deixe marcada a opção **"Open Git Bash here"** (em *Windows Explorer integration*). Com ela, você clica com o botão direito em qualquer pasta e abre o Git Bash já naquele lugar.
- **Choosing the default editor used by Git:** troque o **Vim** pelo **Visual Studio Code** (ou pelo Bloco de Notas). É esse editor que o Git abre quando precisa que você escreva uma mensagem.
- **Adjusting the name of the initial branch:** escolha **"Override the default branch name"** e deixe **`main`**. É o nome padrão usado pelo GitHub.

> Se você deixou o Vim como editor e um dia o Git abrir uma tela estranha da qual você não consegue sair: aperte **Esc**, digite **`:q!`** e aperte **Enter**. Todo mundo já passou por isso! 😂
{: .prompt-warning }

## 3 – Instalação no Mac

Abra o Terminal (**Command + Espaço**, digite "Terminal") e rode:

```bash
git --version
```

Se o Git não estiver instalado, o macOS vai sugerir instalar as **"Command Line Developer Tools"**. É só aceitar e esperar.

Se você usa o [Homebrew](https://brew.sh), também pode instalar com:

```bash
brew install git
```

## 4 – Instalação no Linux

No Ubuntu ou Debian:

```bash
sudo apt update
sudo apt install git
```

No Fedora:

```bash
sudo dnf install git
```

## 5 – Conferindo a Instalação

Em qualquer sistema, abra o terminal (no Windows, o **Git Bash**) e rode:

```bash
git --version
```

Se aparecer a versão do Git, está tudo certo:

![Terminal mostrando o resultado do comando git --version](/assets/2026-10-18-introducao-ao-git-e-github-instalacao-e-primeiros-conceitos/2-git-version.png)

## 6 – Configurando sua Identidade

Agora que o Git está instalado, você precisa se apresentar. Todo checkpoint (que no Git se chama **commit**) leva a sua assinatura. Isso é essencial em times de dados para saber **quem alterou aquela métrica do dashboard** e quando.

Você só precisa fazer isso **uma vez** por computador:

**1. Defina seu nome:**

```bash
git config --global user.name "Seu Nome Completo"
```

**2. Defina seu email:**

```bash
git config --global user.email "seu.email@exemplo.com"
```

> Use o mesmo email da sua conta no GitHub. Se não quiser que ele apareça publicamente, o GitHub oferece um email "noreply" em **Settings → Emails**, no formato `12345678+seu-usuario@users.noreply.github.com`.
{: .prompt-tip }

**3. Defina `main` como nome da branch padrão:**

```bash
git config --global init.defaultBranch main
```

Se você já escolheu isso no instalador do Windows, pode pular. No Mac e no Linux, vale rodar.

**4. Confira se deu certo:**

```bash
git config --global --list
```

![Terminal mostrando os comandos git config e a lista com nome, email e branch padrão](/assets/2026-10-18-introducao-ao-git-e-github-instalacao-e-primeiros-conceitos/3-git-config.png)

> Errou o nome ou o email? É só rodar o comando de novo com o valor certo, que ele substitui o anterior. E se a lista for grande e o terminal "travar" no final, aperte **q** para sair.
{: .prompt-info }

## Resumo dos Comandos

| Comando | Função |
|---------|--------|
| `git --version` | Confere se o Git está instalado e qual a versão |
| `git config --global user.name "..."` | Define seu nome nos commits |
| `git config --global user.email "..."` | Define seu email nos commits |
| `git config --global init.defaultBranch main` | Usa `main` como branch padrão nos novos projetos |
| `git config --global --list` | Mostra todas as suas configurações globais |

## Dica Final 💡

Pronto! A fundação da casa está pronta:

- Você entendeu a diferença entre **Git** e **GitHub**
- O Git está **instalado** no seu computador
- Sua **identidade** está configurada

No próximo post, vamos aos **primeiros comandos** (`init`, `add` e `commit`) e você vai versionar seu primeiro arquivo, um CSV ou um notebook.

Até lá, crie sua conta no [GitHub](https://github.com) se ainda não tiver. Vamos precisar dela em breve!

---

**Você já usa Git no seu trabalho com dados? Qual foi sua maior dificuldade no começo?** Conta nos comentários! 👇

> 💾 **Salve este post** para consultar quando for configurar um computador novo!
{: .prompt-info }

---

*Última atualização: Outubro de 2026*
