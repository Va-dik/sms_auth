extension StringManipulation on String {
  String getNormalPhoneNumber() {
    final String stringWithoutBrackets = replaceAll(RegExp(r'[(){}\[\]]'), '');

    return stringWithoutBrackets.replaceAll(RegExp(r'\s+'), '');
  }
}
