# Conso - Code Consolidator

A simple CLI tool to consolidate multiple code files into a single `_notes/code` file in your current directory. Suggested: have the `_notes` folder in the `gitignore`. Perfect for quickly gathering code or any text files into one single file for documentation, sharing, review or for AI context.

## Features

- ✨ Works from any directory
- 📁 Creates `_notes/code` file automatically on whatever folder you are (usually in your project's home folder)
- 🔍 Adds clear separators between files
- 🎯 Supports any text file type
- 💻 Cross-platform (Windows, macOS, Linux)

## Prerequisites

- Node.js installed (v14 or higher)
- npm (comes with Node.js)

## Installation

### macOS & Linux

1. **Clone or download the script**
   ```bash
   curl -O https://raw.githubusercontent.com/yourrepo/conso.js
   # Or manually create the file with the script content
   ```

2. **Create a directory for the tool**
   ```bash
   mkdir -p ~/bin/conso
   cd ~/bin/conso
   mv /path/to/consolidate-code.js .
   ```

3. **Initialize npm package**
   ```bash
   npm init -y
   ```

4. **Edit package.json to add bin field**
   ```bash
   npm pkg set bin.consolidate=./consolidate-code.js
   ```

5. **Make the script executable**
   ```bash
   chmod +x consolidate-code.js
   ```

6. **Link globally**
   ```bash
   npm link
   ```

7. **Verify installation**
   ```bash
   consolidate
   # Should show usage instructions
   ```

### Windows

1. **Clone or download the script**
   - Save `consolidate-code.js` to a permanent location (e.g., `C:\tools\consolidate-tool\`)

2. **Open Command Prompt or PowerShell as Administrator**

3. **Navigate to the tool directory**
   ```cmd
   cd C:\tools\consolidate-tool
   ```

4. **Initialize npm package**
   ```cmd
   npm init -y
   ```

5. **Add bin field to package.json**
   ```cmd
   npm pkg set bin.conso=./conso.js
   ```

6. **Link globally**
   ```cmd
   npm link
   ```

7. **Verify installation**
   ```cmd
   conso
   ```

**Note:** If you get permission errors, ensure you're running as Administrator.

### Alternative: Manual Installation (All Platforms)

If npm link doesn't work, you can add the script to your PATH manually:

**macOS/Linux:**
```bash
# Copy script to local bin
cp consolidate-code.js ~/.local/bin/consolidate
chmod +x ~/.local/bin/consolidate

# Add to PATH if not already (add to ~/.bashrc or ~/.zshrc)
export PATH="$HOME/.local/bin:$PATH"
```

**Windows:**
1. Create folder: `C:\tools\`
2. Copy `consolidate-code.js` there
3. Rename to `consolidate.js`
4. Add `C:\tools\` to System PATH:
   - Open System Properties → Environment Variables
   - Edit PATH variable
   - Add `C:\tools\`
5. Create batch file `C:\tools\consolidate.bat`:
   ```bat
   @echo off
   node "C:\tools\consolidate.js" %*
   ```

## Usage

Navigate to your project directory and run:

```bash
consolidate <file1> <file2> <file3> ...
```

### Examples

**Basic usage:**
```bash
consolidate src/App.svelte src/lib/utils.ts
```

**Multiple files:**
```bash
consolidate src/App.svelte src/lib/utils.ts components/Header.svelte lib/api.ts
```

**With wildcards (shell expansion):**
```bash
# Note: Your shell expands wildcards, not the tool
consolidate src/**/*.svelte
```

### Output

The tool creates a `_notes/code` file in your current directory:

```
================================================================================
File: src/App.svelte
================================================================================

<script>
  // Your Svelte component code
</script>


================================================================================
File: src/lib/utils.ts
================================================================================

export function myUtil() {
  // Your TypeScript code
}
```

## How It Works

1. Creates `_notes/` directory if it doesn't exist
2. Reads each specified file from your current working directory
3. Combines all content with clear separators
4. Writes to `_notes/code`
5. Shows a summary of processed files

## Troubleshooting

### Command not found

**macOS/Linux:**
- Ensure `npm link` completed successfully
- Check npm global bin path: `npm config get prefix`
- Verify it's in PATH: `echo $PATH`
- Try `npm unlink` then `npm link` again

**Windows:**
- Verify npm global path is in System PATH
- Run `npm config get prefix` to find npm global directory
- Add that directory to your PATH environment variable
- Restart Command Prompt/PowerShell

### Permission denied (macOS/Linux)

```bash
chmod +x consolidate-code.js
# Or if installed globally:
sudo chmod +x /usr/local/bin/consolidate
```

### Files not found

- Ensure you're running the command from the correct directory
- Use relative paths from your current location
- Check file paths for typos

## Uninstall

```bash
npm unlink -g consolidate
```

Or manually remove from:
- macOS/Linux: `~/.local/bin/consolidate` or `/usr/local/bin/consolidate`
- Windows: `C:\tools\consolidate.js` and `consolidate.bat`

## License

MIT - Feel free to use and modify!

## Contributing

Suggestions and improvements welcome!