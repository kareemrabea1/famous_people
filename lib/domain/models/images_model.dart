class ImagesModel {
  ImagesModel({
      this.id, 
      this.profiles,});

  ImagesModel.fromJson(dynamic json) {
    id = json['id'];
    if (json['profiles'] != null) {
      profiles = [];
      json['profiles'].forEach((v) {
        profiles?.add(Profiles.fromJson(v));
      });
    }
  }
  num? id;
  List<Profiles>? profiles;
ImagesModel copyWith({  num? id,
  List<Profiles>? profiles,
}) => ImagesModel(  id: id ?? this.id,
  profiles: profiles ?? this.profiles,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (profiles != null) {
      map['profiles'] = profiles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Profiles {
  Profiles({
      this.aspectRatio, 
      this.height, 
      this.iso6391, 
      this.filePath, 
      this.voteAverage, 
      this.voteCount, 
      this.width,});

  Profiles.fromJson(dynamic json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    iso6391 = json['iso_639_1'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }
  num? aspectRatio;
  num? height;
  dynamic iso6391;
  String? filePath;
  num? voteAverage;
  num? voteCount;
  num? width;
Profiles copyWith({  num? aspectRatio,
  num? height,
  dynamic iso6391,
  String? filePath,
  num? voteAverage,
  num? voteCount,
  num? width,
}) => Profiles(  aspectRatio: aspectRatio ?? this.aspectRatio,
  height: height ?? this.height,
  iso6391: iso6391 ?? this.iso6391,
  filePath: filePath ?? this.filePath,
  voteAverage: voteAverage ?? this.voteAverage,
  voteCount: voteCount ?? this.voteCount,
  width: width ?? this.width,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['aspect_ratio'] = aspectRatio;
    map['height'] = height;
    map['iso_639_1'] = iso6391;
    map['file_path'] = filePath;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    map['width'] = width;
    return map;
  }

}