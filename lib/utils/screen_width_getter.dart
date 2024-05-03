mixin ScreenWidthGetter {
  Future<double> _whenNotZero(Stream<double> source) async {
    await for (double value in source) {
      if (value > 0) {
        return value;
      }
    }
    return 0;
  }

  Future<double> getScreenWidth(Stream<double> source) async {
    return await _whenNotZero(source);
  }
}
