import 'package:amisa/view/screens/product_details/photo_view/photo_view.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:amisa/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:amisa/view_model/database/network/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectionsDetailsScreen extends StatelessWidget {
  const CollectionsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            title: Text(
              homeCubit.collectionModel!.collections.collectionName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                ListView.builder(
                  itemCount: homeCubit
                      .collectionModel!.collections.collectionsimages.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PhotoViewScreen(image: homeCubit.collectionModel!.collections.collectionsimages[index],);
                              },
                            ),
                          );
                        },
                      child: Container(
                        //padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10.r),
                        // color: Colors.orange,

                        height: 200.h,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: "$baseImage${homeCubit.collectionModel!.collections.collectionsimages[index]}",
                          fit: BoxFit.cover,
                        ),
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
