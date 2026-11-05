

import 'package:flutter/material.dart';

void main() {
  runApp(
    // EX2(),
    // EX3()
    // EX4(),
    EX5(),
  );
}

class EX1 extends StatelessWidget {
  const  EX1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello my name is Lelouch!',
            style: TextStyle(color: Colors.orange, fontSize: 50),
          ),
        ),
      ),
    );
  }
}

class EX2 extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        padding: EdgeInsets.all(40),
        margin: EdgeInsets.all(50),
        color: Colors.lightBlue,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'CADT STUDENTS',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EX3 extends StatelessWidget {
  const new({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(45),
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Text(
                  'OOP',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Text(
                  'DART',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                //create a gradient color from blue300 to 600 from left to right
                gradient: LinearGradient(
                  colors: [Colors.blue[300]!, Colors.blue[600]!],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Text(
                  'FLUTTER',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EX4 extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          SizedBox(height: 100),
          Container(height: 400, color: Colors.blue),
          Row(
            children: [
              Expanded(
                child: Container(width: 100, height: 100, color: Colors.green),
              ),
              Container(width: 100, height: 100, color: Colors.pink),
            ],
          ),
          Row(
            children: [
              Expanded(child: Container(height: 100, color: Colors.yellow)),
              SizedBox(width: 20),
              Expanded(child: Container(height: 100, color: Colors.yellow)),
              SizedBox(width: 20),
              Expanded(child: Container(height: 100, color: Colors.yellow)),
            ],
          ),
          SizedBox(height: 20),
          Expanded(child: Container(color: Colors.pink)),
        ],
      ),
    );
  }
}

class EX5 extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:  Text('WelCome Home!'),
          centerTitle: true,
          backgroundColor: Colors.orange[800],
        ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'My hobbies',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),

                 SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 140,
                      height: 150,
                      decoration: BoxDecoration(
                        color:  Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child:  Center(
                        child: Text(
                          'Soccer',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 150,
                      decoration: BoxDecoration(
                        color:   Colors.brown,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child:  Center(
                        child: Text(
                          'Flutter',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
 
    
         
        ],
      ),
      bottomNavigationBar:  Container(
            height: 80,
            color:  Colors.orange[800],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
    )
    );
  }
}
