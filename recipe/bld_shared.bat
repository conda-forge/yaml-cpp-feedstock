:: cmd

:: Isolate the build.
mkdir build_shared
cd build_shared
if errorlevel 1 exit 1

:: Generate the build files.
cmake .. -G"Ninja" %CMAKE_ARGS% ^
    -DYAML_CPP_BUILD_TESTS=OFF ^
    -DBUILD_SHARED_LIBS=ON ^
    -DYAML_BUILD_SHARED_LIBS=ON ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%
if errorlevel 1 exit 1

:: Build and install.
ninja install
if errorlevel 1 exit 1
