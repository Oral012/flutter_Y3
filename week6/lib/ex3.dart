import 'package:flutter/material.dart';
enum Product{
  dart(
    image: 'ex3/dart.png',
    title: 'Dart',
    description: 'the best object language'
  ),
  flutter(
    image: 'ex3/flutter.png',
    title: 'Flutter',
    description: 'the best mobile widget library'
  ),
  firebase(
    image: 'ex3/firebase.png',
    title: 'Firebase',
    description: 'the best cloud database'
  );
  final String image;
  final String title;
  final String description;
  Product({ required this.image, required this.title, required this.description});
}
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(title: Text('Custom Button', style: TextStyle( fontSize: 28, fontWeight: FontWeight.bold),),),
      body: Padding(
        padding: EdgeInsetsGeometry.all(40),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyCard(image: Product.dart.image, title: Product.dart.title, description: Product.dart.description),
              SizedBox(height: 10,),
              MyCard(image: Product.flutter.image, title: Product.flutter.title, description: Product.flutter.description),
              SizedBox(height: 10,),
              MyCard(image: Product.firebase.image, title: Product.firebase.title, description: Product.firebase.description),
             

            ],
        ),
      ),
    ),
  ));
}

class MyCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const MyCard({super.key, required this.image, required this.title, required this.description});
  
  // final Product product;
  @override
  Widget build(BuildContext context) {
             
    return  Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image, width: 60, height: 60),
            
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(title, style:TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(description),
            ),
            // const SizedBox(height: 10),
            // Text(title, style: const TextStyle(fontSize: 25)),
            // const SizedBox(height: 4),
            // Text(description, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

