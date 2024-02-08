import 'package:amisa/screens_path.dart';


class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);

        return Scaffold(
         // appBar: AppBar(),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: CustomNavBar(cubit: cubit),
        );
      },
    );
  }
}
