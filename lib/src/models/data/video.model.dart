part of models;

class VideoModel extends DataModel {
  final String videoId;

  YoutubeExplode youtubeExplode = YoutubeExplode();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  VideoModel(
      {required this.videoId,
      required super.path,
      required super.title,
      required super.description,
      super.shareLink,
      super.source});

  factory VideoModel.fromJson(
          {required Map<String, String> json,
          FileSource source = FileSource.network}) =>
      VideoModel(
          videoId: json['videoId']!,
          description: json['description']!,
          path: json['path']!,
          title: json['title']!,
          shareLink: json['shareLink']!,
          source: source);

  factory VideoModel.fromVideo(Video video) => VideoModel(
        videoId: video.id.value,
        path: video.url,
        title: video.title,
        shareLink: video.url,
        source: FileSource.network,
        description: video.description,
      );
  @override
  PageRouteInfo pageRoute() => VideoDetailsRoute(video: this);

  @override
  Future<void> addToFavorite() async {
    DataManager dataManager = await DataManager.create();
    await dataManager.addTo(
        to: DataLocals.favorites,
        item: {
          "videoId": videoId,
          "title": title,
          "description": description,
          "path": path,
          "shareLink": shareLink ?? "https://youtu.be/$videoId",
        },
        type: DataType.video);
  }

  @override
  Future<void> addToHistory() async {
    DataManager dataManager = await DataManager.create();
    await dataManager.addTo(item: {
      "videoId": videoId,
      "title": title,
      "description": description,
      "path": path,
      "shareLink": shareLink ?? "https://youtu.be/$videoId",
    }, type: DataType.video);
  }

  @override
  Future<void> download() async {
    try {
      DownloaderHelper helper = DownloaderHelper();
      String? filePath = await helper.downloadMp4(VideoId(videoId), title);

      (await DataManager.create()).addTo(
          to: DataLocals.downloads,
          item: toJson()
            ..update('path', (value) => filePath!)
            ..update('videoId', (value) => videoId, ifAbsent: () => videoId),
          type: DataType.video);
    } catch (e) {
      print("=====================Video Download Error======================");
      print(e);
      print("=====================Video Download Error======================");
    }
  }
}
