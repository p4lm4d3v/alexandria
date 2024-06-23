Future<void> wait({required double seconds}) async {
  await Future.delayed(Duration(microseconds: (seconds * 1000000).floor()));
}
