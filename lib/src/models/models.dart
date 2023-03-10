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
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:or_en_pepite/src/core/configs/configs.dart';
import 'package:or_en_pepite/src/services/Resources/manager.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

part 'types/auth_types.dart';
part 'types/typedef.dart';
part 'types/extensions.dart';

part 'data/data.model.dart';
part 'data/downloadable.dart';
part 'data/newsletter.model.dart';
part 'data/podcast.model.dart';
part 'data/video.model.dart';

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
