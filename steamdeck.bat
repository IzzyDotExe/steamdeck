@echo off

echo steampal_stable_9a24a2bf68596b860cb6710d9ea307a76c29a04d> "C:\Program Files (x86)\Steam\package\beta"

if EXIST "C:\Program Files (x86)\Steam\steamdeck.lnk" (
    echo steamdeck shortcut exists, skipping...
) ELSE (
    goto create_shortcut
)

goto end

:create_shortcut
    echo Set oWS = WScript.CreateObject^(^"WScript.Shell^"^) >> CreateShortcut.vbs
    echo sLinkFile = ^"C:\Program Files ^(x86^)\Steam\steamdeck.lnk^" >> CreateShortcut.vbs
    echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
    echo oLink.TargetPath = ^"C:\Program Files ^(x86^)\Steam\steam.exe^" >> CreateShortcut.vbs
    echo oLink.WorkingDirectory = ^"C:\Program Files ^(x86^)\Steam\^" >> CreateShortcut.vbs
    echo oLink.Arguments = ^"-gamepadui^" >> CreateShortcut.vbs
    echo oLink.Save >> CreateShortcut.vbs
    cscript CreateShortcut.vbs
    del CreateShortcut.vbs

    goto end


:end
    taskkill /f /im explorer.exe 
    taskkill /f /im steam.exe

    start /max "" "C:\Program Files (x86)\Steam\steamdeck.lnk"
    echo Press any key to return to windows...
    pause >nul
    taskkill /f /im steam.exe
    start explorer.exe

