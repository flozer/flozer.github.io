---
title: "Scripts DAX Úteis para Power BI"
description: "Scripts DAX para DAX Studio e Power BI: medidas sem pasta de exibição, linhas e cardinalidade por tabela, e automações em PowerShell e Python."
date: 2025-01-23 14:00:00 -0300
categories: [Power BI, Scripts]
tags: [dax, powerbi, scripts, dax-studio, otimizacao]
image:
  path: https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=1200&h=630&fit=crop
  alt: "Análise de dados e dashboards"
---

## Introdução

Scripts DAX são extremamente úteis para análise e manutenção de modelos semânticos no Power BI. Utilizando o **DAX Studio**, você pode executar queries para inspecionar metadados, identificar problemas e otimizar seu modelo.

Neste post, reuni alguns scripts para inspecionar e organizar modelos semânticos, além de duas pequenas automações para arquivos PBIX.

> **Dica:** Todos os scripts abaixo estão armazenados no repositório do blog e são atualizados conforme descubro melhorias. Use os botões de download para salvá-los localmente!
{: .prompt-tip }

> Os scripts usam as funções `INFO.VIEW.*` e `COLUMNSTATISTICS()`, disponíveis nas versões recentes do Power BI Desktop. Funcionam tanto no DAX Studio quanto na **Exibição de consulta DAX** do próprio Power BI Desktop. As funções `INFO.VIEW.*` exigem permissão de escrita no modelo e não funcionam com conexão ao vivo a um modelo publicado.
{: .prompt-info }

## 1. Listar Medidas Sem Pasta de Exibição

Um modelo organizado facilita muito a manutenção. Este script identifica todas as medidas que não estão organizadas em pastas de exibição.

{% include script-file.html
   file="scripts/dax/listar-medidas-sem-pasta.dax"
   language="dax"
   title="Listar Medidas Sem Pasta"
   description="Identifica medidas que precisam ser organizadas em pastas de exibição"
%}

### Como usar:

1. Abra o **DAX Studio** e conecte ao seu modelo (ou abra a **Exibição de consulta DAX** no Power BI Desktop)
2. Cole o script acima
3. Execute (F5)
4. Analise as medidas retornadas e organize-as em pastas

### Por que isso é importante:

- Quem **monta relatórios** encontra as medidas mais rápido no painel de dados, em vez de rolar uma lista enorme
- Quem analisa o modelo pelo **Excel** (Analisar no Excel) vê as mesmas pastas na lista de campos da tabela dinâmica
- Medidas agrupadas por assunto deixam o modelo mais fácil de **manter e documentar**

## 2. Linhas e Cardinalidade por Tabela

Entender o tamanho das suas tabelas e das suas colunas ajuda a encontrar o que pesa no modelo. Este script mostra, para cada tabela, o número exato de linhas, a quantidade de colunas, a maior cardinalidade entre as colunas (valores distintos) e a quantidade de medidas.

{% include script-file.html
   file="scripts/dax/analise-cardinalidade-tabelas.dax"
   language="dax"
   title="Análise de Cardinalidade"
   description="Mostra linhas, colunas, maior cardinalidade de coluna e medidas de cada tabela do modelo"
%}

### O que você descobre com este script:

- **Tabelas grandes**, geralmente as tabelas fato
- **Colunas com cardinalidade alta**, que são as que mais ocupam memória
- **Tabelas vazias** (0 linhas), que podem indicar uma falha na carga ou uma tabela esquecida
- **Distribuição de medidas** entre as tabelas

> Tabelas com poucas linhas não são um problema: normalmente são dimensões (Calendário, Produto, Filial) e são essenciais para o modelo. Só remova uma tabela se ela não for usada em relacionamentos, medidas nem visuais.
{: .prompt-warning }

### Dica de otimização:

No modo Import, milhões de linhas costumam ser tranquilos para o motor VertiPaq. O que mais pesa é a **cardinalidade das colunas**. Se a coluna "Maior Cardinalidade de Coluna" estiver próxima do número de linhas, investigue:

- **Datas com hora:** separe em uma coluna de data e outra de hora, ou remova a hora se não for usada
- **Decimais com muitas casas:** arredonde para a precisão de que o negócio realmente precisa
- **IDs e textos únicos** (chaves de transação, observações, GUIDs): remova se não forem usados em relacionamentos ou visuais
- **Colunas não usadas:** remova no Power Query, antes de carregar

> Para uma análise mais completa, use o **View Metrics** do DAX Studio (menu *Advanced → View Metrics*). Ele mostra o tamanho em memória de cada tabela e coluna, sem precisar escrever DAX.
{: .prompt-tip }

## Bônus: Scripts PowerShell e Python

Além dos scripts DAX, aqui vão duas automações para arquivos PBIX.

> Se o Windows bloquear um script baixado da internet, desbloqueie com `Unblock-File .\nome-do-script.ps1` ou rode com `powershell -ExecutionPolicy Bypass -File .\nome-do-script.ps1`.
{: .prompt-info }

### Backup de Arquivos PBIX

{% include script-file.html
   file="scripts/powershell/backup-pbix-automatico.ps1"
   language="powershell"
   title="Backup de PBIX"
   description="Copia os arquivos .pbix de uma pasta para backups com data e hora, com limpeza opcional dos antigos"
%}

**Como executar:**

```powershell
# Fazer backup de todos os .pbix em uma pasta
.\backup-pbix-automatico.ps1 -SourcePath "C:\MeusProjetos\PowerBI"

# Especificar pasta de backup customizada
.\backup-pbix-automatico.ps1 -SourcePath "C:\Projetos" -BackupPath "D:\Backups"

# Manter só os backups dos últimos 30 dias
.\backup-pbix-automatico.ps1 -SourcePath "C:\Projetos" -KeepDays 30
```

**Para tornar o backup automático**, crie uma tarefa no **Agendador de Tarefas do Windows** (por exemplo, diária) com:

- **Programa:** `powershell.exe`
- **Argumentos:** `-NoProfile -ExecutionPolicy Bypass -File "C:\Scripts\backup-pbix-automatico.ps1" -SourcePath "C:\MeusProjetos\PowerBI" -KeepDays 30`

### Validar Arquivos PBIX

{% include script-file.html
   file="scripts/python/validar-pbix-pasta.py"
   language="python"
   title="Validador de PBIX"
   description="Confere se os arquivos PBIX de uma pasta são ZIPs íntegros e lista tamanho e data"
%}

**Como executar:**

```powershell
# Validar arquivos em uma pasta
python validar-pbix-pasta.py "C:\MeusProjetos\PowerBI"
```

O script usa apenas a biblioteca padrão do Python. Ele confirma que o arquivo é um ZIP íntegro, o que detecta downloads incompletos e arquivos truncados, mas **não garante** que o Power BI consiga abrir o modelo.

## Contribua!

Todos estes scripts estão disponíveis no [repositório do blog no GitHub](https://github.com/flozer/flozer.github.io/tree/main/_includes/scripts).

Se você tiver sugestões de melhorias ou novos scripts úteis, sinta-se à vontade para:
- Abrir uma [issue](https://github.com/flozer/flozer.github.io/issues)
- Comentar abaixo
- Enviar um pull request

---

**Gostou deste conteúdo?** Compartilhe com outros profissionais de Power BI e me conte nos comentários quais scripts você mais usa no seu dia a dia!