import 'package:amisa/core/const/extensions.dart';
import 'package:amisa/view/screens/news/news_details/news_details_screen.dart';
import 'package:amisa/view_model/cubits/layout_cubit/layout_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../screens_path.dart';
import '../../home/widgets/custom_news_card/custom_news_card.dart';
import '../widgets/custom_all_news.dart';

class AllNewsScreen extends StatelessWidget {
  const AllNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var layoutCubit = LayoutCubit.get(context);
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'All News',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: layoutCubit.homeModel!.news.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: InkWell(
                        onTap: () {
                          context.push(
                            NewsDetails(index: i),
                          );
                        },
                        child: CustomAllNewsCard(
                          newsDesc: layoutCubit.homeModel!.news[i].title,
                          backgroundImage: layoutCubit.homeModel!.news[i].image,
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
