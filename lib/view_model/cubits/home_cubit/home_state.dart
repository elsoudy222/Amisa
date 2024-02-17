part of 'home_cubit.dart';

@immutable
abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class LoadingHomeDataStates extends HomeStates{}
class SuccessHomeDataStates extends HomeStates{
  HomeModel model;
  SuccessHomeDataStates(this.model);
}
class ErrorHomeDataStates extends HomeStates{
  final String error;
  ErrorHomeDataStates(this.error);
}

class ChangeIndexState extends HomeStates {}

class ChangeBrandIndexState extends HomeStates {}

class ChangeCurrentPageNumber extends HomeStates {}

class ChangeKitchenTypeToModernState extends HomeStates {}
class ChangeKitchenTypeToClassicState extends HomeStates {}



class LoadingSearchState extends HomeStates{}
class SuccessSearchState extends HomeStates{}
class ErrorSearchState extends HomeStates{
  String error;
  ErrorSearchState(this.error);
}



class LoadingGetAllProductsStates extends HomeStates{}
class SuccessGetAllProductsStates extends HomeStates{}
class ErrorGetAllProductsStates extends HomeStates{
  final String error;
  ErrorGetAllProductsStates(this.error);
}
class LoadingGetAbodeTapsProductsStates extends HomeStates{}
class SuccessGetAbodeTapsProductsStates extends HomeStates{}
class ErrorGetAbodeTapsProductsStates extends HomeStates{
  final String error;
  ErrorGetAbodeTapsProductsStates(this.error);
}








class LoadingGetAllBrandsStates extends HomeStates{}
class SuccessGetAllBrandsStates extends HomeStates{}
class ErrorGetAllBrandsStates extends HomeStates{
  final String error;
  ErrorGetAllBrandsStates(this.error);
}

// class LoadingGetBrandDetailsStates extends HomeStates{}
// class SuccessGetBrandBrandDetailsStates extends HomeStates{}
// class ErrorGetBrandDetailsStates extends HomeStates{
//   final String error;
//   ErrorGetBrandDetailsStates(this.error);
// }

class LoadingGetCollectionDetailsStates extends HomeStates{}
class SuccessGetCollectionDetailsStates extends HomeStates{}
class ErrorGetCollectionDetailsStates extends HomeStates{
  final String error;
  ErrorGetCollectionDetailsStates(this.error);
}

class LoadingGetProductDetailsStates extends HomeStates{}
class SuccessGetProductDetailsStates extends HomeStates{
  // ProductsDetailsModel model;
  // SuccessGetProductDetailsStates(this.model);
}
class ErrorGetProductDetailsStates extends HomeStates{
  final String error;
  ErrorGetProductDetailsStates(this.error);
}
