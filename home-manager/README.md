# Home-Manager Module Documentation

A modular Home-Manager configuration for user-level applications, development environments, shell configurations, and desktop customization.

## Quick Start

The Home-Manager configuration uses a **bundle pattern** where modules are organized into categories and enabled/disabled through boolean flags in `/home-manager/home.nix`.

### Basic Module Usage

```nix
# In /home-manager/home.nix
development = {
  language = {
    python.enable = true;     # Enable Python development
    rust.enable = false;      # Disable Rust development
    typescript.enable = false;
    dart.enable = false;
    java.enable = false;
    cpp.enable = false;
    csharp.enable = false;
    lua.enable = false;
  };

  database = {
    sqlite.enable = false;    # Enable SQLite CLI
    mysql.enable = false;     # Enable MySQL client
    postgresql.enable = false;
    mongodb.enable = false;
    redis.enable = false;
  };

  IDE = {
    jetbrains = {
      intellij.enable = false;
      android-studio.enable = false;
      # ideavim automatically enabled with IntelliJ/Android Studio
    };
    vscode.enable = false;
    helix.enable = false;
  };

  tool = {
    obsidian.enable = false;  # Note-taking app
    penpot.enable = false;    # Design tool
  };
};

console = {
  terminal = {
    kitty.enable = false;     # Terminal emulator
    foot.enable = true;       # Terminal emulator (default)
  };

  shell = {
    bash.enable = true;       # Bash shell configuration
    zsh.enable = false;       # ZSH shell configuration
    tools.enable = true;      # CLI tools and utilities
  };
};

app = {
  browser = {
    brave.enable = true;      # Brave browser (default)
    firefox.enable = false;   # Firefox browser
  };

  infomatic = {
    only-office.enable = false;    # Office suite
    mendeley.enable = false;       # Reference manager
    video-editing.enable = false;  # Video editing tools
  };
  
  other = {
    ferdium.enable = true;    # Unified messaging app (default)
    spotify.enable = false;   # Spotify client
    spotube.enable = false;   # Spotify alternative
    discord.enable = false;   # Discord client
  };
};

system = {
  desktop.gnome.enable = true;  # GNOME desktop customization
};
```

## Module System Architecture

### Module Structure

Each module follows this pattern:
```nix
{
  pkgs,
  lib,
  config,
  ...
}: {
  options.category.module.enable = lib.mkEnableOption "Module description";

  config = lib.mkIf config.category.module.enable {
    home.packages = with pkgs; [package-list];
    # Additional configuration here
  };
}
```

### Bundle Files

- `app/appBundle.nix` - Imports all application modules
- `console/consoleBundle.nix` - Imports all console/terminal modules  
- `development/developmentBundle.nix` - Imports all development modules
- `system/systemBundle.nix` - Imports all system modules

## Available Modules

### Application Modules

#### Browsers

**Brave Browser** (`app/browser/brave.nix`)
```nix
app.browser.brave.enable = true;
```
- Privacy-focused web browser

**Firefox** (`app/browser/firefox.nix`)
```nix
app.browser.firefox.enable = true;
```
- Mozilla Firefox web browser

#### Informatic Apps

**OnlyOffice** (`app/infomatic/only-office.nix`)
```nix
app.infomatic.only-office.enable = true;
```
- Office suite compatible with Microsoft Office

**Mendeley** (`app/infomatic/mendeley.nix`)
```nix
app.infomatic.mendeley.enable = true;
```
- Reference management and PDF organizer

**Video Editing** (`app/infomatic/video-editing.nix`)
```nix
app.infomatic.video-editing.enable = true;
```
- Video editing tools and software

#### Other Applications

**Ferdium** (`app/others/ferdium.nix`)
```nix
app.other.ferdium.enable = true;
```
- Unified messaging application (Facebook, WhatsApp, Slack, etc.)

**Spotify** (`app/others/spotify.nix`)
```nix
app.other.spotify.enable = true;
```
- Official Spotify desktop client

**Spotube** (`app/others/spotube.nix`)
```nix
app.other.spotube.enable = true;
```
- Open-source Spotify client

**Discord** (`app/others/discord.nix`)
```nix
app.other.discord.enable = true;
```
- Discord chat and voice client

### Console Modules

#### Terminal Emulators

**Kitty** (`console/terminal/kitty/kitty.nix`)
```nix
console.terminal.kitty.enable = true;
```
- Fast, feature-rich GPU-accelerated terminal emulator

**Foot** (`console/terminal/foot/foot.nix`)
```nix
console.terminal.foot.enable = true;
```
- Wayland-native terminal emulator
- Includes themes: catppucin-latte, catppucin-mocha, black-white, unokai
- Includes `chafa` image viewer with `icat` alias
- Configuration files in `console/terminal/foot/`

