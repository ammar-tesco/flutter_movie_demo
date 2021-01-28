import 'package:demo_flutter_app/model/domain/MovieDomain.dart';
import 'package:flutter/material.dart';

Widget comingSoonMovieWidget(MovieDomain movie, {Function onTap}) {
  return InkWell(
    onTap: () {
      if (onTap != null) {
        onTap();
      }
    },
    child: Container(
      height: 180,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
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
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: "title" + movie.id,
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            movie.title,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Text(
                        movie.genres,
                        style:
                            TextStyle(color: Color(0xFFC6C6C6), fontSize: 16),
                      ),
                      Text(
                        movie.year + " " + movie.releaseState,
                        style:
                            TextStyle(color: Color(0xFFC6C6C6), fontSize: 16),
                      ),
                      Spacer(),
                      Text(
                        movie.plot,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white60, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
