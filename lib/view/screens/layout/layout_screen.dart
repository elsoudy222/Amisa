import 'package:amisa/view/screens_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../core/components/custom_bottom_navbar/custom_bottom_navbar.dart';
import '../../../view_model/cubits/layout_cubit/layout_cubit.dart';

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
