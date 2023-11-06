part of 'home_cubit.dart';

@immutable
abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class LoadingHomeDataStates extends HomeStates{}
class SuccessHomeDataStates extends HomeStates{}
class ErrorHomeDataStates extends HomeStates{
  final String error;
  ErrorHomeDataStates(this.error);
}


class LoadingGetAllBrandsStates extends HomeStates{}
class SuccessGetAllBrandsStates extends HomeStates{}
class ErrorGetAllBrandsStates extends HomeStates{
  final String error;
  ErrorGetAllBrandsStates(this.error);
}
