# 📦 Asset Migration Guide

## Overview
This guide provides detailed instructions for migrating assets from the original project to the TRANSLINK architecture.

---

## 🎯 Asset Categories

### 1. **3D Models** (CRITICAL)
**Location:** `/public/assets/models/`

| File | Size | Usage | Priority |
|------|------|-------|----------|
| `scene-258.glb` | ~5MB | Main earbuds 3D model | CRITICAL |

**Migration Steps:**
1. Copy from original `public/assets/models/`
2. Verify DRACO compression is working
3. Test loading in WebGL scenes

### 2. **Audio Files** (HIGH)
**Location:** `/public/assets/audio/`

| File | Usage | Volume | Priority |
|------|-------|--------|----------|
| `AETHER_2.5_synthloop-03.mp3` | Background music | 1.0 | HIGH |
| `AETHER_2.5_powerloop-02.mp3` | Background music | 0.46 | HIGH |
| `AETHER_2.5_UI_ask-aether-open-03.mp3` | UI feedback | 1.0 | MEDIUM |
| `AETHER_2.5_UI_menu-close-03.mp3` | UI feedback | 0.55 | MEDIUM |
| `AETHER_2.5_UI_menu-open-03.mp3` | UI feedback | 0.55 | MEDIUM |
| `AETHER_2.5_UI_question-send-03.mp3` | UI feedback | 1.0 | MEDIUM |
| `AETHER_2.5_UI_reply-03.mp3` | UI feedback | 0.8 | MEDIUM |

### 3. **Textures** (CRITICAL)
**Location:** `/public/assets/textures/`

#### Core Textures
| File | Usage | Format | Priority |
|------|-------|--------|----------|
| `noise-r.png` | Procedural effects | PNG | CRITICAL |
| `matcap-glass-01.png` | Glass material | PNG | CRITICAL |

#### Earphone Textures
| File | Usage | Format | Priority |
|------|-------|--------|----------|
| `headphone-emissive-11.webp` | Emissive lighting | WebP | CRITICAL |
| `headphone-emissive-mask-06.webp` | Emissive mask | WebP | CRITICAL |
| `headphone-normal-10.webp` | Normal mapping | WebP | CRITICAL |
| `headphone-roughness-ao-03.webp` | Surface properties | WebP | CRITICAL |
| `headphone-silicone-19.webp` | Silicone material | WebP | CRITICAL |

#### Case Textures
| File | Usage | Format | Priority |
|------|-------|--------|----------|
| `case-alpha-ao-03.webp` | Alpha/AO mapping | WebP | CRITICAL |
| `case-emissive-16.webp` | Case lighting | WebP | CRITICAL |
| `case-matcap-mask-01.webp` | Material masking | WebP | CRITICAL |

#### Effect Textures
| File | Usage | Format | Priority |
|------|-------|--------|----------|
| `bloom-12.webp` | Bloom effects | WebP | MEDIUM |

### 4. **Fonts** (MEDIUM)
**Location:** `/public/assets/fonts/`

| File | Usage | Format | Priority |
|------|-------|--------|----------|
| `Manrope-Regular.woff2` | Primary UI font | WOFF2 | MEDIUM |
| `AzeretMono-Light.woff2` | Monospace font | WOFF2 | MEDIUM |

### 5. **AI Images** (MEDIUM)
**Location:** `/public/assets/images/ai-images/`

| File | Usage | Priority |
|------|-------|----------|
| `avatar1.webp` | AI assistant avatar | MEDIUM |
| `avatar2.webp` | AI assistant avatar | MEDIUM |
| `default.webp` | Default AI image | MEDIUM |

---

## 🔧 Migration Process

### Step 1: Prepare Directories
```bash
cd TRANSLINK
mkdir -p public/assets/{models,audio,textures,fonts,images/ai-images}
```

### Step 2: Copy Assets
```bash
# From original project root:
cp public/assets/models/*.glb TRANSLINK/public/assets/models/
cp public/assets/audio/*.mp3 TRANSLINK/public/assets/audio/
cp public/assets/textures/*.{png,webp} TRANSLINK/public/assets/textures/
cp public/assets/fonts/*.woff2 TRANSLINK/public/assets/fonts/
cp public/assets/images/ai-images/*.webp TRANSLINK/public/assets/images/ai-images/
```

### Step 3: Verify Migration
```bash
cd TRANSLINK
node scripts/verify-assets.js
```

### Step 4: Test Loading
```bash
npm run dev
# Check browser console for 404 errors
```

---

## 🎨 Asset Optimization

### 3D Models
- **Compression:** DRACO compression enabled
- **LOD:** Consider multiple detail levels
- **Size Limit:** Keep under 10MB per model

### Textures
- **Format:** WebP for photos, PNG for graphics
- **Size:** Power of 2 dimensions preferred
- **Compression:** Optimize for web delivery

### Audio
- **Format:** MP3 for compatibility
- **Quality:** 128kbps for UI sounds, 192kbps for music
- **Size:** Keep individual files under 5MB

### Fonts
- **Format:** WOFF2 for modern browsers
- **Subsetting:** Include only required characters
- **Preload:** Critical fonts should be preloaded

---

## 🔍 Validation Checklist

### Pre-Migration
- [ ] Identify all asset references in code
- [ ] Document current asset usage
- [ ] Plan directory structure

### During Migration
- [ ] Copy all required assets
- [ ] Maintain file naming conventions
- [ ] Preserve directory structure

### Post-Migration
- [ ] Run asset verification script
- [ ] Test all WebGL scenes
- [ ] Verify audio playback
- [ ] Check font rendering
- [ ] Test AI image display
- [ ] Monitor browser console for errors

---

## 🚨 Troubleshooting

### Common Issues

#### 404 Asset Errors
- **Cause:** Missing files or incorrect paths
- **Solution:** Verify file exists and path is correct
- **Check:** Browser Network tab for failed requests

#### 3D Model Not Loading
- **Cause:** Missing DRACO decoder or corrupted file
- **Solution:** Verify DRACO files and model integrity
- **Check:** WebGL console errors

#### Audio Not Playing
- **Cause:** Missing audio files or codec issues
- **Solution:** Verify audio files and browser support
- **Check:** Audio context state and file formats

#### Textures Not Rendering
- **Cause:** Missing texture files or format issues
- **Solution:** Verify texture files and WebGL support
- **Check:** Material uniforms and texture loading

---

## 📈 Performance Considerations

### Loading Optimization
- **Lazy Loading:** Load assets on demand
- **Preloading:** Critical assets loaded first
- **Caching:** Proper cache headers set
- **Compression:** Enable gzip/brotli

### Memory Management
- **Disposal:** Properly dispose unused assets
- **Pooling:** Reuse objects where possible
- **Monitoring:** Track memory usage

---

## 🔄 Maintenance

### Regular Checks
- Monitor asset loading performance
- Update assets as needed
- Clean up unused files
- Optimize based on usage analytics

### Version Control
- Track asset changes
- Document asset updates
- Maintain asset inventory

---

*This guide ensures all assets are properly migrated and optimized for the TRANSLINK project.*