@echo off

set SELECTOR_PATH=%~dp0
set SELECTOR_VERSION_NAME=%1
set SELECTOR_VERSION_PATH=%SELECTOR_PATH%\%SELECTOR_VERSION_NAME%
set SELECTOR_LINK_NAME=current
set SELECTOR_LINK_PATH=%SELECTOR_PATH%\%SELECTOR_LINK_NAME%
set SELECTOR_TITLE=[VERSIONS]

if defined SELECTOR_VERSION_NAME (
	if exist %SELECTOR_VERSION_PATH% (
		echo Version setted: %SELECTOR_VERSION_NAME%
		if exist %SELECTOR_LINK_PATH% (
			rmdir %SELECTOR_LINK_PATH%
		)
		mklink /d %SELECTOR_LINK_PATH% %SELECTOR_VERSION_PATH% > NUL
	) else (
		echo Invalid version: %SELECTOR_VERSION_NAME%
	)
) else (
	echo %SELECTOR_TITLE%
	dir /B/AD/ON %SELECTOR_PATH%
)

set SELECTOR_PATH=
set SELECTOR_VERSION_NAME=
set SELECTOR_VERSION_PATH=
set SELECTOR_LINK_NAME=
set SELECTOR_LINK_PATH=
set SELECTOR_TITLE=