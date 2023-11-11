class PopularInfoModel {
  PopularInfoModel({
      this.adult, 
      this.alsoKnownAs, 
      this.biography, 
      this.birthday, 
      this.deathday, 
      this.gender, 
      this.homepage, 
      this.id, 
      this.imdbId, 
      this.knownForDepartment, 
      this.name, 
      this.placeOfBirth, 
      this.popularity, 
      this.profilePath,});

  PopularInfoModel.fromJson(dynamic json) {
    adult = json['adult'];
    alsoKnownAs = json['also_known_as'] != null ? json['also_known_as'].cast<String>() : [];
    biography = json['biography'];
    birthday = json['birthday'];
    deathday = json['deathday'];
    gender = json['gender'];
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    placeOfBirth = json['place_of_birth'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
  }
  bool? adult;
  List<String>? alsoKnownAs;
  String? biography;
  String? birthday;
  dynamic deathday;
  num? gender;
  dynamic homepage;
  num? id;
  String? imdbId;
  String? knownForDepartment;
  String? name;
  String? placeOfBirth;
  num? popularity;
  String? profilePath;
PopularInfoModel copyWith({  bool? adult,
  List<String>? alsoKnownAs,
  String? biography,
  String? birthday,
  dynamic deathday,
  num? gender,
  dynamic homepage,
  num? id,
  String? imdbId,
  String? knownForDepartment,
  String? name,
  String? placeOfBirth,
  num? popularity,
  String? profilePath,
}) => PopularInfoModel(  adult: adult ?? this.adult,
  alsoKnownAs: alsoKnownAs ?? this.alsoKnownAs,
  biography: biography ?? this.biography,
  birthday: birthday ?? this.birthday,
  deathday: deathday ?? this.deathday,
  gender: gender ?? this.gender,
  homepage: homepage ?? this.homepage,
  id: id ?? this.id,
  imdbId: imdbId ?? this.imdbId,
  knownForDepartment: knownForDepartment ?? this.knownForDepartment,
  name: name ?? this.name,
  placeOfBirth: placeOfBirth ?? this.placeOfBirth,
  popularity: popularity ?? this.popularity,
  profilePath: profilePath ?? this.profilePath,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['also_known_as'] = alsoKnownAs;
    map['biography'] = biography;
    map['birthday'] = birthday;
    map['deathday'] = deathday;
    map['gender'] = gender;
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['known_for_department'] = knownForDepartment;
    map['name'] = name;
    map['place_of_birth'] = placeOfBirth;
    map['popularity'] = popularity;
    map['profile_path'] = profilePath;
    return map;
  }

}