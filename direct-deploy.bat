@echo off
echo Setting up ultra-minimal Flask app for Vercel...

REM Create vercel directory if it doesn't exist
if not exist vercel mkdir vercel

REM Create minimal index.py
echo from flask import Flask > vercel\index.py
echo. >> vercel\index.py
echo app = Flask(__name__^) >> vercel\index.py
echo. >> vercel\index.py
echo @app.route('/'^) >> vercel\index.py
echo def home(): >> vercel\index.py
echo     return "Hello World!" >> vercel\index.py

REM Create minimal wsgi.py
echo from index import app > vercel\wsgi.py

REM Create minimal requirements.txt
echo Flask==2.2.3 > vercel\requirements.txt

REM Create properly formatted vercel.json
echo {> vercel.json
echo   "builds": [>> vercel.json
echo     {>> vercel.json
echo       "src": "vercel/index.py",>> vercel.json
echo       "use": "@vercel/python">> vercel.json
echo     }>> vercel.json
echo   ],>> vercel.json
echo   "routes": [>> vercel.json
echo     {>> vercel.json
echo       "src": "/(.*)",>> vercel.json
echo       "dest": "vercel/index.py">> vercel.json
echo     }>> vercel.json
echo   ]>> vercel.json
echo }>> vercel.json

echo All files created successfully!
echo.
echo Now that all files are created, deploy your app using one of these methods:
echo.
echo 1. Vercel website: Upload these files to GitHub and import from vercel.com
echo 2. Vercel login: Run 'vercel login' and follow the prompts, then run 'vercel --prod'
echo. 