ECHO OFF
IF "%1"=="" GOTO USAGE
ECHO Downloading nuget.exe
powershell -command "& { iwr https://dist.nuget.org/win-x86-commandline/v2.8.6/nuget.exe -OutFile nuget.exe }"
ECHO Restoring local solution nuget packages using %1
nuGet.exe restore -Source http://%1/guestAuth/app/nuget/v1/FeedService.svc -Source https://www.nuget.org/api/v2/curated-feeds/microsoftdotnet/
ECHO Deleting nuget.exe
del nuGet.exe
GOTO EXIT

:USAGE
ECHO USAGE: %0 TEAM_CITY_DNS

:EXIT
ECHO ON