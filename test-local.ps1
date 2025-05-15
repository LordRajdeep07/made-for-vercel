#!/usr/bin/env pwsh
# Test Vercel deployment locally

Write-Host "Setting up minimal deployment requirements..." -ForegroundColor Blue
Copy-Item -Path "vercel/fallback-requirements.txt" -Destination "vercel/requirements.txt" -Force

Write-Host "Creating index.py file for Vercel..." -ForegroundColor Blue
@"
# Simple test
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello from Vercel + Flask!"

if __name__ == '__main__':
    app.run()
"@ | Out-File -FilePath "vercel/index.py" -Encoding utf8

Write-Host "Testing deployment locally..." -ForegroundColor Blue
Write-Host "Press Ctrl+C to exit when done testing" -ForegroundColor Yellow

# Run Vercel dev mode to test locally
vercel dev --listen 3000

Write-Host "Local testing completed" -ForegroundColor Green 