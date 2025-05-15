@echo off
echo Setting up minimal Vercel project...

REM Create minimal files
if not exist vercel mkdir vercel

REM Create basic Flask app
echo from flask import Flask > vercel\index.py
echo app = Flask(__name__) >> vercel\index.py
echo @app.route("/") >> vercel\index.py
echo def home(): >> vercel\index.py
echo     return "Hello from Vercel + Flask!" >> vercel\index.py

REM Create requirements
echo Flask==2.2.3 > vercel\requirements.txt

REM Create vercel.json
echo {^
  "builds": [^
    {^
      "src": "vercel/index.py",^
      "use": "@vercel/python"^
    }^
  ],^
  "routes": [^
    {^
      "src": "/(.*)",^
      "dest": "vercel/index.py"^
    }^
  ]^
} > vercel.json

REM Create .vercel directory and project.json
if not exist .vercel mkdir .vercel
echo {^
  "projectId": "prj_BmLHnkCJi5q1cQFjJZZT1",^
  "orgId": "zXaBCJi5q1cQFjJZZT1sHnWe"^
} > .vercel\project.json

echo Project configuration complete!
echo.
echo Now run: npx vercel --prod 