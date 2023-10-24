import 'package:amisa/view/screens_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

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
          bottomNavigationBar: const CustomBottomNavbar(),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
