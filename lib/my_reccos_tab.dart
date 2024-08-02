import 'package:flutter/material.dart';

class MyReccosTab extends StatefulWidget {
  @override
  _MyReccosTabState createState() => _MyReccosTabState();
}

class _MyReccosTabState extends State<MyReccosTab> {
  List<Recco> myReccos = [
    Recco("User 1", "Song 1", 3),
    Recco("User 2", "Song 2", 5),
    // Add more reccos here
  ];

  int userCredits = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: myReccos.length,
        itemBuilder: (context, index) {
          Recco recco = myReccos[index];
          return ListTile(
            title: Text('${recco.user}: ${recco.song}'),
            subtitle: Text('Rating: ${recco.rating}'),
            onTap: () {
              if (recco.isLocked && userCredits < 1) {
                // Prompt user to make a recco to unlock
                // Replace this with your specific logic
              } else if (recco.isLocked) {
                // Deduct one credit and unlock
                setState(() {
                  userCredits--;
                  recco.isLocked = false;
                });
              }
              // Show recco details, e.g., rating and chat options
              // Replace this with your specific logic
            },
          );
        },
      ),
    );
  }
}

class Recco {
  final String user;
  final String song;
  final int rating;
  bool isLocked;

  Recco(this.user, this.song, this.rating, {this.isLocked = true});
}
