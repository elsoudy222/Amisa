import 'package:amisa/screens_path.dart';


class ShowRoomsScreen extends StatefulWidget {
  final int showRoomId;

  ShowRoomsScreen({super.key, required this.showRoomId});

  @override
  State<ShowRoomsScreen> createState() => _ShowRoomsScreenState();
}

class _ShowRoomsScreenState extends State<ShowRoomsScreen> {


  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.showRoomsModel!.rooms[widget.showRoomId].title
                  .toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                CachedNetworkImage(
                        height: 250.h,
                        imageUrl:
                            "$baseImage${cubit.showRoomsModel!.rooms[widget.showRoomId].image}",
                        fit: BoxFit.contain,
                      ),

                InkWell(
                  onTap: (){
                    context.push(
                      ShowRoomVideoScreen(showRoomId: widget.showRoomId)
                    );
                  },
                  child: Container(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r)
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Show Room Video",
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(width: 5.w,),
                          const Image(image: AssetImage(arrow2,),color: AppColors.scaffoldBackground,width: 30,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      IconlyBold.location,
                      color: Colors.white,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 19.h,
                          width: MediaQuery.of(context).size.width*0.8,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Text(
                                cubit.showRoomsModel!.rooms[widget.showRoomId].location,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  cubit.showRoomsModel!.rooms[widget.showRoomId].categories,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.h,
                ),
                const Divider(),
                SizedBox(
                  height: 10.h,
                ),

                /// PoBox =============================================================
                // cubit.showRoomsModel!.rooms[widget.showRoomId].pobox.isNotEmpty
                //     ? Text(
                //         cubit.showRoomsModel!.rooms[widget.showRoomId].pobox,
                //         style: TextStyle(color: Colors.white, fontSize: 17.sp),
                //       )
                //     : Container(),
                // SizedBox(
                //   height: 20.h,
                // ),

                /// Open Time =============================================================
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10.h,
                    ),
                    SvgPicture.asset(
                      clock,
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Text(
                      "Opining at : ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 30.w,
                      ),
                      Text(
                        cubit.showRoomsModel!.rooms[widget.showRoomId].opentime,
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Text(
                        cubit.showRoomsModel!.rooms[widget.showRoomId]
                            .fridaytime,
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      call,
                      height: 23,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Row(
                      children: [
                        Link(
                            uri: Uri.parse(
                                "tel:${cubit.showRoomsModel!.rooms[widget.showRoomId].tel}"),
                            builder: (context, followLink) {
                              return InkWell(
                                onTap: followLink,
                                child: Text(
                                  "Tel : ${cubit.showRoomsModel!.rooms[widget.showRoomId].tel}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.sp),
                                ),
                              );
                            }),
                        SizedBox(
                          width: 20.w,
                        ),
                        Link(
                            uri: Uri.parse(
                                "tel:${cubit.showRoomsModel!.rooms[widget.showRoomId].fax}"),
                            builder: (context, followLink) {
                              return InkWell(
                                onTap: followLink,
                                child: Text(
                                  "Fax : ${cubit.showRoomsModel!.rooms[widget.showRoomId].fax}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.sp),
                                ),
                              );
                            }),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Link(
                  uri: cubit.gmailUrl,
                  builder: (BuildContext context, followLink) {
                    return InkWell(
                      onTap: followLink,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            cubit
                                .showRoomsModel!.rooms[widget.showRoomId].email,
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.sp),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
