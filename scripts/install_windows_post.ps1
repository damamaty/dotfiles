<#  Post-install config script (Windows 10/11)
    Existing items:
      1)  Clear taskbar pins
      2)  Taskbar alignment: Left
      3)  Timezone: Asia/Novosibirsk
      4)  Dark mode (apps + system)
      5)  Show file extensions
      6)  Enable Win32 long paths (system-wide)
      7)  Disable Bing/web in Start/Search
      8)  Explorer opens to "This PC"
      9)  Default folder view = Details (all folders)
     10)  Hide Recommended in Start + reduce suggestions
     11)  Power (AC): display/sleep/hibernate timeouts = 0

    New items:
     12)  Privacy: disable "Let websites show me locally relevant content"
     13)  Remove "People" icon on taskbar (Win10; harmless on Win11)
     14)  Show hidden files (keep protected OS files hidden)
     15)  Ensure known folders show under "This PC"
     16)  Pin Downloads, Documents, and Home to Quick Access
#>

# --- Safety: require elevation ---
$IsAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $IsAdmin) {
  Write-Error "Please run this script as Administrator."
  exit 1
}

# Helpers
function Restart-Explorer {
  try { Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue } catch {}
  Start-Sleep -Milliseconds 400
}

function Ensure-Key {
  param([Parameter(Mandatory)][string]$Path)
  if (-not (Test-Path $Path)) { New-Item -Path $Path -Force | Out-Null }
}

function Pin-ToQuickAccess {
  param([Parameter(Mandatory)][string]$Path)
  if (-not (Test-Path $Path)) { Write-Warning "Path not found for pin: $Path"; return }
  try {
    $shell  = New-Object -ComObject Shell.Application
    $parent = Split-Path $Path -Parent
    $leaf   = Split-Path $Path -Leaf
    if ([string]::IsNullOrEmpty($parent)) {
      $ns = $shell.Namespace($Path)
      if ($ns -and $ns.Self) { $ns.Self.InvokeVerb('pintohome') }
    } else {
      $ns = $shell.Namespace($parent)
      if ($ns) {
        $item = $ns.ParseName($leaf)
        if ($item) { $item.InvokeVerb('pintohome') }
      }
    }
  } catch {
    Write-Warning ("Couldn't pin to Quick Access: {0} - {1}" -f $Path, $_.Exception.Message)
  }

}

function New-Shortcut {
  param(
    [Parameter(Mandatory)][string]$Target,
    [Parameter(Mandatory)][string]$ShortcutPath
  )
  $ws = New-Object -ComObject WScript.Shell
  $sc = $ws.CreateShortcut($ShortcutPath)
  $sc.TargetPath = $Target
  $sc.WorkingDirectory = Split-Path $Target -Parent
  $sc.Save()
}

function Pin-Taskbar {
  param([Parameter(Mandatory)][string]$ShortcutPath)
  if (-not (Test-Path $ShortcutPath)) { return }
  try {
    $shell  = New-Object -ComObject Shell.Application
    $folder = $shell.Namespace((Split-Path $ShortcutPath -Parent))
    $item   = $folder.ParseName((Split-Path $ShortcutPath -Leaf))
    if ($item) { $item.InvokeVerb('taskbarpin') }
  } catch {
    Write-Warning ("Couldn't pin to taskbar: {0} - {1}" -f $ShortcutPath, $_.Exception.Message)
  }
}

function Resolve-FirstExistingPath {
  param([string[]]$Candidates)
  foreach ($c in $Candidates) { if (Test-Path $c) { return $c } }
  return $null
}

# 1) Remove all pinned applications from taskbar
try {
  $pinDir = Join-Path $env:APPDATA 'Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar'
  if (Test-Path $pinDir) {
    Get-ChildItem $pinDir -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
  }
  $taskbandKey = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband'
  if (Test-Path $taskbandKey) { Remove-Item $taskbandKey -Recurse -Force -ErrorAction SilentlyContinue }
  Write-Host "Taskbar pins cleared."
} catch {
  Write-Warning "Couldn't fully clear taskbar pins: $($_.Exception.Message)"
}

# 2) Taskbar/start alignment LEFT (Win11; harmless on Win10)
try {
  $advKey = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
  Ensure-Key $advKey
  Set-ItemProperty -Path $advKey -Name 'TaskbarAl' -Type DWord -Value 0
  Write-Host "Taskbar alignment set to left."
} catch {
  Write-Warning "Couldn't set taskbar alignment: $($_.Exception.Message)"
}

# 3) Timezone: Asia/Novosibirsk
try {
  tzutil /s "N. Central Asia Standard Time"
  Write-Host "Timezone set to Asia/Novosibirsk."
} catch {
  Write-Warning "Couldn't set timezone: $($_.Exception.Message)"
}

