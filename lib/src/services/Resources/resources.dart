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

   
}
