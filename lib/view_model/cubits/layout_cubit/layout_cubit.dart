
import 'package:amisa/model/design_hub_model.dart';
import 'package:amisa/model/product_details_model.dart';
import 'package:amisa/model/showroom_model.dart';
import 'package:amisa/model/timeline_model.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view/screens_path.dart';
import '../../database/network/dio_helper.dart';



part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);




  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const CategoryScreen(),
    SearchScreen(),
     MenuScreen(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(LayoutChangeNavBarState());
  }

  bool expansionIcon = false;
  void changeExpansionTileIcon(bool expanded) {
    expansionIcon = expanded;
    emit(LayoutChangeNExpansionTileIconState());
  }
  void changeExpansionTileIcon1(bool expanded) {
    expansionIcon = expanded;
    emit(LayoutChangeNExpansionTileIcon1State());
  }

  ProductsDetailsModel? searchDetailsModel;
  void searchProductsList({
    required String searchText,
  }) {
    emit(LoadingSearchState());
    DioHelper.postData(
      url: SEARCH,
      data: {
        "search" : searchText,

      },
    ).then((value) {
      // for(var product in value.data){
      //   productsModel?.add(ProductsModel.fromJson(product) );
      // }
      searchDetailsModel = ProductsDetailsModel.fromJson(value.data);
      // productsModel = value.data.map((e) => ProductsModel.fromJson(e)).toList();

       print(searchDetailsModel.toString());
      // print(productsModel?.products.type.toString());
      emit(SuccessSearchState());
      print("====================== SUCCESS ==========================");

    }).catchError((error){
      emit(ErrorSearchState(error.toString()));
      print("==========ERROR =========== ${error.toString()}");
    });
  }


  TimelineModel? timelineModel;
  void getTimeline() {
    emit(LoadingGetTimelineState());
    DioHelper.getData(
      url: TIMELINE,
    ).then((value) {
      timelineModel = TimelineModel.fromJson(value.data);
      print(timelineModel.toString());
      emit(SuccessGetTimelineState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetTimelineState(error.toString()));
    });
  }

  DesignHubModel? designHubModel;
  void getDesignHub(){
    emit(LoadingGetDesignHubState());
    DioHelper.getData(url: DESIGN_HUB).then((value){
      designHubModel = DesignHubModel.fromJson(value.data);
      emit(SuccessGetDesignHubState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetDesignHubState(error.toString()));
    });
  }

  ShowRoomsModel? showRoomsModel;
  void getShowRooms(){
    emit(LoadingGetShowRoomsState());
    DioHelper.getData(url: SHOWROOMS).then((value){
      showRoomsModel = ShowRoomsModel.fromJson(value.data);
      emit(SuccessGetShowRoomsState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetShowRoomsState(error.toString()));
    });
  }


}
