extension IterableX<T> on Iterable<T> {
  /// Separate every element of list by [separator].
  /// Typically used in widgets.
  List<T> separated(T separator) {
    final res = <T>[];
    final it = iterator;

    if (it.moveNext()) {
      res.add(it.current);
    }

    while (it.moveNext()) {
      res.add(separator);
      res.add(it.current);
    }

    return res;
  }
}
