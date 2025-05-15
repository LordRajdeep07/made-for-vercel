import os
import sys
import traceback

try:
    from flask import Flask, jsonify

    # Create a minimal Flask app
    app = Flask(__name__)

    @app.route('/', methods=['GET'])
    def index():
        return jsonify({
            "status": "ok",
            "message": "Vercel Flask deployment is working"
        })

    @app.route('/debug', methods=['GET'])
    def debug():
        """Return environment and system information for debugging"""
        info = {
            "python_version": sys.version,
            "sys_path": sys.path,
            "environment": dict(os.environ),
            "cwd": os.getcwd()
        }
        return jsonify(info)

    # Error handlers
    @app.errorhandler(404)
    def not_found(e):
        return jsonify({"error": "Not found"}), 404

    @app.errorhandler(500)
    def server_error(e):
        return jsonify({"error": str(e)}), 500

except Exception as e:
    # If Flask itself can't be imported or initialized
    print(f"Initialization error: {str(e)}")
    print(traceback.format_exc())
    
    # Create a minimal WSGI app as fallback
    def application(environ, start_response):
        status = '200 OK'
        headers = [('Content-type', 'text/html; charset=utf-8')]
        start_response(status, headers)
        error_message = f"""
        <html>
            <head><title>Flask Initialization Error</title></head>
            <body>
                <h1>Flask Initialization Error</h1>
                <p>Error: {str(e)}</p>
                <pre>{traceback.format_exc()}</pre>
            </body>
        </html>
        """
        return [error_message.encode('utf-8')]
    
    # Also define app variable so the WSGI server can find it
    app = application

# For local testing
if __name__ == "__main__":
    if isinstance(app, Flask):
        app.run(debug=True, port=3000)
    else:
        print("Flask app failed to initialize. Check errors above.") 