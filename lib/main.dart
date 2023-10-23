import 'package:amisa/core/config/app_colors/app_colors.dart';
import 'package:amisa/core/const/app_strings.dart';
import 'package:amisa/view/screens/layout/layout.dart';
import 'package:amisa/view_model/cubits/layout_cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LayoutCubit(),
        ),
      ],
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(400,800),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Fashion App',
              theme: ThemeData(
                scaffoldBackgroundColor: AppColors.scaffoldBackground,
                primaryColor: AppColors.scaffoldBackground,

              ),
              home: LayoutScreen(),
            ),
          );
        },
      ),
    );
  }
}


