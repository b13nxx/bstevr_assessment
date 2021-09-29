String getTimePassed(DateTime date) {
  Duration difference = DateTime.now().difference(date);

  if (difference.inHours >= 1) {
    return "${difference.inHours}h ${difference.inMinutes - (difference.inHours * 60)}m ${difference.inSeconds - (difference.inMinutes * 60)}s";
  } else if (difference.inMinutes >= 1) {
    return "${difference.inMinutes}m ${difference.inSeconds - (difference.inMinutes * 60)}s";
  }

  return "${difference.inSeconds}s";
}
