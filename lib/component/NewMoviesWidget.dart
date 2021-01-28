import 'package:demo_flutter_app/model/domain/MovieDomain.dart';
import 'package:flutter/material.dart';

Widget newMovieWidget(MovieDomain movie, {Function onTap}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 200,
                child: Hero(
                  tag: "img" + movie.id,
                  child: Material(
                    child: Image.network(
                      movie.imageUrl,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Hero(
          tag: "title" + movie.id,
          child: Material(
            color: Colors.transparent,
            child: Text(
              movie.title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        )
      ],
    ),
  );
}
