import 'dart:convert';

import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/core/config/const/enums.dart';
import 'package:amisa/model/brand_details_model.dart';
import 'package:amisa/model/category_model.dart';
import 'package:amisa/model/home_model.dart';
import 'package:amisa/model/products_model.dart';
import 'package:amisa/view_model/cubits/product_cubit/products_cubit.dart';
import 'package:amisa/view_model/database/network/dio_helper.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/collection_model.dart';
import '../../../model/product_details_model.dart';
import '../../../model/search_model.dart';
import '../../../view/screens_path.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {

  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  // Scrollbar in home Screen:
  final ScrollController newArrivalsScrollController = ScrollController();
  final PageController imageController = PageController();

  int brandCurrentIndex = 0;

  void changeBrandIndex(int index) {
    brandCurrentIndex = index;
     emit(ChangeBrandIndexState());
  }
  int categoryCurrentIndex = 0;
  void changeIndex(int index) {
    categoryCurrentIndex = index;
   // emit(ChangeIndexState());
  }

  List<String> kitchenTypes=["modern" , "classic"];
  List<String> kitchenTypesImage=[modern , classic];


  /// Get Home Data from API :
  HomeModel? homeModel;
  void getHomeData() {
    emit(LoadingHomeDataStates());
    DioHelper.getData(
      url: HOME,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel.toString());
      emit(SuccessHomeDataStates(homeModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorHomeDataStates(error.toString()));
    });
  }

  TextEditingController searchController = TextEditingController();
  SearchModel? searchDetailsModel;
  void searchProductsList({
    required String searchText,
  }){
    emit(LoadingSearchState());
    DioHelper.postData(
      url: SEARCH,
      data: {
        "search": searchText,
      },
    ).then((value) {
      // for(var product in value.data){
      //   productsModel?.add(ProductsModel.fromJson(product) );
      // }
      searchDetailsModel = SearchModel.fromJson(value.data);
      // productsModel = value.data.map((e) => ProductsModel.fromJson(e)).toList();

      print(searchDetailsModel.toString());
      // print(productsModel?.products.type.toString());
      emit(SuccessSearchState());
      print("====================== SUCCESS ==========================");
    }).catchError((error) {
      emit(ErrorSearchState(error.toString()));
      print("==========ERROR =========== ${error.toString()}");
    });
  }


  /// Get All Products Data from API :

  ProductsModel? productsModel;
  void getAllProducts({required String brandId, String type = ""  }) {
    emit(LoadingGetAllProductsStates());
    DioHelper.postData(
      url: ALL_PRODUCTS,
      data: {
        "brand_id" : brandId,
        "type" : type,
        "pagenum" : "",
      },
    ).then((value) {

    productsModel = ProductsModel.fromJson(value.data);

      print(productsModel.toString());

    emit(SuccessGetAllProductsStates());
      print("====================== SUCCESS ==========================");

    }).catchError((error){
       print("==========ERROR =========== ${error}");
       emit(ErrorGetAllProductsStates(error.toString()));
    })
    ;
  }

  /// Get All Brands Data from API :
  CategoryModel? brandModel;
  void getAllBrands(int? catId) {
    emit(LoadingGetAllBrandsStates());
    DioHelper.getData(
      url: BRANDS + catId.toString(),
     // url: "$BRANDS${homeModel!.categories[index].id}",
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
      print(value.data.toString());
    }).catchError((error) {
      emit(ErrorGetProductDetailsStates(error.toString()));
      print("(Product Details ERROR) => ${error.toString()}");
    });
  }

  /// Get All Collections Data from API :
  CollectionModel? collectionModel;
  void getCollectionDetails(int collectionID) {
    emit(LoadingGetCollectionDetailsStates());
    DioHelper.getData(
        url: COLLECTION + collectionID.toString(),
    ).then((value) {
       collectionModel = CollectionModel.fromJson(value.data);
      //collectionModel = value.data.map((e) => CollectionModel.fromJson(e)).toList();
       print(value.data.toString());
      emit(SuccessGetCollectionDetailsStates());
    }).catchError((error) {
      emit(ErrorGetCollectionDetailsStates(error.toString()));
      print(error.toString());
    });
  }


}
