import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:sms_auth/src/features/sign_up/presentation/constants/sign_up_colors_constant.dart';
import 'package:sms_auth/src/features/sign_up/presentation/pages/sign_up_page/1_sign_up_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(
        barBackgroundColor: SignUpColorsConstant.scaffoldBgColor,
        scaffoldBackgroundColor: SignUpColorsConstant.scaffoldBgColor,
      ),
      title: 'Sms Auth',
      home: SignUpPage(),
    );
  }
}
