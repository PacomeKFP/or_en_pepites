part of models;

abstract class DataModel {
  final String id;
  final String title;

  DataModel({required this.id, required this.title});

  Map<String, dynamic> toJson() => {'id': id, 'title': title};

  Future<void> addToHistory() async {
    DataManager dataManager = await DataManager.create();
    await dataManager.addTo(item: toJson(), type: dataType);
  }

  Future<void> addToFavorites() async {
    DataManager dataManager = await DataManager.create();
    await dataManager.addTo(
        item: toJson(), type: dataType, to: DataLocals.favorites);
  }

  static DataModel fromEntry(MapEntry entry, FileSource fileSource) {
    switch (entry.key) {
      case 'podcasts':
      case 'podcast':
        return PodcastModel.fromJson(json: entry.value, source: fileSource);
      case 'videos':
      case 'video':
        return VideoModel.fromJson(json: entry.value, source: fileSource);

      case 'newsletters':
      case 'newsletter':
        return NewsletterModel.fromJson(json: entry.value);
      default:
        return PodcastModel.fromJson(json: entry.value, source: fileSource);
    }
  }

  DataType get dataType;
  PageRouteInfo get pageRoute;
}
