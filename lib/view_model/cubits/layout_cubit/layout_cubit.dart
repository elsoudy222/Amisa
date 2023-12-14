import 'package:amisa/model/design_hub_model.dart';
import 'package:amisa/model/product_details_model.dart';
import 'package:amisa/model/search_model.dart';
import 'package:amisa/model/showroom_model.dart';
import 'package:amisa/model/timeline_model.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../view/screens_path.dart';
import '../../database/network/dio_helper.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  final Uri whatsappUrl = Uri.parse("whatsapp://send?phone=+971569570054");
  final Uri facebookUrl = Uri.parse("https://www.facebook.com/amisakct/");
  final Uri instagramUrl = Uri.parse("https://www.instagram.com/amisakct/");
  final Uri youtubeUrl = Uri.parse("https://www.youtube.com/@amisakitchensceramics3572");
  final Uri urlCall = Uri.parse("tel:+97142399881");
  final Uri gmailUrl = Uri(scheme: "mailto", path: "info@amisakct.com",
      queryParameters: {
        "subject" : "",
        "body" : "",
      }
  );


  int currentIndex = 0;
  List<Widget> screens = [
     HomeScreen(),
    const CategoryScreen(),
    SearchScreen(),
    const MenuScreen(),
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
  bool expansionIcon1 = false;
  void changeExpansionTileIcon1(bool expanded1) {
    expansionIcon1 = expanded1;
    emit(LayoutChangeNExpansionTileIcon1State());
  }


  int currentTimeLineIndex = 0;
  void changeTimeLineIndex(int index) {
    currentTimeLineIndex = index;
    emit(LayoutChangeTimeLineIndexState());
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

  void getDesignHub() {
    emit(LoadingGetDesignHubState());
    DioHelper.getData(url: DESIGN_HUB).then((value) {
      designHubModel = DesignHubModel.fromJson(value.data);
      emit(SuccessGetDesignHubState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetDesignHubState(error.toString()));
    });
  }

  ShowRoomsModel? showRoomsModel;

  void getShowRooms() {
    emit(LoadingGetShowRoomsState());
    DioHelper.getData(url: SHOWROOMS).then((value) {
      showRoomsModel = ShowRoomsModel.fromJson(value.data);
      emit(SuccessGetShowRoomsState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetShowRoomsState(error.toString()));
    });
  }
}
