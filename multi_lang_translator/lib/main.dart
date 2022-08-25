import 'package:flutter/material.dart';
import 'package:multi_lang_translator/pages/input_selector.dart';
import 'package:multi_lang_translator/pages/speech.dart';
import 'package:multi_lang_translator/pages/text_translator.dart';
import 'package:multi_lang_translator/pages/loading.dart';

void main() => runApp(MaterialApp(
      title: 'Anvadak',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/input_selector' : (context) => InputSelector(),
        '/text_converter': (context) => Text_Converter(),
        '/speech_text': (context) => SpeechText(),
        // '/image_text' : (context) => ImageTranslator(),
      },
    ));
