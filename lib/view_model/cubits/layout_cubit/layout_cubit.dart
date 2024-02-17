import 'package:amisa/screens_path.dart';

import '../../../model/home_model.dart';


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
     const HomeScreen(),
    const CategoryScreen(),
    const SearchScreen(),
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
      debugPrint(timelineModel.toString());
      emit(SuccessGetTimelineState());
    }).catchError((error) {
      debugPrint(error.toString());
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
      debugPrint(error.toString());
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
      debugPrint(error.toString());
      emit(ErrorGetShowRoomsState(error.toString()));
    });
  }
}
