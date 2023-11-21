import 'package:amisa/view_model/cubits/layout_cubit/layout_cubit.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../screens_path.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {

  List<Color> colors = [Colors.orange, Colors.red, Colors.blueAccent];
  TabController? _tabController;

 bool isSelected = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _tabController!.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Overview",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: 330,
                  // color: Colors.orange,
                  child: Text(
                    "Amisa Group has been successfully providing solutions for all types of building materials work for architects and the construction industry in large quantities. This has enabled the Group to be a strong competitor to major companies, due to the efforts put in by the management, in developing and strengthening the company as a whole",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Timeline",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.h,
                ),
                // SizedBox(
                //   height: 30.h,
                //   child: ListView.builder(
                //     controller: timelineController,
                //     shrinkWrap: true,
                //     scrollDirection: Axis.horizontal,
                //     itemCount: cubit.timelineModel!.timeline.length,
                //     itemBuilder: (context, index) {
                //       return Container(
                //         margin: EdgeInsets.only(left: 10.w),
                //         width: 70,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(20.r),
                //           border: Border.all(color: Colors.white),
                //         ),
                //         child: Center(
                //           child: Text(
                //             cubit.timelineModel!.timeline[index].date,
                //             style: TextStyle(color: Colors.white),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                // Container(
                //   // color: Colors.orange,
                //   width: double.infinity,
                //   height: 200.h,
                //   child: Container(
                //     child: Text(
                //       cubit.timelineModel!.timeline[0].date,
                //     ),
                //   ),
                // ),
                Padding(
                  padding:  EdgeInsets.all(15.0.r),
                  child: Column(
                    children: [
                      TabBar(
                        enableFeedback: true,
                        dividerColor: Colors.transparent,
                        indicatorColor: Colors.transparent,
                          splashBorderRadius: BorderRadius.circular(20.r),
                          controller: _tabController,
                          tabs: List.generate(
                            cubit.timelineModel!.timeline.length,
                            (index) => Container(
                              width: 71.w,height: 30.h,
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.white : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20.r),
                                  border: Border.all(color: Colors.white)
                              ),
                              child: Center(
                                child: Text(
                                  cubit.timelineModel!.timeline[index].date,
                                ),
                              ),
                            ),
                          ),

                      ),
                      SizedBox(height: 15.h,),
                      Container(
                       // color: Colors.orange,
                        height: 300.h,
                        child: TabBarView(
                          controller: _tabController,
                          children: List.generate(
                              cubit.timelineModel!.timeline.length,
                              (index) => Container(
                                    child: Column(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl:
                                              "$baseImage${cubit.timelineModel!.timeline[index].image}",
                                          fit: BoxFit.cover,
                                        ),
                                        Text(
                                            cubit.timelineModel!.timeline[index].description,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
