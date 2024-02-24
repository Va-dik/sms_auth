extension StringListExtension on List<String> {
  bool allElementsContainDigits() {
    return every((element) => double.tryParse(element) != null);
  }
}