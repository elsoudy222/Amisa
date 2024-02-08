
import 'package:amisa/screens_path.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var cubit = LayoutCubit.get(context);
    var cubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is LoadingGetProductDetailsStates) {
          MyDialog.showLoadingDialog();
        } else if (state
        is SuccessGetProductDetailsStates) {
          EasyLoading.dismiss();
          context.push(
            const ProductDetailsScreen(
            ),
          );
          debugPrint(
              "============= SUCCESS get product details ===============");
        } else if (state
        is ErrorGetProductDetailsStates) {
          EasyLoading.dismiss();
          debugPrint(
              "============= Error get product details ===============");
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10.0.r),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0.r),
                    child: TextFormFieldsCustom(
                      controller: cubit.searchController,
                      keyboardType: TextInputType.text,
                      hintText: "What you’re looking for?",
                      onChanged: (val){
                        cubit.searchProductsList(
                            searchText: cubit.searchController.text);
                        val = cubit.searchController.text;

                      },
                      prefixIcon: IconButton(
                        onPressed: () {
                          cubit.searchProductsList(
                              searchText: cubit.searchController.text);
                        },
                        icon: const Icon(
                          IconlyBold.search,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  ConditionalBuilder(
                    condition: cubit.searchDetailsModel != null && cubit.searchController.text != "",
                    builder: (context) {
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: cubit.searchDetailsModel!.result.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: CustomSubCategoryCard(
                                description: "",
                                backgroundImage: cubit.searchDetailsModel!
                                    .result[index].coverImages[0],
                                buttonText: cubit.searchDetailsModel!
                                    .result[index].productName,
                                badgeBackgroundColor:
                                    Colors.black.withOpacity(0.5),
                                badgeWidget: Text(
                                  cubit.searchDetailsModel!.result[index]
                                      .productName
                                      .toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                onTap: () {

                                  cubit.getProductDetails(cubit.searchDetailsModel!.result[index].id);

                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                    fallback: (context) => Expanded(
                      child: Center(
                          child: SingleChildScrollView(
                            child: Image(image: const AssetImage(search),
                            height: 280.h,),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
