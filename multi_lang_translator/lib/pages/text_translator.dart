import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:multi_lang_translator/others/translate.dart';

class Text_Converter extends StatefulWidget {
  const Text_Converter({Key? key}) : super(key: key);

  @override
  State<Text_Converter> createState() => _Text_ConverterState();
}

class _Text_ConverterState extends State<Text_Converter> {
  bool circular = true;
  var languages = ['Hindi', 'English', 'Marathi', 'Tamil'];
  var originLanguage = "From";
  var destinationLanguage = "To";
  var output = "";
  var failure = "";
  TextEditingController languageController = TextEditingController();

  void translate(String src, String desc, String input) async {
    setState(() {
      circular = true;
    });

    if (src == '--' || desc == '--') {
      setState(() {
        failure = 'Fail to translate';
      });
    } else {
      var data = await sendText(src, desc, input);
      setState(() {
        output = data;
        circular = false;
      });
      setState(() {
        failure = '';
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
  void initState() {
    super.initState();
    languageController.addListener(() => setState(() {}));
  }

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
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueGrey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Type To Translate',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: DropdownButton(
                              focusColor: Colors.transparent,
                              iconDisabledColor: Colors.transparent,
                              iconEnabledColor: Colors.transparent,
                              hint: Text(
                                originLanguage,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20.0),
                              ),
                              dropdownColor: Colors.amber,
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
                        color: Colors.black,
                        size: 40,
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        child: Center(
                          child: DropdownButton(
                              focusColor: Colors.transparent,
                              iconDisabledColor: Colors.transparent,
                              iconEnabledColor: Colors.transparent,
                              hint: Text(
                                destinationLanguage,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20.0),
                              ),
                              dropdownColor: Colors.amber,
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
                    padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      cursorColor: Colors.black,
                      autofocus: false,
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.text_snippet_outlined,
                          color: Colors.black,
                        ),
                        suffixIcon: languageController.text.isEmpty
                            ? Container(
                                width: 0,
                              )
                            : IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () => languageController.clear(),
                              ),
                        hintText: 'Text to translate',
                        hintStyle: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 211, 208, 208)),
                        labelText: 'Please enter your Text',
                        labelStyle: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 211, 208, 208)),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey, width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 222, 222, 222),
                                width: 2)),
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
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            minimumSize: Size(60.0, 40.0)),
                        onPressed: languageController.text.isEmpty ? null : () {
                          translate(
                              getLanguageCode(originLanguage),
                              getLanguageCode(destinationLanguage),
                              languageController.text.toString());
                        },
                        child: Text(
                          "Translate",
                          style: TextStyle(fontSize: 20.0),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: output != ''
                          ? circular
                              ? CircularProgressIndicator()
                              : Column(
                                  children: <Widget>[
                                    Text(
                                      failure == '' ?
                                      "\n$output" : failure,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                )
                          : Column(
                              children: <Widget>[
                                Text(
                                  failure == '' ?
                                  "\n$output" : failure,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            )),
                ],
              ),
            ),
          ),
        ));
  }
}
