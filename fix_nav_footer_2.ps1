$indexHtml = Get-Content -Raw "index.html"
$navMatch = [regex]::Match($indexHtml, '(?s)(<nav class="navbar">.*?</nav>)')
$footerMatch = [regex]::Match($indexHtml, '(?s)(<footer class="footer">.*?</footer>)')
$faviconMatch = [regex]::Match($indexHtml, '(<link rel="icon".*?>)')

if ($navMatch.Success -and $footerMatch.Success) {
    $navContent = $navMatch.Groups[1].Value
    $footerContent = $footerMatch.Groups[1].Value
    $faviconTag = if ($faviconMatch.Success) { $faviconMatch.Groups[1].Value } else { "" }

    $htmlFiles = Get-ChildItem -Filter *.html | Where-Object { $_.Name -notin @('index.html', 'login.html', 'signup.html') }

    foreach ($file in $htmlFiles) {
        $content = Get-Content -Raw $file.FullName
        
        # We need to make sure the file contains a nav to replace. (Dashboard has custom nav now)
        if ($file.Name -ne 'dashboard.html' -and $content -match '(?s)<nav class="navbar">.*?</nav>') {
            $content = $content -replace '(?s)<nav class="navbar">.*?</nav>', $navContent
        }
        
        # Replace footer (Dashboard doesn't get a footer)
        if ($file.Name -ne 'dashboard.html' -and $content -match '(?s)<footer class="footer">.*?</footer>') {
            $content = $content -replace '(?s)<footer class="footer">.*?</footer>', $footerContent
        }

        # Sync Favicon
        if ($faviconTag -and $content -match '<head>') {
            if ($content -match '<link rel="icon".*?>') {
                $content = $content -replace '<link rel="icon".*?>', $faviconTag
            } else {
                $content = $content -replace '<head>', "<head>`n    $faviconTag"
            }
        }
        
        [IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
        Write-Host "Synchronized $file Name"
    }
}
