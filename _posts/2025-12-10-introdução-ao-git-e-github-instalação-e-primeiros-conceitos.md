---
layout: post
title: "Introdução ao Git e GitHub: Instalação e Primeiros Conceitos"
date: 2025-12-10 17:47:00 -0300
categories:
  - Git
  - GitHub
  - CI/CD
tags:
  - git
  - github
  - ci/cd
  - versionamento
---
> **Para quem é este post?** Estou criando esse post principalmente aplicado a quem trabalha com Dados (Data Engineers, Analytics Engineers, etc), porém, se você é DEV, também vai ser muito útil, pois provavelmente já faz parte do seu dia a dia. 😉

Se você trabalha com código, provavelmente já passou por isso: fez alguma alteração e depois precisou do código antigo. E aí ? Como faz?

O **Git** e o **GitHub** resolvem exatamente esse problema. Eles versionam seu código de modo que você pode gravar versões dele sempre que precisar alterar, mantendo um histórico em que você pode navegar e recuperar quando precisar.

Está série de 9 artigos visa ajudar aqueles que precisam usar essa ferramenta no dia a dia, tirá-los do absoluto zero e levá-los a um conhecimento fundamental da ferramente.

- - -

## 1. O Conceito: Git vs GitHub

Antes de instalar qualquer coisa, precisamos separar o que é o quê. É comum achar que são a mesma coisa, mas não são.

### Git (O Motor Local)

O Git é um software que você instala no **seu computador**. Ele monitora as mudanças nos seus arquivos.

* **Analogia**: Imagine que o Git é uma **Máquina do Tempo**. Ele permite que você salve "checkpoints" do seu projeto e volte para qualquer um deles a qualquer momento.

### GitHub (A Nuvem)

O GitHub é um site na internet onde você hospeda seus projetos que usam Git.

* **Analogia**: Se o Git é a máquina do tempo, o GitHub é o **Museu ou a Nuvem**. É onde você expõe seu trabalho, colabora com outros e faz backup dos seus checkpoints.

> **Resumo**: Você usa o Git para trabalhar no seu notebook localmente, e o GitHub para mostrar esse notebook para o mundo (ou para seu time).

- - -

## 2. Instalação

Vamos preparar o terreno. O foco aqui é garantir que você tenha as ferramentas certas.

### 🪟 Windows (Atenção aqui!)

No Windows, o terminal padrão (CMD ou PowerShell) pode ser um pouco diferente dos comandos padrão do Linux/Mac. Por isso, recomendo fortemente instalar o **Git Bash**.

1. Acesse: [git-scm.com/download/win](https://git-scm.com/download/win)
2. Baixe a versão "Standalone Installer" (64-bit geralmente).
3. **Durante a instalação**: Pode dar "Next" em tudo, mas certifique-se de que a opção **"Git Bash Here"** esteja marcada. Isso vai facilitar muito sua vida clicando com o botão direito nas pastas.

### 🍎 Mac

Abra seu terminal (Command + Espaço, digite "Terminal") e rode:

```bash
git --version
```

Se não estiver instalado, ele vai sugerir a instalação das "Command Line Developer Tools". Apenas aceite.

### 🐧 Linux (Ubuntu/Debian)

```bash
sudo apt-get update
sudo apt-get install git
```

- - -

## 3. A Primeira Configuração (Identidade)

Agora que o Git está instalado, você precisa se apresentar. Todo "checkpoint" (chamado de **commit**) que você fizer levará sua assinatura. Isso é crucial em times de dados para saber quem alterou aquela métrica no dashboard.

Abra seu terminal (no Windows, abra o **Git Bash**):

**1. Defina seu nome:**

```bash
git config --global user.name "Seu Nome Completo"
```

**2. Defina seu email:**
*Dica: Use o mesmo email que você usou/usará para criar sua conta no GitHub.*

```bash
git config --global user.email "seu.email@exemplo.com"
```

**3. Verifique se deu certo:**

```bash
git config --list
```

Você deve ver seu nome e email aparecerem na lista.

- - -

## Conclusão

Pronto! A "fundação" da casa está pronta.

* Você tem o motor (Git) instalado.
* Você configurou sua identidade.

No próximo post, vamos aprender os **Primeiros Comandos** (`init`, `add`, `commit`) e fazer seu primeiro versionamento de um arquivo CSV ou Notebook.

> **Dica Pro**: Crie uma conta no [GitHub.com](https://github.com) se ainda não tiver. Vamos precisar dela em breve.
