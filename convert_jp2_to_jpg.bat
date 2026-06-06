@echo off
:: ============================================================
:: JP2 to JPG batch converter — fixed for your project folder
:: ============================================================

setlocal enabledelayedexpansion

set INPUT_FOLDER=C:\Users\hamma\Desktop\Projects\Asraar-e-Mehboob-Kamil-Book\images
set OUTPUT_FOLDER=C:\Users\hamma\Desktop\Projects\Asraar-e-Mehboob-Kamil-Book\images_jpg

echo Input  : %INPUT_FOLDER%
echo Output : %OUTPUT_FOLDER%
echo.

if not exist "%OUTPUT_FOLDER%" (
    mkdir "%OUTPUT_FOLDER%"
    echo Created output folder.
)

set COUNT=0
set FAILED=0

echo Starting conversion...
echo.

for %%f in ("%INPUT_FOLDER%\*.jp2") do (
    set FILENAME=%%~nf
    set OUTFILE=%OUTPUT_FOLDER%\!FILENAME!.jpg

    if exist "!OUTFILE!" (
        echo [SKIP] !FILENAME!.jp2
    ) else (
        echo [CONVERTING] !FILENAME!.jp2 ...
        magick "%%f" -quality 88 "!OUTFILE!"
        if !errorlevel! == 0 (
            set /a COUNT+=1
            echo [OK] !FILENAME!.jpg
        ) else (
            set /a FAILED+=1
            echo [FAIL] !FILENAME!.jp2
        )
    )
)

echo.
echo ============================================================
echo Done!  Converted: %COUNT%   Failed: %FAILED%
echo Output: %OUTPUT_FOLDER%
echo ============================================================
pause
