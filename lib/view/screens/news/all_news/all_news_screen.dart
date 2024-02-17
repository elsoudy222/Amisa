import 'package:amisa/screens_path.dart';

class AllNewsScreen extends StatelessWidget {
  const AllNewsScreen({super.key});

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
                  itemCount: homeCubit.homeModel!.news.length,
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
                          newsDesc: homeCubit.homeModel!.news[i].title,
                          backgroundImage: homeCubit.homeModel!.news[i].image,
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
