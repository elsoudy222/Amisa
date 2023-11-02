import 'package:amisa/view/screens/category/kitchens_type/kitchens_sub_category_type.dart';
import 'package:amisa/view/screens/category/sub_category/sub_category_screen.dart';
import 'package:amisa/view/screens/product_details/product_details_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:amisa/view/screens/layout/layout_screen.dart';
import 'package:amisa/view_model/cubits/layout_cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/config_path.dart';

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
          // To Change StatusBar Color:
          SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            statusBarColor: AppColors.scaffoldBackground,
              statusBarBrightness: Brightness.dark
          ));
          return ScreenUtilInit(
            designSize: const Size(400,800),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Amisa K.C.T',
              themeMode: ThemeMode.dark,
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  backgroundColor: AppColors.scaffoldBackground,
                  elevation: 0.0
                ),
                scaffoldBackgroundColor: AppColors.scaffoldBackground,
                  primaryColor: AppColors.scaffoldBackground,
                  fontFamily: "Montserrat-Black",

              ),
              home:   LayoutScreen(),
            ),
          );
        },
      ),
    );
  }
}


