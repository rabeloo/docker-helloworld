import socket
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')

def hello():
    container_id = socket.gethostname()
    return render_template('index.html', container_id=container_id)

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
