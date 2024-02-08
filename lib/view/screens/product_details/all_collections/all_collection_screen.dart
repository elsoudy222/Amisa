import 'package:amisa/screens_path.dart';


class AllCollectionScreen extends StatelessWidget {
  const AllCollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is SuccessGetCollectionDetailsStates) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const CollectionsDetailsScreen();
              },
            ),
          );
        }
        debugPrint("======================== SUCCESS ========================");
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return ListView.builder(
                itemCount: homeCubit.productsDetailsModel!.collections.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      homeCubit.getCollectionDetails(homeCubit
                          .productsDetailsModel!
                          .collections[index]
                          .collectionsId);
                    },
                    child: Container(
                      height: 200.h,
                      margin: EdgeInsets.only(bottom: 10.h),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.7), BlendMode.dstATop),

                          /// This Image will be changes :--------------
                          image: CachedNetworkImageProvider(
                            "$baseImage${homeCubit.productsDetailsModel!.collections[index].collectionphoto}",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 70.h,
                            width: MediaQuery.of(context).size.width - 150.w,
                            color: Colors.black.withOpacity(0.7),
                            child: Center(
                              child: Text(
                                homeCubit.productsDetailsModel!
                                    .collections[index].collectionName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