# 4) Dark mode (apps + system)
try {
  $personalize = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize'
  Ensure-Key $personalize
  New-ItemProperty -Path $personalize -Name 'AppsUseLightTheme'    -PropertyType DWord -Value 0 -Force | Out-Null
  New-ItemProperty -Path $personalize -Name 'SystemUsesLightTheme' -PropertyType DWord -Value 0 -Force | Out-Null
  Write-Host "Dark mode enabled."
} catch {
  Write-Warning "Couldn't set dark mode: $($_.Exception.Message)"
}

# 5) Show file extensions
try {
  $advKey = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
  Ensure-Key $advKey
  New-ItemProperty -Path $advKey -Name 'HideFileExt' -PropertyType DWord -Value 0 -Force | Out-Null
  Write-Host "File extensions set to visible."
} catch {
  Write-Warning "Couldn't toggle file extensions: $($_.Exception.Message)"
}

# 6) Enable Win32 long paths
try {
  $fsKey = 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem'
  Ensure-Key $fsKey
  New-ItemProperty -Path $fsKey -Name 'LongPathsEnabled' -PropertyType DWord -Value 1 -Force | Out-Null
  Write-Host "Long paths enabled (system-wide)."
} catch {
  Write-Warning "Couldn't enable long paths: $($_.Exception.Message)"
}

# 7) Disable Bing/web in Start/Search
try {
  $searchUser = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Search'
  Ensure-Key $searchUser
  New-ItemProperty -Path $searchUser -Name 'BingSearchEnabled' -PropertyType DWord -Value 0 -Force | Out-Null
  New-ItemProperty -Path $searchUser -Name 'CortanaConsent'    -PropertyType DWord -Value 0 -Force | Out-Null

  $explorerPolicy = 'HKCU:\Software\Policies\Microsoft\Windows\Explorer'
  Ensure-Key $explorerPolicy
  New-ItemProperty -Path $explorerPolicy -Name 'DisableSearchBoxSuggestions' -PropertyType DWord -Value 1 -Force | Out-Null

  $wsPolicy = 'HKCU:\Software\Policies\Microsoft\Windows\Windows Search'
  Ensure-Key $wsPolicy
  New-ItemProperty -Path $wsPolicy -Name 'ConnectedSearchUseWeb'    -PropertyType DWord -Value 0 -Force | Out-Null
  New-ItemProperty -Path $wsPolicy -Name 'AllowSearchToUseLocation' -PropertyType DWord -Value 0 -Force | Out-Null

  Write-Host "Bing/web search disabled."
} catch {
  Write-Warning "Couldn't fully disable web search: $($_.Exception.Message)"
}

# 8) Explorer -> This PC
try {
  $adv = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
  Ensure-Key $adv
  New-ItemProperty -Path $adv -Name 'LaunchTo' -PropertyType DWord -Value 1 -Force | Out-Null
  Write-Host "Explorer set to open to This PC."
} catch {
  Write-Warning "Couldn't set Explorer LaunchTo: $($_.Exception.Message)"
}

# 9) Default view = Details for all folders
try {
  $bagsRoot = 'HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell'
  if (Test-Path "$bagsRoot\Bags")   { Remove-Item "$bagsRoot\Bags"   -Recurse -Force -ErrorAction SilentlyContinue }
  if (Test-Path "$bagsRoot\BagMRU") { Remove-Item "$bagsRoot\BagMRU" -Recurse -Force -ErrorAction SilentlyContinue }

  $allFoldersShell = "$bagsRoot\Bags\AllFolders\Shell"
  Ensure-Key $allFoldersShell
  New-ItemProperty -Path $allFoldersShell -Name 'FolderType' -PropertyType String -Value 'NotSpecified' -Force | Out-Null
  New-ItemProperty -Path $allFoldersShell -Name 'Mode'       -PropertyType String -Value 'Details'      -Force | Out-Null
  Write-Host "Default folder view set to Details."
} catch {
  Write-Warning "Couldn't set default Details view: $($_.Exception.Message)"
}

# 10) Hide Recommended in Start + reduce Start suggestions
try {
  $explorerPolicy = 'HKCU:\Software\Policies\Microsoft\Windows\Explorer'
  Ensure-Key $explorerPolicy
  New-ItemProperty -Path $explorerPolicy -Name 'HideRecommendedSection' -PropertyType DWord -Value 1 -Force | Out-Null

  $adv = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
  Ensure-Key $adv
  New-ItemProperty -Path $adv -Name 'Start_IrisRecommendations' -PropertyType DWord -Value 0 -Force | Out-Null
  New-ItemProperty -Path $adv -Name 'Start_TrackProgs'          -PropertyType DWord -Value 0 -Force | Out-Null
  New-ItemProperty -Path $adv -Name 'Start_TrackDocs'           -PropertyType DWord -Value 0 -Force | Out-Null

  Write-Host "Start recommendations reduced/hidden."
} catch {
  Write-Warning "Couldn't adjust Start recommendations: $($_.Exception.Message)"
}

