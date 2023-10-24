
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../core/config/config_path.dart';
import '../../../view_model/cubits/layout_cubit/layout_cubit.dart';
import '../../screens_path.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key});

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
              backgroundColor: AppColors.scaffoldBackground,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              elevation: 3,
              currentIndex: cubit.currentIndex,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.white,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },

              items: [
                BottomNavigationBarItem(
                  icon:
                  Icon(cubit.currentIndex == 0 ? IconlyBold.home : IconlyLight.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(cubit.currentIndex == 1
                      ? IconlyBold.category
                      : IconlyLight.category),
                  label: "Categories",
                ),
                BottomNavigationBarItem(
                  icon: Icon(cubit.currentIndex == 2 ? IconlyBold.search : IconlyLight.search),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      cubit.currentIndex == 3 ? IconlyBold.moreSquare : IconlyLight.moreSquare),
                  label: "Menu",
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
