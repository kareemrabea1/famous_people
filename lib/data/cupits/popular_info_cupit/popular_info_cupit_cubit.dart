import 'package:bloc/bloc.dart';
import 'package:famous_people/data/requests/popular_request.dart';
import 'package:famous_people/domain/models/images_model.dart';
import 'package:famous_people/domain/models/popular_info_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'popular_info_cupit_state.dart';

class PopularInfoCupitCubit extends Cubit<PopularInfoCupitState> {
  PopularInfoCupitCubit() : super(PopularInfoCupitInitial());
  static PopularInfoCupitCubit get (context) => BlocProvider.of(context);
  PopularInfoModel popularInfoModel=PopularInfoModel();
  ImagesModel imagesModel=ImagesModel();

  getPopularInfo({required int id}){
    emit(PopularInfoCupitLoading());
    PopularRequest.getPopularInfo(id: id,
        onSuccsses: (res){
          popularInfoModel=res;
          emit(PopularInfoCupitDone());

        },
        onError: (statusCode){
      emit(PopularInfoCupitDone());
        });
  }
  getPopularImages({required int id}){
    emit(PopularImageCupitLoading());
    PopularRequest.getPopularImages(id: id,
        onSuccsses: (res){
          imagesModel=res;
          emit(PopularImageCupitDone());

        },
        onError: (statusCode){
      emit(PopularImageCupitError());
        });
  }
}
