import 'package:flutter/material.dart';

class MakeAReccoTab extends StatefulWidget {
  @override
  _MakeAReccoTabState createState() => _MakeAReccoTabState();
}

class _MakeAReccoTabState extends State<MakeAReccoTab> {
  List<UserProfile> userProfiles = [
    UserProfile("User 1", "Genre 1"),
    UserProfile("User 2", "Genre 2"),
    // Add more user profiles here
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userProfiles.isEmpty
          ? Center(child: Text('No users available'))
          : _buildUserProfileCard(userProfiles[currentIndex]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (currentIndex < userProfiles.length - 1) {
              currentIndex++;
            } else {
              // Reset to the first user profile
              currentIndex = 0;
            }
          });
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

  Widget _buildUserProfileCard(UserProfile userProfile) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('User: ${userProfile.username}'),
            subtitle: Text('Favorite Genre: ${userProfile.favoriteGenre}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Swipe left logic
                    // Replace this with your specific logic
                    setState(() {
                      currentIndex++;
                    });
                  },
                  child: Text('Swipe Left'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Recommend music logic
                    // Replace this with your specific logic
                  },
                  child: Text('Recommend Music'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserProfile {
  final String username;
  final String favoriteGenre;

  UserProfile(this.username, this.favoriteGenre);
}
