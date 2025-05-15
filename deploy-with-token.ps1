#!/usr/bin/env pwsh
# Deploy to Vercel using token authentication

# Set Vercel token
$env:VERCEL_TOKEN = "zXaBCJi5q1cQFjJZZT1sHnWe"

# Ensure we have minimal working app
Write-Host "Setting up minimal app for deployment..." -ForegroundColor Blue

# Create the simplest vercel.json file
@'
{
  "builds": [
    {
      "src": "vercel/index.py",
      "use": "@vercel/python"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "vercel/index.py"
    }
  ]
}
'@ | Out-File -FilePath "vercel.json" -Encoding utf8 -Force

# Create the Python project metadata file
@'
[project]
name = "vercel-flask-app"
version = "0.1.0"
description = "Simple Flask app for Vercel"
requires-python = ">=3.9"
'@ | Out-File -FilePath "vercel/pyproject.toml" -Encoding utf8 -Force

# Deploy with force flag
Write-Host "Deploying to Vercel..." -ForegroundColor Green
# Use cmd.exe to avoid powershell issues
cmd /c "npx vercel --token $env:VERCEL_TOKEN --prod --force"

Write-Host "Deployment complete!" -ForegroundColor Green 