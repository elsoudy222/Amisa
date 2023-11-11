import 'dart:convert';

import 'package:amisa/core/config/const/enums.dart';
import 'package:amisa/model/category_model.dart';
import 'package:amisa/model/home_model.dart';
import 'package:amisa/model/products_model.dart';
import 'package:amisa/view_model/database/network/dio_helper.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/product_details_model.dart';
import '../../../view/screens_path.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  // Scrollbar in home Screen:
  final ScrollController scrollController = ScrollController();

  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }
List<String> kitchen=["modern" , "classic"];

 String? kitchenType;
  void changeKitchenTypeToModern( ) {
    kitchenType = KitchenTypes.modern.toString();
    print(kitchenType);
    emit(ChangeKitchenTypeToModernState());

  }
  void changeKitchenTypeToClassic() {
    kitchenType = KitchenTypes.classic.toString();
    print(kitchenType);
    emit(ChangeKitchenTypeToClassicState());

  }




  /// Get Home Data from API :
  HomeModel? homeModel;

  void getHomeData() {
    emit(LoadingHomeDataStates());
    DioHelper.getData(
      url: HOME,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel.toString());
      emit(SuccessHomeDataStates());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorHomeDataStates(error));
    });
  }


  /// Get All Products Data from API :
 ProductsModel? productsModel;
  void getAllProducts({
    required String brandId,
    String type = "" ,
    String pageNumber ="" ,

}) {
    emit(LoadingGetAllProductsStates());
    DioHelper.postData(
      url: ALL_PRODUCTS,
      data: {
        "brand_id" : brandId,
        "type" : type,
        "pagenum" : pageNumber,
      },
    ).then((value) {
      // for(var product in value.data){
      //   productsModel?.add(ProductsModel.fromJson(product) );
      // }
    productsModel = ProductsModel.fromJson(value.data);
      // productsModel = value.data.map((e) => ProductsModel.fromJson(e)).toList();

      print(productsModel.toString());
      print(productsModel?.products.type.toString());
    emit(SuccessGetAllProductsStates());
      print("====================== SUCCESS ==========================");

    }).catchError((error){
      print("==========ERROR =========== ${error.toString()}");
      emit(ErrorGetAllProductsStates(error.toString()));
    });
  }

  /// Get All Brands Data from API :
  CategoryModel? brandModel;
  void getAllBrands(int catId) {
    emit(LoadingGetAllBrandsStates());
    DioHelper.getData(
      url: BRANDS + catId.toString(),
    ).then((value) {
      brandModel = CategoryModel.fromJson(value.data);
      emit(SuccessGetAllBrandsStates());
    }).catchError((error) {
      emit(ErrorGetAllBrandsStates(error.toString()));
      print(error.toString());
    });
  }

  /// Get Product Details Data from API :
  ProductsDetailsModel? productsDetailsModel;
  void getProductDetails(int productID) {
    emit(LoadingGetProductDetailsStates());
    DioHelper.getData(
      url: PRODUCT_DETAILS + productID.toString(),
    ).then((value) {
      productsDetailsModel = ProductsDetailsModel.fromJson(value.data);
      emit(SuccessGetProductDetailsStates());
    }).catchError((error) {
      emit(ErrorGetProductDetailsStates(error.toString()));
      print("(Product Details ERROR) => ${error.toString()}");
    });
  }
}
