echo off
title Run Build to Project DOTNET
cls


@rem Define project name
set PROJECTMAINPATH=CIUniversalWindows.sln
set PROJECTTESTPATH=Tests\bin\x64\Release\Tests.dll

echo Start Build!

@rem ---------------------- {DEFINE PATH TO MSBUILD} ----------------------
@rem Add path to MSBuild Binaries
@rem Example C:\Program Files (x86)\MSBuild\14.0\Bin
@rem download the msbuild and install [en_visual_studio_enterprise_2015_x86_x64_dvd_6850497; select all features]
set MSBUILDPATH=C:\Program Files (x86)\MSBuild\14.0\Bin
@if exist "%MSBUILDPATH%" set PATH=%MSBUILDPATH%;%PATH%

@rem ---------------------- {DEFINE PATH TO NUGET} ----------------------
@rem Add path to Nuget Binaries
@rem Example C:\Program Files\Nuget
@rem download the nuget to the folder above or anywhere and set bellow [https://docs.nuget.org/consume/installing-nuget]
@rem set NUGETPATH=C:\Program Files\Nuget
@rem @if exist "%NUGETPATH%" set PATH=%NUGETPATH%;%PATH%

@rem ---------------------- {DEFINE PATH TO NUNIT} ----------------------
@rem Add path to NUnit Binaries
@rem Example C:\Program Files (x86)\NUnit 2.6.4\bin
@rem download the nunit and install [http://nunit.org/?p=download]
set NUNITPATH=C:\Program Files (x86)\NUnit 2.6.4\bin
@if exist "%NUNITPATH%" set PATH=%NUNITPATH%;%PATH%

@rem ------------------- { SHOW ENVIRONMENT VARIABLE} ------------------
echo [!] Show environment variables 
echo.
echo MSBUILD - [%MSBUILDPATH%]
echo.
echo NUGET - [%NUGETPATH%]
echo.
echo NUNIT - [%NUNITPATH%]
echo.
echo PATH - [%PATH%]
echo.
echo.
@rem --------------------------------------------------------------------


@rem ---------------------------- {RUN NUGET} ----------------------------
@rem Execute nuget
echo Executing Nuget with command [nuget restore %PROJECTMAINPATH%] ...
@rem nuget restore %PROJECTMAINPATH%
echo Nuget done.
echo.
echo.

echo Workspace - [%WORKSPACE%]
git clone -q --branch=dev https://github.com/NuGet/NuGetGallery.git %WORKSPACE%
build.cmd

@rem ---------------------------- {RUN MSBUILD} ---------------------------
@rem Execute msbuild
echo Executing MSBuild with command [msbuild %PROJECTMAINPATH% /m /t:Clean;Rebuild /p:Configuration=Release;Platform=x64] ...
msbuild %PROJECTMAINPATH% /m /t:Clean;Rebuild /p:Configuration=Release;Platform=x64
echo MSBuild done.
echo.
echo.

@rem ---------------------------- {RUN NUNIT} -----------------------------
@rem Execute nunit-console
echo Executing NUnit with command [nunit-console %PROJECTTESTPATH%]
nunit-console %PROJECTTESTPATH%
echo Nunit done.
echo.
echo.

echo Build done.



