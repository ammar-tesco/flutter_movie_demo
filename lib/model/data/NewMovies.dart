/// items : [{"id":"tt11169050","title":"Supernova","fullTitle":"Supernova (2020)","year":"2020","releaseState":"Opening This Week - January 29","image":"https://imdb-api.com/images/original/MV5BNDc0Y2FjZjgtOWNkYy00NjdjLWE3ZjYtZGYyNDdmYzZiZGYzXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_Ratio0.6699_AL_.jpg","runtimeMins":"93","runtimeStr":"1h 33mins","plot":"Sam and Tusker are traveling across England in their old RV to visit friends, family and places from their past. Since Tusker was diagnosed with dementia two years ago, their time together is the most important thing they have.","contentRating":"R","imDbRating":"","imDbRatingCount":"","metacriticRating":"68","genres":"Drama, Romance","genreList":[{"key":"Drama","value":"Drama"},{"key":"Romance","value":"Romance"}],"directors":"Harry Macqueen","directorList":[{"id":"nm2982240","name":"Harry Macqueen"}],"stars":"Colin Firth, Stanley Tucci, Pippa Haywood, Peter MacQueen","starList":[{"id":"nm0000147","name":"Colin Firth"},{"id":"nm0001804","name":"Stanley Tucci"},{"id":"nm0371846","name":"Pippa Haywood"},{"id":"nm0534267","name":"Peter MacQueen"}]},{"id":"tt8760280","title":"Finding You","fullTitle":"Finding You (2021)","year":"2021","releaseState":"Opening This Week - January 29","image":"https://imdb-api.com/images/original/MV5BZTYzMTZiZjgtYTk4My00NTg0LWFiYjgtODIxOWExNDE5Y2ZiXkEyXkFqcGdeQXVyNjczNDM0NzM@._V1_Ratio0.6699_AL_.jpg","runtimeMins":"","runtimeStr":"","plot":"Finley, a talented aspiring violinist, meets Beckett, a famous young movie star, on the way to her college semester abroad program in a small coastal village in Ireland. An unexpected romance emerges as the heartthrob Beckett leads the uptight Finley on an adventurous reawakening, and she emboldens him to take charge of his future, until the pressures of his stardom get in the way.","contentRating":"PG","imDbRating":"","imDbRatingCount":"","metacriticRating":"","genres":"Drama, Romance","genreList":[{"key":"Drama","value":"Drama"},{"key":"Romance","value":"Romance"}],"directors":"Brian Baugh","directorList":[{"id":"nm0061982","name":"Brian Baugh"}],"stars":"Katherine McNamara, Saoirse-Monica Jackson, Vanessa Redgrave, Tom Everett Scott","starList":[{"id":"nm3031063","name":"Katherine McNamara"},{"id":"nm8090765","name":"Saoirse-Monica Jackson"},{"id":"nm0000603","name":"Vanessa Redgrave"},{"id":"nm0779866","name":"Tom Everett Scott"}]},{"id":"tt10016180","title":"The Little Things","fullTitle":"The Little Things (2021)","year":"2021","releaseState":"Opening This Week - January 29","image":"https://imdb-api.com/images/original/MV5BOGFlNTdmYWQtM2IzMi00YTY3LTlmMDQtZDI5NGQ5MjYzZmEwXkEyXkFqcGdeQXVyNjY1MTg4Mzc@._V1_Ratio0.6699_AL_.jpg","runtimeMins":"127","runtimeStr":"2h 7mins","plot":"Two cops track down a serial killer.","contentRating":"R","imDbRating":"","imDbRatingCount":"","metacriticRating":"","genres":"Crime, Drama, Thriller","genreList":[{"key":"Crime","value":"Crime"},{"key":"Drama","value":"Drama"},{"key":"Thriller","value":"Thriller"}],"directors":"John Lee Hancock","directorList":[{"id":"nm0359387","name":"John Lee Hancock"}],"stars":"Denzel Washington, Rami Malek, Jared Leto, Chris Bauer","starList":[{"id":"nm0000243","name":"Denzel Washington"},{"id":"nm1785339","name":"Rami Malek"},{"id":"nm0001467","name":"Jared Leto"},{"id":"nm0061777","name":"Chris Bauer"}]},{"id":"tt8102806","title":"The Night","fullTitle":"The Night (2020)","year":"2020","releaseState":"Opening This Week - January 29","image":"https://imdb-api.com/images/original/MV5BN2M3NGY2NmItYjVmMC00NmE1LWIxZDctMTllNTgzYTA5YjQwXkEyXkFqcGdeQXVyMTE1MzI2NzIz._V1_Ratio0.6699_AL_.jpg","runtimeMins":"105","runtimeStr":"1h 45mins","plot":"An Iranian couple living in the US become trapped inside a hotel when insidious events force them to face the secrets that have come between them, in a night that never ends.","contentRating":"","imDbRating":"","imDbRatingCount":"","metacriticRating":"","genres":"Horror, Mystery, Thriller","genreList":[{"key":"Horror","value":"Horror"},{"key":"Mystery","value":"Mystery"},{"key":"Thriller","value":"Thriller"}],"directors":"Kourosh Ahari","directorList":[{"id":"nm6422804","name":"Kourosh Ahari"}],"stars":"Shahab Hosseini, Niousha Noor, George Maguire, Michael Graham","starList":[{"id":"nm1486911","name":"Shahab Hosseini"},{"id":"nm2873130","name":"Niousha Noor"},{"id":"nm0536574","name":"George Maguire"},{"id":"nm5227612","name":"Michael Graham"}]}]
/// errorMessage : ""

