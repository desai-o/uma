@echo off
git init
git add -A
git commit -m "Initial commit: uma.html v1.0 — self-contained period tracker"
gh repo create uma --public --description "Uma Period Tracker" --source . --push