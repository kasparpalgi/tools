#!/usr/bin/env node
const fs = require('fs');
const path = require('path');

// Configuration
const INCLUDE_FILE_NAME = false; // If set true will add the file path and name at the top of the file and when false won't add

const filePaths = process.argv.slice(2);

if (filePaths.length === 0) {
    console.log('Usage: consolidate <file1> <file2> <file3> ...');
    console.log('Example: consolidate src/App.svelte src/utils.ts');
    process.exit(1);
}

const notesDir = path.join(process.cwd(), '_notes');
if (!fs.existsSync(notesDir)) {
    fs.mkdirSync(notesDir, { recursive: true });
}

const outputFile = path.join(notesDir, 'code');
let consolidatedContent = '';

filePaths.forEach(filePath => {
    const fullPath = path.join(process.cwd(), filePath);

    if (!fs.existsSync(fullPath)) {
        console.log(`⚠️  File not found: ${filePath}`);
        return;
    }

    try {
        const content = fs.readFileSync(fullPath, 'utf8');

        if (INCLUDE_FILE_NAME) {
            const separator = '='.repeat(80);
            consolidatedContent += `${separator}\n`;
            consolidatedContent += `File: ${filePath}\n`;
            consolidatedContent += `${separator}\n\n`;
        }

        consolidatedContent += content;
        consolidatedContent += '\n\n\n';

        console.log(`✓ Added: ${filePath}`);
    } catch (error) {
        console.log(`✗ Error reading ${filePath}: ${error.message}`);
    }
});

try {
    fs.writeFileSync(outputFile, consolidatedContent, 'utf8');
    console.log(`\n✓ Code consolidated into: _notes/code`);
} catch (error) {
    console.error(`Error writing output file: ${error.message}`);
    process.exit(1);
}