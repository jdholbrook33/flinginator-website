# Flinginator website: deploy cheat sheet

## Update the live site
1. Edit files in `F:\Flinginator_Website\site\`
2. Double-click `deploy.bat`
3. It should end with `answered HTTP 200`

Only what's inside `site\` gets uploaded. Notes, this file and deploy.bat stay on your PC.
Deploy copies files over the top: a file you DELETE locally is not deleted on the server.

## Server facts
| Thing | Value |
|---|---|
| Server | AWS Lightsail instance `flinginator`, Ubuntu 24.04 LTS |
| Static IP | 100.48.212.8 |
| Web root | `/var/www/flinginator` |
| nginx config | `/etc/nginx/sites-available/flinginator` |
| Deploy key (PC) | `%USERPROFILE%\.ssh\flinginator` |
| DNS | Squarespace: A records `@` and `www` -> 100.48.212.8 on .com and .net (1 hr TTL) |
| HTTPS | Let's Encrypt via certbot, renews itself |
| Firewall | Lightsail Networking tab: 22, 80, 443 open |

`flinginator.net` and `www` both forward to `https://flinginator.com`.

## Handy commands (PowerShell on the PC)
Log in to the server:
```
ssh -i $env:USERPROFILE\.ssh\flinginator ubuntu@flinginator.com
```

## Handy commands (on the server)
Test and reload nginx after a config change:
```
sudo nginx -t && sudo systemctl reload nginx
```
Check the certificate and its expiry date:
```
sudo certbot certificates
```
Dry-run a certificate renewal:
```
sudo certbot renew --dry-run
```
Install updates:
```
sudo apt update && sudo DEBIAN_FRONTEND=noninteractive apt -y upgrade
```
