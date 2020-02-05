import sys
from flask import *

args = sys.argv
app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def main_page():
    return render_template("top.html")

@app.route("/<name>", methods=["GET", "POST"])
def namepage(name):
    return render_template("trace2office365.html", file_name = args[1])

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=8888, threaded=True)
