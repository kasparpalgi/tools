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
   mv /path/to/conso.js .
   ```

3. **Initialize npm package**
   ```bash
   npm init -y
   ```

4. **Edit package.json to add bin field**
   ```bash
   npm pkg set bin.conso=./conso.js
   ```
   
   **Note:** This creates the `conso` command. The bin name must match the command you want to use.

5. **Make the script executable**
   ```bash
   chmod +x conso.js
   ```

6. **Link globally**
   ```bash
   npm link
   ```

7. **Verify installation**
   ```bash
   conso
   # Should show usage instructions
   ```

### Windows

1. **Clone or download the script**
   - Save `conso.js` to a permanent location (e.g., `C:\tools\conso\`)

2. **Open Command Prompt or PowerShell as Administrator**

3. **Navigate to the tool directory**
   ```cmd
   cd C:\tools\conso
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
cp conso.js ~/.local/bin/conso
chmod +x ~/.local/bin/conso

# Add to PATH if not already (add to ~/.bashrc or ~/.zshrc)
export PATH="$HOME/.local/bin:$PATH"

# Reload shell configuration
source ~/.zshrc  # or source ~/.bashrc
```

**Windows:**
1. Create folder: `C:\tools\`
2. Copy `conso.js` there
3. Add `C:\tools\` to System PATH:
   - Open System Properties → Environment Variables
   - Edit PATH variable
   - Add `C:\tools\`
4. Create batch file `C:\tools\conso.bat`:
   ```bat
   @echo off
   node "C:\tools\conso.js" %*
   ```

## Usage

Navigate to your project directory and run:

```bash
conso <file1> <file2> <file3> ...
```

### Examples

**Basic usage:**
```bash
conso src/App.svelte src/lib/utils.ts
```

**Multiple files:**
```bash
conso src/App.svelte src/lib/utils.ts components/Header.svelte lib/api.ts
```

**With wildcards (shell expansion):**
```bash
# Note: Your shell expands wildcards, not the tool
conso src/**/*.svelte
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

### Command not found after npm link

**macOS/Linux:**

The most common issue is that npm's global bin directory isn't in your PATH.

1. **Check npm's global bin path:**
   ```bash
   npm config get prefix
   ```
   This usually returns `/usr/local` or `~/.npm-global`

2. **The bin directory will be:**
   - If prefix is `/usr/local`, bins go in `/usr/local/bin`
   - If prefix is `~/.npm-global`, bins go in `~/.npm-global/bin`

3. **Check if it's in your PATH:**
   ```bash
   echo $PATH
   ```

4. **If not in PATH, add to your shell config:**
   
   For **zsh** (default on modern macOS), add to `~/.zshrc`:
   ```bash
   export PATH="/usr/local/bin:$PATH"
   # Or if using ~/.npm-global:
   # export PATH="$HOME/.npm-global/bin:$PATH"
   ```
   
   For **bash**, add to `~/.bashrc` or `~/.bash_profile`:
   ```bash
   export PATH="/usr/local/bin:$PATH"
   ```

5. **Reload your shell:**
   ```bash
   source ~/.zshrc  # or source ~/.bashrc
   # Or simply restart your terminal
   ```

6. **If still not working, try unlinking and relinking:**
   ```bash
   npm unlink
   npm link
   ```

7. **Verify the symlink was created:**
   ```bash
   ls -la $(npm config get prefix)/bin | grep conso
   ```

**Windows:**
- Verify npm global path is in System PATH
- Run `npm config get prefix` to find npm global directory
- Add that directory to your PATH environment variable
- Restart Command Prompt/PowerShell

### Permission denied (macOS/Linux)

```bash
chmod +x conso.js
# Or if installed globally:
sudo chmod +x $(npm config get prefix)/bin/conso
```

### Files not found

- Ensure you're running the command from the correct directory
- Use relative paths from your current location
- Check file paths for typos

## Uninstall

```bash
npm unlink -g conso
```

Or manually remove from:
- macOS/Linux: `~/.local/bin/conso` or `/usr/local/bin/conso`
- Windows: `C:\tools\conso.js` and `conso.bat`

## Configuration

You can modify the `INCLUDE_FILE_NAME` constant at the top of `conso.js`:
- `true`: Adds file path separator headers
- `false`: Only includes file content

## License

MIT - Feel free to use and modify!

## Contributing

Suggestions and improvements welcome!