import 'package:amisa/core/const/extensions.dart';
import 'package:amisa/view/screens/product_details/photo_view/photo_view.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:amisa/view_model/cubits/layout_cubit/layout_cubit.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesignHubScreen extends StatelessWidget {
  final int designId;

  const DesignHubScreen({
    super.key,
    required this.designId,
  });

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
              cubit.designHubModel!.designHup[designId].designName,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          body: ListView.builder(
            shrinkWrap: true,
            itemCount:
                cubit.designHubModel!.designHup[designId].designPhotos.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  context.push(PhotoViewScreen(image: cubit.designHubModel!.designHup[designId].designPhotos[index]));
                },
                child: Container(
                  //padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10.r),
                 // color: Colors.orange,

                  height: 200.h,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: "$baseImage${cubit.designHubModel!.designHup[designId].designPhotos[index]}",
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
