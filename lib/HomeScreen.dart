import 'package:demo_flutter_app/MovieDetailScreen.dart';
import 'package:demo_flutter_app/api/ImdbApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'component/ComingSoonWidget.dart';
import 'component/HeadLineWidget.dart';
import 'component/NewMoviesWidget.dart';
import 'model/domain/MovieDomain.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(
      backgroundColor: Color(0xFF2d3477),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF2d3477),
        leading: Icon(Icons.menu_open),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            child: Column(
              children: [
                headline("New Movies"),
                newMovieList != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          height: 250,
                          child: ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              scrollDirection: Axis.horizontal,
                              itemCount: newMovieList.length,
                              itemBuilder: (context, index) {
                                return newMovieWidget(newMovieList[index],
                                    onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MovieDetailScreen(
                                                  newMovieList[index])));
                                });
                              }),
                        ),
                      )
                    : Container(
                        height: 250,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                headline("Coming Soon"),
                comingSoonMovieList != null
                    ? Column(
                        children: [
                          Container(
                            child: ListView.builder(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: comingSoonMovieList.length,
                                itemBuilder: (context, index) {
                                  return comingSoonMovieWidget(
                                      comingSoonMovieList[index]);
                                }),
                          ),
                          Text(
                            "View All",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