class NewMovie {
  List<Items> _items;
  String _errorMessage;

  List<Items> get items => _items;
  String get errorMessage => _errorMessage;

  NewMovie({
      List<Items> items, 
      String errorMessage}){
    _items = items;
    _errorMessage = errorMessage;
}

  NewMovie.fromJson(dynamic json) {
    if (json["items"] != null) {
      _items = [];
      json["items"].forEach((v) {
        _items.add(Items.fromJson(v));
      });
    }
    _errorMessage = json["errorMessage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_items != null) {
      map["items"] = _items.map((v) => v.toJson()).toList();
    }
    map["errorMessage"] = _errorMessage;
    return map;
  }

}

/// id : "tt11169050"
/// title : "Supernova"
/// fullTitle : "Supernova (2020)"
/// year : "2020"
/// releaseState : "Opening This Week - January 29"
/// image : "https://imdb-api.com/images/original/MV5BNDc0Y2FjZjgtOWNkYy00NjdjLWE3ZjYtZGYyNDdmYzZiZGYzXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_Ratio0.6699_AL_.jpg"
/// runtimeMins : "93"
/// runtimeStr : "1h 33mins"
/// plot : "Sam and Tusker are traveling across England in their old RV to visit friends, family and places from their past. Since Tusker was diagnosed with dementia two years ago, their time together is the most important thing they have."
/// contentRating : "R"
/// imDbRating : ""
/// imDbRatingCount : ""
/// metacriticRating : "68"
/// genres : "Drama, Romance"
/// genreList : [{"key":"Drama","value":"Drama"},{"key":"Romance","value":"Romance"}]
/// directors : "Harry Macqueen"
/// directorList : [{"id":"nm2982240","name":"Harry Macqueen"}]
/// stars : "Colin Firth, Stanley Tucci, Pippa Haywood, Peter MacQueen"
/// starList : [{"id":"nm0000147","name":"Colin Firth"},{"id":"nm0001804","name":"Stanley Tucci"},{"id":"nm0371846","name":"Pippa Haywood"},{"id":"nm0534267","name":"Peter MacQueen"}]

class Items {
  String _id;
  String _title;
  String _fullTitle;
  String _year;
  String _releaseState;
  String _image;
  String _runtimeMins;
  String _runtimeStr;
  String _plot;
  String _contentRating;
  String _imDbRating;
  String _imDbRatingCount;
  String _metacriticRating;
  String _genres;
  List<GenreList> _genreList;
  String _directors;
  List<DirectorList> _directorList;
  String _stars;
  List<StarList> _starList;

  String get id => _id;
  String get title => _title;
  String get fullTitle => _fullTitle;
  String get year => _year;
  String get releaseState => _releaseState;
  String get image => _image;
  String get runtimeMins => _runtimeMins;
  String get runtimeStr => _runtimeStr;
  String get plot => _plot;
  String get contentRating => _contentRating;
  String get imDbRating => _imDbRating;
  String get imDbRatingCount => _imDbRatingCount;
  String get metacriticRating => _metacriticRating;
  String get genres => _genres;
  List<GenreList> get genreList => _genreList;
  String get directors => _directors;
  List<DirectorList> get directorList => _directorList;
  String get stars => _stars;
  List<StarList> get starList => _starList;

