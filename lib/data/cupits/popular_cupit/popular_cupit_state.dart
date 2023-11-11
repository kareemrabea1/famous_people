part of 'popular_cupit_cubit.dart';

@immutable
abstract class PopularCupitState {}

class PopularCupitInitial extends PopularCupitState {}
class PopularCupitLoading extends PopularCupitState {}
class PopularCupitDone extends PopularCupitState {}
class PopularCupitEroor extends PopularCupitState {}
