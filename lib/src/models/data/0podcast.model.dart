// part of models;



// class PodcastModel implements Downloadable{
//   String homePath = "c:/workspace/paid/downloader/res/";

//   /// The url of the podcast resource
//   final String url;
//   final String shareLink;

//   final String? localPath;

//   final FileSource fileSource;

//   /// The title of the podcast resource
//   final String title;

//   /// The description binded with the podcast resource
//   final String description;

//   PodcastModel({
//     required this.url,
//     required this.shareLink,
//     required this.title,
//     this.localPath,
//     this.fileSource = FileSource.network,
//     required this.description,
//   });

//   factory PodcastModel.
//   fromJson(Map<String, String> j                                                                             son) => PodcastModel(
//     shareLink:json['shareLink']!,
//         url: json['url']!,
//         title: json['title']!,
//         description: json['description']!,
//       );
    
//   @override
//   Future<File?> download() async {
//     //Download file
//     if (fileSource == FileSource.local) {
//       print("Ce fichier a deja ete telechargé");
//       return null;
//     }
//     Dio dio = Dio();
//     try {
//       //path to audio files
//       var dir = Directory("$homePath/audio");
//       if (!(await dir.exists())) dir.create();
//       await dio.download(
//         url,
//         "$dir/$title",
//         onReceiveProgress: (rec, total) {
//           print("Rec: $rec , Total: $total");
//         },
//       ).then((value) => print("Download ends \n\t--> $value"));

//       return File("$dir/$title");
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

// }
