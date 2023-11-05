import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view/screens_path.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  final ScrollController scrollController = ScrollController();

  final List<Map<String, dynamic>> categoryCard = [
    {
      'title': 'kitchens',
      'desc': "The Number One Italian Kitchen Company You Will Find Here.",
    },
    {
      'title': 'Ceramics',
      'desc': "The Number One Italian Kitchen Company You Will Find Here.",
    },
    {
      'title': 'Ceramics',
      'desc': "The Number One Italian Kitchen Company You Will Find Here.",
    },
  ];

  final List<String> newsDesc = [
    "The Number One Italian Kitchen Company You Will Find Here.",
    'We were pleased to welcome you in The Gulf Bride Show at The World Trade Center.Stay tuned for our upcoming events.',
    'We were pleased to welcome you in The Gulf Bride Show at The World Trade Center.Stay tuned for our upcoming events.',
    'We were pleased to welcome you in The Gulf Bride Show at The World Trade Center.Stay tuned for our upcoming events.',
  ];
}
