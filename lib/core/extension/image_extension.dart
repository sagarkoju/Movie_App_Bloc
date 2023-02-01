extension ImageExtension on String {
  String getImageUrl() {
    return 'https://image.tmdb.org/t/p/original${this}';
  }
}
