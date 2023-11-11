part of 'popular_info_cupit_cubit.dart';

@immutable
abstract class PopularInfoCupitState {}

class PopularInfoCupitInitial extends PopularInfoCupitState {}
class PopularInfoCupitLoading extends PopularInfoCupitState {}
class PopularInfoCupitDone extends PopularInfoCupitState {}
class PopularInfoCupitError extends PopularInfoCupitState {}
class PopularImageCupitLoading extends PopularInfoCupitState {}
class PopularImageCupitDone extends PopularInfoCupitState {}
class PopularImageCupitError extends PopularInfoCupitState {}
