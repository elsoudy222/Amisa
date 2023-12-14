import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:amisa/view_model/cubits/layout_cubit/layout_cubit.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';


class ShowRoomsScreen extends StatefulWidget {
  final int showRoomId;

  ShowRoomsScreen({super.key, required this.showRoomId});

  @override
  State<ShowRoomsScreen> createState() => _ShowRoomsScreenState();
}

class _ShowRoomsScreenState extends State<ShowRoomsScreen> {
  //final Uri _url = Uri.parse('https://aspire-4edu.com/');
  Future<void> _launchUrl() async {
    if (!await launchUrl(
        Uri as Uri,
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch ');
    }

  }


  final String lat = "25.136223159315175";
  final String lng = "55.21567496013613";


  launchMap( )async{
    final Uri googleMapsUrl = Uri.parse('comgooglemaps: //?center=$lat , $lng');
  //final String googleMapsUrl="comgooglemaps: //?center=$lat , $lng";

 // final String appleMapsUrl="https: //maps. apple. com/?q-$lat , $lng";
    final Uri appleMapsUrl = Uri.parse('https: //maps. apple. com/?q-$lat , $lng');


    if(await canLaunchUrl(googleMapsUrl as Uri)){
    await launchUrl(googleMapsUrl as Uri);
  }
  if(await canLaunchUrl(appleMapsUrl as Uri)){
    await launchUrl(appleMapsUrl as Uri);
  }
  else {
    throw "Couldn't launch Google Maps ";
  }


  }


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
              cubit.showRoomsModel!.rooms[widget.showRoomId].title.toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                //    MapUtils.openMap(25.136223159315175, 55.21567496013613);
                  },
                  child: CachedNetworkImage(
                    height: 300.h,
                    imageUrl:
                        "$baseImage${cubit.showRoomsModel!.rooms[widget.showRoomId].image}",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(IconlyBold.location,color: Colors.white,),
                    Text(
                      cubit.showRoomsModel!.rooms[widget.showRoomId].location,
                      style: TextStyle(color: Colors.white, fontSize: 16.sp,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 5.h,),
                Text(
                  cubit.showRoomsModel!.rooms[widget.showRoomId].categories,
                  style: TextStyle(color: Colors.white, fontSize: 14.sp,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.h,),
                const Divider(),
                SizedBox(height: 10.h,),
                /// PoBox =============================================================
                cubit.showRoomsModel!.rooms[widget.showRoomId].pobox.isNotEmpty
                ?Text(
                  cubit.showRoomsModel!.rooms[widget.showRoomId].pobox,
                  style: TextStyle(color: Colors.white, fontSize: 17.sp),
                )
                : Container(),
                SizedBox(height: 20.h,),

                /// Open Time =============================================================
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    SizedBox(width: 10.h,),
                    SvgPicture.asset(clock,height: 20.h,),
                    SizedBox(width: 10.h,),
                    Text(
                      "Opining at : ",
                      style:
                      TextStyle(color: Colors.white, fontSize: 18.sp,fontWeight: FontWeight.bold),
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
                        style:
                        TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),

                      Text(
                        cubit.showRoomsModel!.rooms[widget.showRoomId].fridaytime,
                        style:
                        TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SvgPicture.asset(call,height: 23,),
                    SizedBox(
                      width: 10.w,
                    ),
                    Row(
                      children: [
                        Link(
                            uri: Uri.parse("tel:${cubit.showRoomsModel!.rooms[widget.showRoomId].tel}"),
                            builder: (context, followLink){
                              return InkWell(
                                onTap: followLink,
                                child: Text(
                                  "Tel : ${cubit.showRoomsModel!.rooms[widget.showRoomId].tel}",
                                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                                ),
                              );
                            }),
                        SizedBox(
                          width: 20.w,
                        ),
                        Link(
                            uri: Uri.parse("tel:${cubit.showRoomsModel!.rooms[widget.showRoomId].fax}"),
                            builder: (context, followLink){
                              return InkWell(
                                onTap: followLink,
                                child: Text(
                                  "Fax : ${cubit.showRoomsModel!.rooms[widget.showRoomId].fax}",
                                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                                ),
                              );
                            }),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Link(

                  uri: cubit.gmailUrl,
                  builder: (BuildContext context,  followLink) {
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
                            cubit.showRoomsModel!.rooms[widget.showRoomId].email,
                            style: TextStyle(color: Colors.white, fontSize: 13.sp),
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





