import 'package:amisa/view/screens_path.dart';
import 'package:amisa/view_model/cubits/layout_cubit/layout_cubit.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowRoomsScreen extends StatelessWidget {
  final int showRoomId;

  const ShowRoomsScreen({super.key, required this.showRoomId});

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
              cubit.showRoomsModel!.rooms[showRoomId].title.toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(

                  imageUrl: "$baseImage${cubit.showRoomsModel!.rooms[showRoomId].image}",
                fit: BoxFit.cover,
              ),



              Text(
                cubit.showRoomsModel!.rooms[showRoomId].categories,
                style:  TextStyle(color: Colors.white,fontSize: 13.sp),
              ),
              Text(
                cubit.showRoomsModel!.rooms[showRoomId].pobox,
                style:  TextStyle(color: Colors.white,fontSize: 13.sp),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.call,color: Colors.white,),
                      SizedBox(width: 10.w,),
                      Column(
                        children: [
                          Text(
                            "Tel :${cubit.showRoomsModel!.rooms[showRoomId].tel}",
                            style:  TextStyle(color: Colors.white,fontSize: 13.sp),
                          ),
                          Text(
                            "Fax :${cubit.showRoomsModel!.rooms[showRoomId].fax}",
                            style:  TextStyle(color: Colors.white,fontSize: 13.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(

                    children: [
                      const Icon(Icons.lock_clock,color: Colors.white,),
                      SizedBox(width: 10.w,),
                      Column(
                        children: [
                          Text(
                           cubit.showRoomsModel!.rooms[showRoomId].opentime,
                            style:  TextStyle(color: Colors.white,fontSize: 13.sp),
                          ),
                          Text(
                            cubit.showRoomsModel!.rooms[showRoomId].fridaytime,
                            style:  TextStyle(color: Colors.white,fontSize: 13.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.email,color: Colors.white,),
                  SizedBox(width: 10.w,),
                  Text(
                    cubit.showRoomsModel!.rooms[showRoomId].email,
                    style:  TextStyle(color: Colors.white,fontSize: 13.sp),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
