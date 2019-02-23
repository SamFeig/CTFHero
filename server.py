from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():

    return "Hello World!"

@app.route("/compete")
def compete():
    return "Compete"

@app.route("/learn")
def learn():
    return "Learn"

@app.route("/archive")
def practice():
    return "Practice on archives"