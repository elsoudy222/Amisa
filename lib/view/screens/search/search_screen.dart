import 'package:amisa/core/components/custom_text_form_field/custom_text_form_filed.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:amisa/view_model/cubits/layout_cubit/layout_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
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
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      hintText: "What you’re looking for?",
                      prefixIcon: const Icon(
                        IconlyBold.search,
                        color: Colors.grey,
                        size: 20,
                      ),
                      onChanged: (value){
                        cubit.searchProductsList(searchText: searchController.text);
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Text(
                            "Search Screen",
                            style: TextStyle(
                                color: Colors.white, fontSize: 20.sp),
                          ),
                        );
                      },
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
