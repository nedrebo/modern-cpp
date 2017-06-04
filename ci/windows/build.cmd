echo off

set ORIGINAL_DIR=%CD%
cd %~dp0

mkdir build
cd build && ^
cmake ..\..\.. && ^
msbuild ModernCpp.sln

set BUILD_ERROR_CODE=%errorlevel%

cd %ORIGINAL_DIR%

if %BUILD_ERROR_CODE% neq 0 (
    exit /b %BUILD_ERROR_CODE%
)

echo "Success!"
