import 'package:amisa/screens_path.dart';


class CustomCollectionsWidget extends StatelessWidget {
  const CustomCollectionsWidget({
    super.key,
    required this.homeCubit,
    required this.length,
  });

  final HomeCubit homeCubit;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customTitleText(title: "COLLECTIONS"),
        SizedBox(
          height: 15.h,
        ),
        ListView.builder(
          itemCount: length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                homeCubit.getCollectionDetails(homeCubit
                    .productsDetailsModel!.collections[index].collectionsId);
              },
              child: Container(
                height: 200.h,
                width: double.infinity,
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
                          homeCubit.productsDetailsModel!.collections[index]
                              .collectionName.toUpperCase(),
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
        ),
      ],
    );
  }
}