part of 'layout_cubit.dart';


abstract class LayoutStates {}

class LayoutInitialState extends LayoutStates {}



class LayoutChangeNavBarState extends LayoutStates{}
class LayoutChangeTimeLineIndexState extends LayoutStates{}
class LayoutChangeNExpansionTileIconState extends LayoutStates{}
class LayoutChangeNExpansionTileIcon1State extends LayoutStates{}

class LoadingHomeDataStates extends LayoutStates{}
class SuccessHomeDataStates extends LayoutStates{
  HomeModel model;
  SuccessHomeDataStates(this.model);
}
class ErrorHomeDataStates extends LayoutStates{
  final String error;
  ErrorHomeDataStates(this.error);
}

class LoadingGetTimelineState extends LayoutStates{}
class SuccessGetTimelineState extends LayoutStates{}
class ErrorGetTimelineState extends LayoutStates{
  String error;
  ErrorGetTimelineState(this.error);
}

class LoadingGetDesignHubState extends LayoutStates{}
class SuccessGetDesignHubState extends LayoutStates{}
class ErrorGetDesignHubState extends LayoutStates{
  String error;
  ErrorGetDesignHubState(this.error);
}
class LoadingGetShowRoomsState extends LayoutStates{}
class SuccessGetShowRoomsState extends LayoutStates{}
class ErrorGetShowRoomsState extends LayoutStates{
  String error;
  ErrorGetShowRoomsState(this.error);
}