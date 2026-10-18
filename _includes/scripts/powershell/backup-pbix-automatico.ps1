# Script PowerShell: Backup de arquivos PBIX com timestamp
# Copia todos os arquivos .pbix de uma pasta para uma pasta de backup e,
# opcionalmente, apaga backups mais antigos que N dias.
#
# Os textos exibidos ficam sem acentos de proposito: o Windows PowerShell 5.1
# le scripts sem BOM como ANSI e quebraria caracteres especiais.
#
# Para rodar todo dia, agende no Agendador de Tarefas do Windows:
#   powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\Scripts\backup-pbix-automatico.ps1" -SourcePath "C:\MeusProjetos\PowerBI"

param(
    [Parameter(Mandatory = $true)]
    [string]$SourcePath,

    [Parameter(Mandatory = $false)]
    [string]$BackupPath = (Join-Path $SourcePath "Backups"),

    # Apaga backups com mais de N dias. 0 = nunca apaga.
    [Parameter(Mandatory = $false)]
    [int]$KeepDays = 0
)

if (-not (Test-Path $SourcePath)) {
    Write-Host "Pasta de origem nao encontrada: $SourcePath" -ForegroundColor Red
    exit 1
}

# Cria a pasta de backup se nao existir
if (-not (Test-Path $BackupPath)) {
    New-Item -ItemType Directory -Path $BackupPath | Out-Null
    Write-Host "Pasta de backup criada: $BackupPath" -ForegroundColor Green
}

$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$pbixFiles = @(Get-ChildItem -Path $SourcePath -Filter "*.pbix" -File)

if ($pbixFiles.Count -eq 0) {
    Write-Host "Nenhum arquivo PBIX encontrado em: $SourcePath" -ForegroundColor Yellow
    exit 0
}

$ok = 0
$falhas = 0

foreach ($file in $pbixFiles) {
    $backupName = "$($file.BaseName)_$timestamp$($file.Extension)"
    $backupFullPath = Join-Path $BackupPath $backupName

    try {
        # -ErrorAction Stop faz o catch capturar falhas de copia
        Copy-Item -Path $file.FullName -Destination $backupFullPath -Force -ErrorAction Stop
        Write-Host "[OK]   $backupName" -ForegroundColor Green
        $ok++
    }
    catch {
        Write-Host "[ERRO] $($file.Name): $($_.Exception.Message)" -ForegroundColor Red
        $falhas++
    }
}

if ($KeepDays -gt 0) {
    $limite = (Get-Date).AddDays(-$KeepDays)
    $antigos = @(Get-ChildItem -Path $BackupPath -Filter "*.pbix" -File |
        Where-Object { $_.LastWriteTime -lt $limite })
    $antigos | Remove-Item -Force
    Write-Host "Backups com mais de $KeepDays dias removidos: $($antigos.Count)" -ForegroundColor DarkGray
}

Write-Host "`nBackup concluido: $ok copiado(s), $falhas falha(s)" -ForegroundColor Cyan
if ($falhas -gt 0) { exit 1 }
