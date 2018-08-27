from flask import render_template
from app import app


@app.route('/')
@app.route('/index')
def index():
    user = {'nickname': 'Denis'}
    return render_template("index.html", title='Home', user=user)


@app.route('/about')
def about():
    return 'The about page'


@app.route('/bugoga')
def bugoga():
    return 'bugogashenka'

