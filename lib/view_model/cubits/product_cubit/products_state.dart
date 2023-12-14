// part of 'products_cubit.dart';
//
//
//
// class ProductsInitial extends ProductsState {}
//
// class LoadingFetchProducts extends ProductsState {
//   // late List<ProductsList>oldProductsList;
//   //
//   // LoadingFetchProducts(this.oldProductsList);
// }
//
// class SuccessFetchProducts extends ProductsState {
//   // late List<ProductsList> productsModel;
//   // SuccessFetchProducts(this.productsModel);
// }
//
// class FailedFetchProducts extends ProductsState {}

import 'package:dio/dio.dart';


import '../../../model/products_model.dart';
import '../../../view/screens_path.dart';

class ProductRepository {
  final Dio _dio = Dio();

  Future<dynamic> fetchProducts(String brandId, int pageNum, String type) async {
    final response = await _dio.get(
      'https://amisa.aspire-4edu.com/productsforBrand/$brandId/$pageNum/$type',
    );

    if (response.statusCode == 200  ) {
      //debugPrint("wdewefwefwefwefw${response.data['products']['productslist']}");
      if(response.data['products'] == null) {
        debugPrint("No MORE PRUDUCTS");
      }else {
        final List<dynamic> data = response.data['products']['productslist'];
        return data.map((json) => ProductsModel.fromJson(json)).toList();
      }


    } else {
      throw Exception('Failed to fetch products');
    }
  }
}