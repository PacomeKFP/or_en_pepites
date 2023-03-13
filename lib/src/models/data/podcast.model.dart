part of models;

class PodcastModel extends Downloadable {
  final FileSource source;

  PodcastModel._internal(
      {required super.path,
      required super.shareLink,
      required super.description,
      required super.id,
      required super.title,
      required this.source});

  factory PodcastModel.fromJson(
          {required Map<String, dynamic> json,
          FileSource source = FileSource.network}) =>
      PodcastModel._internal(
          path: json['path'],
          shareLink: json['shareLink'],
          description: json['description'],
          id: json['id'],
          title: json['title'],
          source: source);

  @override
  DataType get dataType => DataType.podcast;

  @override
  PageRouteInfo get pageRoute => PodcastDetailsRoute(podcast: this);

  @override
  Future<void> download() async {
    if (source == FileSource.local) {
      return;
    }
    try {
      // double percent = 0;
      DataManager dataManager = await DataManager.create();
      Dio dio = Dio();
      String filePath = join(dataManager.audio, "$title.mp3");
      await dio.download(path, filePath, onReceiveProgress: (count, total) {
        // if (count / total - percent > 0.1) {
        //   percent = count / total;
        //   callback(percent * 100);
        // }
        print("Done: $count on $total");
      }, options: Options(receiveTimeout: const Duration(minutes: 2)));

      await addToDownloads(localFilePath: filePath);
    } catch (e) {
      //TODO: implement this
    }
  }
}
