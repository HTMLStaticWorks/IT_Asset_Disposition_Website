$files = Get-ChildItem -Filter *.html
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    $navLen = 0
    $footerLen = 0
    if ($content -match '(?s)<nav\b[^>]*>(.*?)</nav>') {
        $navLen = $matches[0].Length
    }
    if ($content -match '(?s)<footer\b[^>]*>(.*?)</footer>') {
        $footerLen = $matches[0].Length
    }
    Write-Output "$($file.Name)|$navLen|$footerLen"
}
