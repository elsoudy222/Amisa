import 'package:amisa/core/config/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubits/layout_cubit/layout_cubit.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);

        return Scaffold(
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45.0),
              topRight: Radius.circular(45.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
           //   backgroundColor: Colors.white.withOpacity(.1),
              showSelectedLabels: true,
              showUnselectedLabels: false,
              elevation: 2,
              currentIndex: cubit.currentIndex,
              //  unselectedItemColor: AppColors.primaryColorGray,
              // selectedItemColor: AppColors.primaryColorRed,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },

              items: [
                BottomNavigationBarItem(
                  icon: cubit.currentIndex != 0
                      ? Icon(
                          Icons.home_filled,
                          color: Colors.grey,
                        )
                      : Icon(
                          Icons.home_filled,

                        ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: cubit.currentIndex != 1
                      ? Icon(
                          Icons.category_outlined,
                          color: Colors.grey,
                        )
                      : Icon(Icons.category),
                  label: "Category",
                ),
                BottomNavigationBarItem(
                  icon: cubit.currentIndex != 2
                      ? Icon(
                          Icons.search,
                          color: Colors.grey,
                        )
                      : Icon(Icons.search),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: cubit.currentIndex != 3
                      ? Icon(
                          Icons.menu,
                          color: Colors.grey,
                        )
                      : Icon(Icons.menu),
                  label: "Search",
                ),
              ],
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
