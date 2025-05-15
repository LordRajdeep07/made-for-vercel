import os
import sys
from flask import Flask, render_template_string

# Create a basic Flask app
app = Flask(__name__)

@app.route('/')
def home():
    return render_template_string("""
    <!DOCTYPE html>
    <html>
    <head>
        <title>Disease Outbreak Prediction</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
                line-height: 1.6;
                color: #333;
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
            }
            h1 {
                color: #2563eb;
                border-bottom: 2px solid #e5e7eb;
                padding-bottom: 10px;
            }
            .card {
                background: #f9fafb;
                border-radius: 8px;
                padding: 20px;
                margin: 20px 0;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            .success {
                color: #10b981;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <h1>Disease Outbreak Prediction System</h1>
        
        <div class="card">
            <h2>Deployment Successful!</h2>
            <p class="success">Your application has been successfully deployed to Vercel.</p>
            <p>This is a minimal version of the application to demonstrate successful deployment.</p>
        </div>
        
        <div class="card">
            <h2>Next Steps</h2>
            <p>To deploy the full application:</p>
            <ol>
                <li>Gradually add dependencies to the requirements.txt file</li>
                <li>Update this placeholder with your actual application code</li>
                <li>Configure environment variables in the Vercel dashboard</li>
            </ol>
        </div>
    </body>
    </html>
    """)

# For local testing
if __name__ == "__main__":
    app.run(debug=True) 