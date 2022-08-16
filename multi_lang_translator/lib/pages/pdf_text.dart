import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:translator/translator.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:pdf_text/pdf_text.dart';
import 'package:multi_lang_translator/others/mobile.dart';
import 'package:flutter/services.dart';


class PdfTranslator extends StatefulWidget {
  const PdfTranslator({Key? key}) : super(key: key);

  @override
  State<PdfTranslator> createState() => _PdfTranslatorState();
}

class _PdfTranslatorState extends State<PdfTranslator> {
  PDFDoc? _pdfDoc;
  String _text = "";
  var output = "";
  bool _buttonsEnabled = true;

  void translate(String src, String desc, String input) async {
    GoogleTranslator translator = new GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: desc);
    
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    setState(() {
      output = translation.text.toString();
    });
    print(output);
    print('Translate done');

    final font = await rootBundle.load("asset/fonts/Hind-Regular.ttf");
    final  dataint = font.buffer.asUint8List(font.offsetInBytes,font.lengthInBytes);
    final  PdfFont  font1  =  PdfTrueTypeFont (dataint,12);
    page.graphics
        .drawString(output, font1);

    List<int> bytes = await document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
    print('Translated pdf');

    if (src == '--' || desc == '--') {
      setState(() {
        output = 'Fail to translate';
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Translation'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            TextButton(
              child: Text(
                "Pick PDF document",
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.all(5),
                  backgroundColor: Colors.blueAccent),
              onPressed: _pickPDFText,
            ),
            TextButton(
              child: Text(
                "Read random page",
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.all(5),
                  backgroundColor: Colors.blueAccent),
              onPressed: _buttonsEnabled ? _readRandomPage : () {},
            ),
            TextButton(
              child: Text(
                "Read whole document",
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.all(5),
                  backgroundColor: Colors.blueAccent),
              onPressed: _buttonsEnabled ? _readWholeDoc : () {},
            ),
            ElevatedButton(
              onPressed: _createPDF,
              child: Text('Create Translated PDF'),
            ),
            Padding(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black,
                  width: 1,
                )),
                child: Text(
                  _pdfDoc == null
                      ? "Pick a new PDF document and wait for it to load..."
                      : "PDF document loaded, ${_pdfDoc!.length} pages\n",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              padding: EdgeInsets.all(15),
            ),
            Padding(
              child: Text(
                _text == "" ? "" : "Text:",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.all(15),
            ),
            Container(child: Text(_text)),
          ],
        ),
      ),
    );
  }

  /// Picks a new PDF document from the device
  Future _pickPDFText() async {
    var filePickerResult = await FilePicker.platform.pickFiles();
    print('Path: $filePickerResult.files.single.path!');
    if (filePickerResult != null) {
      _pdfDoc = await PDFDoc.fromPath(filePickerResult.files.single.path!);
      setState(() {});
    }
  }

  /// Reads a random page of the document
  Future _readRandomPage() async {
    if (_pdfDoc == null) {
      return;
    }
    setState(() {
      _buttonsEnabled = false;
    });

    String text =
        await _pdfDoc!.pageAt(Random().nextInt(_pdfDoc!.length) + 1).text;

    setState(() {
      _text = text;
      print(_text);
      _buttonsEnabled = true;
      translate('en', 'hi', _text);
      print(output);
    });
  }

  /// Reads the whole document
  Future _readWholeDoc() async {
    if (_pdfDoc == null) {
      return;
    }
    setState(() {
      _buttonsEnabled = false;
    });

    String text = await _pdfDoc!.text;

    setState(() {
      _text = text;
      _buttonsEnabled = true;
    });
  }

  // Create pdf
  Future<void> _createPDF() async {
    if (_pdfDoc == null) {
      return;
    }
    setState(() {
      _buttonsEnabled = false;
    });

    String text = await _pdfDoc!.text;

    // PdfDocument document = PdfDocument();

    setState(() {
      _text = text;
      _buttonsEnabled = true;
    });

    translate('en', 'hi', _text);
    // print('Translate done');
    // final page = document.pages.add();
    // print(output);


    // final font = await rootBundle.load("asset/fonts/Hind-Regular.ttf");
    // final  dataint = font.buffer.asUint8List(font.offsetInBytes,font.lengthInBytes);
    // final  PdfFont  font1  =  PdfTrueTypeFont (dataint,12);
    // page.graphics
    //     .drawString(output, font1);

    // List<int> bytes = await document.save();
    // document.dispose();

    // saveAndLaunchFile(bytes, 'Output.pdf');
    // print('Translated pdf');
  }
}
