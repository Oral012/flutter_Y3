import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(title: Text('My Hobbies', style: TextStyle( fontSize: 28, fontWeight: FontWeight.bold),),),
      body: Padding(
        padding: EdgeInsetsGeometry.all(40),
        child: Column(
          children: [
            HobbyCard(hobby: 'Do sth ', icon: Icons.search),
            SizedBox(height: 10,),
            HobbyCard(hobby: 'Skating', icon: Icons.skateboarding)
          ],
        ),
      ),
    ),
  ));
}

class HobbyCard extends StatelessWidget {
  final String hobby;
  final IconData icon;
  final Color color;
  const HobbyCard({super.key, required this.hobby, required this.icon, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.all( 30)
                    ),
                    Icon(icon),
                    SizedBox(width: 20,),
                    Text(hobby, style: TextStyle(),)
                  ],
                ),
              ),
            );
  }
}

class EX2 extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}