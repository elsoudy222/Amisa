

import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/photo_view.dart';
import 'package:amisa/view/screens/home/widgets/custom_new_arrivals/custom_new_arrivals_card.dart';
import 'package:amisa/view/screens_path.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: const Text("AppStrings.collections"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250.h,
              width: double.infinity,
              // color: Colors.grey,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    news,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap:  () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PhotoViewScreen();
                          },
                        ),
                      );
                    },
                    child:  CustomNewArrivalsCard(title: "", subtitle: "", image: '',));
              },
            ),
          ],
        ),
      ),
    );
  }
}
