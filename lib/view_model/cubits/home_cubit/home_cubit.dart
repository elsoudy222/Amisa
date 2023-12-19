import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/model/category_model.dart';
import 'package:amisa/model/products_model.dart';
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
    emit(ChangeIndexState());
  }

  List<String> kitchenTypes=["modern" , "classic"];
  List<String> kitchenTypesImage=[modern , classic];




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

      searchDetailsModel = SearchModel.fromJson(value.data);
      debugPrint(searchDetailsModel.toString());
      emit(SuccessSearchState());
      debugPrint("====================== SUCCESS ==========================");
    }).catchError((error) {
      emit(ErrorSearchState(error.toString()));
      debugPrint("==========ERROR =========== ${error.toString()}");
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
      },
    ).then((value) {
    productsModel = ProductsModel.fromJson(value.data);
    debugPrint(productsModel as String?);
    emit(SuccessGetAllProductsStates());
    debugPrint("====================== SUCCESS ==========================");

    }).catchError((error){
      debugPrint("==========ERROR =========== $error");
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

    ).then((value) {
      brandModel = CategoryModel.fromJson(value.data);
      emit(SuccessGetAllBrandsStates());
    }).catchError((error) {
      emit(ErrorGetAllBrandsStates(error.toString()));
      debugPrint(error.toString());
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
      debugPrint(value.data.toString());
    }).catchError((error) {
      emit(ErrorGetProductDetailsStates(error.toString()));
      debugPrint("(Product Details ERROR) => $error");
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
       debugPrint(value.data.toString());
      emit(SuccessGetCollectionDetailsStates());
    }).catchError((error) {
      emit(ErrorGetCollectionDetailsStates(error.toString()));
      debugPrint(error.toString());
    });
  }


}
