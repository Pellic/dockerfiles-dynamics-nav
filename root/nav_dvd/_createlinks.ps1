if ((Test-Path (Join-Path $PSScriptRoot 'content')) -eq $false) {
    New-Item -ItemType Junction -Path (Join-Path $PSScriptRoot 'content') -Value (Join-Path $PSScriptRoot '..\__content\NAV')
}

if ((Test-Path (Join-Path $PSScriptRoot 'NAVDVD')) -eq $false) {
    New-Item -ItemType Junction -Path (Join-Path $PSScriptRoot 'NAVDVD') -Value (Join-Path $PSScriptRoot '..\__content_user\NAVDVD')
}
