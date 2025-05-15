#!/usr/bin/env pwsh
# Simple Vercel Deployment Script

Write-Host "Setting up minimal deployment requirements..." -ForegroundColor Blue
Copy-Item -Path "vercel/fallback-requirements.txt" -Destination "vercel/requirements.txt" -Force

# Create a .vercelignore file to minimize deployment size
@"
# Exclude everything by default
*
# Only include vercel directory and configuration files
!vercel/
!vercel.json
!package.json
"@ | Out-File -FilePath ".vercelignore" -Encoding utf8

Write-Host "Deploying to Vercel..." -ForegroundColor Blue
Write-Host "If prompted, select 'Create new project'"

# Deploy using only the necessary configuration
vercel --force

Write-Host "Deployment process complete!" -ForegroundColor Green
Write-Host "If deployment was successful, you can gradually add dependencies and features to your app" -ForegroundColor Yellow 