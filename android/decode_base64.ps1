# DecodeBase64WithPrompts.ps1
# Script to decode a Base64 string and save it to a file with interactive prompts.

# Prompt for the input file path
$InputFilePath = Read-Host "Enter the path of the Base64 encoded input file (e.g., C:\path\to\file.txt)"

# Check if the input file exists
if (-Not (Test-Path $InputFilePath)) {
    Write-Host "Input file not found: $InputFilePath" -ForegroundColor Red
    exit 1
}

# Prompt for the output directory path
$OutputDir = Read-Host "Enter the directory path to save the decoded file (e.g., C:\path\to\output)"

# Check if the output directory exists
if (-Not (Test-Path $OutputDir)) {
    Write-Host "Output directory not found: $OutputDir. Creating the directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $OutputDir
}

# Prompt for the output file name (e.g., keystore.jks)
$OutputFileName = Read-Host "Enter the name for the output file (e.g., keystore.jks)"

# Combine the output directory path and file name
$OutputFilePath = Join-Path $OutputDir $OutputFileName

# Ensure the directory is in quotes for proper handling of spaces
$OutputFilePath = "`"$OutputFilePath`""

# Read the Base64 string from the input file
Write-Host "Reading Base64 string from $InputFilePath..."
$Base64String = Get-Content $InputFilePath -Raw

# Decode the Base64 string into bytes
Write-Host "Decoding Base64 string..."
try {
    $DecodedBytes = [System.Convert]::FromBase64String($Base64String)
} catch {
    Write-Host "Failed to decode Base64 string. Ensure the input is valid." -ForegroundColor Red
    exit 1
}

# Write the decoded bytes to the output file
Write-Host "Writing decoded output to $OutputFilePath..."
[System.IO.File]::WriteAllBytes($OutputFilePath, $DecodedBytes)

Write-Host "Decoding complete. Output saved to $OutputFilePath" -ForegroundColor Green