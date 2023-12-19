import '../../../view/screens_path.dart';

// ignore: must_be_immutable
class CustomProductAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(sizeHeight.h);

 // final VoidCallback onTap;
  final double sizeHeight;
  final String title;
  FontWeight? fontWeight;



  CustomProductAppbar({
    super.key,
    this.sizeHeight = 170,

    this.title = " ",
    this.fontWeight,
   // required this.onTap,


  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeHeight.h,
      child: Stack(
        children: [
          Positioned(
            bottom: 10.h,
            left: 50.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                 // color: Colors.red,

                  width: 310.w,
                  child: Text(
                    title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat"
                    ),

                  ),
                ),
                SizedBox(height: 10.h,),
                Text(
                  "We have many choices for you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Montserrat-Black"
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40.h,
            left: 20.w,
            child: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),),
          ),
        ],
      ),
    );
  }}
