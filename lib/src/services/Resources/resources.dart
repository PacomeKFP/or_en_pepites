import 'dart:convert';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/models/models.dart';
import 'package:flutter/services.dart';

class ResourcesServices {
  /// To fetch al ressources from a location (local or remote)
  static Future<Map<String, dynamic>?> getRessources(
      ResourceLocation resourceLocation) async {
    var resssource = await rootBundle.loadString(resourceLocation.path);
    return json.decode(resssource) as Map<String, dynamic>?;
  }

  /// pour ajouter une ressource aux favoris
  addToFavorite(ResourceType resourceType, resource) {}

    /// pour reccuperer tous les id de videos
  static Future<List<String>> getVideosIds() async =>
      ["https://youtu.be/sPNWQzHHm88"];

      /// pour reccuperer les news letters distantes
  static Future<List<Map<String, String>>> geNewsLetters() async => [
        {
          "title": "Newsletter 1",
          "content": AppTexts.newsletter1,
        }
      ];

      /// pour recucperer le podcast distants
  static Future<List<Map<String, String>>> getRemotePodcasts() async => [
        {
          "title": "Qui -suis je ?",
          "file_url": "https://audio.ausha.co/brwewqiDjLQB.mp3",
          "description":
              "Description Bienvenue sur le podcast « Or en pépites » Cette plateforme se propose d’aller à la rencontre de personnalités, de parcours atypiques et discrètes qui brillent par leurs réalisations, leurs accomplissements et leurs dévouements à\nla fois envers leurs prochains et à travers le métier qu’ils ont choisi d’exercer. A travers leurs récits et leurs biographies, nous essayerons de comprendre la construction de leurs identités et trajectoires professionnelles en nous basant sur leurs caractéristiques personnelles.  Qui sont-ils?D’où viennent-ils ? Que font-ils ? Pourquoi et comment le font-ils ?  Quel impact produisent-ils autour d’eux ?  Quel regard portent-ils sur la société actuelle ?  Quels messages ont-ils envie de faire passer à travers leurs actions ?  Autant de questions qui nous aideront à mieux comprendre et connaitre certains métiers, rôles ou fonctions sous un angle différent, sous un angle humain. Ici nous ne parlerons pas de diplômes, de statut social, de postes hiérarchiques ou alors très peu, nous nous intéressons au rapport personnel   que ces individus ont choisi d’entretenir ou entretiennent avec leurs activités distinctes.  Pour résumer, qu’est ce qui fait qu’ils sont ce qu’ils font ? Comment transforment-ils en lingot d’or des petites pépites ? comment construisent-ils leur talent tout au long de leur carrière?"
        }
      ];
}
