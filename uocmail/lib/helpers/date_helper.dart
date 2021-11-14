String formatDate(DateTime date) {
  //return "${date.day}/${date.month}/${date.year}";
  return date.toIso8601String().split('T').first;
}
