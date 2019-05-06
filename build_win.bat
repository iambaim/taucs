@echo off

echo Compiler: %COMPILER%
echo Architecture: %MSYS2_ARCH%
echo Platform: %PLATFORM%
echo MSYS2 directory: %MSYS2_DIR%
echo MSYS2 system: %MSYSTEM%

IF %COMPILER%==msys2 (
    @echo on
    SET "PATH=C:\%MSYS2_DIR%\%MSYSTEM%\bin;C:\%MSYS2_DIR%\usr\bin;%PATH%"
    bash -lc "pacman -S --needed --noconfirm pacman-mirrors"
    REM Update
    bash -lc "pacman -Syu --noconfirm"

    REM build tools
    bash -lc "pacman -S --needed --noconfirm mingw-w64-x86_64-toolchain autoconf automake libtool make patch mingw-w64-x86_64-libtool"

    REM dependencies
    bash -lc "pacman -S --noconfirm --needed mingw-w64-x86_64-metis mingw-w64-x86_64-lapack mingw-w64-x86_64-openblas mingw-w64-x86_64-f2c"

    REM start build
    bash -lc "cd $TAUCS_BUILD_DIR && ./build_win.sh"
)

