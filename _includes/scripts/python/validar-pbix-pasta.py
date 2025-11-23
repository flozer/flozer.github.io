"""
Script Python: Validar arquivos PBIX em uma pasta
Verifica se os arquivos PBIX não estão corrompidos e lista informações básicas
Requer: pip install python-pptx (PBIX usa formato ZIP similar)
"""

import os
import zipfile
from pathlib import Path
from datetime import datetime

def validar_pbix(caminho_arquivo):
    """Valida se um arquivo PBIX está íntegro"""
    try:
        with zipfile.ZipFile(caminho_arquivo, 'r') as zip_ref:
            # Testa a integridade do arquivo
            test_result = zip_ref.testzip()
            if test_result is None:
                return True, "OK"
            else:
                return False, f"Arquivo corrompido: {test_result}"
    except zipfile.BadZipFile:
        return False, "Não é um arquivo ZIP válido"
    except Exception as e:
        return False, f"Erro: {str(e)}"

def listar_pbix(pasta):
    """Lista e valida todos os arquivos PBIX em uma pasta"""
    pasta_path = Path(pasta)

    if not pasta_path.exists():
        print(f"❌ Pasta não encontrada: {pasta}")
        return

    # Busca arquivos PBIX
    arquivos_pbix = list(pasta_path.glob("*.pbix"))

    if not arquivos_pbix:
        print(f"⚠️  Nenhum arquivo PBIX encontrado em: {pasta}")
        return

    print(f"\n📊 Análise de arquivos PBIX em: {pasta}\n")
    print(f"{'Arquivo':<40} {'Tamanho':<12} {'Modificado':<20} {'Status':<15}")
    print("-" * 95)

    total_validos = 0
    total_invalidos = 0

    for arquivo in sorted(arquivos_pbix):
        # Informações do arquivo
        tamanho = arquivo.stat().st_size
        tamanho_mb = f"{tamanho / (1024*1024):.2f} MB"
        modificado = datetime.fromtimestamp(arquivo.stat().st_mtime).strftime("%Y-%m-%d %H:%M:%S")

        # Valida o arquivo
        valido, mensagem = validar_pbix(arquivo)

        # Formatação do status
        if valido:
            status = f"✅ {mensagem}"
            total_validos += 1
        else:
            status = f"❌ {mensagem}"
            total_invalidos += 1

        # Exibe informações
        nome = arquivo.name[:37] + "..." if len(arquivo.name) > 40 else arquivo.name
        print(f"{nome:<40} {tamanho_mb:<12} {modificado:<20} {status}")

    # Resumo
    print("\n" + "=" * 95)
    print(f"Total: {len(arquivos_pbix)} arquivo(s) | Válidos: {total_validos} | Inválidos: {total_invalidos}")

if __name__ == "__main__":
    import sys

    if len(sys.argv) > 1:
        pasta = sys.argv[1]
    else:
        pasta = input("Digite o caminho da pasta com arquivos PBIX: ")

    listar_pbix(pasta)