
"%PYTHON%" %RECIPE_DIR%/fix_openssl_setup.py

"%PYTHON%" -m pip install . --no-deps --ignore-installed --no-cache-dir -vvv
if errorlevel 1 exit 1
