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

# etc files as root or you can use stow -t
```bash
pacman -S powertop
cp .etc/modprobe.d/* /etc/modprobe.d/
cp .etc/udev/rules.d/99-powertop.rules /etc/udev/rules.d
chmod +x powertop.sh
cp .etc/pm/power.d/powertop.sh /etc/pm/power.d/
cp .etc/fstab /etc/fstab
mkdir ~/.vimbackup
stom vim
```
