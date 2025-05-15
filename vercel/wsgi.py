import sys
import traceback

try:
    # Import the Flask app
    from app import app as application
    
    # Define a variable that Vercel can use
    app = application
    
except Exception as e:
    # Print error for logging
    print(f"Error importing app: {str(e)}")
    print(traceback.format_exc())
    
    # Define a fallback application
    def app(environ, start_response):
        status = '500 Internal Server Error'
        headers = [('Content-type', 'text/html; charset=utf-8')]
        start_response(status, headers)
        error_message = f"""
        <html>
            <head><title>WSGI Import Error</title></head>
            <body>
                <h1>Error Importing Flask Application</h1>
                <p>There was an error importing the Flask application:</p>
                <pre>{str(e)}</pre>
                <pre>{traceback.format_exc()}</pre>
            </body>
        </html>
        """
        return [error_message.encode('utf-8')] 