  Items({
      String id, 
      String title, 
      String fullTitle, 
      String year, 
      String releaseState, 
      String image, 
      String runtimeMins, 
      String runtimeStr, 
      String plot, 
      String contentRating, 
      String imDbRating, 
      String imDbRatingCount, 
      String metacriticRating, 
      String genres, 
      List<GenreList> genreList, 
      String directors, 
      List<DirectorList> directorList, 
      String stars, 
      List<StarList> starList}){
    _id = id;
    _title = title;
    _fullTitle = fullTitle;
    _year = year;
    _releaseState = releaseState;
    _image = image;
    _runtimeMins = runtimeMins;
    _runtimeStr = runtimeStr;
    _plot = plot;
    _contentRating = contentRating;
    _imDbRating = imDbRating;
    _imDbRatingCount = imDbRatingCount;
    _metacriticRating = metacriticRating;
    _genres = genres;
    _genreList = genreList;
    _directors = directors;
    _directorList = directorList;
    _stars = stars;
    _starList = starList;
}

  Items.fromJson(dynamic json) {
    _id = json["id"];
    _title = json["title"];
    _fullTitle = json["fullTitle"];
    _year = json["year"];
    _releaseState = json["releaseState"];
    _image = json["image"];
    _runtimeMins = json["runtimeMins"];
    _runtimeStr = json["runtimeStr"];
    _plot = json["plot"];
    _contentRating = json["contentRating"];
    _imDbRating = json["imDbRating"];
    _imDbRatingCount = json["imDbRatingCount"];
    _metacriticRating = json["metacriticRating"];
    _genres = json["genres"];
    if (json["genreList"] != null) {
      _genreList = [];
      json["genreList"].forEach((v) {
        _genreList.add(GenreList.fromJson(v));
      });
    }
    _directors = json["directors"];
    if (json["directorList"] != null) {
      _directorList = [];
      json["directorList"].forEach((v) {
        _directorList.add(DirectorList.fromJson(v));
      });
    }
    _stars = json["stars"];
    if (json["starList"] != null) {
      _starList = [];
      json["starList"].forEach((v) {
        _starList.add(StarList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["title"] = _title;
    map["fullTitle"] = _fullTitle;
    map["year"] = _year;
    map["releaseState"] = _releaseState;
    map["image"] = _image;
    map["runtimeMins"] = _runtimeMins;
    map["runtimeStr"] = _runtimeStr;
    map["plot"] = _plot;
    map["contentRating"] = _contentRating;
    map["imDbRating"] = _imDbRating;
    map["imDbRatingCount"] = _imDbRatingCount;
    map["metacriticRating"] = _metacriticRating;
    map["genres"] = _genres;
    if (_genreList != null) {
      map["genreList"] = _genreList.map((v) => v.toJson()).toList();
    }
    map["directors"] = _directors;
    if (_directorList != null) {
      map["directorList"] = _directorList.map((v) => v.toJson()).toList();
    }
    map["stars"] = _stars;
    if (_starList != null) {
      map["starList"] = _starList.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "nm0000147"
/// name : "Colin Firth"

class StarList {
  String _id;
  String _name;

  String get id => _id;
  String get name => _name;

  StarList({
      String id, 
      String name}){
    _id = id;
    _name = name;
}

  StarList.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    return map;
  }

}

/// id : "nm2982240"
/// name : "Harry Macqueen"

class DirectorList {
  String _id;
  String _name;

  String get id => _id;
  String get name => _name;

  DirectorList({
      String id, 
      String name}){
    _id = id;
    _name = name;
}

  DirectorList.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    return map;
  }

}

/// key : "Drama"
/// value : "Drama"

class GenreList {
  String _key;
  String _value;

  String get key => _key;
  String get value => _value;

  GenreList({
      String key, 
      String value}){
    _key = key;
    _value = value;
}

  GenreList.fromJson(dynamic json) {
    _key = json["key"];
    _value = json["value"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["key"] = _key;
    map["value"] = _value;
    return map;
  }

}