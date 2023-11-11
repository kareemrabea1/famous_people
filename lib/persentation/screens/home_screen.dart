import 'package:famous_people/app/app_colors.dart';
import 'package:famous_people/app/app_words.dart';
import 'package:famous_people/data/cupits/popular_cupit/popular_cupit_cubit.dart';
import 'package:famous_people/persentation/component/home_screen_card.dart';
import 'package:famous_people/persentation/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    PopularCupitCubit.get(context).getPopular();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text(
          AppWords.popularList,
          style: TextStyle(color: AppColors.withColor),
        ),
      ),
      body: BlocConsumer<PopularCupitCubit, PopularCupitState>(
        listener: (context, state) {
          state is PopularCupitEroor ? debugPrint("an eroor occure") : null;
        },
        builder: (context, state) {
          return state is PopularCupitLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.mainColor,
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 16, right: 16),
                  child: ListView.separated(
                      itemBuilder: (context, i) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  InfoScreen(id:int.parse(PopularCupitCubit.get(context).popularList[i].id.toString()),name:PopularCupitCubit.get(context).popularList[i].name??"" , )));
                            },
                            child: HomeScreenCard(name: PopularCupitCubit.get(context).popularList[i].name ?? "No Name",
                            ));
                      },
                      separatorBuilder: (context, i) {
                        return const SizedBox(
                          height: 16,
                        );
                      },
                      itemCount:
                          PopularCupitCubit.get(context).popularList.length),
                );
        },
      ),
    );
  }
}
