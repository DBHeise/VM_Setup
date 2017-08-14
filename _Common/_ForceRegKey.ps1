function ForceRegKey ($path) {
    if (!(Test-path $path)) {
        New-Item -Path $path -ItemType Directory -Force | Out-Null
    }
}
