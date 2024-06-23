extension ToDateTime on String {
  DateTime toDateTime() {
    // Split the input string by the dash separator
    List<String> parts = split('-');
    if (parts.length != 3) {
      throw const FormatException('Invalid date format, expected "dd-mm-yyyy"');
    }

    // Parse the day, month, and year
    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);

    // Create and return a DateTime object
    return DateTime(year, month, day);
  }
}
