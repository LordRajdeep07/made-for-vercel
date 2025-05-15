#!/usr/bin/env pwsh
# Vercel v3 Deployment Script

# Check if Node.js is installed
$nodeInstalled = $null
try {
    $nodeInstalled = Get-Command node -ErrorAction SilentlyContinue
} catch {
    # Command not found
}

if (-not $nodeInstalled) {
    Write-Host "Node.js not found. Please install Node.js before proceeding." -ForegroundColor Red
    exit 1
}

# Check if Vercel CLI is installed
$vercelInstalled = $null
try {
    $vercelInstalled = Get-Command vercel -ErrorAction SilentlyContinue
} catch {
    # Command not found
}

if (-not $vercelInstalled) {
    Write-Host "Vercel CLI not found. Installing..." -ForegroundColor Yellow
    npm install -g vercel
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to install Vercel CLI. Make sure Node.js is installed." -ForegroundColor Red
        exit 1
    }
}

# Ensure we're logged in
Write-Host "Checking Vercel login status..." -ForegroundColor Blue
vercel whoami
if ($LASTEXITCODE -ne 0) {
    Write-Host "Please login to Vercel:" -ForegroundColor Yellow
    vercel login
}

# Make sure we're using the minimal requirements
Write-Host "Setting up minimal deployment requirements..." -ForegroundColor Blue
Copy-Item -Path "vercel/fallback-requirements.txt" -Destination "vercel/requirements.txt" -Force

# Ask whether to create a new project or use existing
$projectType = Read-Host "Create a new project? (y/n)"

if ($projectType -eq "y") {
    # Force a new project
    Write-Host "Creating a new Vercel project..." -ForegroundColor Blue
    vercel --force
} else {
    # Deploy to existing project
    Write-Host "Deploying to existing project..." -ForegroundColor Blue
    vercel --prod
}

Write-Host "Deployment process complete!" -ForegroundColor Green
Write-Host "Note: If deployment was successful, you can gradually add dependencies to vercel/requirements.txt and update vercel/app.py to include the full application functionality." -ForegroundColor Yellow 