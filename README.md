# Server Info
**IP:** waltoncloud.ddns.net

**Port:** 2456 (default)

# Server Maintenance & Backups
The server will reboot for maintenance & backups on Mondays, Wednesdays, and Fridays at 4am EST.

# Installation Notes
The `valheim_dedicated.sh` script includes logic to save changes and push to this repo when started and is designed to be run on server reboot. Server files larger than 50MB are not included in this repo. The full server software can be installed from [Steam](https://store.steampowered.com/app/892970/Valheim/).

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
# Start server on reboot, wait 2 mins for networking to come up, log to ./server_console.log
@reboot sleep 120 && sh "/home/kwalton/.local/share/Steam/steamapps/common/Valheim dedicated server/valheim_dedicated.sh" > "/home/kwalton/.local/share/Steam/steamapps/common/Valheim dedicated server/server_console.log"
```