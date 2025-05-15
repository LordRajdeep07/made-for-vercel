#!/usr/bin/env pwsh
# Vercel Deployment Script

# Check if Vercel CLI is installed
$vercelInstalled = $null
try {
    $vercelInstalled = Get-Command vercel -ErrorAction SilentlyContinue
} catch {
    # Command not found
}

if (-not $vercelInstalled) {
    Write-Host "Vercel CLI not found. Installing..."
    npm install -g vercel
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to install Vercel CLI. Make sure Node.js is installed."
        exit 1
    }
}

# Ensure we're logged in
Write-Host "Checking Vercel login status..."
vercel whoami
if ($LASTEXITCODE -ne 0) {
    Write-Host "Please login to Vercel:"
    vercel login
}

# Ask which deployment type to use
$deployType = Read-Host "Choose deployment type: [1] Full (all dependencies), [2] Minimal (fallback)"

if ($deployType -eq "2") {
    Write-Host "Using minimal deployment setup..."
    Copy-Item -Path "vercel/fallback-requirements.txt" -Destination "vercel/requirements.txt" -Force
} else {
    Write-Host "Using full deployment setup..."
    # Make sure the full requirements file is in place
}

# Deploy to Vercel
$deployEnv = Read-Host "Deploy to production? (y/n)"
if ($deployEnv -eq "y") {
    Write-Host "Deploying to production..."
    vercel --prod
} else {
    Write-Host "Deploying to preview environment..."
    vercel
}

Write-Host "Deployment process complete!" 