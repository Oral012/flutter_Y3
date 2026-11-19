import 'package:flutter/material.dart';

List<String> images = [
  "assets/ex3-assets/bird.jpg",
  "assets/ex3-assets/bird2.jpg",
  "assets/ex3-assets/insect.jpg",
  "assets/ex3-assets/girl.jpg",
  "assets/ex3-assets/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      home: IMAGES(),
    ));



class IMAGES extends StatefulWidget {
  const new({super.key});

  @override
  State<IMAGES> createState() => _IMAGESState();
}

class _IMAGESState extends State<IMAGES> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Text('Image viewer'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.navigate_before),
              tooltip: 'Go to the previous image',
              onPressed: ()  {
                setState(() {
                  index = index > 0? index - 1 : images.length-1; 
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
              child: IconButton(
                icon: const Icon(Icons.navigate_next),
                tooltip: 'Go to the next image',
                onPressed: () => {
                  setState(() {
                  index = index < images.length-1? index + 1 : 0; 
                })
                },
              ),
            ),
          ],
        ),
        body: Image.asset(images[index]),
      );
  }
}

