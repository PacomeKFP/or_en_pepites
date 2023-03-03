library models;

import 'dart:convert';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:or_en_pepite/src/core/router/app_router.dart';
import 'package:or_en_pepite/src/services/Resources/download_helper.dart';
import 'package:or_en_pepite/src/services/Resources/notification.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/services/Resources/manager.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

part 'types/auth_types.dart';
part 'types/typedef.dart';
part 'types/extensions.dart';

part 'data/user.model.dart';
part 'data/podcast.model.dart';
part 'data/video.model.dart';
part 'data/ressources.dart';

enum FileSource {
  network, //0
  local; //1
}

enum DataType {
  podcast,
  video,
  newsletter;

  String get key => "${name}s";
}

///Where: downloads, favorites or history
enum DataLocals {
  downloads,
  favorites,
  history;

  String get key => name;
}

abstract class Downloadable {
  Future<File?> download();
}

abstract class DataModel {
  /// the title attached to the media
  final String title;

  /// The description attached to the media
  final String description;

  /// The link we will use to share the resource in social networks
  final String? shareLink;

  /// the source of the path
  final FileSource source;

  /// [path] the path to the resource (image, audio or video)
  /// if the rsource is a vide, we will use the link
  final String path;

  DataModel({
    required this.title,
    required this.description,
    this.shareLink,
    required this.path,
    this.source = FileSource.network,
  });

  Map<String, String> toJson() => {
        'path': path,
        'title': title,
        'description': description,
        'shareLink': shareLink ?? path,
      };

  static DataModel fromEntry(MapEntry<String, Map<String, String>> entry, FileSource source) {
    switch (entry.key) {
      case 'podcasts':
        return PodcastModel.fromJson(
            json: entry.value, source: source);
      case 'videos':
        return VideoModel.fromJson(json: entry.value, source: source);
      // case 'newsletters':
      //   return PodcastModel.fromJson(json: entry.value);
      default:
        return PodcastModel.fromJson(
            json: entry.value, source: FileSource.local);
    }
  }

  PageRouteInfo pageRoute();

  Future<void> download();
  Future<void> addToFavorite();
  Future<void> addToHistory();
}
