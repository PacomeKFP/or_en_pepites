part of models;

abstract class Downloadable extends DataModel {
  final String path;
  final String shareLink;
  final String description;

  Downloadable(
      {required this.path,
      required this.shareLink,
      required this.description,
      required super.id,
      required super.title});

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addEntries(
      [
        MapEntry('path', path),
        MapEntry('shareLink', shareLink),
        MapEntry('description', description),
      ],
    );

  Future<void> addToDownloads({required String localFilePath}) async {
    DataManager dataManager = await DataManager.create();
    await dataManager.addTo(
        to: DataLocals.downloads,
        item: toJson()..update('path', (value) => localFilePath),
        type: dataType);
  }

  Future<void> download();
}
