# Making Git Scripts Runnable from Anywhere

Two scripts for Mac/Linux/Win to run multiple git commands with one short command. 

1. ´gc "your commit message here"´ will ´git pull´, ´git add .´, ´git commit -m´ and ´git push´.
2. ´gcc "your commit msg"´ will do the same but when you forgot to use the ´gc´ tool and did your commit before pulling the latest then this will also run ´git reset --soft HEAD~1´ beforehand

# Run this commands from anywhere

## `gcc` (git cancel & recommit)

## macOS/Linux/Ubuntu

### 1. Make scripts executable:
```bash
chmod +x gcc.sh gc.sh
```

### 2. Move to a directory in your PATH:

**macOS:**
```bash
sudo mv gcc.sh /usr/local/bin/gcc
sudo mv gc.sh /usr/local/bin/gc
```

**Linux:**
```bash
sudo mv gcc.sh /usr/bin/gcc
sudo mv gc.sh /usr/bin/gc
```

### 3. Now use from anywhere:
```bash
gcc "my commit message"
gc "commit message"
```

### Alternative (without sudo): Add to your user bin
```bash
mkdir -p ~/.local/bin
mv gcc.sh ~/.local/bin/gcc
mv gc.sh ~/.local/bin/gc
chmod +x ~/.local/bin/gcc ~/.local/bin/gc
```

**Add to PATH if needed:**

For **Ubuntu/Linux** (add to `~/.bashrc`):
```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

For **macOS** (add to `~/.zshrc` for newer versions or `~/.bash_profile` for older):
```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

## Windows

### Quick PATH add via Command Prompt (run as Administrator):
```cmd
setx /M PATH "%PATH%;C:\path_to\this_folder\git"
```

OR the long GUI classic way:

### 1. Add to PATH:
- Press `Win + R`, type `sysdm.cpl`, Enter
- Go to **Advanced** tab → **Environment Variables**
- Under **User variables**, select **Path** → **Edit**
- Click **New** → Add `C:\path_to\this_folder\git`
- Click **OK** on all windows

### 2. Restart Command Prompt/PowerShell

### 3. Now use from anywhere:
```cmd
gcc "my commit message"
gc "commit message"
```