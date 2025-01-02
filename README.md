# Dotfiles

This repository contains my personal configuration files (dotfiles) for various tools and applications. It helps me keep my development environment consistent across multiple devices and makes it easy to set up a new system.

## Contents

- **Shell Configuration**: `.bashrc`
- **Editor Settings**: `.vimrc`, `.config/nvim/init.vim`
- **Git Configuration**: `.gitconfig`
- **Terminal Settings**: `.config/kitty/kitty.conf`

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

I'm suck. Therefore, you go make your own then sned me your modded configs
```bash
git add <file>
git commit -m "Update <file>"
git push
```

## License

What's a license?
