part of models;

class VideoModel extends Downloadable {
  final FileSource source;

  VideoModel._internal(
      {required super.path,
      required super.shareLink,
      required super.description,
      required super.id,
      required super.title,
      required this.source});

  factory VideoModel.fromJson(
          {required Map<String, dynamic> json,
          FileSource source = FileSource.network}) =>
      VideoModel._internal(
          path: json['path'],
          shareLink: json['shareLink'],
          description: json['description'],
          id: json['id'],
          title: json['title'],
          source: source);

  factory VideoModel.fromVideo(Video video) => VideoModel._internal(
      path: video.url,
      shareLink: video.url,
      description: video.description,
      id: video.id.value,
      title: video.title,
      source: FileSource.network);

  @override
  DataType get dataType => DataType.video;
  @override
  PageRouteInfo get pageRoute=>VideoDetailsRoute(video: this);

  @override
  Future<void> download() async {
    print("Downloads Not implemented Yet");
  }
}
