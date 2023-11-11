import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:famous_people/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver_v3/image_gallery_saver.dart';

class ImagePreviwe extends StatelessWidget {
  String path;
  num height,width;
   ImagePreviwe({super.key,required this.path,required this.height,required this.width});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        iconTheme: const IconThemeData(color: AppColors.withColor),
        actions: [
          IconButton(
              onPressed: () {
                _save() async {
                  var response = await Dio().get(
                      "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg",
                      options: Options(responseType: ResponseType.bytes));
                  final result = await ImageGallerySaver.saveImage(
                      Uint8List.fromList(response.data),
                      quality: 60,
                      name: "hello");
                  print(result);
                }
              },
              icon: const Icon(
                Icons.download,
                color: AppColors.withColor,
              ))
        ],
      ),
      body: ListView(
        children: [
          Image.network(
            "https://image.tmdb.org/t/p/w500/"+path,

            height: double.parse(height.toString()),
            width: double.parse(width.toString()),
          )
        ],
      ),
    );
  }
}
