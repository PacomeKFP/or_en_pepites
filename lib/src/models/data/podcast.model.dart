part of models;

class PodcastModel extends DataModel {
  PodcastModel._internal(
      {required super.path,
      required super.title,
      required super.description,
      super.shareLink,
      super.source});

  factory PodcastModel.fromJson(
          {required Map<String, String> json,
          FileSource source = FileSource.network}) =>
      PodcastModel._internal(
          description: json['description']!,
          path: json['path']!,
          title: json['title']!,
          shareLink: json['shareLink']!,
          source: source);
  @override
  PageRouteInfo pageRoute() => PodcastDetailsRoute(podcast: this);

  @override
  Future<void> addToFavorite() async {
    // create a dataManager Object
    DataManager dataManager = await DataManager.create();
    // adding it to the fav list
    await dataManager.addTo(
        to: DataLocals.favorites, item: toJson(), type: DataType.podcast);
  }

  @override
  Future<void> addToHistory() async {
    DataManager dataManager = await DataManager.create();
    await dataManager.addTo(item: toJson(), type: DataType.podcast);
  }

  @override
  Future<void> download() async {
    /// it will give the path to the store-dir
    DataManager dataManager = await DataManager.create();

    Dio dio = Dio();
    try {
      //path to audio files
      var dir = Directory(dataManager.audio);
      if (!(await dir.exists())) dir.create();
      String filePath = "$dir/$title.mp3";
      await dio
          .download(
            path,
            filePath,
            onReceiveProgress: (rec, total) {
              print("Rec: $rec , Total: $total");
               LocalNotificationService.showProgressNotification(
                progrss: (rec*100/total).ceil(),
                maxProgress: 100,
                title: "Téléchargement en cours...",
                body: title,
              );
            },
          )
          .then((value) => print("Download ends \n\t--> $value"))
          .onError((error, stackTrace) async => await dataManager.test(
              data: json.encode(error), fileName: "DownloadError.json"));
      
      await dataManager.addTo(
          to: DataLocals.downloads,
          item: toJson()
            ..update('path', (value) => filePath, ifAbsent: () => filePath),
          type: DataType.podcast);

      await LocalNotificationService.showNotification(
                title: "Talent Télechargé !", body: title);
    } catch (e) {
      print(e);
    }
  }
}
