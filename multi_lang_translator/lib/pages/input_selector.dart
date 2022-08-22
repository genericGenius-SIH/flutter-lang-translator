import 'package:flutter/material.dart';
import 'package:multi_lang_translator/pages/Image_picker.dart';
import 'package:multi_lang_translator/pages/image_camera_translation.dart';
import 'package:multi_lang_translator/pages/pdf_translator.dart';
import 'package:multi_lang_translator/pages/speech.dart';
import 'package:multi_lang_translator/pages/text_translator.dart';

//sih_translator

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
        image: DecorationImage(image: AssetImage('asset/Anuvadak!.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding:EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05, right: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Text('App Info', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500)),
                  IconButton(onPressed: (() {
                  showDialog(context: context, 
                  builder: (context) => AlertDialog(
                    title: Center(child: Text('Welcome !!')),
                    content: Text('Anuvadak! is a translation software that translates from Hindi to English and vice-versa.\n\nUsers can give input in multiple formats such as \n -  Text\n -  Speech\n -  Image\n -  Document \n\nOur app also provides courses to learn Hindi & English languages.', textAlign: TextAlign.justify,),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context), child: Text('OK')),
                    ],
                    scrollable: true,
                  )
                  );
                }), icon: Icon(Icons.info))
              ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.5, right: 35, left: 35
                ),
                child: Column(children: [
        
                  ElevatedButton.icon(
                  onPressed: () => Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => Text_Converter())), 
                  icon: Icon(Icons.text_fields_rounded, size: 32),
                  label: Text('Text'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    minimumSize: Size(470, 70),
                  ),),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton.icon(onPressed: () => Navigator.push(context, 
           MaterialPageRoute(builder: (context) => SpeechText())), 
                  icon: Icon(Icons.mic, size: 32),
                  label: Text('Speech'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    minimumSize: Size(470, 70),
                  ),),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton.icon(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp())), 
                  icon: Icon(Icons.image, size: 32),
                  label: Text('Image'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF00BCD4),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    minimumSize: Size(470, 70),
                  ),),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton.icon(
                  onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PdfTranslator())), 
                  icon: Icon(Icons.text_snippet_outlined, size: 32),
                  label: Text('Pdf'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    minimumSize: Size(470, 70),
                  ),),
                  TextButton(onPressed: (){}, child: Text('Check out FREE language courses',style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w500)),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  ),
                  
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
