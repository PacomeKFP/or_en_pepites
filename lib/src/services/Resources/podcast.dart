import 'package:or_en_pepite/src/models/models.dart';
import 'package:or_en_pepite/src/services/Resources/resources.dart';

class PodcastResource extends ResourcesServices {
  PodcastResource._();

  /// pour recupperer le podcast distants
  static Future<List<PodcastModel>> getRemotePodcasts() async => [
        {
          "id":"brwewqiDjLQB",
          "title": "Qui -suis je ?",
          "path": "https://audio.ausha.co/brwewqiDjLQB.mp3",
          "shareLink":"https://podcast.ausha.co/or-en-pepites/qui-suis-je",
          "description":
              "Bienvenue sur le podcast « Or en pépites » Cette plateforme se propose d’aller à la rencontre de personnalités, de parcours atypiques et discrètes qui brillent par leurs réalisations, leurs accomplissements et leurs dévouements à\nla fois envers leurs prochains et à travers le métier qu’ils ont choisi d’exercer. A travers leurs récits et leurs biographies, nous essayerons de comprendre la construction de leurs identités et trajectoires professionnelles en nous basant sur leurs caractéristiques personnelles.  Qui sont-ils?D’où viennent-ils ? Que font-ils ? Pourquoi et comment le font-ils ?  Quel impact produisent-ils autour d’eux ?  Quel regard portent-ils sur la société actuelle ?  Quels messages ont-ils envie de faire passer à travers leurs actions ?  Autant de questions qui nous aideront à mieux comprendre et connaitre certains métiers, rôles ou fonctions sous un angle différent, sous un angle humain. Ici nous ne parlerons pas de diplômes, de statut social, de postes hiérarchiques ou alors très peu, nous nous intéressons au rapport personnel   que ces individus ont choisi d’entretenir ou entretiennent avec leurs activités distinctes.  Pour résumer, qu’est ce qui fait qu’ils sont ce qu’ils font ? Comment transforment-ils en lingot d’or des petites pépites ? comment construisent-ils leur talent tout au long de leur carrière?"
        }
      ].map((jsonPodcast) => PodcastModel.fromJson(json: jsonPodcast)).toList();

}