#### Shell Configurations

**Bash** (`console/shell/bash.nix`)
```nix
console.shell.bash.enable = true;
```
- Enhanced bash shell configuration

**ZSH** (`console/shell/zsh.nix`)
```nix
console.shell.zsh.enable = true;
```
- ZSH shell with enhanced configuration

#### CLI Tools

**Development Tools** (`console/shell/CLI/tools.nix`)
```nix
console.shell.tools.enable = true;
```
Comprehensive CLI toolset including:
- **File management**: `zip`, `unzip`, `unrar`, `eza`, `bat`
- **Search and navigation**: `ripgrep`, `fzf`, `zoxide`
- **Development**: `git`, `curl`, `opencode`, `posting`
- **Multimedia**: `ffmpeg`, `chafa`, `wl-clipboard`
- **System monitoring**: `btop` with custom theme

**Shell Aliases** (included with tools):
```bash
cat = "bat --theme='Catppuccin Mocha' --color=always"
ls = "eza --icons=auto --git"
format = "ffmpeg -i"
unrar = "unrar x"
fm = "xdg-open"
```

**Environment Variables**:
```bash
EDITOR=nvim
VISUAL=nvim
```

**TMUX** (`console/shell/CLI/tmux.nix`)
- Terminal multiplexer configuration
- Auto-enabled with tools

### Development Modules

#### Programming Languages

**Python** (`development/language/python.nix`)
```nix
development.language.python.enable = true;
```
- Python development with `pyright` language server

**Rust** (`development/language/rust.nix`)
```nix
development.language.rust.enable = true;
```
- Rust development tools and utilities

**TypeScript** (`development/language/typescript.nix`)
```nix
development.language.typescript.enable = true;
```
- TypeScript/JavaScript development environment

**Dart** (`development/language/dart.nix`)
```nix
development.language.dart.enable = true;
```
- Dart programming language support

**Java** (`development/language/java.nix`)
```nix
development.language.java.enable = true;
```
- Java development environment

**C/C++** (`development/language/cpp.nix`)
```nix
development.language.cpp.enable = true;
```
- C and C++ development tools

**C#** (`development/language/csharp.nix`)
```nix
development.language.csharp.enable = true;
```
- C# and .NET development environment

**Lua** (`development/language/lua.nix`)
```nix
development.language.lua.enable = true;
```
- Lua scripting language support

**Nix** (`development/language/nix.nix`)
```nix
development.language.nix.enable = true;
```
- Nix expression language development tools

#### IDEs and Editors

**Visual Studio Code** (`development/IDE/vscode/vscode.nix`)
```nix
development.IDE.vscode.enable = true;
```
- VS Code with FHS wrapper for full compatibility

**JetBrains Suite** (`development/IDE/jetbrains/`)
```nix
development.IDE.jetbrains.intellij.enable = true;
development.IDE.jetbrains.android-studio.enable = true;
# ideavim automatically enabled with any JetBrains IDE
```

**IntelliJ IDEA** (`development/IDE/jetbrains/intellij.nix`)
- IntelliJ IDEA IDE

**Android Studio** (`development/IDE/jetbrains/android-studio.nix`)
- Android development IDE

**IDEA Vim** (`development/IDE/jetbrains/ideavim.nix`)
- Vim emulation for JetBrains IDEs (auto-enabled)

**Helix** (`development/IDE/helix/helix.nix`)
```nix
development.IDE.helix.enable = true;
```
- Modern terminal-based text editor

#### Database Tools

**MySQL** (`development/database/mysql.nix`)
```nix
development.database.mysql.enable = true;
```
- MySQL client tools (mysql84)

**PostgreSQL** (`development/database/postgresql.nix`)
```nix
development.database.postgresql.enable = true;
```
- PostgreSQL client tools

**SQLite** (`development/database/sqlite.nix`)
```nix
development.database.sqlite.enable = true;
```
- SQLite command-line interface

**MongoDB** (`development/database/mongodb.nix`)
```nix
development.database.mongodb.enable = true;
```
- MongoDB client tools

**Redis** (`development/database/redis.nix`)
```nix
development.database.redis.enable = true;
```
- Redis client utilities

#### Development Tools

**Obsidian** (`development/tool/obsidian.nix`)
```nix
development.tool.obsidian.enable = true;
```
- Knowledge management and note-taking application

**Penpot** (`development/tool/penpot.nix`)
```nix
development.tool.penpot.enable = true;
```
- Open-source design and prototyping tool

### System Modules

#### Desktop Customization

