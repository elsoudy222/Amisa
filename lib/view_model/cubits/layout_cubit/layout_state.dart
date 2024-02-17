part of 'layout_cubit.dart';


abstract class LayoutStates {}

class LayoutInitialState extends LayoutStates {}



class LayoutChangeNavBarState extends LayoutStates{}
class LayoutChangeTimeLineIndexState extends LayoutStates{}
class LayoutChangeNExpansionTileIconState extends LayoutStates{}
class LayoutChangeNExpansionTileIcon1State extends LayoutStates{}



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