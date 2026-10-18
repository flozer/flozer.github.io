# Scripts Úteis

Esta pasta contém scripts úteis para Power BI, DAX, Python, PowerShell e outras ferramentas de dados.

> **Nota:** Os scripts estão armazenados em `_includes/scripts/` para serem facilmente incluídos nos posts do blog Jekyll.

## 📁 Estrutura

```
_includes/scripts/
├── dax/               # Scripts DAX para DAX Studio e Power BI
├── powershell/        # Scripts PowerShell para automação
└── python/            # Scripts Python para automação e análise
```

## 🚀 Como Usar

### Scripts DAX
Execute no **DAX Studio** conectado ao seu modelo Power BI, ou na **Exibição de consulta DAX** do Power BI Desktop:
1. Abra o DAX Studio
2. Conecte ao seu arquivo PBIX ou workspace
3. Cole o script
4. Execute (F5)

Para criar uma nova pasta (por exemplo `sql/` ou `powerquery/`), adicione também o `case` da linguagem em `_includes/script-file.html`.

### Scripts PowerShell
Execute no **PowerShell** ou **PowerShell ISE**:
```powershell
.\nome-do-script.ps1 -Parametro "valor"
```

Mantenha os scripts `.ps1` sem acentos nos textos exibidos (ou salve em UTF-8 com BOM): o Windows PowerShell 5.1 lê arquivos sem BOM como ANSI.

### Scripts Python
Execute no terminal ou IDE Python:
```bash
python nome-do-script.py
```

## 📝 Contribuindo

Todos os scripts são mantidos e atualizados regularmente. Se você:
- Encontrou um bug
- Tem uma sugestão de melhoria
- Quer contribuir com um novo script

Abra uma [issue](https://github.com/flozer/flozer.github.io/issues) ou envie um pull request!

## 📖 Documentação

Cada script possui comentários explicativos. Para exemplos de uso completos, veja os posts do blog em [flozer.github.io](https://flozer.github.io).

## 📜 Licença

Todos os scripts são fornecidos "como estão" para uso livre. Use por sua conta e risco.