# 11) Power (AC) — timeouts = Never (0)
try {
  powercfg /x monitor-timeout-ac 0 | Out-Null
  powercfg /x standby-timeout-ac 0 | Out-Null
  powercfg /x hibernate-timeout-ac 0 | Out-Null
  Write-Host "Power (AC) timeouts set to 0 (Never)."
} catch {
  Write-Warning "Couldn't apply power settings: $($_.Exception.Message)"
}

# 12) Privacy — disable "Let websites show me locally relevant content"
try {
  $intl = 'HKCU:\Control Panel\International\User Profile'
  Ensure-Key $intl
  New-ItemProperty -Path $intl -Name 'HttpAcceptLanguageOptOut' -PropertyType DWord -Value 1 -Force | Out-Null
  Write-Host "Disabled locally relevant website content (language list)."
} catch {
  Write-Warning "Couldn't change language-list privacy: $($_.Exception.Message)"
}

# 13) Remove People icon on taskbar (Win10)
try {
  $advKey = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
  Ensure-Key $advKey
  New-ItemProperty -Path $advKey -Name 'PeopleBand' -PropertyType DWord -Value 0 -Force | Out-Null
  Write-Host "People icon removed (if present)."
} catch {
  Write-Warning "Couldn't change People icon setting: $($_.Exception.Message)"
}

# 14) Show hidden files (keep protected OS files hidden)
try {
  $advKey = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
  Ensure-Key $advKey
  New-ItemProperty -Path $advKey -Name 'Hidden'          -PropertyType DWord -Value 1 -Force | Out-Null  # 1 = Show
  New-ItemProperty -Path $advKey -Name 'ShowSuperHidden' -PropertyType DWord -Value 0 -Force | Out-Null  # 0 = keep OS files hidden
  Write-Host "Hidden files shown (protected OS files remain hidden)."
} catch {
  Write-Warning "Couldn't set hidden files visibility: $($_.Exception.Message)"
}

# 15) Ensure known folders show under "This PC"
try {
  $fdRoot = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions'
  $guids = @(
    'B4BFCC3A-DB2C-424C-B029-7FE99A87C641', # Desktop
    'FDD39AD0-238F-46AF-ADB4-6C85480369C7', # Documents
    '374DE290-123F-4565-9164-39C4925E467B', # Downloads
    '33E28130-4E1E-4676-835A-98395C3BC3BB', # Pictures
    '4BD8D571-6D19-48D3-BE97-422220080E43', # Music
    '18989B1D-99B5-455B-841C-AB7C74E4DDFC'  # Videos
  )
  foreach ($g in $guids) {
    $pb = Join-Path $fdRoot "$g\PropertyBag"
    Ensure-Key $pb
    New-ItemProperty -Path $pb -Name 'ThisPCPolicy' -PropertyType String -Value 'Show' -Force | Out-Null
  }
  Write-Host "Known folders set to show in This PC."
} catch {
  Write-Warning "Couldn't ensure known folders in This PC: $($_.Exception.Message)"
}

# 16) Pin Quick Access items: Downloads, Documents, Home folder
try {
  $downloads = Join-Path $env:USERPROFILE 'Downloads'
  $documents = [Environment]::GetFolderPath('MyDocuments')
  $homePath  = $env:USERPROFILE
  Pin-ToQuickAccess -Path $downloads
  Pin-ToQuickAccess -Path $documents
  Pin-ToQuickAccess -Path $homePath
  Write-Host "Pinned Downloads, Documents, and Home folder to Quick Access."
  Write-Host "Note: Quick Access pin order can't be set reliably via script; you can drag to reorder in Explorer."
} catch {
  Write-Warning "Couldn't complete Quick Access pinning: $($_.Exception.Message)"
}

