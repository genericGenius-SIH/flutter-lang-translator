import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class Text_Converter extends StatefulWidget {
  const Text_Converter({Key? key}) : super(key: key);

  @override
  State<Text_Converter> createState() => _Text_ConverterState();
}

class _Text_ConverterState extends State<Text_Converter> {
  var languages = ['Hindi', 'English', 'Marathi', 'Tamil'];
  var originLanguage = "From";
  var destinationLanguage = "To";
  var output = "";
  TextEditingController languageController = TextEditingController();

  void translate(String src, String desc, String input) async {
    GoogleTranslator translator = new GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: desc);
    setState(() {
      output = translation.text.toString();
    });

    if (src == '--' || desc == '--') {
      setState(() {
        output = 'Fail to translate';
      });
    }
  }

  String getLanguageCode(String language) {
    if (language == 'English') {
      return "en";
    } else if (language == 'Hindi') {
      return "hi";
    } else if (language == 'Marathi') {
      return "mr";
    } else if (language == 'Tamil') {
      return "ta";
    }
    return "--";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff10223d),
      appBar: AppBar(
        title: Text('SayHi!', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2.0,),),
        centerTitle: true,
        backgroundColor: Color(0xff10223d),
        elevation: 0,
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
        child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: DropdownButton(
                          focusColor: Colors.white,
                          iconDisabledColor: Colors.white,
                          iconEnabledColor: Colors.white,
                          hint: Text(
                            originLanguage,
                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: languages.map((String dropDownStringItem) {
                            return DropdownMenuItem(
                              child: Text(dropDownStringItem),
                              value: dropDownStringItem,
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              originLanguage = value!;
                            });
                          }),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Center(
                      child: DropdownButton(
                          focusColor: Colors.white,
                          iconDisabledColor: Colors.white,
                          iconEnabledColor: Colors.white,
                          hint: Text(
                            destinationLanguage,
                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: languages.map((String dropDownStringItem) {
                            return DropdownMenuItem(
                              child: Text(dropDownStringItem),
                              value: dropDownStringItem,
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              destinationLanguage = value!;
                            });
                          }),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  decoration: InputDecoration(
                    labelText: 'Please enter your Text',
                    labelStyle: TextStyle(fontSize: 18, color: Colors.white),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1)),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  controller: languageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter text to translate';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 27, 67, 128), minimumSize: Size(60.0, 40.0)),
                    onPressed: () {
                      translate(
                          getLanguageCode(originLanguage),
                          getLanguageCode(destinationLanguage),
                          languageController.text.toString());
                    },
                    child: Text("Translate", style: TextStyle(fontSize: 20.0),)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "\n$output",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            ],
        ),
      ),
          )),
    );
  }
}
