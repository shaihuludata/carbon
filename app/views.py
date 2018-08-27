from app import app

@app.route('/')
@app.route('/index')
def index():
    return "Hulo, my wold!"


@app.route('/about')
def about():
    return 'The about page'


@app.route('/bugoga')
def bugoga():
    return 'bugogashenka'

# from flask import Flask
# app = Flask(__name__)
#
#
# @app.route('/')
# def hello_world():
#     return 'Huloworld!'
#
