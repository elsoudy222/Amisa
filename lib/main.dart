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
          return ScreenUtilInit(
            designSize: const Size(400,800),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Amisa K.C.T',
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  color: AppColors.scaffoldBackground,
                  elevation: 0.0
                ),
                scaffoldBackgroundColor: AppColors.scaffoldBackground,
               // primaryColor: AppColors.scaffoldBackground,
                 //primarySwatch: Colors.red
                  fontFamily: "Montserrat-Black",


              ),
              home: LayoutScreen(),
            ),
          );
        },
      ),
    );
  }
}


