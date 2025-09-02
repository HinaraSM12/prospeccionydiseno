from flask import Flask, render_template, request

app = Flask(__name__)


@app.route('/',methods=["GET","POST"])
def hello_world():  # put application's code here
    if request.method=="POST":
        print(len(request.form),1)
        for i in request.args:
            print(i)
    return render_template("traductor.html")


if __name__ == '__main__':
    app.run(port=80)

@app.route('/salida',methods=["GET","POST"])
def salida():
    return render_template("salida.html")

