---
title: "Atalhos Úteis para Barra de Fórmulas DAX - Power BI Desktop"
description: "Os atalhos de teclado mais úteis da barra de fórmulas DAX no Power BI Desktop: múltiplos cursores, indentação, comentários, mover e copiar linhas."
date: 2020-06-22 10:00:00 -0300
categories: [Power BI, DAX]
tags: [powerbi, dax, atalhos, produtividade, tutorial]
image:
  path: /assets/2020-06-22-atalhos-uteis-barra-formulas-dax-powerbi/0-banner.jpg
  alt: "Barra de fórmulas DAX no Power BI Desktop"
---

Alguns desses atalhos estão na documentação oficial, outros não. Então resolvi compilar aqui para facilitar a vida de quem trabalha com DAX no Power BI Desktop! 🚀

## 1 – Seleções Múltiplas

Quer selecionar várias ocorrências da mesma palavra? Esses atalhos são essenciais:

- **Ctrl + D:** Seleciona uma palavra de forma repetida em segmentos
- **Ctrl + F2** ou **Ctrl + Shift + L:** Seleciona todas as instâncias de uma palavra de uma vez
- **Ctrl + Alt + ↑/↓:** Cria múltiplos cursores nas linhas acima ou abaixo

![Demonstração de seleções múltiplas no Power BI](/assets/2020-06-22-atalhos-uteis-barra-formulas-dax-powerbi/1-selecoes-multiplas.gif)

> Esses atalhos são perfeitos para renomear variáveis ou fazer alterações em massa!
{: .prompt-tip }

## 2 – Indentação

Mantenha seu código DAX organizado e legível:

- **Tab:** Indenta o código para a direita
- **Shift + Tab:** Indenta o código para a esquerda

![Demonstração de indentação no Power BI](/assets/2020-06-22-atalhos-uteis-barra-formulas-dax-powerbi/2-identacao.gif)

## 3 – Inserindo Comentários

Comentários são fundamentais para documentar suas fórmulas:

- **Ctrl + K + C** ou **Ctrl + ;** → Comenta com `//`
- **Ctrl + K + U** → Remove comentário `//`
- **Alt + Shift + A** → Comenta com `/* */` e vice-versa

```dax
// Este é um comentário de linha única
/* Este é um
   comentário de
   múltiplas linhas */
```
![Demonstração de inserir comentários no Power BI](/assets/2020-06-22-atalhos-uteis-barra-formulas-dax-powerbi/3-inserir-comentarios.gif)

## 4 – Reordenar Linhas

Precisa mover uma linha de código? Não precisa recortar e colar:

- **Alt + ↑** → Move a linha para cima
- **Alt + ↓** → Move a linha para baixo

![Demonstração de reordenar linhas no Power BI](/assets/2020-06-22-atalhos-uteis-barra-formulas-dax-powerbi/4-reordenar-linhas.gif)

## 5 – Remover Linhas

Deletar linhas rapidamente:

- **Ctrl + Shift + K** → Remove uma ou mais linhas selecionadas

![Demonstração de remover linhas no Power BI](/assets/2020-06-22-atalhos-uteis-barra-formulas-dax-powerbi/5-remover-uma-ou-mais-linhas.gif)

> Muito mais rápido que selecionar e apertar Delete!
{: .prompt-info }

## 6 – Quebra de Linha

Controle como suas linhas quebram:

- **Shift + Enter** → Quebra de linha com indentação automática
- **Alt + Enter** → Quebra de linha sem indentação

![Demonstração de quebra de linha no Power BI](/assets/2020-06-22-atalhos-uteis-barra-formulas-dax-powerbi/6-quebra-de-linha.gif)

## 7 – Ir para Determinada Linha

Navegando em fórmulas grandes:

- **Ctrl + G** → Abre um campo para você digitar o número da linha desejada

Perfeito para fórmulas DAX complexas com centenas de linhas!

![Demonstração de ir para linha específica no Power BI](/assets/2020-06-22-atalhos-uteis-barra-formulas-dax-powerbi/7-ir-para-uma-linha.gif)

## 8 – Copiar Linhas

Duplicar linhas de forma rápida:

- **Alt + Shift + ↑** → Copia a linha para cima
- **Alt + Shift + ↓** → Copia a linha para baixo

![Demonstração de copiar linhas no Power BI](/assets/2020-06-22-atalhos-uteis-barra-formulas-dax-powerbi/8-copiar-linhas.gif)

## 9 – Zoom da Barra de Fórmulas

Ajuste o tamanho da fonte:

- **Ctrl + +** ou **Ctrl + Scroll do mouse** → Aumenta o zoom
- **Ctrl + -** ou **Ctrl + Scroll do mouse** → Diminui o zoom

Útil para apresentações ou quando precisa enxergar melhor o código!

![Demonstração de zoom na barra de fórmulas do Power BI](/assets/2020-06-22-atalhos-uteis-barra-formulas-dax-powerbi/9-aumentar-diminuir-zoom.gif)

## 10 – Intellisense

O autocompletar parou de funcionar? Reative assim:

- **Alt + I**, **Alt + G**, ou **Alt + qualquer letra** → Reativa o autocompletar (Intellisense)

![Demonstração do Intellisense no Power BI](/assets/2020-06-22-atalhos-uteis-barra-formulas-dax-powerbi/10-intelisense.gif)

> O Intellisense é seu melhor amigo ao escrever DAX! Ele sugere funções, tabelas e colunas.
{: .prompt-tip }

## Resumo dos Atalhos

| Atalho | Função |
|--------|--------|
| `Ctrl + D` | Selecionar palavra repetidamente |
| `Ctrl + F2` | Selecionar todas as instâncias |
| `Ctrl + Alt + ↑/↓` | Múltiplos cursores |
| `Tab` | Indentar direita |
| `Shift + Tab` | Indentar esquerda |
| `Ctrl + K + C` | Comentar com // |
| `Ctrl + K + U` | Descomentar // |
| `Alt + Shift + A` | Comentar com /* */ |
| `Alt + ↑/↓` | Mover linha |
| `Ctrl + Shift + K` | Remover linha |
| `Shift + Enter` | Quebrar linha com indentação |
| `Alt + Enter` | Quebrar linha sem indentação |
| `Ctrl + G` | Ir para linha |
| `Alt + Shift + ↑/↓` | Copiar linha |
| `Ctrl + +/-` | Zoom |
| `Alt + I` | Reativar Intellisense |

## Dica Final 💡

Praticar esses atalhos vai aumentar significativamente sua produtividade ao trabalhar com DAX! No início pode parecer estranho, mas em poucos dias eles se tornam naturais.

Comece usando 2 ou 3 atalhos que você achar mais úteis e vá incorporando os outros aos poucos.

---

**Qual atalho você mais usa? Conhece algum outro que não está nessa lista?** Compartilhe nos comentários! 👇

> 💾 **Salve este post** para consultar sempre que precisar!
{: .prompt-info }

---

*Última atualização: Novembro de 2023*
