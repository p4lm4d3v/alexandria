enum FireCollection {
  dbs('dbs'),
  music('music'),
  movies('movies'),
  shows('shows'),
  books('books');

  final String path;
  const FireCollection(this.path);
}
