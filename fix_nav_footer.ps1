$indexHtml = Get-Content -Raw "index.html"
$navMatch = [regex]::Match($indexHtml, '(?s)(<nav class="navbar">.*?</nav>)')
$footerMatch = [regex]::Match($indexHtml, '(?s)(<footer class="footer">.*?</footer>)')

if ($navMatch.Success -and $footerMatch.Success) {
    $navContent = $navMatch.Groups[1].Value
    $footerContent = $footerMatch.Groups[1].Value

    $filesToUpdate = @("about.html", "blog-details.html", "blog.html", "case-studies.html", "contact.html", "home-2.html", "industries.html", "process.html", "service-details.html", "services.html", "404.html")

    foreach ($file in $filesToUpdate) {
        if (Test-Path $file) {
            $content = Get-Content -Raw $file
            $replacedNav = $false
            $replacedFooter = $false
            
            if ($content -match '(?s)<nav class="navbar">.*?</nav>') {
                $content = $content -replace '(?s)<nav class="navbar">.*?</nav>', $navContent
                $replacedNav = $true
            }
            if ($content -match '(?s)<footer class="footer">.*?</footer>') {
                $content = $content -replace '(?s)<footer class="footer">.*?</footer>', $footerContent
                $replacedFooter = $true
            }
            
            # If 404 has no footer, we might want to skip or just write what we replaced
            [IO.File]::WriteAllText((Join-Path (Get-Location) $file), $content, [System.Text.Encoding]::UTF8)
            Write-Host "Updated $file (Nav: $replacedNav, Footer: $replacedFooter)"
        }
    }
} else {
    Write-Host "Could not find nav or footer in index.html"
}
