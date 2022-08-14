import 'package:flutter/material.dart';
import 'package:multi_lang_translator/pages/speech.dart';
import 'package:multi_lang_translator/pages/text_converter.dart';

class InputSelector extends StatefulWidget {
  const InputSelector({ Key? key }) : super(key: key);

  @override
  State<InputSelector> createState() => _InputSelectorState();
}

class _InputSelectorState extends State<InputSelector> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anuvadak'),
      ),
      body: Center(
       child: Column (
         
         children: <Widget>[ 
          Padding(
          padding:EdgeInsets.only(top:50),
           
            child: Column (children:<Widget>[  
               Stack(
  children: <Widget>[
    // Stroked text as border.
    Text(
      'Input Selector!',
      style: TextStyle(
        fontSize: 40,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 6
          ..color = Colors.red[700]!,
      ),
    ),
    // Solid text as fill.
    Text(
      'Input Selector!',
      style: TextStyle(
        fontSize: 40,
        color: Colors.pink[100],
      ),
    ),
  ],
),  
              SizedBox(height: 30),
              Row(
             mainAxisAlignment:MainAxisAlignment.center,
           children:<Widget>[
             
             ElevatedButton(
         child:Text('Text'),
           style: ElevatedButton.styleFrom(
       primary: Colors.redAccent, //background color of button
       side: BorderSide(width:1, color:Colors.brown), //border width and color
       elevation: 3, //elevation of button
       shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(25)
                  ),
              fixedSize: const Size(110, 100), //width and height
        padding: EdgeInsets.all(20) //content padding inside button
   ),
               
               
         onPressed:() => Navigator.push(context, 
         MaterialPageRoute(builder: (context) => Text_Converter())),
         
       ),
       SizedBox(width: 20),          
       ElevatedButton(
         child:Text('Speech'),
         style: ElevatedButton.styleFrom(
       primary: Colors.redAccent, //background color of button
       side: BorderSide(width:1,  color:Colors.brown), //border width and color
       elevation: 50, //elevation of button
       shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(25)
                  ),
         fixedSize: const Size(110, 100),
        padding: EdgeInsets.all(20) //content padding inside button
   ),
         onPressed:() => Navigator.push(context, 
         MaterialPageRoute(builder: (context) => SpeechText())),
         
       ),
             
           ]
           ), //row
              SizedBox(height: 40), // space between rows
                  Row(
             mainAxisAlignment:MainAxisAlignment.center,
           children:<Widget>[
              
             ElevatedButton(
              
           child:Text('Pdf'),
           style: ElevatedButton.styleFrom(
           primary: Colors.redAccent, //background color of button
           side: BorderSide(width:1, color:Colors.brown), //border width and color
           elevation: 3, //elevation of button
           shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(25)
                  ),
           fixedSize: const Size(110, 100),
           padding: EdgeInsets.all(20) //content padding inside button
   ),
               
               
         onPressed:(){},
         
       ),
          SizedBox(width: 20),            
       ElevatedButton(
         child:Text('Image'),
         style: ElevatedButton.styleFrom(
       primary: Colors.redAccent, //background color of button
       side: BorderSide(width:1,  color:Colors.brown), //border width and color
       elevation: 50, //elevation of button
       shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(25)
                  ),
         fixedSize: const Size(110, 100),
        padding: EdgeInsets.all(20) //content padding inside button
   ),
         onPressed:(){},
         
       ),
             
           ]
           ) //row
             ],
                   ),
            
            
          )//padding
            ], //widget[]
         
         
        
       ), //column 
      ), //center
    ); //scaffold
      
  }
}