import 'dart:convert';
import 'dart:math';

import 'package:famous_people/domain/models/images_model.dart';
import 'package:famous_people/domain/models/popular_info_model.dart';
import 'package:famous_people/domain/models/popular_model.dart';
import 'package:http/http.dart' as http;
class PopularRequest{
static void getPopular({
  required Function(List<Results>?) onSuccsses,
  required Function(int statusCode) onError,})async{
  Map<String,String> headers={
    "Content-Type": "application/json"
  };
  await http.get(Uri.parse("https://api.themoviedb.org/3/person/popular?api_key=2dfe23358236069710a379edd4c65a6b"),
    headers: headers,
  ).then((response) {
    if(
    response.statusCode==200
    ){
      Map<String,dynamic> decoded={};
      decoded=json.decode(response.body);
      PopularModel popularModel=PopularModel.fromJson(decoded);
      onSuccsses(popularModel.results);
    }
    else{
      onError(response.statusCode);
    }

  });

}



static void getPopularInfo({
  required int id,
  required Function(PopularInfoModel) onSuccsses,
  required Function(int statusCode) onError,})async{
  Map<String,String> headers={
    "Content-Type": "application/json"
  };
  await http.get(Uri.parse("https://api.themoviedb.org/3/person/$id?api_key=2dfe23358236069710a379edd4c65a6b"),
    headers: headers,
  ).then((response) {
    if(
    response.statusCode==200
    ){
      Map<String,dynamic> decoded={};
      decoded=json.decode(response.body);
      PopularInfoModel  popularInfoModel=PopularInfoModel.fromJson(decoded);
      onSuccsses(popularInfoModel);
    }
    else{
      onError(response.statusCode);
    }

  });

}




static void getPopularImages({
  required int id,
  required Function(ImagesModel) onSuccsses,
  required Function(int statusCode) onError,
})async{
  Map<String,String> headers={
    "Content-Type": "application/json"
  };
  await http.get(Uri.parse("https://api.themoviedb.org/3/person/$id/images?api_key=2dfe23358236069710a379edd4c65a6b"),
    headers: headers,
  ).then((response) {
    if(
    response.statusCode==200
    ){
      Map<String,dynamic> decoded={};
      decoded=json.decode(response.body);
      ImagesModel  imagesModel=ImagesModel.fromJson(decoded);
      onSuccsses(imagesModel);
    }
    else{
      onError(response.statusCode);
    }

  });

}
}