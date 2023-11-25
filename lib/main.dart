import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'infofilm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo JSON API FROM OMDB'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];
  String apiKey = 'de6c2959';

  Future<void> _searchMovies() async {
    final String searchTerm = _searchController.text;

    final response = await http.get(
        Uri.parse('http://www.omdbapi.com/?t=$searchTerm&apikey=$apiKey'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        _searchResults = data['Search'];
      });
    } else {
      print('Erreur de recherche');
    }
  }

  Future<void> _showMovieDetails(String imdbID) async {

    final response = await http.get(
        Uri.parse('http://www.omdbapi.com/?i=$imdbID&apikey=$apiKey'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MovieDetailsPage(movieDetails: data),
        ),
      );
    } else {
      print('Erreur de récupération des détails du film');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: const Color(0xFF050505),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 25.0),
            child: Text(
              'Choisir un nom de film',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Entrez le nom du film',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _searchMovies,
            child: const Text('Rechercher'),
          ),
          const SizedBox(height: 16.0),
          // Affiche les résultats de la recherche
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: GestureDetector(
                    onTap: () {
                      _showMovieDetails(_searchResults[index]['imdbID']);
                    },
                  child: Container(
                    color: index % 2 == 0 ? const Color(0xFF000000) : const Color(0xFF111111), // Alterne les couleurs de fond
                    child: Padding(
                    padding: const EdgeInsets.all(10.0),
                        child: Text(
                          _searchResults[index]['Title'],
                          style: const TextStyle(
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ),
                  ),
                ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}