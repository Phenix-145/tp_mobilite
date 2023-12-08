import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  final Map<String, dynamic> movieDetails;

  const MovieDetailsPage({Key? key, required this.movieDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Demo',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: screenWidth * 0.1,
                  right: screenWidth * 0.1,
                ),
                child: Text(
                  movieDetails['Title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Center(
                  child: Image.network(
                    movieDetails['Poster'],
                    width: 250.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              Container(
                margin: EdgeInsets.only(
                    left: screenWidth * 0.1,
                    right: screenWidth * 0.1,
                ),
                child: Text(
                  'Anne: ${movieDetails['Year']}',
                  style: const TextStyle(color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              const SizedBox(height: 2.5),
              Container(
                margin: EdgeInsets.only(
                  left: screenWidth * 0.1,
                  right: screenWidth * 0.1,
                ),
                child: Text(
                  'Genre: ${movieDetails['Genre']}',
                  style: const TextStyle(color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              const SizedBox(height: 2.5),
              Container(
                margin: EdgeInsets.only(
                  left: screenWidth * 0.1,
                  right: screenWidth * 0.1,
                ),
                child: Text(
                  'Realisateur: ${movieDetails['Director']}',
                  style: const TextStyle(color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              const SizedBox(height: 2.5),
              Container(
                margin: EdgeInsets.only(
                  left: screenWidth * 0.1,
                  right: screenWidth * 0.1,
                ),
                child: Text(
                  'Acteurs: ${movieDetails['Actors']}',
                  style: const TextStyle(color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Container(
                margin: EdgeInsets.only(
                  left: screenWidth * 0.1,
                  right: screenWidth * 0.1,
                ),
                child: Text(
                  'Intrigue: ${movieDetails['Plot']}',
                  style: const TextStyle(color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
