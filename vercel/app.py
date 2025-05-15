import os
import sys

# Add parent directory to path for imports
parent_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, parent_dir)
sys.path.insert(0, os.path.join(parent_dir, "src"))

try:
    # Import the Flask server from the app
    from src.app import server as flask_app
    
    # This is for Vercel serverless deployment
    app = flask_app
except ImportError as e:
    # Fallback for deployment issues
    from flask import Flask
    
    app = Flask(__name__)
    
    @app.route('/')
    def home():
        return """
        <html>
            <head>
                <title>Disease Outbreak Prediction</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 40px; line-height: 1.6; }
                    h1 { color: #333; }
                    .error { color: #d9534f; background: #f9f9f9; padding: 15px; border-radius: 5px; }
                </style>
            </head>
            <body>
                <h1>Disease Outbreak Prediction System</h1>
                <p>The application is currently experiencing technical difficulties. Please try again later.</p>
                <div class="error">
                    <p>Error details for administrators:</p>
                    <code>{}</code>
                </div>
            </body>
        </html>
        """.format(str(e))
    
    # Log the error
    print(f"Error importing main application: {e}", file=sys.stderr) 