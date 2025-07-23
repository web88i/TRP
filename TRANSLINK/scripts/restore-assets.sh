#!/bin/bash

# TRANSLINK Asset Restoration Script
# This script helps restore missing assets from the original project

echo "🔧 TRANSLINK Asset Restoration Script"
echo "======================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if we're in the right directory
if [ ! -f "package.json" ] || [ ! -d "TRANSLINK" ]; then
    echo -e "${RED}❌ Error: Please run this script from the project root directory${NC}"
    exit 1
fi

echo -e "${YELLOW}📋 Creating required asset directories...${NC}"

# Create asset directory structure
mkdir -p TRANSLINK/public/assets/{models,audio,textures,fonts,images/ai-images}

echo -e "${GREEN}✅ Asset directories created${NC}"

echo -e "${YELLOW}📋 Asset restoration checklist:${NC}"
echo ""
echo "Please manually copy the following files from the original project:"
echo ""

echo -e "${YELLOW}🎮 3D MODELS (CRITICAL):${NC}"
echo "  📁 Source: public/assets/models/"
echo "  📁 Target: TRANSLINK/public/assets/models/"
echo "  📄 Files needed:"
echo "    - scene-258.glb"
echo ""

echo -e "${YELLOW}🔊 AUDIO FILES (HIGH PRIORITY):${NC}"
echo "  📁 Source: public/assets/audio/"
echo "  📁 Target: TRANSLINK/public/assets/audio/"
echo "  📄 Files needed:"
echo "    - AETHER_2.5_synthloop-03.mp3"
echo "    - AETHER_2.5_powerloop-02.mp3"
echo "    - AETHER_2.5_UI_ask-aether-open-03.mp3"
echo "    - AETHER_2.5_UI_menu-close-03.mp3"
echo "    - AETHER_2.5_UI_menu-open-03.mp3"
echo "    - AETHER_2.5_UI_question-send-03.mp3"
echo "    - AETHER_2.5_UI_reply-03.mp3"
echo ""

echo -e "${YELLOW}🎨 TEXTURES (CRITICAL):${NC}"
echo "  📁 Source: public/assets/textures/"
echo "  📁 Target: TRANSLINK/public/assets/textures/"
echo "  📄 Files needed:"
echo "    - noise-r.png"
echo "    - matcap-glass-01.png"
echo "    - headphone-emissive-11.webp"
echo "    - headphone-emissive-mask-06.webp"
echo "    - headphone-normal-10.webp"
echo "    - headphone-roughness-ao-03.webp"
echo "    - headphone-silicone-19.webp"
echo "    - case-alpha-ao-03.webp"
echo "    - case-emissive-16.webp"
echo "    - case-matcap-mask-01.webp"
echo "    - bloom-12.webp"
echo ""

echo -e "${YELLOW}🔤 FONTS (MEDIUM PRIORITY):${NC}"
echo "  📁 Source: public/assets/fonts/"
echo "  📁 Target: TRANSLINK/public/assets/fonts/"
echo "  📄 Files needed:"
echo "    - Manrope-Regular.woff2"
echo "    - AzeretMono-Light.woff2"
echo ""

echo -e "${YELLOW}🤖 AI IMAGES (MEDIUM PRIORITY):${NC}"
echo "  📁 Source: public/assets/images/ai-images/"
echo "  📁 Target: TRANSLINK/public/assets/images/ai-images/"
echo "  📄 Files needed:"
echo "    - avatar1.webp"
echo "    - avatar2.webp"
echo "    - default.webp"
echo ""

echo -e "${YELLOW}🧹 CLEANUP UNRELATED FILES:${NC}"
echo "  Run the following commands to remove unrelated files:"
echo ""
echo "  rm -f public/assets/collect.txt"
echo "  rm -f public/assets/css/aether1.local.css"
echo "  rm -f public/assets/d73958b3-81a7-426a-8675-5162d4ac4425"
echo "  rm -f public/assets/images/logo.png"
echo "  rm -f public/assets/images/placeholder.svg"
echo "  rm -f public/assets/images/aether1-opengraph.webp"
echo "  rm -f public/assets/images/noise-transparent.png"
echo "  rm -f public/assets/index.html"
echo ""

echo -e "${GREEN}📋 After copying assets, run:${NC}"
echo "  cd TRANSLINK"
echo "  npm run dev"
echo ""
echo -e "${GREEN}🔍 Then check browser console for any remaining 404 errors${NC}"

echo ""
echo -e "${YELLOW}⚠️  WARNING: The TRANSLINK project will not function until these assets are restored!${NC}"