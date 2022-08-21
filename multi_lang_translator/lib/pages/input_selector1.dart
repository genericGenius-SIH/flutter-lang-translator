import 'package:flutter/material.dart';
import 'package:multi_lang_translator/pages/Image_picker.dart';
import 'package:multi_lang_translator/pages/image_camera_translation.dart';
import 'package:multi_lang_translator/pages/pdf_translator.dart';
import 'package:multi_lang_translator/pages/speech.dart';
import 'package:multi_lang_translator/pages/text_converter.dart';

class InputSelector extends StatefulWidget {
  const InputSelector({Key? key}) : super(key: key);

  @override
  State<InputSelector> createState() => _InputSelectorState();
}

class _InputSelectorState extends State<InputSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('asset/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 90),
              child: Text(
                'Welcome !!',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 35, top: 240),
              child: Text(
                'What can I translate \nfor you today?',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5,
                  right: 35,
                  left: 35),
              child: Column(children: [
                ElevatedButton(
                  onPressed: () => Navigator.push(context, 
         MaterialPageRoute(builder: (context) => Text_Converter())),
                  child: Text("Text"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    minimumSize: Size(470, 70),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.push(context, 
         MaterialPageRoute(builder: (context) => SpeechText())),
                  child: Text("Speech"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    minimumSize: Size(470, 70),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp())),
                  child: Text("Image"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    minimumSize: Size(470, 70),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PdfTranslator())),
                  child: Text("Pdf"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    minimumSize: Size(470, 70),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
