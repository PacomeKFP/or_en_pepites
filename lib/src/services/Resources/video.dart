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

  static Stream<Video> getVideos() async* {
    List<String> ids = (await ResourcesServices.getRessources(
        ResourceLocation.remote))!['videos'];

    YoutubeExplode yt = YoutubeExplode();
    for (String id in ids) {
      Video video = await yt.videos.get("https://youtu.be/$id");
      yield video;
    }
  }

  String remoteVideoLink(String videoId) => "youtu.be/$videoId";
}
