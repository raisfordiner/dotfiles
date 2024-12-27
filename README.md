# Dotfiles

This repository contains my personal configuration files (dotfiles) for various tools and applications. It helps me keep my development environment consistent across multiple devices and makes it easy to set up a new system.

## Contents

- **Shell Configuration**: `.bashrc`, `.zshrc`
- **Editor Settings**: `.vimrc`, `.config/nvim/init.vim`
- **Git Configuration**: `.gitconfig`
- **Terminal Settings**: `.tmux.conf`

## Installation

1. Clone this repository to your home directory:

   ```bash
   git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
   ```

2. Navigate to the `dotfiles` directory:

   ```bash
   cd ~/dotfiles
   ```

3. Use `GNU Stow` to create the necessary symbolic links. Simply run:

   ```bash
   stow .
   ```

   This will automatically link all configuration files to their appropriate locations.

4. Reload your shell or restart your applications to apply the changes.

## Customization

Feel free to modify any of the configuration files to suit your preferences. If you make changes, remember to commit them back to this repository:

```bash
git add <file>
git commit -m "Update <file>"
git push
```

## Backup and Sync

You can use this repository to backup and sync your dotfiles across multiple machines. Just clone it on each machine and use `GNU Stow` to set up the configurations.

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

