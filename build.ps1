﻿param(
    [string] $Architecture = "x64",
    [string] $Version = "1.0.0",
    [switch] $Dev
)

$ErrorActionPreference = "Stop";

if ($Dev) {
    dotnet publish Starward -c Release -r "win10-$Architecture" -o "build/Starward/app-$Version" -p:Platform=$Architecture -p:DefineConstants=DEV -p:PublishReadyToRun=true -p:PublishTrimmed=true -p:TrimMode=partial -p:Version=$Version;
}
else {
    dotnet publish Starward -c Release -r "win10-$Architecture" -o "build/Starward/app-$Version" -p:Platform=$Architecture -p:PublishReadyToRun=true -p:PublishTrimmed=true -p:TrimMode=partial -p:Version=$Version;
}

$env:Path += ';C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\amd64\';

msbuild Starward.Launcher "-property:Configuration=Release;Platform=$Architecture;OutDir=$(Resolve-Path "build/Starward/")";

Add-Content "build/Starward/config.ini" -Value "app_folder=app-$Version`r`nexe_name=Starward.exe";

Remove-Item "build/Starward/Starward.pdb" -Force;
