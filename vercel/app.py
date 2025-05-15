import os
import sys

# Add parent directory to path for imports
parent_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, parent_dir)
sys.path.insert(0, os.path.join(parent_dir, "src"))

# Import the Flask server from the app
from src.app import server as flask_app

# This is for Vercel serverless deployment
app = flask_app 