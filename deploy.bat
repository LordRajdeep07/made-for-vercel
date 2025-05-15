@echo off
echo Setting up deployment files...

REM Create minimal index.py
if not exist vercel mkdir vercel
echo from flask import Flask > vercel\index.py
echo app = Flask(__name__) >> vercel\index.py
echo @app.route('/') >> vercel\index.py
echo def home(): >> vercel\index.py
echo     return "Hello from Vercel!" >> vercel\index.py

REM Create minimal requirements.txt
echo Flask==2.2.3 > vercel\requirements.txt

REM Create vercel.json
echo {"builds":[{"src":"vercel/index.py","use":"@vercel/python"}],"routes":[{"src":"/(.*)", "dest":"vercel/index.py"}]} > vercel.json

REM Create .vercelignore
echo * > .vercelignore
echo !vercel/ >> .vercelignore
echo !vercel.json >> .vercelignore

REM Deploy using token
echo Deploying to Vercel...
set VERCEL_TOKEN=zXaBCJi5q1cQFjJZZT1sHnWe
npx vercel --token %VERCEL_TOKEN% --prod --force

echo Deployment complete! 