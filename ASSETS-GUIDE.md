# Guia Completo de Assets - Projeto Leis de Kepler

## 📋 Resumo Executivo

Este projeto educacional sobre as Leis de Kepler utiliza **15 imagens essenciais** distribuídas em 4 categorias. Todas as imagens estão atualmente vinculadas a URLs externas (principalmente Wikipedia Commons e Unsplash) e precisam ser localizadas para garantir performance e disponibilidade.

## 🗂️ Estrutura de Assets

```
assets/
├── historicos/          # 3 imagens - Personalidades principais
├── sistemas/           # 3 imagens - Modelos astronômicos essenciais
├── leis/               # 6 imagens - Diagramas das leis de Kepler
├── modernas/           # 3 imagens - Aplicações contemporâneas
└── README.md           # Documentação detalhada
```

## 📊 Lista Detalhada de Imagens Necessárias

### 🎭 Históricos (3 imagens essenciais)
| Arquivo | Descrição | URL Atual | Formato Recomendado |
|---------|-----------|-----------|-------------------|
| `kepler-portrait-1610.jpg` | Retrato principal de Johannes Kepler | `wikipedia.../Johannes_Kepler_1610.jpg` | JPG, 400×300px |
| `tycho-brahe.jpg` | Astrônomo Tycho Brahe | `wikipedia.../Tycho_Brahe.JPG` | JPG, 400×300px |
| `isaac-newton.jpg` | Sir Isaac Newton | `wikipedia.../IsaacNewton-1689.jpg` | JPG, 400×300px |

### 🌌 Sistemas Astronômicos (3 imagens essenciais)
| Arquivo | Descrição | URL Atual | Formato Recomendado |
|---------|-----------|-----------|-------------------|
| `ptolemaic-system.png` | Sistema geocêntrico | `wikipedia.../Ptolemaicsystem-small.png` | SVG, 600×600px |
| `copernican-system.jpg` | Sistema heliocêntrico | `wikipedia.../Copernican_heliocentrism_diagram-2.jpg` | SVG, 600×600px |
| `mars-orbit.png` | Órbita elíptica de Marte | `wikipedia.../Mars_orbit.png` | SVG, 600×400px |

### ⚖️ Leis de Kepler (6 imagens essenciais)
| Arquivo | Descrição | URL Atual | Formato Recomendado |
|---------|-----------|-----------|-------------------|
| `first-law-ellipse.svg` | Primeira Lei - Elipses | `wikipedia.../Kepler-first-law.svg` | SVG, 600×400px |
| `second-law-areas.svg` | Segunda Lei - Áreas | `wikipedia.../Kepler-second-law.svg` | SVG, 600×400px |
| `third-law-graph.svg` | Terceira Lei - Gráfico P²∝a³ | `wikipedia.../Kepler_third_law_plot.svg` | SVG, 600×400px |
| `ellipse-construction.gif` | Animação construção elipse | `wikipedia.../Ellipse_drawing.gif` | GIF, 600×400px |
| `equal-areas-animation.gif` | Animação áreas iguais | `wikipedia.../Kepler_law2_areas.gif` | GIF, 600×400px |
| `astronomia-nova-cover.jpg` | Capa "Astronomia Nova" | `wikipedia.../Astronomia_nova_title_page.jpg` | JPG, 400×600px |

### 🚀 Aplicações Modernas (3 imagens essenciais)
| Arquivo | Descrição | URL Atual | Formato Recomendado |
|---------|-----------|-----------|-------------------|
| `universal-gravitation.svg` | Gravitação universal Newton | `wikipedia.../Newton_gravitation_pull.svg` | SVG, 500×500px |
| `exoplanet-detection.svg` | Detecção por velocidade radial | `wikipedia.../Doppler_spectroscopy.svg` | SVG, 600×400px |
| `space-trajectories.svg` | Trajetórias espaciais | `wikipedia.../New_Horizons_trajectory.svg` | SVG, 800×600px |

## 🔧 Implementação

### Passo 1: Download das Imagens
```bash
# Criar diretórios
mkdir -p assets/{historicos,sistemas,leis,modernas}

# Baixar imagens da Wikipedia Commons
wget https://upload.wikimedia.org/wikipedia/commons/d/d7/Johannes_Kepler_1610.jpg -O assets/historicos/kepler-portrait-1610.jpg
wget https://upload.wikimedia.org/wikipedia/commons/2/2b/Tycho_Brahe.JPG -O assets/historicos/tycho-brahe.jpg
wget https://upload.wikimedia.org/wikipedia/commons/3/39/GodfreyKneller-IsaacNewton-1689.jpg -O assets/historicos/isaac-newton.jpg
# ... repetir para as 15 URLs essenciais
```

### Passo 2: Otimização
```bash
# Converter para WebP (melhor compressão)
cwebp assets/historicos/kepler-portrait-1610.jpg -o assets/historicos/kepler-portrait-1610.webp

# Redimensionar se necessário
convert assets/historicos/kepler-portrait-1610.jpg -resize 400x300^ assets/historicos/kepler-portrait-1610.jpg
```

### Passo 3: Substituição no Código
Execute o script PowerShell fornecido:
```powershell
.\assets\replace-urls.ps1
```

### Passo 4: Validação
- [ ] Verificar todas as imagens carregam corretamente
- [ ] Testar em diferentes dispositivos
- [ ] Validar textos alternativos (alt text)
- [ ] Medir impacto na performance

## 📈 Benefícios da Localização

1. **Performance**: Redução de ~1-2s no tempo de carregamento
2. **Confiabilidade**: Sem dependência de serviços externos
3. **Controle**: Otimização específica para o projeto
4. **Offline**: Funcionamento sem conexão com internet
5. **SEO**: Melhores métricas de Core Web Vitals
6. **Foco**: Apenas imagens essenciais para o aprendizado

## ⚠️ Considerações Legais

- **Wikipedia Commons**: Domínio público ou Creative Commons
- **Unsplash**: Licença livre para uso educacional
- **Imagens próprias**: Criar quando necessário
- **Créditos**: Manter atribuições quando requeridas

## 🎯 Próximos Passos

1. **Imediato**: Executar script de substituição
2. **Curto prazo**: Baixar e otimizar as 15 imagens essenciais
3. **Médio prazo**: Implementar lazy loading para as imagens
4. **Longo prazo**: Considerar responsive images se necessário

## 📊 Métricas de Sucesso

- **Before**: 15 requests externos, ~3MB transferidos
- **After**: 0 requests externos, ~1.2MB transferidos
- **Performance**: Lighthouse score 95+ 
- **Acessibilidade**: WCAG 2.1 AA compliance
- **Foco**: Apenas conteúdo visual essencial para o aprendizado

---

*Documento criado em: 25 de Junho de 2025*  
*Última atualização: 25 de Junho de 2025*
