import 'package:sms_auth/src/core/components/enums/screen_states_enum.dart';
import 'package:sms_auth/src/features/home/components/enums/home_pages_enum.dart';
import 'package:sms_auth/src/features/home/data/models/page_model.dart';

class HomeState {
  final HomePagesEnum currentPage;
  final PagesModel pagesModel = PagesModel();
  final ScreenStatesEnum screenState;

   HomeState( {
    this.currentPage = HomePagesEnum.myProjects,
    this.screenState = ScreenStatesEnum.ready,
  });

  HomeState copyWith({
    HomePagesEnum? currentPage,
    ScreenStatesEnum? screenState,
  }) {
    return HomeState(
      currentPage: currentPage ?? this.currentPage,
      screenState: screenState ?? this.screenState,
    );
  }
}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState({required this.errorMessage});
}
