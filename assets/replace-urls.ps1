# Script para Substituição de URLs por Assets Locais

Este script PowerShell automatiza a substituição das URLs externas pelos assets locais.

## Como usar:

1. Abra o PowerShell como administrador
2. Execute: `Set-ExecutionPolicy RemoteSigned` (se necessário)
3. Execute o script: `.\replace-urls.ps1`

```powershell
# replace-urls.ps1 - Script para substituir URLs por assets locais

# Definir o diretório base do projeto
$projectDir = "c:\Users\felip\Downloads\INSIDERS\PROJETOS INTEGRADOS A\PROJETOS-INTEGRADOS-A"

# Mapeamento de URLs para assets locais (15 imagens essenciais)
$urlMappings = @{
    # Personalidades Históricas (3 essenciais)
    "https://upload.wikimedia.org/wikipedia/commons/d/d7/Johannes_Kepler_1610.jpg" = "assets/historicos/kepler-portrait-1610.svg"
    "https://upload.wikimedia.org/wikipedia/commons/2/2b/Tycho_Brahe.JPG" = "assets/historicos/tycho-brahe.svg"
    "https://upload.wikimedia.org/wikipedia/commons/3/39/GodfreyKneller-IsaacNewton-1689.jpg" = "assets/historicos/isaac-newton.svg"
    
    # Sistemas Astronômicos (3 essenciais)
    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Ptolemaicsystem-small.png/600px-Ptolemaicsystem-small.png" = "assets/sistemas/ptolemaic-system.svg"
    "https://upload.wikimedia.org/wikipedia/commons/c/c7/Copernican_heliocentrism_diagram-2.jpg" = "assets/sistemas/copernican-system.svg"
    "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Mars_orbit.png/600px-Mars_orbit.png" = "assets/sistemas/mars-orbit.svg"
    
    # Leis de Kepler (6 essenciais)
    "https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Kepler-first-law.svg/600px-Kepler-first-law.svg.png" = "assets/leis/first-law-ellipse.svg"
    "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Kepler-second-law.svg/600px-Kepler-second-law.svg.png" = "assets/leis/second-law-areas.svg"
    "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Kepler_third_law_plot.svg/600px-Kepler_third_law_plot.svg.png" = "assets/leis/third-law-graph.svg"
    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Ellipse_drawing.gif/600px-Ellipse_drawing.gif" = "assets/leis/ellipse-construction.gif"
    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Kepler_law2_areas.gif/600px-Kepler_law2_areas.gif" = "assets/leis/equal-areas-animation.gif"
    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Astronomia_Nova.jpg/300px-Astronomia_Nova.jpg" = "assets/leis/astronomia-nova-cover.svg"
    
    # Aplicações Modernas (3 essenciais)
    "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Newton_gravitation_pull.svg/600px-Newton_gravitation_pull.svg.png" = "assets/modernas/universal-gravitation.svg"
    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Doppler_spectroscopy.svg/600px-Doppler_spectroscopy.svg.png" = "assets/modernas/exoplanet-detection.svg"
    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/New_Horizons_trajectory.svg/600px-New_Horizons_trajectory.svg.png" = "assets/modernas/space-trajectories.svg"
}

# Arquivos para processar
$filesToProcess = @(
    "$projectDir\index.html",
    "$projectDir\historia.html",
    "$projectDir\experimentos.html",
    "$projectDir\kepler-simulator.html"
)

Write-Host "Iniciando substituição de URLs para 15 imagens essenciais..." -ForegroundColor Green

foreach ($file in $filesToProcess) {
    if (Test-Path $file) {
        Write-Host "Processando: $file" -ForegroundColor Yellow
        
        $content = Get-Content -Path $file -Raw -Encoding UTF8
        $originalContent = $content
        
        foreach ($url in $urlMappings.Keys) {
            $localPath = $urlMappings[$url]
            $content = $content -replace [regex]::Escape($url), $localPath
        }
        
        if ($content -ne $originalContent) {
            Set-Content -Path $file -Value $content -Encoding UTF8
            Write-Host "  ✓ URLs substituídas em $file" -ForegroundColor Green
        } else {
            Write-Host "  - Nenhuma URL encontrada em $file" -ForegroundColor Gray
        }
    } else {
        Write-Host "  ✗ Arquivo não encontrado: $file" -ForegroundColor Red
    }
}

Write-Host "`nSubstituição concluída!" -ForegroundColor Green
Write-Host "Próximos passos:" -ForegroundColor Cyan
Write-Host "1. Baixar as 15 imagens essenciais das URLs originais" -ForegroundColor White
Write-Host "2. Converter/otimizar as imagens para web (WebP recomendado)" -ForegroundColor White
Write-Host "3. Substituir os placeholders SVG pelas imagens reais" -ForegroundColor White
Write-Host "4. Testar o projeto localmente" -ForegroundColor White
Write-Host "5. Verificar que o foco educacional foi mantido" -ForegroundColor White
```

## Lista de Arquivos Criados

### Placeholders SVG criados:
- `assets/historicos/kepler-portrait-1610.svg`
- `assets/historicos/tycho-brahe.svg`
- `assets/leis/first-law-ellipse.svg`
- `assets/leis/second-law-areas.svg`
- `assets/leis/third-law-graph.svg`
- `assets/sistemas/ptolemaic-system.svg`
- `assets/sistemas/copernican-system.svg`
- `assets/obras/astronomia-nova-cover.svg`
- `assets/backgrounds/starfield-header.svg`

### Diretórios criados:
- `assets/historicos/`
- `assets/sistemas/`
- `assets/obras/`
- `assets/leis/`
- `assets/modernas/`
- `assets/backgrounds/`

## Checklist para Implementação

- [ ] Executar o script replace-urls.ps1
- [ ] Baixar imagens reais das URLs da Wikipedia Commons
- [ ] Otimizar imagens para web (compressão, WebP)
- [ ] Substituir placeholders SVG pelas imagens reais
- [ ] Testar funcionamento local
- [ ] Implementar lazy loading para performance
- [ ] Adicionar alt text apropriado para acessibilidade
- [ ] Verificar responsividade em diferentes dispositivos
