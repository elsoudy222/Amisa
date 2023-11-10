part of 'home_cubit.dart';

@immutable
abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class ChangeIndexState extends HomeStates {}

class ChangeKitchenTypeToModernState extends HomeStates {}
class ChangeKitchenTypeToClassicState extends HomeStates {}

class LoadingHomeDataStates extends HomeStates{}
class SuccessHomeDataStates extends HomeStates{}
class ErrorHomeDataStates extends HomeStates{
  final String error;
  ErrorHomeDataStates(this.error);
}
class LoadingGetAllProductsStates extends HomeStates{}
class SuccessGetAllProductsStates extends HomeStates{}
class ErrorGetAllProductsStates extends HomeStates{
  final String error;
  ErrorGetAllProductsStates(this.error);
}




class LoadingGetAllBrandsStates extends HomeStates{}
class SuccessGetAllBrandsStates extends HomeStates{}
class ErrorGetAllBrandsStates extends HomeStates{
  final String error;
  ErrorGetAllBrandsStates(this.error);
}
