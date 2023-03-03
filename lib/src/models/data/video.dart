part of models;

class Podcast extends DataModel {
  Podcast({
    required super.path,
    required super.title,
    required super.description,
    super.shareLink,
    super.source
  });

  @override
  Future<void> addToFavorite() async {
    // TODO: implement addToFavorite
    throw UnimplementedError();
  }

  @override
  Future<void> addToHistory() async {
    // TODO: implement addToHistory
    throw UnimplementedError();
  }

  @override
  Future<void> download() async {
    // TODO: implement download
    throw UnimplementedError();
  }
}
