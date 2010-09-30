@echo off
setLocal EnableDelayedExpansion
set CLASSPATH="
for /R ./lib %%a in (*.jar) do (
   set CLASSPATH=!CLASSPATH!;%%a
)
set CLASSPATH=!CLASSPATH!"
set CLASSPATH=%CLASSPATH%;src;test;config;data
set CLASSPATH="
for /R "%USERPROFILE%/.clojure/lib" %%a in (*.jar) do (
   set CLASSPATH=!CLASSPATH!;%%a
)
set CLASSPATH=!CLASSPATH!"
echo CLASSPATH=%CLASSPATH%

rem check if the first arg is a file, if so use clj-script
if "%1"=="" goto :noscript

if not exist %1 goto :noscript 
  rem java -server -Xmx1G -cp %CLASSPATH% jline.ConsoleRunner clojure.main %*
  java -Xmx1G -cp %CLASSPATH% jline.ConsoleRunner clojure.main %*

:noscript
  rem java -server -Xmx1G -cp %CLASSPATH% jline.ConsoleRunner clojure.main -r %*
  java -Xmx1G -cp %CLASSPATH% jline.ConsoleRunner clojure.main -r %*
