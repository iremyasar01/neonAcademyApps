class AppModel {
  final String appName;
  final String artistName;
  final String artworkUrl100;
  final String releaseDate;
  final String appCategory;
  final String storeURL;

  AppModel({
    required this.appName,
    required this.artistName,
    required this.artworkUrl100,
    required this.releaseDate,
    required this.appCategory,
    required this.storeURL,
  });

  factory AppModel.fromJson(Map<String, dynamic> json) {
    return AppModel(
      appName: json['trackName'] ?? 'Unknown App',
      artistName: json['artistName'] ?? 'Unknown Developer',
      artworkUrl100: json['artworkUrl100'] ?? '',
      releaseDate: json['releaseDate'] ?? 'Unknown Date',
      appCategory: json['primaryGenreName'] ?? 'Uncategorized',
      storeURL: json['trackViewUrl'] ?? '',
    );
  }

  String get highResArtwork => artworkUrl100.replaceAll('100x100bb', '500x500bb');
}