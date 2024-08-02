// home_page.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String artistName;
  late String artistImage;

  @override
  void initState() {
    super.initState();
    fetchRandomArtist();
  }

  Future<void> fetchRandomArtist() async {
    final String apiEndpoint = 'https://api.deezer.com/chart/0/artists';

    try {
      final response = await http.get(Uri.parse(apiEndpoint));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> artists = data['data'];

        final random = Random();
        final randomIndex = random.nextInt(artists.length);
        final randomArtist = artists[randomIndex];

        setState(() {
          artistName = randomArtist['name'];
          artistImage = randomArtist['picture_medium'];
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Recommended Artist:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              artistName,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            artistImage.isNotEmpty
                ? Image.network(
                    artistImage,
                    width: 200,
                    height: 200,
                  )
                : Container(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchRandomArtist,
              child: Text('Another Reco?'),
            ),
          ],
        ),
      ),
    );
  }
}
