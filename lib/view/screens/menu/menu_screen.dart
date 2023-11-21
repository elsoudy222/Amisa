import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/core/const/extensions.dart';
import 'package:amisa/view/screens/about_us/about_us_screen.dart';
import 'package:amisa/view/screens/design_hub/design_hub_screen.dart';
import 'package:amisa/view/screens/menu/widgets/custom_expansion_tile.dart';
import 'package:amisa/view/screens/menu/widgets/custom_menu_card.dart';
import 'package:amisa/view/screens/menu/widgets/custom_menu_header.dart';
import 'package:amisa/view/screens/profile/profile_screen.dart';
import 'package:amisa/view/screens/showroom_screen/showroom_screen.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:amisa/view_model/cubits/layout_cubit/layout_cubit.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomMenuHeaderWidget(
            imageUrl: header,
            description: '© Amisa Kitchens & Ceramics',
          ),
          body: Padding(
            padding: EdgeInsets.all(12.0.r),
            child: Column(
              children: [
                SizedBox(
                  // color: Colors.orange,
                  height: MediaQuery.of(context).size.height - 340.h,
                  child: SingleChildScrollView(
                    child: Column(
                      // shrinkWrap: true,
                      children: [
                        CustomMenuCard(
                          title: "Profile",
                          icon: IconlyBold.profile,
                          onTap: () {
                            context.push(const ProfileScreen());
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        /// Design Hub :#################
                        CustomExpansionTile(
                          cubit: cubit,
                          leadingIcon: Icons.draw_rounded,
                          title: 'Design Hub',
                          subtitle: 'tap to show designs',
                          expansionBody: List.generate(
                            cubit.designHubModel!.designHup.length,
                                (index) => InkWell(
                              onTap: () {
                                context.push(DesignHubScreen(designId: index));
                              },
                              child: Container(
                                width: double.infinity,
                                // color: Colors.orange,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.5), BlendMode.dstATop),
                                        image: CachedNetworkImageProvider(
                                            "$baseImage${cubit.designHubModel!.designHup[index].designPhotos[0]}"),
                                        fit: BoxFit.cover)),
                                padding: EdgeInsets.only(left: 70.w, top: 17.h),
                                margin: EdgeInsets.only(bottom: 5.h),
                                height: 60.h,
                                child: Text(
                                  cubit.designHubModel!.designHup[index].designName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        /// Show Rooms :#################
                        CustomExpansionTile(
                          cubit: cubit,
                          leadingIcon: IconlyBold.location,
                          title: 'Our Show Rooms',
                          subtitle: 'tap to view our show rooms',
                          expansionBody: List.generate(
                            cubit.showRoomsModel!.rooms.length,
                                (index) => InkWell(
                              onTap: () {
                                context.push(ShowRoomsScreen(showRoomId: index));
                              },
                              child: Container(
                                width: double.infinity,
                                // color: Colors.orange,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.5), BlendMode.dstATop),
                                        image: CachedNetworkImageProvider(
                                            "$baseImage${cubit.showRoomsModel!.rooms[index].image}"),
                                        fit: BoxFit.cover)),
                                padding: EdgeInsets.only(left: 70.w, top: 12.h),
                                margin: EdgeInsets.only(bottom: 5.h),
                                height: 60.h,
                                child: Text(
                                  cubit.showRoomsModel!.rooms[index].title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 15.h,
                        ),
                        CustomMenuCard(
                          title: "About Amisa",
                          icon: IconlyBold.infoCircle,
                          onTap: () {
                            context.push(const AboutUsScreen());
                          },
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                      ],
                    ),
                  ),
                ),
                const Text(
                  "© Amisa Kitchens & Ceramics",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}



