from flask import Flask, request
from dotenv import load_dotenv, find_dotenv
load_dotenv(find_dotenv())

app = Flask(__name__)
@app.route('/hello', methods=['GET', 'POST'])
def my_app():
    return "world "

@app.route('/vowel-service', methods =['GET', 'POST'])
def v_app():
   input_json = request.get_json()
   str1 = (input_json['message'])
   vowels = ""
   for char in str1:
       if char in "aeiouAEIOU":
           vowels += char
   result_string = ""
   for char in str1:
       if char in "aeiouAEIOU":
           result_string += vowels[-1]
           vowels = vowels[:-1]
       else:
           result_string += char

   return result_string, 405

   return app

