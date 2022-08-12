import 'package:flutter/material.dart';
import 'package:multi_lang_translator/pages/speech.dart';
import 'package:multi_lang_translator/pages/text_converter.dart';
import 'package:multi_lang_translator/pages/loading.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/speech_text',
      routes: {
        '/': (context) => Loading(),
        '/text_converter': (context) => Text_Converter(),
        '/speech_text': (context) => SpeechText(),
        // '/image_text' : (context) => ImageTranslator(),
      },
    ));
