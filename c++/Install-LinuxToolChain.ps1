function Install-LinuxToolChain {
<#
.SYNOPSIS
 Downloads and installs the UE4 linux toolchain components.
 
.DESCRIPTION
 Downloads the clang compiler to $ToolChainDestination and creates a
 system-wide environment variable pointing to it.
 
 Afterwards you have to regenerate the UE4 engine project files and
 rebuild the engine.

.NOTES
 https://wiki.unrealengine.com/Compiling_For_Linux
 https://wiki.unrealengine.com/Dedicated_Server_Guide_(Windows_%26_Linux)
 http://allarsblog.com/2015/11/06/Installing-Linux-Toolchain-On-Windows/
#>
[CmdletBinding()]
param(
    [string]$ToolChainDestination = "C:\UE-Toolchain\",
    [string]$ToolChainURL =  "http://cdn.unrealengine.com/qfe/v4_clang-3.5.0_ld-2.24_glibc-2.12.2.zip"
)

    if(!(Test-Path $ToolChainDestination))
    {
        Write-Verbose "Toolchain destination directory doesn't exist. Creating now..."
        try {
            [void](mkdir $ToolChainDestination)
        }
        catch {
            Write-Error "Failed to create target folder (Error: "  $_.Exception.Message ")"
            exit
        }
    }

    $DestinationFilePath = Join-Path $ToolChainDestination $ToolChainURL.Split('/')[-1]

    Write-Verbose ("Start download: [{0}]->[{1}]" -f $ToolChainURL,$DestinationFilePath)
    Invoke-WebRequest $ToolChainURL -OutFile $DestinationFilePath
        
    Write-Verbose ("Unpacking {0}" -f $DestinationFilePath)
    try { 
        $shell = New-Object -ComObject Shell.Application 
        $shell.Namespace($ToolChainDestination).copyhere(($shell.NameSpace($DestinationFilePath)).items()) 
    } 
    catch { 
        Write-Warning -Message "Unexpected Error. (Error: " $_.Exception.Message ")" 

    } 

    $ToolChain = Get-ChildItem -Path $ToolChainDestination -Recurse -Filter 'toolchain'
    Write-Verbose ("Create environment variable: [{0}]->[{1}]" -f 'LINUX_ROOT',$ToolChain.FullName)
    [Environment]::SetEnvironmentVariable('LINUX_ROOT', $ToolChain.FullName, 'Machine')
    Get-Childitem $ToolChainDestination -filter *.zip | Remove-item -force
    
}


Install-LinuxToolChain -Verbose
