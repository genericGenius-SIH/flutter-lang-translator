import 'dart:math';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:translator/translator.dart';

import '../api/speech_api.dart';

class SpeechText extends StatefulWidget {
  const SpeechText({Key? key}) : super(key: key);

  @override
  State<SpeechText> createState() => _SpeechTextState();
}

class _SpeechTextState extends State<SpeechText> {
  String _lastWords = '';
  var output = "";
  bool isListening = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _initSpeech();
  // }

  /// This has to happen only once per app
  // void _initSpeech() async {
  //   _speechEnabled = await _speechToText.initialize();
  //   setState(() {});
  // }

  /// Each time to start a speech recognition session
  // void _startListening() async {
  //   await _speechToText.listen(onResult: _onSpeechResult);
  //   setState(() {});
  // }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  // void _stopListening() async {
  //   await _speechToText.stop();
  //   setState(() {});
  // }

  

  void translate(String src, String desc, String input) async {
    GoogleTranslator translator = new GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: desc);
    setState(() {
      output = translation.text.toString();
      // print(output);
    });

    if (src == '--' || desc == '--') {
      setState(() {
        output = 'Fail to translate';
      });
    }
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  // void _onSpeechResult(SpeechRecognitionResult result) {
  //   setState(() {
  //     _lastWords = result.recognizedWords;
  //     print(_lastWords);
  //     translate('en', 'hi', _lastWords);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Anuvadak!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        elevation: 0,
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                // Text('Recognized words:', style: TextStyle(fontSize: 20.0, color: Colors.black),),
                Builder(
                  builder: (context) => IconButton(
                    onPressed: () async {
                      await output != null ? FlutterClipboard.copy(output) : (){};

                      Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Copied'))
                      );
                    },
                    icon: Icon(Icons.content_copy)),
                ),
                ]),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  reverse: true,
                  padding: const EdgeInsets.all(30).copyWith(bottom: 150),
                  child: Column(
                  children : [
                  Text(
                  // If listening is active show the recognized words
                  isListening
                      ? "Listening..."
                      //'$_lastWords'
                      // If listening isn't active but could be tell the user
                      // how to start it, otherwise indicate that speech
                      // recognition is not yet ready or not supported on
                      // the target device
                      : 'Tap the microphone to start listening...',
                          // : 'Speech not available',
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                
                SizedBox(
                  height: 30,
                ),
                
                Text(
                    "$_lastWords\n\n$output",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                )

                ]
                ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: isListening,
        endRadius: 80,
        glowColor: Colors.cyan,
        child: FloatingActionButton(
          onPressed: toggleRecording,
          child: Icon(isListening ? Icons.mic : Icons.mic_none),
          backgroundColor: Colors.cyan,
        ),
      ),
      
    );
  }

  Future toggleRecording() => SpeechApi.toggleRecording(
    onResult: (_lastWords) => setState(() => this._lastWords = _lastWords),
    onListening: (isListening){
      setState(() => this.isListening = isListening);

      if(!isListening){
        Future.delayed(Duration(seconds: 1), (() {
          translate('en', 'hi', _lastWords != '' ? _lastWords: 'hello, Tap the microphone to start listening...');
        }));
      }
    }
  );
}