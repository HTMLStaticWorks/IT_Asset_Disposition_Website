$htmlFiles = "login.html", "signup.html"

foreach ($file in $htmlFiles) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw
        $content = $content -replace 'class="navbar-brand" style="font-size: 1.5rem;"', 'class="navbar-brand"'
        Set-Content -Path $file -Value $content -NoNewline
    }
}
