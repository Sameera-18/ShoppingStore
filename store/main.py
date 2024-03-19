from flask import Flask 
from public import public
from admin import admin
from customer import customer
from vendor import vendor

app=Flask(__name__)

app.secret_key='key'

app.register_blueprint(public)
app.register_blueprint(admin,url_prefix='/admin')
app.register_blueprint(customer,url_prefix='/customer')
app.register_blueprint(vendor,url_prefix='/vendor')


app.run(debug=True,port=5353,host="0.0.0.0")
