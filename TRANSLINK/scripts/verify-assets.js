#!/usr/bin/env node

/**
 * TRANSLINK Asset Verification Script
 * Verifies that all required assets are present and accessible
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const projectRoot = path.resolve(__dirname, '..');

// Colors for console output
const colors = {
  red: '\x1b[31m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  blue: '\x1b[34m',
  reset: '\x1b[0m'
};

// Required assets mapping
const requiredAssets = {
  models: [
    'scene-258.glb'
  ],
  audio: [
    'AETHER_2.5_synthloop-03.mp3',
    'AETHER_2.5_powerloop-02.mp3',
    'AETHER_2.5_UI_ask-aether-open-03.mp3',
    'AETHER_2.5_UI_menu-close-03.mp3',
    'AETHER_2.5_UI_menu-open-03.mp3',
    'AETHER_2.5_UI_question-send-03.mp3',
    'AETHER_2.5_UI_reply-03.mp3'
  ],
  textures: [
    'noise-r.png',
    'matcap-glass-01.png',
    'headphone-emissive-11.webp',
    'headphone-emissive-mask-06.webp',
    'headphone-normal-10.webp',
    'headphone-roughness-ao-03.webp',
    'headphone-silicone-19.webp',
    'case-alpha-ao-03.webp',
    'case-emissive-16.webp',
    'case-matcap-mask-01.webp',
    'bloom-12.webp'
  ],
  fonts: [
    'Manrope-Regular.woff2',
    'AzeretMono-Light.woff2'
  ],
  'images/ai-images': [
    'avatar1.webp',
    'avatar2.webp',
    'default.webp'
  ]
};

function log(message, color = 'reset') {
  console.log(`${colors[color]}${message}${colors.reset}`);
}

function checkAssetExists(category, filename) {
  const assetPath = path.join(projectRoot, 'public', 'assets', category, filename);
  return fs.existsSync(assetPath);
}

function getFileSize(category, filename) {
  try {
    const assetPath = path.join(projectRoot, 'public', 'assets', category, filename);
    const stats = fs.statSync(assetPath);
    return (stats.size / 1024).toFixed(2) + ' KB';
  } catch (error) {
    return 'N/A';
  }
}

function verifyAssets() {
  log('\n🔍 TRANSLINK Asset Verification Report', 'blue');
  log('==========================================', 'blue');
  
  let totalAssets = 0;
  let missingAssets = 0;
  let presentAssets = 0;
  
  const missingFiles = [];
  
  for (const [category, files] of Object.entries(requiredAssets)) {
    log(`\n📁 ${category.toUpperCase()}:`, 'yellow');
    
    for (const filename of files) {
      totalAssets++;
      const exists = checkAssetExists(category, filename);
      
      if (exists) {
        const size = getFileSize(category, filename);
        log(`  ✅ ${filename} (${size})`, 'green');
        presentAssets++;
      } else {
        log(`  ❌ ${filename}`, 'red');
        missingAssets++;
        missingFiles.push(`${category}/${filename}`);
      }
    }
  }
  
  // Summary
  log('\n📊 SUMMARY:', 'blue');
  log(`Total Assets: ${totalAssets}`);
  log(`Present: ${presentAssets}`, presentAssets === totalAssets ? 'green' : 'yellow');
  log(`Missing: ${missingAssets}`, missingAssets === 0 ? 'green' : 'red');
  
  const completionPercentage = ((presentAssets / totalAssets) * 100).toFixed(1);
  log(`Completion: ${completionPercentage}%`, completionPercentage === '100.0' ? 'green' : 'red');
  
  if (missingAssets > 0) {
    log('\n🚨 MISSING ASSETS:', 'red');
    missingFiles.forEach(file => {
      log(`  - ${file}`, 'red');
    });
    
    log('\n⚠️  WARNING: Application may not function properly with missing assets!', 'yellow');
    log('\n💡 To restore assets, run:', 'blue');
    log('   ./scripts/restore-assets.sh', 'blue');
  } else {
    log('\n🎉 All required assets are present!', 'green');
    log('✅ TRANSLINK project is ready for development', 'green');
  }
  
  return missingAssets === 0;
}

function checkUnrelatedFiles() {
  log('\n🧹 CHECKING FOR UNRELATED FILES:', 'blue');
  
  const unrelatedFiles = [
    'public/assets/collect.txt',
    'public/assets/css/aether1.local.css',
    'public/assets/d73958b3-81a7-426a-8675-5162d4ac4425',
    'public/assets/images/logo.png',
    'public/assets/images/placeholder.svg',
    'public/assets/images/aether1-opengraph.webp',
    'public/assets/images/noise-transparent.png',
    'public/assets/index.html'
  ];
  
  const foundUnrelated = [];
  
  for (const file of unrelatedFiles) {
    const fullPath = path.join(process.cwd(), file);
    if (fs.existsSync(fullPath)) {
      foundUnrelated.push(file);
      log(`  🗑️  ${file}`, 'yellow');
    }
  }
  
  if (foundUnrelated.length > 0) {
    log(`\n⚠️  Found ${foundUnrelated.length} unrelated files that should be removed`, 'yellow');
    log('\n💡 To clean up, run:', 'blue');
    foundUnrelated.forEach(file => {
      log(`   rm ${file}`, 'blue');
    });
  } else {
    log('✅ No unrelated files found', 'green');
  }
  
  return foundUnrelated;
}

// Main execution
async function main() {
  try {
    const assetsComplete = verifyAssets();
    const unrelatedFiles = checkUnrelatedFiles();
    
    log('\n' + '='.repeat(50), 'blue');
    
    if (assetsComplete && unrelatedFiles.length === 0) {
      log('🎉 AUDIT PASSED: Project is ready!', 'green');
      process.exit(0);
    } else {
      log('⚠️  AUDIT FAILED: Issues found that need attention', 'red');
      process.exit(1);
    }
    
  } catch (error) {
    log(`❌ Error during verification: ${error.message}`, 'red');
    process.exit(1);
  }
}

main();