import 'package:amisa/core/const/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 450.h,
                  width: double.infinity,
                  
                  decoration: BoxDecoration(
                   color: Colors.black.withOpacity(.5),

                  ),
                  child: Container(
                    height: 450.h,
                    decoration:  BoxDecoration(
                      image: DecorationImage(
                        colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.colorBurn),
                        image: const AssetImage(header1),
                        fit: BoxFit.cover,

                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 30.w,
                          bottom: 55.h,
                          child: Row(
                           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 70.h,
                                width: 215.w,
                                child: const Text(
                                  "THE LUXURY\nDESTINATION",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                              SizedBox(width: 75.w,),
                              InkWell(
                                onTap: () {
                                  print(" **************** (Tapped) ****************");
                                },
                                child: Container(
                                  height: 50.h,
                                  width: 50.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(.2)
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                    size: 25.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 55.h,
                          left: 160.w ,
                          right: 160.w ,
                          child: Image(image: AssetImage(appLogo),height: 65.h,width: 70.w,),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
