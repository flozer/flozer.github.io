---
title: "Scripts Úteis DAX para Power BI"
date: 2025-01-23 14:00:00 -0300
categories: [Power BI, Scripts]
tags: [dax, powerbi, scripts, dax-studio, otimizacao]
image:
  path: https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=1200&h=630&fit=crop
  alt: "Análise de dados e dashboards"
---

## Introdução

Scripts DAX são extremamente úteis para análise e manutenção de modelos semânticos no Power BI. Utilizando o **DAX Studio**, você pode executar queries para inspecionar metadados, identificar problemas e otimizar seu modelo.

Neste post, compartilho alguns scripts que uso frequentemente no meu dia a dia como Analytics Engineer.

> **Dica:** Todos os scripts abaixo estão armazenados no repositório do blog e são atualizados conforme descubro melhorias. Use os botões de download para salvá-los localmente!
{: .prompt-tip }

## 1. Listar Medidas Sem Pasta de Exibição

Um modelo organizado facilita muito a manutenção. Este script identifica todas as medidas que não estão organizadas em pastas de exibição.

{% include script-file.html
   file="scripts/dax/listar-medidas-sem-pasta.dax"
   language="dax"
   title="Listar Medidas Sem Pasta"
   description="Identifica medidas que precisam ser organizadas em pastas de exibição"
%}

### Como usar:

1. Abra o **DAX Studio** e conecte ao seu modelo
2. Cole o script acima
3. Execute (F5)
4. Analise as medidas retornadas e organize-as em pastas

### Por que isso é importante:

- Melhora a **experiência do usuário** no Power BI Desktop
- Facilita a **manutenção** do modelo
- Segue as **boas práticas** de modelagem

## 2. Análise de Cardinalidade de Tabelas

Entender o tamanho das suas tabelas é fundamental para otimização. Este script mostra quantas linhas, colunas e medidas cada tabela possui.

{% include script-file.html
   file="scripts/dax/analise-cardinalidade-tabelas.dax"
   language="dax"
   title="Análise de Cardinalidade"
   description="Mostra linhas, colunas e medidas de cada tabela do modelo"
%}

### O que você descobre com este script:

- **Tabelas grandes** que podem impactar performance
- **Tabelas vazias** ou com poucos registros (possíveis candidatas para remoção)
- **Distribuição de medidas** entre as tabelas

### Dica de otimização:

Se encontrar tabelas com milhões de linhas, considere:
- Aplicar filtros no Power Query para reduzir dados
- Usar agregações (Aggregations) no modelo
- Avaliar se todos os dados são realmente necessários

## Bônus: Scripts PowerShell e Python

Além dos scripts DAX, também compartilho automações úteis:

### Backup Automático de Arquivos PBIX

{% include script-file.html
   file="scripts/powershell/backup-pbix-automatico.ps1"
   language="powershell"
   title="Backup Automático PBIX"
   description="Cria backups automáticos com timestamp de arquivos Power BI"
%}

**Como executar:**

```powershell
# Fazer backup de todos os .pbix em uma pasta
.\backup-pbix-automatico.ps1 -SourcePath "C:\MeusProjetos\PowerBI"

# Especificar pasta de backup customizada
.\backup-pbix-automatico.ps1 -SourcePath "C:\Projetos" -BackupPath "D:\Backups"
```

### Validar Arquivos PBIX

{% include script-file.html
   file="scripts/python/validar-pbix-pasta.py"
   language="python"
   title="Validador de PBIX"
   description="Verifica integridade de arquivos PBIX em uma pasta"
%}

**Como executar:**

```bash
# Validar arquivos em uma pasta
python validar-pbix-pasta.py "C:\MeusProjetos\PowerBI"
```

## Contribua!

Todos estes scripts estão disponíveis no [repositório do blog no GitHub](https://github.com/flozer/flozer.github.io/tree/main/scripts).

Se você tiver sugestões de melhorias ou novos scripts úteis, sinta-se à vontade para:
- Abrir uma [issue](https://github.com/flozer/flozer.github.io/issues)
- Comentar abaixo
- Enviar um pull request

## Próximos Scripts

Estou preparando mais scripts úteis para:
- Identificar colunas não utilizadas em visuais
- Analisar relacionamentos do modelo
- Exportar documentação do modelo automaticamente
- Scripts de otimização de DAX

Fique ligado! 🚀

---

**Gostou deste conteúdo?** Compartilhe com outros profissionais de Power BI e me conte nos comentários quais scripts você mais usa no seu dia a dia!