{
  lib,
  config,
  ...
}: {
  options.systemd.obsidian-sync.enable = lib.mkEnableOption "Enables Obsidan Automatic Syncronization";

  config = lib.mkIf config.systemd.obsidian-sync.enable {
  home.file.".local/bin/sync-notes.sh" = {
    text = ''
#!/usr/bin/env bash
    set -e
    
    NOTES_DIR="$HOME/Notes"  # Adjust to your vault path
    LOG_FILE="$HOME/.local/share/notes-sync.log"
    
    echo "$(date): Starting notes sync..." >> "$LOG_FILE"
    
    cd "$NOTES_DIR"
    
    # Check if directory is a git repository
    if [ ! -d .git ]; then
        echo "Error: Not a git repository" >> "$LOG_FILE"
        exit 1
    fi
    
    # Pull changes first
    git pull --autostash --rebase 2>&1 >> "$LOG_FILE"
    
    # Add all changes
    git add . 2>&1 >> "$LOG_FILE"
    
    # Commit if there are changes
    if ! git diff-index --quiet HEAD --; then
        git commit -m "Auto-sync: $(date '+%Y-%m-%d %H:%M:%S')" 2>&1 >> "$LOG_FILE"
        git push 2>&1 >> "$LOG_FILE"
        echo "Changes committed and pushed" >> "$LOG_FILE"
    else
        echo "No changes to commit" >> "$LOG_FILE"
    fi
    
    echo "$(date): Sync completed" >> "$LOG_FILE"

    '';  
    executable = true;
  };

  systemd.user = {
    services.sync-notes = {
      Unit.Description = "Sync notes repository";
      Unit.After = [ "network.target" ];
      Service.Type = "oneshot";
      Service.ExecStart = "%h/.local/bin/sync-notes.sh";
      Service.Environment = [ "PATH=%h/.nix-profile/bin:/run/current-system/sw/bin" ];
    };

    timers.sync-notes = {
      Unit.Description = "Timer for syncing notes repository";
      Timer.OnCalendar = "*-*-* *:0/15";  # Every 15 minutes
      Timer.Persistent = true;
      Install.WantedBy = [ "timers.target" ];
    };
  };
  };
}
