import 'dart:convert';

import 'package:amisa/model/category_model.dart';
import 'package:amisa/model/home_model.dart';
import 'package:amisa/view_model/database/network/dio_helper.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view/screens_path.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  final ScrollController scrollController = ScrollController();

  final List<Map<String, dynamic>> categoryCard = [
    {
      'title': 'kitchens',
      'desc': "The Number One Italian Kitchen Company You Will Find Here.",
    },
    {
      'title': 'Ceramics',
      'desc': "The Number One Italian Kitchen Company You Will Find Here.",
    },
    {
      'title': 'Ceramics',
      'desc': "The Number One Italian Kitchen Company You Will Find Here.",
    },
  ];

  final List<String> newsDesc = [
    "The Number One Italian Kitchen Company You Will Find Here.",
    'We were pleased to welcome you in The Gulf Bride Show at The World Trade Center.Stay tuned for our upcoming events.',
    'We were pleased to welcome you in The Gulf Bride Show at The World Trade Center.Stay tuned for our upcoming events.',
    'We were pleased to welcome you in The Gulf Bride Show at The World Trade Center.Stay tuned for our upcoming events.',
  ];


  // Get Home Data from API :
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

  CategoryModel? brandModel;
  void getAllBrands(int catId){
    emit(LoadingGetAllBrandsStates());
    DioHelper.getData(
      url: BRANDS+catId.toString(),
    ).then((value) {
      brandModel = CategoryModel.fromJson(value.data);
      emit(SuccessGetAllBrandsStates());
    }).catchError((error){
      emit(ErrorGetAllBrandsStates(error.toString()));
      print(error.toString());
    });
  }


}
