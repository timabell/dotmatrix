#!/bin/sh -v

# https://github.com/dotnet-campus/dotnetCampus.UpdateAllDotNetTools
dotnet tool install --global dotnetcampus.updatealldotnettools

# https://github.com/timabell/sln-items-sync/issues
dotnet tool install --global sln-items-sync

# https://github.com/dotnet-outdated/dotnet-outdated
dotnet tool install --global dotnet-outdated-tool # for upgrading nugets in a project

# https://github.com/Webreaper/CentralisedPackageConverter
dotnet tool install --global centralisedpackageconverter


dotnet tool install --global dotnet-ef
