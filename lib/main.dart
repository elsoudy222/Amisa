import 'package:amisa/screens_path.dart';


//TODO: 1: Edit OnBoarding Screen Details .(Next Step),
//TODO: 2: Edit Abode Types Navigation .(Next Step)
//TODO: 3:
//TODO: 4:

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );



  runApp( const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key, });

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

                textTheme: GoogleFonts.montserratTextTheme(),
              ),
              home: const SplashScreen(),
             // home: OnBoardingScreen(),
            ),
          );
        },
      ),
    );
  }
}
