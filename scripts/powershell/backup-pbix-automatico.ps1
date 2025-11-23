# Script PowerShell: Backup automático de arquivos PBIX
# Cria cópias de segurança com timestamp de todos os arquivos .pbix em uma pasta

param(
    [Parameter(Mandatory=$true)]
    [string]$SourcePath,

    [Parameter(Mandatory=$false)]
    [string]$BackupPath = "$SourcePath\Backups"
)

# Cria pasta de backup se não existir
if (-not (Test-Path $BackupPath)) {
    New-Item -ItemType Directory -Path $BackupPath | Out-Null
    Write-Host "Pasta de backup criada: $BackupPath" -ForegroundColor Green
}

# Obtém data/hora atual para o timestamp
$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"

# Busca todos os arquivos PBIX
$pbixFiles = Get-ChildItem -Path $SourcePath -Filter "*.pbix" -File

if ($pbixFiles.Count -eq 0) {
    Write-Host "Nenhum arquivo PBIX encontrado em: $SourcePath" -ForegroundColor Yellow
    exit
}

# Faz backup de cada arquivo
foreach ($file in $pbixFiles) {
    $backupName = "$($file.BaseName)_$timestamp$($file.Extension)"
    $backupFullPath = Join-Path $BackupPath $backupName

    try {
        Copy-Item -Path $file.FullName -Destination $backupFullPath -Force
        Write-Host "✓ Backup criado: $backupName" -ForegroundColor Green
    }
    catch {
        Write-Host "✗ Erro ao fazer backup de $($file.Name): $_" -ForegroundColor Red
    }
}

Write-Host "`nBackup concluído! Total: $($pbixFiles.Count) arquivo(s)" -ForegroundColor Cyan