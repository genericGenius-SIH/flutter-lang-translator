from flask import Flask, request, jsonify
from googletrans import Translator

app = Flask(__name__)
translator = Translator()

@app.route('/api',methods=['GET'])
def home():
    d = {}
    inputchr = str(request.args['query'])
    source_lan = "en"  #en is the code for english Language
    translated_to= "hi" #hi is the code for Hindi Language
    translated_text = translator.translate(inputchr, src=source_lan, dest = translated_to)
    # ans = str(ord(inputchr))
    d['output'] = translated_text.text
    print(f"The Translated Text is: {translated_text.text}")
    return d

if __name__ == '__main__':
    app.run(host= "192.168.0.106", port=8000, debug=True)