# Taskbar: hide Search, Widgets, Chat; show seconds in clock
try {
  $adv = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
  Ensure-Key $adv
  # New-ItemProperty -Path $adv -Name 'TaskbarDa' -PropertyType DWord -Value 0 -Force | Out-Null   # Widgets off (Win11)
  New-ItemProperty -Path $adv -Name 'TaskbarMn' -PropertyType DWord -Value 0 -Force | Out-Null   # Chat/Teams off (Win11)
  New-ItemProperty -Path $adv -Name 'ShowSecondsInSystemClock' -PropertyType DWord -Value 1 -Force | Out-Null  # Show seconds

  $search = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Search'
  Ensure-Key $search
  New-ItemProperty -Path $search -Name 'SearchboxTaskbarMode' -PropertyType DWord -Value 0 -Force | Out-Null   # 0 = Hidden (Win11)

  # (Optional Win10: disable News & Interests)
  # $feeds = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds'
  # Ensure-Key $feeds
  # New-ItemProperty -Path $feeds -Name 'ShellFeedsTaskbarViewMode' -PropertyType DWord -Value 2 -Force | Out-Null # 2 = Turn off

  Write-Host "Taskbar: search hidden, widgets/chat off, clock shows seconds."
} catch {
  Write-Warning ("Couldn't adjust taskbar items - {0}" -f $_.Exception.Message)
}

# Pin preferred apps to taskbar (best-effort)
try {
  $tmp = Join-Path $env:TEMP 'TaskbarPins'
  New-Item -ItemType Directory -Force -Path $tmp | Out-Null

  $apps = @(
    @{ name='File Explorer'; path=(Resolve-FirstExistingPath @("$env:WINDIR\explorer.exe")) },
    @{ name='Firefox';       path=(Resolve-FirstExistingPath @("$env:ProgramFiles\Mozilla Firefox\firefox.exe", "$env:ProgramFiles(x86)\Mozilla Firefox\firefox.exe")) },
    @{ name='Sublime Text';  path=(Resolve-FirstExistingPath @("$env:ProgramFiles\Sublime Text\sublime_text.exe", "$env:ProgramFiles(x86)\Sublime Text\sublime_text.exe")) },
    @{ name='Windows Terminal'; path=(Resolve-FirstExistingPath @("$env:WINDIR\System32\wt.exe")) },
    @{ name='WezTerm';       path=(Resolve-FirstExistingPath @("$env:ProgramFiles\WezTerm\wezterm-gui.exe", "$env:LOCALAPPDATA\wezterm\wezterm-gui.exe")) },
    @{ name='Obsidian';      path=(Resolve-FirstExistingPath @("$env:LOCALAPPDATA\Programs\Obsidian\Obsidian.exe", "$env:ProgramFiles\Obsidian\Obsidian.exe")) },
    @{ name='TickTick';      path=(Resolve-FirstExistingPath @("$env:LOCALAPPDATA\Programs\TickTick\TickTick.exe", "$env:ProgramFiles\TickTick\TickTick.exe")) },
    @{ name='Slack';         path=(Resolve-FirstExistingPath @("$env:LOCALAPPDATA\slack\slack.exe", "$env:ProgramFiles\Slack\slack.exe")) },
    @{ name='Telegram';      path=(Resolve-FirstExistingPath @("$env:ProgramFiles\Telegram Desktop\Telegram.exe", "$env:APPDATA\Telegram Desktop\Telegram.exe")) }
  )

  foreach ($a in $apps) {
    if ($null -ne $a.path) {
      $lnk = Join-Path $tmp ("{0}.lnk" -f $a.name)
      New-Shortcut -Target $a.path -ShortcutPath $lnk
      Pin-Taskbar -ShortcutPath $lnk
    } else {
      Write-Host ("Skip pin (not found): {0}" -f $a.name)
    }
  }

  Write-Host "Pinned requested apps (where found)."
} catch {
  Write-Warning ("Pin sequence error - {0}" -f $_.Exception.Message)
}

# Policy-disable Widgets (Win11) and News & Interests (Win10)
try {
  # Win11 Widgets policy: Microsoft\Dsh -> AllowNewsAndInterests = 0
  $dsh = 'HKLM:\SOFTWARE\Policies\Microsoft\Dsh'
  Ensure-Key $dsh
  New-ItemProperty -Path $dsh -Name 'AllowNewsAndInterests' -PropertyType DWord -Value 0 -Force | Out-Null

  # Win10 News & Interests policy: Windows Feeds -> EnableFeeds = 0
  $feedsPolicy = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds'
  Ensure-Key $feedsPolicy
  New-ItemProperty -Path $feedsPolicy -Name 'EnableFeeds' -PropertyType DWord -Value 0 -Force | Out-Null

  Write-Host "Policy set: Widgets/News & Interests disabled."
} catch {
  Write-Warning ("Couldn't set policy keys - {0}" -f $_.Exception.Message)
}

try { gpupdate /target:computer /force | Out-Null } catch {}

# Apply shell-related changes
Restart-Explorer
Write-Host "`nAll requested tweaks applied. Some HKLM/policy changes may need a sign-out or reboot."
