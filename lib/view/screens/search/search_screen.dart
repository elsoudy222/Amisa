import 'package:amisa/core/components/custom_text_form_field/custom_text_form_filed.dart';
import 'package:amisa/core/config/config_path.dart';
import 'package:amisa/view/screens_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchController= TextEditingController();
   SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(10.0.r),
          child: Column(
            children: [
              TextFormFieldsCustom(
                controller: searchController,
                keyboardType: TextInputType.text,
                hintText: "What you’re looking for?",
                prefixIcon: const Icon(IconlyBold.search,color: AppColors.white,size: 20,),

              ),
              Center(
                child: Text("Search Screen",style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
