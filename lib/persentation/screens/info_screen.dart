import 'package:famous_people/app/app_colors.dart';
import 'package:famous_people/app/app_words.dart';
import 'package:famous_people/data/cupits/popular_cupit/popular_cupit_cubit.dart';
import 'package:famous_people/data/cupits/popular_info_cupit/popular_info_cupit_cubit.dart';
import 'package:famous_people/persentation/screens/image_previwe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoScreen extends StatefulWidget {
  int id;
  String name;
   InfoScreen({super.key, required this.id,required this.name});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  void initState() {
    PopularInfoCupitCubit.get(context).getPopularInfo(id: widget.id);
    PopularInfoCupitCubit.get(context).getPopularImages(id: widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularInfoCupitCubit, PopularInfoCupitState>(
  listener: (context, state) {
    state is PopularInfoCupitError?debugPrint("an eroor occure") : null;
  },
  builder: (context, state) {
    return state is PopularInfoCupitLoading||state is PopularImageCupitLoading?Center(
        child: CircularProgressIndicator(
        color: AppColors.mainColor,
    ),):
      Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title:  Text(
          AppWords.detailsAbout+" "+widget.name,
          style: TextStyle(color: AppColors.withColor),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.withColor),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2 - 40,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child:  Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Text(
                    "Name ${PopularInfoCupitCubit.get(context).popularInfoModel.name}",
                      style:
                          TextStyle(color: AppColors.withColor, fontSize: 20),
                    ),
                    Text(
                        "Birthday ${PopularInfoCupitCubit.get(context).popularInfoModel.birthday}",
                      style:
                          TextStyle(color: AppColors.withColor, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                          "Place Of Birth ${PopularInfoCupitCubit.get(context).popularInfoModel.placeOfBirth}",
                        style:
                            TextStyle(color: AppColors.withColor, fontSize: 20),
                      ),
                    ),
                    Text(
                        "Gender${PopularInfoCupitCubit.get(context).popularInfoModel.gender}",
                      style:
                          TextStyle(color: AppColors.withColor, fontSize: 20),
                    ),
                    Text(
                        "Imdb Id ${PopularInfoCupitCubit.get(context).popularInfoModel.imdbId}",
                      style:
                          TextStyle(color: AppColors.withColor, fontSize: 20),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2 - 50,
              child: ListView.separated(
                  itemBuilder: (context, i) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  ImagePreviwe(
                                    height:PopularInfoCupitCubit.get(context).imagesModel.profiles![i].height??100 ,
                                    width:PopularInfoCupitCubit.get(context).imagesModel.profiles![i].width??100 ,
                                    path:PopularInfoCupitCubit.get(context).imagesModel.profiles![i].filePath! ,
                                  )));
                        },
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500/"+PopularInfoCupitCubit.get(context).imagesModel.profiles![i].filePath!,
                          height: 250,
                          width: 250,
                        ));
                  },
                  separatorBuilder: (context, i) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                  itemCount: PopularInfoCupitCubit.get(context).imagesModel.profiles!.length),
            )
          ],
        ),
      ),
    );
  },
);
  }
}
