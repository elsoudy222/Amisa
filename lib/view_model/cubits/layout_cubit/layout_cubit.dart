import 'package:amisa/view/screens/menu/menu_screen.dart';
import 'package:amisa/view/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view/screens/category/category.dart';
import '../../../view/screens/home/home.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);


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
}
