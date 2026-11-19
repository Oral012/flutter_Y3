import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
          child: Column(
            spacing: 20,
            children: [
              BoxButton(),
              BoxButton(),
                BoxButton(),
                  
            ],
          ),
        ),
      ),
    ));

class BoxButton extends StatefulWidget {
  const BoxButton({super.key});

  @override
  State<BoxButton> createState() => _BoxButtonState();
}

class _BoxButtonState extends State<BoxButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                width: 400,
                height: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: isSelected? Colors.blue[500] : Colors.blue[50]),
                    onPressed: ()  {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    child:  isSelected? Text( "Selected ", style:TextStyle(color:Colors.white )) 
                                      : Text( "Not Selected ", style:TextStyle(color: Colors.black))),
              );
  }
}