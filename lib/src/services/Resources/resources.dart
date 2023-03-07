import 'dart:convert';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/models/models.dart';
import 'package:flutter/services.dart';

class ResourcesServices {

  /// pour reccuperer tous les id de videos
  static Future<List<String>> getVideosIds() async =>
      ["https://youtu.be/sPNWQzHHm88"];

  /// pour reccuperer les news letters distantes
  static Future<List<Map<String, dynamic>>> geNewsLetters() async => [
        {
          "id": "1",
          "title": "Incertititudes: Antifragilité et Authenticité.",
          "images": [
            "assets/images/newsletter0.png",
            "assets/images/newsletter1.png"
          ],
          "paragraphs": AppTexts.newsletter1
        }
      ];
}
