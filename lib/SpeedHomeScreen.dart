import 'package:demo_flutter_app/component/ComingSoonWidget.dart';
import 'package:demo_flutter_app/model/data/NewMovies.dart';
import 'package:flutter/material.dart';

import 'MovieDetailScreen.dart';
import 'api/ImdbApi.dart';
import 'component/NewMoviesWidget.dart';
import 'model/domain/MovieDomain.dart';

class SpeedHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SpeedHomeScreenState();
  }
}

class SpeedHomeScreenState extends State<SpeedHomeScreen> {
  List<MovieDomain> newMovieList;
  List<MovieDomain> comingSoonMovieList;

  @override
  void initState() {
    super.initState();
    loadNewMovies();
    loadComingSoon();
  }

  void loadNewMovies() async {
    var newMovie = await ImdbApi().getNewMovie();

    var newMovieList = newMovie.items
        .map((movie) => MovieDomain(
            movie.id,
            movie.title,
            movie.image,
            movie.genres,
            movie.runtimeStr,
            movie.plot,
            movie.releaseState,
            movie.year))
        .toList();


    setState(() {
      this.newMovieList = newMovieList;
    });
  }

  void loadComingSoon() async {
    var comingSoonMovies = await ImdbApi().getComingSoon();

    var comingSoonMoviesList = comingSoonMovies.items
        .map((movie) => MovieDomain(
            movie.id,
            movie.title,
            movie.image,
            movie.genres,
            movie.runtimeStr,
            movie.plot,
            movie.releaseState,
            movie.year))
        .take(5)
        .toList();

    setState(() {
      this.comingSoonMovieList = comingSoonMoviesList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        drawer: Drawer(
          child: Container(
            color: Colors.grey,
            child: SafeArea(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headline("Drawer"),
                headline("Drawer"),
                headline("Drawer"),
                headline("Drawer"),
                headline("Drawer"),
                headline("Drawer"),
              ],
            )),
          ),
        ),
        backgroundColor: Color(0xFF646464),
        appBar: AppBar(elevation: 0, backgroundColor: Color(0xFF646464)),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headline("New Movies"),
              newMovieList != null
                  ? Container(
                      height: 250,
                      child: ListView.builder(
                          itemCount: newMovieList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return newMovieWidget(newMovieList[index],
                                onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MovieDetailScreen(
                                          newMovieList[index])));
                            });
                          }),
                    )
                  : Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
              headline("Coming Soon"),
              comingSoonMovieList != null
                  ? Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: comingSoonMovieList.length,
                          itemBuilder: (context, index) {
                            return comingSoonMovieWidget(
                                comingSoonMovieList[index], onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MovieDetailScreen(
                                          comingSoonMovieList[index])));
                            });
                          }),
                    )
                  : Container()
            ],
          )),
        ),
      ),
    );
  }

  Column poster() {
    return Column(
      children: [
        Image.asset("assets/cover.jpg"),
        Text(
          "Title",
          style: TextStyle(color: Colors.white, fontSize: 20),
        )
      ],
    );
  }

  Padding headline(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
