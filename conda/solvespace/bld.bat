mkdir build
cd build

cmake -G "Ninja" ^
      -D BUILD_PYTHON:BOOL=ON ^
      -D CMAKE_BUILD_TYPE:STRING=Release ^
      -D FREECAD_LIBPACK_USE:BOOL=OFF ^
      -D CMAKE_INSTALL_PREFIX:FILEPATH=%LIBRARY_PREFIX% ^
      -D CMAKE_PREFIX_PATH:FILEPATH=%LIBRARY_PREFIX% ^
      -D PYTHON_EXECUTABLE:FILEPATH=%PREFIX%/python ^
      ..

if errorlevel 1 exit 1
ninja _slvs
if errorlevel 1 exit 1
copy src/swig/python/_slvs.so %SP_DIR%
copy src/swig/python/slvs.py %SP_DIR%
