#!/bin/sh -v

# https://github.com/dotnet-campus/dotnetCampus.UpdateAllDotNetTools
dotnet tool install --global dotnetcampus.updatealldotnettools

# https://github.com/timabell/sln-items-sync/issues
dotnet tool install --global sln-items-sync

# https://github.com/dotnet-outdated/dotnet-outdated
dotnet tool install --global dotnet-outdated-tool # for upgrading nugets in a project

# https://github.com/Webreaper/CentralisedPackageConverter
dotnet tool install --global centralisedpackageconverter

# https://github.com/GitTools/GitVersion
dotnet tool install --global GitVersion.Tool # semver tooling

# https://github.com/natemcmaster/dotnet-serve
dotnet tool install --global dotnet-serve # serve any folder over http

dotnet tool install --global dotnet-ef

################

dotnet new install xunit.v3.templates
