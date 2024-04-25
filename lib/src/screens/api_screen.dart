import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RickAndMortyScreen extends StatefulWidget {
  @override
  _RickAndMortyScreenState createState() => _RickAndMortyScreenState();
}

class _RickAndMortyScreenState extends State<RickAndMortyScreen> {
  Future<List<Map<String, dynamic>>> fetchCharacters() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));

    if (response.statusCode == 200) {
      List<dynamic> characters = json.decode(response.body)['results'];
      return characters.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load characters');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty API'),
      ),
      body: FutureBuilder(
        future: fetchCharacters(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Map<String, dynamic>> characters =
                snapshot.data as List<Map<String, dynamic>>;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> character = characters[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(character['image']),
                    title: Text(character['name']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Especie: ${character['species']}'),
                        Text('Género: ${character['gender']}'),
                        Text('Origen: ${character['origin']['name']}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
