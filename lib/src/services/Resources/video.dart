import 'package:or_en_pepite/src/models/models.dart';
import 'package:or_en_pepite/src/services/Resources/resources.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VideoRessource extends ResourcesServices {
  final String videoId;
  late Video video;

  YoutubeExplode yt = YoutubeExplode();
  VideoRessource._internal(this.videoId) {}

  Future<List<String>> getRemoteVideosId() async {
    var remoteResources =
        await ResourcesServices.getRessources(ResourceLocation.remote);
    return remoteResources!['videos'] as List<String>;
  }

  Future<Video> getVideoDetails(String videoId) async {
    Video video = await yt.videos.get(remoteVideoLink(videoId));
    return video;
  }

  static List<Future<Video>?> getVideos() {
    YoutubeExplode yt = YoutubeExplode();
    List ids = ["sPNWQzHHm88"];
    List<Future<Video>> res = ids.map((id) =>  yt.videos.get(id)).toList();

    print(res.length);
    return res;
  }

  String remoteVideoLink(String videoId) => "youtu.be/$videoId";
}
