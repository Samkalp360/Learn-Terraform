# load-env.ps1   
# . .\load-env.ps1
# This script loads environment variables from a .env file into the current PowerShell session.

Get-Content .env | ForEach-Object {
    if ($_ -match "^\s*([^#].*?)=(.*)$") {
        $key = $matches[1].Trim()
        $value = $matches[2].Trim()
        [System.Environment]::SetEnvironmentVariable($key, $value, "Process")
    }
}
Write-Host ".env variables loaded into session."
