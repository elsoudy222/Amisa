// import 'package:amisa/view/screens_path.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../model/products_model.dart';
// import '../../database/network/dio_helper.dart';
// import '../../database/network/end_points.dart';
// import '../home_cubit/home_cubit.dart';
//
//  class ProductsState {
//   late final List<ProductsModel> products;
//   late final bool isLoading;
//
//   ProductState({required this.products, required this.isLoading});
// }
//
// class ProductsCubit extends Cubit<ProductsState> {
//   ProductsCubit() : super(ProductsInitial());
//
//   static ProductsCubit get(context) => BlocProvider.of(context);
//   final ScrollController productsScrollController = ScrollController();
//
//   // ProductsModel? productsModel ;
//   //   int page = 1;
//   // Future<ProductsModel> getAllProducts(
//   //     {
//   //       required String brandId,
//   //       String type = "" ,
//   //       int? page ,
//   //
//   //     }
//   //     ) async {
//   //   emit(LoadingFetchProducts());
//   //   await DioHelper.postData(
//   //     url: ALL_PRODUCTS,
//   //     data: {
//   //       "brand_id" : brandId,
//   //       "type" : type,
//   //       "pagenum" : page,
//   //     },
//   //   ).then((value) {
//   //     debugPrint(value.data.runtimeType.toString());
//   //      // productsModel = List.from(value.data).map((e)
//   //      // => ProductsModel.fromJson(e)).toList();
//   //
//   //       productsModel = ProductsModel.fromJson(value.data);
//   //
//   //
//   //     emit(SuccessFetchProducts());
//   //     print("====================== SUCCESS ==========================");
//   //
//   //   // }).catchError((error){
//   //   //   print("==========ERROR =========== $error");
//   //   //   emit(FailedFetchProducts());
//   //   });
//   //   return productsModel!;
//   // }
//
//
//   // loadProducts({required String brandId}) {
//   //   if (state is LoadingFetchProducts) return;
//   //   final currentState = state;
//   //   var oldProductList = <ProductsList>[];
//   //   if (currentState is SuccessFetchProducts) {
//   //     oldProductList = currentState.productsModel;
//   //   }
//   //   emit(LoadingFetchProducts(oldProductList, page == 1) );
//   //   getAllProducts(
//   //     brandId: brandId,
//   //       type: "",
//   //       page: page
//   //   )
//   //       .then((newProductsList) {
//   //     page ++ ;
//   //     List<ProductsList>  products = (state as ProductsLoading).oldProductsList;
//   //     products.addAll(newProductsList.products.productsList);
//   //     emit(ProductsLoaded(products) as ProductsState);
//   //   });
//   // }
//
//   // setupScrollController(context, {required String brandId}) {
//   //   productsScrollController.addListener(() {
//   //     if(
//   //     productsScrollController.position.pixels
//   //         == productsScrollController.position.maxScrollExtent
//   //     ){
//   //       print("================= CALL =================================");
//   //        //page++;
//   //      // loadProducts(brandId: brandId,);
//   //     }
//   //   });
//   // }
//   // setupScrollController(context, {required String savedBrandId}) {
//   //   productsScrollController.addListener(() {
//   //     if (productsScrollController.position.atEdge) {
//   //       if (productsScrollController.position.pixels != 0) {
//   //         loadProducts(savedBrandId: savedBrandId);
//   //       }
//   //     }
//   //   });
//   // }
//
// }

import 'package:amisa/model/products_model.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:amisa/view_model/cubits/product_cubit/products_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductState {
   final List<ProductsModel> products;
  final bool isLoading;

  ProductState({required this.products, required this.isLoading});

  ProductState copyWith({List<ProductsModel>? products, bool? isLoading}) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
    );
  }
  factory ProductState.initial() {
    return ProductState(products: [], isLoading: false);
  }
}

class ProductCubit extends Cubit<ProductState> {

  ProductCubit(this._productRepository) : super(ProductState.initial());
  static ProductCubit get(context) => BlocProvider.of(context);

  final ProductRepository _productRepository ;
  // final int? brandId;
  // final String? type;
  int pageNum = 1;



  Future<void> fetchProducts(String brandId,String type) async {
 //   try {
      emit(state.copyWith(isLoading: true));
      final List<ProductsModel> products = List.from(await _productRepository.fetchProducts(brandId, pageNum, type));
      emit(state.copyWith(products: [...state.products, ...products], isLoading: false));
      pageNum++;
    // } catch (e) {
    //   // emit(state.copyWith(isLoading: false));
    //   // debugPrint("ERROR===================${e}================");
    // }
  }
  void clearProducts() {
    emit(state.copyWith(products: [], ));
  }
}