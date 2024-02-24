import 'package:flutter/cupertino.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.children,
    required this.verticalPadding,
  });

  final List<Widget> children;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: verticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
