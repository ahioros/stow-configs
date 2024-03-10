# stow-configs

# Install package
```bash
pacman -S stow
```

# Clone repo
```bash
git clone git@github.com:ahioros/stow-configs.git
```

# backup old files 
```bash
cp ~/.zshrc ~/.zshrc-bkp
cd stow-configs
cp ~/.zshrc .
stow .
```
