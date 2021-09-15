class BaseFunctions {
  static String? getPublishedTime(String value) =>
      '${value.substring(11, 16)} / ${value.substring(8, 10)}.${value.substring(5, 7)}.${value.substring(0, 4)}';
}
