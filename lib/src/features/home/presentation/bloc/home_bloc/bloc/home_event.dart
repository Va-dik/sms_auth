import 'package:sms_auth/src/features/home/components/enums/home_pages_enum.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class ChangePageEvent extends HomeEvent {
  final HomePagesEnum page;

  const ChangePageEvent({required this.page});
}
