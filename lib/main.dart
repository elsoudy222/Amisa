import 'package:amisa/view/screens/splash_screen/splash_screen.dart';
import 'package:amisa/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:amisa/view_model/database/local/cache_helper.dart';
import 'package:amisa/view_model/database/local/observer.dart';
import 'package:amisa/view_model/database/network/dio_helper.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amisa/view_model/cubits/layout_cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/config/config_path.dart';

//TODO: 1: Fix Error for navigation in Kitchens Type.
//TODO: 2: Change Video Player for show rooms.
//TODO: 3:
//TODO: 4:

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){


    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => LayoutCubit()
            ..getHomeData()
            ..getTimeline()
            ..getDesignHub()
            ..getShowRooms(),
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
              statusBarBrightness: Brightness.dark));
          return ScreenUtilInit(
            designSize: const Size(400, 800),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp(
              builder: EasyLoading.init(),
              debugShowCheckedModeBanner: false,
              title: 'Amisa K.C.T',
              themeMode: ThemeMode.dark,
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    centerTitle: true,
                    backgroundColor: AppColors.scaffoldBackground,
                    iconTheme: IconThemeData(color: Colors.white,),
                    elevation: 0.0,
                ),
                scaffoldBackgroundColor: AppColors.scaffoldBackground,
                primaryColor: AppColors.white,
                // primarySwatch: Colors.grey,
                 fontFamily: "Montserrat-Black",
               // textTheme: GoogleFonts.montserratTextTheme(),
              ),
              home: const SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}
