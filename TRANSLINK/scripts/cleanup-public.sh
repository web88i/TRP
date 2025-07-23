#!/bin/bash

# TRANSLINK Public Folder Cleanup Script
# Removes unrelated files from the /public directory

echo "🧹 TRANSLINK Public Folder Cleanup"
echo "=================================="

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

echo -e "${YELLOW}🔍 Scanning for unrelated files...${NC}"

# List of unrelated files to remove
UNRELATED_FILES=(
    "public/assets/collect.txt"
    "public/assets/css/aether1.local.css"
    "public/assets/d73958b3-81a7-426a-8675-5162d4ac4425"
    "public/assets/images/logo.png"
    "public/assets/images/placeholder.svg"
    "public/assets/images/aether1-opengraph.webp"
    "public/assets/images/noise-transparent.png"
    "public/assets/index.html"
)

REMOVED_COUNT=0
TOTAL_COUNT=${#UNRELATED_FILES[@]}

echo ""
echo -e "${YELLOW}📋 Files to be removed:${NC}"

for file in "${UNRELATED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo -e "  🗑️  $file"
        rm "$file"
        REMOVED_COUNT=$((REMOVED_COUNT + 1))
        echo -e "    ${GREEN}✅ Removed${NC}"
    else
        echo -e "  ⚪ $file ${YELLOW}(not found)${NC}"
    fi
done

echo ""
echo -e "${GREEN}📊 Cleanup Summary:${NC}"
echo -e "  Total files checked: $TOTAL_COUNT"
echo -e "  Files removed: $REMOVED_COUNT"
echo -e "  Files not found: $((TOTAL_COUNT - REMOVED_COUNT))"

if [ $REMOVED_COUNT -gt 0 ]; then
    echo ""
    echo -e "${GREEN}✅ Cleanup completed successfully!${NC}"
    echo -e "${GREEN}🎉 /public folder is now clean and optimized${NC}"
else
    echo ""
    echo -e "${GREEN}✅ No unrelated files found - folder is already clean!${NC}"
fi

echo ""
echo -e "${YELLOW}💡 Next steps:${NC}"
echo -e "  1. Verify assets with: ${GREEN}node TRANSLINK/scripts/verify-assets.js${NC}"
echo -e "  2. Restore missing assets with: ${GREEN}./TRANSLINK/scripts/restore-assets.sh${NC}"
echo -e "  3. Test the application: ${GREEN}cd TRANSLINK && npm run dev${NC}"