import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List movies = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovies();
  }
  getMovies() async {
    Uri _uri = Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=a1c50a4be7ed8195db574e9771b2e9fb");
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> myMap = json.decode(response.body);
      movies = myMap["results"];
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
           ListView.builder(
             shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index ){
                return Container(
                  width: double.infinity,
                  height: height*0.7,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                      image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500${movies[index]["poster_path"]}",
                      ),
                    ),
                  ),
                );
              }
           ),
          ],
        ),
      ),
    );
  }
}