**GNOME** (`system/desktop/gnome/`)
```nix
system.desktop.gnome.enable = true;
```
Comprehensive GNOME desktop customization including:

**Extensions** (`system/desktop/gnome/custom/extensions.nix`)
- User Themes - Theme management
- Blur My Shell - Visual effects
- Removable Drive Menu - Drive management
- Touchpad Switcher - Touchpad control
- Tactile - Enhanced UI
- App Name Indicator - Window identification
- Auto Move Windows - Workspace management
- Caffeine - Prevent auto-suspend
- Cronomix - Time management

**Themes** (`system/desktop/gnome/custom/theme.nix`)
- Dracula theme integration
- Adwaita icon theme

**Fonts** (`system/desktop/gnome/custom/fonts.nix`)
- Custom font configurations

**Keymaps** (`system/desktop/gnome/custom/keymaps.nix`)
- Custom keyboard shortcuts and mappings

## Configuration Examples

### Basic Development Setup
```nix
development.language.python.enable = true;
development.language.typescript.enable = true;
development.IDE.vscode.enable = true;
development.database.sqlite.enable = true;
console.shell.tools.enable = true;
console.terminal.foot.enable = true;
```

### Full Stack Development
```nix
development.language.python.enable = true;
development.language.typescript.enable = true;
development.language.rust.enable = true;
development.IDE.vscode.enable = true;
development.database.mysql.enable = true;
development.database.postgresql.enable = true;
development.database.redis.enable = true;
development.tool.obsidian.enable = true;
console.shell.tools.enable = true;
```

### Design and Productivity
```nix
app.infomatic.only-office.enable = true;
development.tool.penpot.enable = true;
development.tool.obsidian.enable = true;
app.other.discord.enable = true;
app.other.ferdium.enable = true;
system.desktop.gnome.enable = true;
```

### Gaming Setup
```nix
app.other.discord.enable = true;
app.browser.brave.enable = true;
console.terminal.foot.enable = true;
console.shell.tools.enable = true;
```

### Minimal Setup
```nix
console.shell.tools.enable = true;
console.terminal.foot.enable = true;
app.browser.brave.enable = true;
```

## Applying Changes

### Apply Home-Manager Configuration
```bash
home-manager switch --flake .#k1
```

### Apply with Cache Update
```bash
nix flake update
home-manager switch --flake .#k1
```

### Test Configuration
```bash
home-manager build --flake .#k1
```

### Clean Up Old Generations
```bash
home-manager expire-generations "-30 days"
```

## Important Notes

- **User-specific**: Home-Manager configurations apply only to the specified user (`k1`)
- **Unfree packages**: Required for some applications like Discord
- **Terminal choice**: Choose between Kitty and Foot terminal emulators
- **Browser choice**: Choose between Brave and Firefox
- **IDE dependencies**: IDE Vim automatically enabled with JetBrains IDEs
- **GNOME customization**: Requires GNOME desktop environment to be enabled in NixOS configuration

## File Structure

```
home-manager/
├── home.nix                    # Main Home-Manager configuration
├── app/
│   ├── appBundle.nix           # Application module imports
│   ├── browser/                # Web browsers
│   ├── infomatic/              # Office and productivity apps
│   └── others/                 # Communication and media apps
├── console/
│   ├── consoleBundle.nix       # Console module imports
│   ├── terminal/               # Terminal emulators
│   │   ├── foot/              # Foot terminal with themes
│   │   └── kitty/             # Kitty terminal
│   ├── shell/                 # Shell configurations
│   │   ├── CLI/               # Command-line tools
│   │   └── bash/zsh          # Shell configs
│   └── utils/                 # Utility scripts
├── development/
│   ├── developmentBundle.nix   # Development module imports
│   ├── IDE/                   # Integrated Development Environments
│   │   ├── jetbrains/         # JetBrains suite
│   │   ├── vscode/            # Visual Studio Code
│   │   └── helix/             # Terminal editor
│   ├── language/              # Programming languages
│   ├── database/              # Database clients
│   ├── tool/                  # Development tools
│   └── settings/              # Configuration files
└── system/
    ├── systemBundle.nix        # System module imports
    └── desktop/                # Desktop customizations
        └── gnome/             # GNOME customization
```

## Configuration Files

Some modules include additional configuration files:

- **Foot themes**: `console/terminal/foot/*.ini`
- **TMUX config**: `console/shell/CLI/tmux.conf`
- **Posting config**: `development/settings/configurations/posting-config.yaml`
- **IDEA settings**: `development/settings/configurations/idea-settings.zip`
- **Git prompt**: `console/utils/.git-prompt.sh`

Each module can be used independently by importing it directly or through the bundle system.