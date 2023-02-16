import 'dart:convert';
import 'package:or_en_pepite/src/models/models.dart';
import 'package:flutter/services.dart';

class ResourcesServices {
  /// To fetch al ressources from a location (local or remote)
  Future<Map<String, dynamic>?> getRessources(
      ResourceLocation resourceLocation) async {
    var resssource = await rootBundle.loadString(resourceLocation.path);
    return json.decode(resssource) as Map<String, dynamic>?;
  }

  /// to update Json file
  _updateJsonFile(data, filePath) async {
    var fileStrData = await rootBundle.loadString(filePath);
    var fileData = json.decode(fileStrData) as Map<String, dynamic>;
    
  }

  addToFavorite(ResourceType resourceType, resource) {}
}
