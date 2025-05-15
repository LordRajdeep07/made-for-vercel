#!/usr/bin/env pwsh
# Simplified Vercel Deployment Script using index.py

# Create the simplest possible Flask app in index.py
Write-Host "Creating minimal Flask app..." -ForegroundColor Blue
New-Item -ItemType Directory -Force -Path "vercel" | Out-Null

@"
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({
        "status": "ok",
        "message": "Vercel Flask deployment is working"
    })
"@ | Out-File -FilePath "vercel/index.py" -Encoding utf8

# Create minimal requirements
@"
setuptools>=65.0.0
wheel>=0.38.0
Flask==2.2.3
"@ | Out-File -FilePath "vercel/requirements.txt" -Encoding utf8

# Create simplified vercel.json
@"
{
  "version": 2,
  "builds": [
    {
      "src": "vercel/index.py",
      "use": "@vercel/python",
      "config": {
        "runtime": "python3.9"
      }
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "vercel/index.py"
    }
  ]
}
"@ | Out-File -FilePath "vercel.json" -Encoding utf8

# Create a .vercelignore file to minimize deployment size
@"
# Exclude everything by default
*
# Only include vercel directory and configuration files
!vercel/
!vercel.json
"@ | Out-File -FilePath ".vercelignore" -Encoding utf8

Write-Host "Deploying to Vercel..." -ForegroundColor Blue
Write-Host "If prompted, select 'Create new project'" -ForegroundColor Yellow

# Deploy using only the necessary configuration
vercel --force

Write-Host "Deployment process complete!" -ForegroundColor Green
Write-Host "If successful, you can add more functionality to your app gradually" -ForegroundColor Yellow 