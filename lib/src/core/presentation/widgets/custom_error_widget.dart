import 'package:flutter/cupertino.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Ошибка загрузки данных"));
  }
}
