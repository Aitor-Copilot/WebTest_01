# Deploy Script for Struts Application
# This script builds and deploys the application to Tomcat

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Struts Application Deployment Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Delete target folder
Write-Host "[1/4] Deleting target folder..." -ForegroundColor Yellow
$targetPath = Join-Path $PSScriptRoot "target"
if (Test-Path $targetPath) {
    Remove-Item -Path $targetPath -Recurse -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 1
    Write-Host "  [OK] Target folder deleted" -ForegroundColor Green
} else {
    Write-Host "  [INFO] Target folder does not exist, skipping..." -ForegroundColor Gray
}

# Step 2: Maven compile
Write-Host "[2/4] Compiling project with Maven..." -ForegroundColor Yellow
Set-Location $PSScriptRoot
$compileResult = mvn compile 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "  [OK] Compilation successful" -ForegroundColor Green
} else {
    Write-Host "  [ERROR] Compilation failed!" -ForegroundColor Red
    Write-Host $compileResult
    exit 1
}

# Step 3: Maven package
Write-Host "[3/4] Packaging WAR file..." -ForegroundColor Yellow
$packageResult = mvn package -DskipTests 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "  [OK] WAR file created successfully" -ForegroundColor Green
} else {
    Write-Host "  [ERROR] Packaging failed!" -ForegroundColor Red
    Write-Host $packageResult
    exit 1
}

# Step 4: Deploy to Tomcat
Write-Host "[4/4] Deploying to Tomcat..." -ForegroundColor Yellow

# Check if CATALINA_HOME is set
if (-not $env:CATALINA_HOME) {
    Write-Host "  [ERROR] CATALINA_HOME environment variable is not set!" -ForegroundColor Red
    Write-Host "  Please set it first: `$env:CATALINA_HOME = 'C:\path\to\tomcat'" -ForegroundColor Yellow
    exit 1
}

# Check if Tomcat webapps directory exists
$webappsPath = Join-Path $env:CATALINA_HOME "webapps"
if (-not (Test-Path $webappsPath)) {
    Write-Host "  [ERROR] Tomcat webapps directory not found: $webappsPath" -ForegroundColor Red
    exit 1
}

# Copy WAR file
$warFile = Join-Path $PSScriptRoot "target\struts-app.war"
if (Test-Path $warFile) {
    Copy-Item -Path $warFile -Destination $webappsPath -Force
    Write-Host "  [OK] WAR file deployed to: $webappsPath" -ForegroundColor Green
} else {
    Write-Host "  [ERROR] WAR file not found: $warFile" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Deployment completed successfully!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
$appUrl = "http://localhost:8080/struts-app/"
Write-Host "Application URL: $appUrl" -ForegroundColor Cyan
Write-Host ""
