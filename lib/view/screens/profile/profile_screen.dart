
import '../../../screens_path.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();






}

class _ProfileScreenState extends State<ProfileScreen> {
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
            title: const Image(
              image: AssetImage(appLogo),
              height: 60,
            ),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Overview",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 340.w,
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
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    // height: 50.h,
                    //width: double.infinity,
                    child: GridView.builder(
                      itemCount: cubit.timelineModel!.timeline.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      //scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisExtent: 30.h,
                        mainAxisSpacing: 10
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            cubit.changeTimeLineIndex(index);
                          },
                          child: Container(
                            height: 50.h,
                            //width: 80.w,
                            margin: EdgeInsets.only(left: 10.w),
                            decoration: BoxDecoration(
                              color: cubit.currentTimeLineIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Center(
                              child: Text(
                                cubit.timelineModel!.timeline[index].date,
                                style: TextStyle(
                                  color: cubit.currentTimeLineIndex == index
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 300.h,
                    width: double.infinity,

                    margin: EdgeInsets.all(10.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 140.h,
                          width: double.infinity,

                          child: CachedNetworkImage(
                            imageUrl:
                                "$baseImage${cubit.timelineModel!.timeline[cubit.currentTimeLineIndex].image}",
                            fit: cubit.currentTimeLineIndex != 0 ?BoxFit.cover: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 150.h,
                          child: Text(
                            cubit.timelineModel!
                                .timeline[cubit.currentTimeLineIndex].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Contact Us",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /// Facebook :
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 9,
                            ),
                          ],
                        ),
                        child: SocialLinksWidget(
                          uri: cubit.facebookUrl,
                          imageUrl: facebook,
                        ),
                      ),
                      /// WhatsApp :
                      SocialLinksWidget(
                        uri: cubit.whatsappUrl,
                        imageUrl: whatsapp,
                      ),
                      /// Instagram :
                      SocialLinksWidget(
                        uri: cubit.instagramUrl,
                        imageUrl: instagram,
                      ),
                      /// Youtube :
                      SocialLinksWidget(
                        uri: cubit.youtubeUrl,
                        imageUrl: youtube,
                      ),
                      /// Gmail :
                      SocialLinksWidget(
                        uri: cubit.gmailUrl,
                        imageUrl: gmail,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Container(
                    height: 100.h,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 8,
                        ),
                      ],
                      image: const DecorationImage(image: AssetImage(header1),fit: BoxFit.cover)
                    ),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.5),
                                spreadRadius: 4,
                                blurRadius: 10,
                              ),
                            ],

                        ),
                        child: Text(

                          "Amisa\nKitchens & Ceramics",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
