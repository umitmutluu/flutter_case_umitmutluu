final class WidgetNotFoundException<T, R> implements Exception {

  WidgetNotFoundException(this.data);
  final R data;
  @override
  String toString() {
    return 'Class Not find on this State: $T, $data';
  }
}
