import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            FavoriteCard(),
            FavoriteCard(),
          ],
        ),
      ),
    ));

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
    bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
                // YOUR CODE
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  border: Border(
                    
                    bottom: BorderSide(width: 3.0, color: Colors.lightBlue.shade900),
                  )
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('titel'),
                          Text('description'),
                        ],
                      ),
                    ),
                    IconButton(
                   
                      color: isFavorite ? Colors.red : Colors.grey,
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                        }, icon: Icon(Icons.heart_broken), )
                  ],
                ),
                );
  }
}