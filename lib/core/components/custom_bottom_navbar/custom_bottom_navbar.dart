

import '../../../screens_path.dart';


class CustomNavBar extends StatelessWidget {
  final LayoutCubit cubit;

  const CustomNavBar({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
            icon: Icon(
                cubit.currentIndex == 0
                    ? IconlyBold.home
                    : IconlyLight.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
                cubit.currentIndex == 1
                ? IconlyBold.category
                : IconlyLight.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(
                cubit.currentIndex == 2
                ? IconlyBold.search
                : IconlyLight.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
                cubit.currentIndex == 3
                ? IconlyBold.moreSquare
                : IconlyLight.moreSquare),
            label: "Menu",
          ),
        ],
      ),
    );
  }
}
