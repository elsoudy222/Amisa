// Packages:
export 'package:flutter/material.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:dio/dio.dart';
export 'package:flutter_easyloading/flutter_easyloading.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:flutter/services.dart';
export 'dart:async';
export 'package:google_fonts/google_fonts.dart';
export 'firebase_options.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
export 'package:flutter_iconly/flutter_iconly.dart';
export 'package:fluttertoast/fluttertoast.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:flutter_svg/svg.dart';
export 'package:carousel_slider/carousel_slider.dart';
export 'package:dots_indicator/dots_indicator.dart';
export 'package:smooth_page_indicator/smooth_page_indicator.dart';
export 'package:photo_view/photo_view.dart';
export 'package:readmore/readmore.dart';
export 'package:url_launcher/link.dart';
export 'package:appinio_video_player/appinio_video_player.dart';

/////////////////////// Screens: //////////////////////
//1- About Us  :
export 'view/screens/about_us/about_us_screen.dart';
export 'view/screens/about_us/widgets/about_us_wigdet.dart';
//2- Categories :
export 'view/screens/category/abode_brand_types/abode_brand_types.dart';
export 'view/screens/category/abode_pronteau_types/abode_pronteau_types.dart';
export 'view/screens/category/kitchens_type/kitchens_sub_category_type.dart';
export 'view/screens/category/kitchens_type/widgets/custom_kitchen-Type_card.dart';
export 'view/screens/category/main_category/main_category_screen.dart';
export 'view/screens/category/main_category/widgets/carousel_item_card.dart';
export 'view/screens/category/sub_category/sub_category_screen.dart';
//3- Design Hub :
export 'view/screens/design_hub/design_hub_screen.dart';
// 4- Home :
export 'view/screens/home/home_screen.dart';
export 'view/screens/home/widgets/custom_discounts/custom_discount_widget.dart';
export 'view/screens/home/widgets/custom_header_widget/custom_header_widget.dart';
export 'view/screens/home/widgets/custom_new_arrivals/custom_new_arrivals_card.dart';
export 'view/screens/home/widgets/custom_news_card/custom_news_card.dart';
export 'view/screens/home/widgets/custom_text_title/custom_title_text.dart';
//5- Layout:
export 'view/screens/layout/layout_screen.dart';
//6- Menu:
export 'view/screens/menu/menu_screen.dart';
export 'view/screens/menu/widgets/custom_expansion_tile.dart';
export 'view/screens/menu/widgets/custom_menu_card.dart';
export 'view/screens/menu/widgets/custom_menu_header.dart';
//7- News :
export 'view/screens/news/all_news/all_news_screen.dart';
export 'view/screens/news/news_details/news_details_screen.dart';
export 'view/screens/news/widgets/custom_all_news.dart';
//8 Onboarding :
export 'view/screens/onboarding/onboarding_screen.dart';
//9- Product Details :
export 'view/screens/product_details/product_details_screen.dart';
export 'view/screens/product_details/widgets/custom_collection_widget.dart';
export 'view/screens/product_details/all_collections/all_collection_screen.dart';
export 'view/screens/product_details/collection_details/collection_details_screen.dart';
export 'view/screens/product_details/photo_view/photo_view.dart';
//10- Products:
export 'view/screens/products/products_screen.dart';
export 'view/screens/products/abode_taps_products_screen.dart';
//11- Profile:
export 'view/screens/profile/profile_screen.dart';
export 'view/screens/profile/widgets/custom_timeline_year.dart';
export 'view/screens/profile/widgets/social_links_widget.dart';
//12- Search
export 'view/screens/search/search_screen.dart';
//13- Showroom :
export 'view/screens/showroom_screen/showroom_screen.dart';
export 'view/screens/showroom_screen/video_screen.dart';
//14- Splash Screen:
export 'view/screens/splash_screen/splash_screen.dart';

////////////////////// View Model ////////////////////
// Cubits:
//export 'package:amisa/view_model/cubits/home_cubit/home_state.dart';
export 'package:amisa/view_model/cubits/home_cubit/home_cubit.dart';
export 'package:amisa/view_model/cubits/layout_cubit/layout_cubit.dart';
// export 'package:amisa/view_model/cubits/layout_cubit/layout_state.dart';
 export 'package:amisa/view_model/database/local/cache_helper.dart';
 export 'package:amisa/view_model/database/local/observer.dart';
 export 'package:amisa/view_model/database/network/dio_helper.dart';
 export 'package:amisa/view_model/database/network/end_points.dart';


//----------------------------------------------------------------
// CORE :
//1- Components
export '../../../core/components/components.dart';
export '../../../core/components/custom_appbars/custom_kitchen_type_appbar.dart';
export '../../../core/components/custom_appbars/custom_products-appbar.dart';
export '../../../core/components/custom_appbars/custom_pronteau_types_appbar.dart';
export '../../../core/components/custom_appbars/custom_sub_category_appbar.dart';
export '../../../core/components/custom_bottom_navbar/custom_bottom_navbar.dart';
export '../../../core/components/custom_sub_category_card/custom_sub_category_card.dart';
export '../../../core/components/custom_text_form_field/custom_text_form_filed.dart';
export '../../../core/components/show_all_button/show_all_button.dart';
export '../../../core/components/toast/toast.dart';

//2- Config :
export 'package:amisa/core/config/const/app_strings.dart';
export 'package:amisa/core/config/const/app_colors.dart';
export 'package:amisa/core/config/const/extensions.dart';
export 'package:amisa/core/config/const/functional.dart';
//----------------------------------------------------------------
//Models :

export 'package:amisa/model/brand_details_model.dart';
export 'package:amisa/model/category_model.dart';
export 'package:amisa/model/main_category_model.dart';
// export 'package:amisa/model/home_model.dart';
export 'package:amisa/model/collection_model.dart';
export 'package:amisa/model/design_hub_model.dart';
export 'package:amisa/model/onboarding_model.dart';
export 'package:amisa/model/product_details_model.dart';
export 'package:amisa/model/products_model.dart';
export 'package:amisa/model/search_model.dart';
export 'package:amisa/model/showroom_model.dart';
export 'package:amisa/model/timeline_model.dart';