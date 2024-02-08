import 'package:amisa/screens_path.dart';


class NewsDetails extends StatelessWidget {
  final int index;

  const NewsDetails({super.key, required this.index});

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
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 350.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            "$baseImage${cubit.homeModel!.news[index].image}"),
                        fit: BoxFit.cover,
                      ),
                    )),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.all(10.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customTitleText(
                          title: cubit.homeModel!.news[index].title),
                      SizedBox(height: 20.h),
                      Text(
                        cubit.homeModel!.news[index].description,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
