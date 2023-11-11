import 'package:bloc/bloc.dart';
import 'package:famous_people/data/requests/popular_request.dart';
import 'package:famous_people/domain/models/popular_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'popular_cupit_state.dart';

class PopularCupitCubit extends Cubit<PopularCupitState> {
  PopularCupitCubit() : super(PopularCupitInitial());
  static PopularCupitCubit get (context) => BlocProvider.of(context);
  List<Results> popularList=[];
  getPopular(){
    emit(PopularCupitLoading());
    PopularRequest.getPopular(onSuccsses: (res){
      popularList=res!;
      emit(PopularCupitDone());
    },
         onError: (
             statusCode
             ){
      emit(PopularCupitEroor());
         },
    );
  }
}
