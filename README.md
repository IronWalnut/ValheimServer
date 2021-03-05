# Server Info
**IP:** waltoncloud.ddns.net

**Port:** 19132 (default)

# Server Maintenance & Backups
The server will reboot for maintenance and to back up the world files on Mondays, Wednesdays, and Fridays at 4am EST.

# Installation Notes
The `valheim_dedicated.sh` script includes logic to save changes and push to this repo when started and is designed to be run on server reboot. Several server files are much to big for git and are not included in this repo. The full server software can be installed from [Steam](https://store.steampowered.com/app/892970/Valheim/).

### Command Line Example:
```
# Running with backup script
cd "~/.local/share/Steam/steamapps/common/Valheim dedicated server"
sudo ./valheim_dedicated.sh

# Just starting the server executable
cd "~/.local/share/Steam/steamapps/common/Valheim dedicated server"
sudo ./valheim_server.x86_64 -name "My server" -port 2456 -world "Dedicated" -password "secret"
```

### Cronjob Example (running as sudo):
```
@reboot cd "/home/<user>/.local/share/Steam/steamapps/common/Valheim dedicated server" && sudo ./valheim_dedicated.sh > server_console.log
```