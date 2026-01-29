# Nix-Ecosystem

A comprehensive modular NixOS configuration using flakes with organized system components, user-level applications, development tools, and desktop customizations.

## Overview

This repository contains two main configuration systems:

### 🖥️ NixOS System Configuration (`/nixos/`)

System-level configuration for desktop environments, database services, development tools, and system utilities. Manages the entire operating system through modular boolean flags.

### 👤 Home-Manager User Configuration (`/home-manager/`)

User-level configuration for applications, shell customization, development environments, and personal desktop preferences.

## Quick Start

Both configurations use a **bundle pattern** where modules are organized into categories and enabled/disabled through boolean flags.

### Apply System Changes

```bash
# Apply NixOS system configuration
sudo nixos-rebuild switch --flake .#k1

# Apply Home-Manager user configuration
home-manager switch --flake .#k1

# Apply both with cache update
sudo nix flake update
sudo nixos-rebuild switch --flake .#k1
home-manager switch --flake .#k1
```

## Module Categories

### 🖥️ NixOS System Modules

#### **Desktop Environments** (Choose ONE)

- **GNOME** - Modern desktop with GDM, fingerprint auth, bloatware exclusion
- **Cosmic DE** - System76's Wayland-first desktop environment
- **KDE Plasma** - Plasma6 with SDDM and Wayland support

#### **Database Services**

- **MySQL/MariaDB** - Database server with MariaDB
- **PostgreSQL** - Database with auto-created "nixdocs" database and user
- **SQLite** - CLI tools system-wide
- **Bundle Option** - `enableAll` to activate multiple databases

#### **Development Tools**

- **Docker** - Daemon with user permissions for container management
- **Virt-Manager** - Complete virtualization stack with libvirtd
- **Nginx** - Web server with virtual host configuration
- **Steam** - Gaming platform (requires unfree packages)
- **Tomcat** - Java web application container

#### **System Features**

- **ZSH Shell** - Optional replacement for bash system-wide
- **Battery Management** - Laptop charging limits via `set-battery-limit` command
- **Hardware Optimized** - AMD CPU, NVMe storage, EFI boot configuration

### 👤 Home-Manager User Modules

#### **Applications**

- **Browsers** - Brave (default), Firefox
- **Communication** - Ferdium, Discord, Spotify/Spotube
- **Productivity** - OnlyOffice, Mendeley, Video editing tools

#### **Console & Terminal**

- **Terminal Emulators** - Foot (default) with themes, Kitty
- **Shell Configs** - Enhanced Bash, ZSH with aliases
- **CLI Tools** - Comprehensive development toolkit (git, ripgrep, eza, bat, btop, etc.)

#### **Development Environment**

- **Programming Languages** - Python, Rust, TypeScript, Dart, Java, C/C++, C#, Lua, Nix
- **IDEs** - VS Code, JetBrains Suite (IntelliJ, Android Studio), Helix
- **Database Clients** - MySQL, PostgreSQL, SQLite, MongoDB, Redis
- **Development Tools** - Obsidian (notes), Penpot (design)

#### **System Customization**

- **GNOME Desktop** - Extensions, themes, fonts, keymaps
- **User-specific** - Applies only to user `k1`

## Configuration Examples

### 🏠 Home Office Setup

```nix
# System (NixOS)
system.desktop.gnome.enable = true;
tool.docker.enable = true;

# User (Home-Manager)
app.browser.brave.enable = true;
app.other.ferdium.enable = true;
development.IDE.vscode.enable = true;
development.language.python.enable = true;
```

### 💻 Full Development Environment

```nix
# System (NixOS)
system.desktop.kdePlasma.enable = true;
tool.docker.enable = true;
tool.nginx.enable = true;

# User (Home-Manager)
development.language.python.enable = true;
development.language.typescript.enable = true;
development.language.rust.enable = true;
development.database.mysql.enable = true;
development.database.postgresql.enable = true;
```

### 🎮 Gaming Setup

```nix
# System (NixOS)
system.desktop.gnome.enable = true;
tool.steam.enable = true;
tool.virtManager.enable = true;

# User (Home-Manager)
app.other.discord.enable = true;
app.browser.brave.enable = true;
```

### 🖥️ Server Configuration

```nix
# System (NixOS) - No desktop
tool.docker.enable = true;
tool.nginx.enable = true;
database.enableAll = true;

# User (Home-Manager) - Minimal
console.shell.tools.enable = true;
```

## Important Notes

- **User**: All configurations are optimized for user `k1`
- **Unfree**: Some packages require `allowUnfree = true`
- **Dependencies**: IDE Vim auto-enabled with JetBrains IDEs
- **Virtualization**: Requires `sudo virsh net-start default` after enable
- **Choices**: Select ONE desktop environment, ONE browser, ONE terminal

## File Structure

```
Nix-Ecosystem/
├── flake.nix                    # Main flake configuration
├── nixos/                       # System-level configuration
│   ├── README.md               # NixOS module documentation
│   ├── configuration.nix       # Main system config
│   ├── system/                 # Desktop, shell, hardware modules
│   ├── database/               # Database service modules
│   └── tool/                   # System tool modules
├── home-manager/                # User-level configuration
│   ├── README.md               # Home-Manager documentation
│   ├── home.nix                # Main user config
│   ├── app/                    # Application modules
│   ├── console/                # Terminal, shell, CLI tools
│   ├── development/            # Development environment
│   └── system/                 # Desktop customization
└── README.md                   # This overview file
```

## Documentation

- **NixOS Modules**: See `/nixos/README.md` for detailed system module documentation
- **Home-Manager Modules**: See `/home-manager/README.md` for detailed user module documentation

Each module can be used independently by importing it directly or through the bundle system.

