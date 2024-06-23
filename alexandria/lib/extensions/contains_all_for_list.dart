extension ContainsAll<T> on List<T> {
  bool containsAll(Iterable<T> elements) {
    Set<T> set = Set<T>.from(this);
    return elements.every(set.contains);
  }
}
