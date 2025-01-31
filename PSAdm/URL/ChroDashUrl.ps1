$URLs = Get-Content "C:\PSAdm\URL\DashURLs.txt"

foreach ($URL in $URLs) {
    Start-Process -FilePath "C:\Users\CMitchel\AppData\Local\Google\Chrome\Application\chrome.exe" $url
}
