import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_auth/src/features/home/presentation/bloc/home_bloc/bloc/home_event.dart';
import 'package:sms_auth/src/features/home/presentation/bloc/home_bloc/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<ChangePageEvent>(_changePage);
  }

  void _changePage(ChangePageEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(currentPage: event.page));
  }
}
