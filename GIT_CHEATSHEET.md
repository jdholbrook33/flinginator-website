# Flinginator website: git cheat sheet

Repo: https://github.com/jdholbrook33/flinginator-website (private)
Run every command from PowerShell inside the website folder.

## Start of a work session: get the latest
```
git pull
```

## Save your work to GitHub
1. See what changed:
```
git status
```

2. Stage everything:
```
git add .
```

3. Commit with a short note:
```
git commit -m "what you changed"
```

4. Send it to GitHub:
```
git push
```

## Then make it live
Double-click `deploy.bat`. Git and deploy are separate steps: pushing to GitHub does NOT change the live site.

## Set up on another workstation (one time)
1. Clone the repo:
```
git clone https://github.com/jdholbrook33/flinginator-website.git F:\Flinginator_Website
```

2. Copy the deploy key files `flinginator` and `flinginator.pub` from the first PC's
   `%USERPROFILE%\.ssh\` folder into the same folder on this PC. The key is NOT in git, on purpose.

## Oops buttons
Throw away uncommitted changes to one file:
```
git restore site\index.html
```
See the history:
```
git log --oneline
```
