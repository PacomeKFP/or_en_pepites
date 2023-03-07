import 'package:or_en_pepite/src/models/models.dart';
import 'package:or_en_pepite/src/services/Resources/resources.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VideoRessource extends ResourcesServices {

  static List<Future<Video>?> getVideos() {
    YoutubeExplode yt = YoutubeExplode();
    List ids = ["sPNWQzHHm88"];
    List<Future<Video>> res = ids.map((id) =>  yt.videos.get(id)).toList();

    print(res.length);
    return res;
  }

  String remoteVideoLink(String videoId) => "youtu.be/$videoId";
}
