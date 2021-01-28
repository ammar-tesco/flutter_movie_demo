import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/domain/MovieDomain.dart';

class MovieDetailScreen extends StatefulWidget {
  MovieDomain movie;

  MovieDetailScreen(this.movie);

  @override
  State<StatefulWidget> createState() {
    return MovieDetailScreenState(movie);
  }
}

class MovieDetailScreenState extends State<MovieDetailScreen> {
  MovieDomain movie;

  MovieDetailScreenState(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 400,
                    width: double.infinity,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          child: Hero(
                            tag: "img" + movie.id,
                            child: Image.network(
                              movie.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Hero(
                      tag: "title" + movie.id,
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          movie.title,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Text(movie.plot),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.grey.shade200,
                                      height: 50,
                                      width: 2,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ))),
                  SizedBox(height: 30),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
