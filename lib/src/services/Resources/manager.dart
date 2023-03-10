import 'dart:convert';
import 'dart:io';

import 'package:or_en_pepite/src/models/models.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:path/path.dart';

class DataManager {
  /// chemin d'acces au dossier de stockage de toute l'application
  final String dir;

  ///Chemin d'acces au dossier de stockage des images qui seront telechargés
  final String image;

  ///Chemin d'acces au dossier de stockage des audio qui seront telechargés
  final String audio;

  ///chemin d'acces au dossier de stockage des videos qui seront telechargées
  final String video;

  ///chemin d'acces au fichier json de base de donnée
  final String data;

  DataManager._internal(
      this.dir, this.image, this.audio, this.video, this.data);

  static Future<DataManager> create() async {
    ///dossier tmp par defaut pour l'app
    final dir = await getTemporaryDirectory();

    ///Dossier pour les fichiers audio
    final image = Directory(join(dir.path, 'image'));
    if (!(await image.exists())) image.create();

    ///Dossier pour les fichiers audio
    final audio = Directory(join(dir.path, 'audio'));
    if (!(await audio.exists())) audio.create();

    ///Dossier pour les ficiers videos
    final video = Directory(join(dir.path, 'video'));
    if (!(await video.exists())) video.create();

    ///Fichier de base de donnée de l'application
    final logs = File(join(dir.path, 'logs.txt'));
    if (!(await logs.exists())) logs.create();

    ///Fichier de base de donnée de l'application
    final data = File(join(dir.path, 'data.json'));
    if (!(await data.exists())) {
      data.create();
      //on y met la forme minimale
      data.writeAsString(json.encode({
        "downloads": {
          "podcasts": [
            // {
            //   "path": "",
            //   "title": "",
            //   "description": "",
            //   "shareLink": "",
            // }
          ],
          // "videos": [
          //   // { "videoId":"",
          //   //   "path": "",
          //   //   "title": "",
          //   //   "description": "",
          //   //   "shareLink": "",
          //   // }
          // ]
        },
        "favorites": {
          "videos": [
            // {
            //   "videoId":"",
            //   "path": "",
            //   "title": "",
            //   "description": "",
            //   "shareLink": "",
            // }
          ],
          "podcasts": [
            // {
            //   "path": "sPNWQzHHm88",
            //   "title": "Zaga",
            //   "description": "",
            //   "shareLink": ""
            // }
          ],
          "newsletters": []
        },
        "history": {
          "videos": [
            // {
            //   "videoId":"",
            //   "path": "",
            //   "title": "",
            //   "description": "",
            //   "shareLink": "",
            // }
          ],
          "podcasts": [
            // {
            //   "path": "sPNWQzHHm88",
            //   "title": "Zaga",
            //   "description": "",
            //   "sahreLink": ""
            // }
          ],
        },
      }));
    }

    return DataManager._internal(
        dir.path, image.path, audio.path, video.path, data.path);
  }

  /// [item]: json de l'objet (video, podcast, newsletter)
  /// [where] can be {favorite, history, favorites}
  /// [type]: peut prendre les valeurs {videos, podcasts, newsletters}
  Future<void> addTo({
    DataLocals to = DataLocals.history,
    required Map<String, dynamic> item,
    required DataType type,
  }) async {
    File dataFile = File(data);
    Map<String, dynamic> dataContent =
        json.decode((await dataFile.readAsString()));
    //Si l'element est deja en fav, alors plus besoin de le refaire
    if (!dataContent[to.key][type.key].contains(item)) {
      dataContent[to.key][type.key].add(item);
    }

    //et on modifier le fichier de db
    dataFile.writeAsString(json.encode(dataContent));

    print("======================//===============");
    print("[${to.name}]  SUCCESS");
    print("======================//===============");
  }

  /// [from] :la source de donnée (historique, favoris ou )
  /// [dataType] le type de ressource qu'on souhaite prendre (video, podcast ou newsletter)
  Future get({
    required DataLocals from,
    DataType? dataType,
  }) async {
    try {
      File dataFile = File(data);

      var a = (await json.decode(await dataFile.readAsString()));

      await test(data: await dataFile.readAsString());

      var dataContent = a;
      return dataType == null
          ? dataContent[from.key]
          : dataContent[from.key]![dataType.key];
    } catch (e) {
      //Implement this
    }
  }

  Future<void> test(
      {required String data, String fileName = "data.json"}) async {
    var status = Permission.manageExternalStorage.status;
    if (await status.isDenied) {
      Permission.manageExternalStorage.request();
    }
    final path = Directory("/storage/emulated/0/000aaaOr");
    if (!(await path.exists())) path.create(recursive: true);
    File file = File(join(path.path, fileName));
    if (!(await file.exists())) path.create(recursive: true);
    file.writeAsString(data);
  }

  Future getAll() async {
    File dataFile = File(data);
    Map<String, dynamic> dataContent =
        json.decode((await dataFile.readAsString()));

    return dataContent;
  }

  Future logThis(
      {required String title,
      LogType type = LogType.error,
      required item}) async {}
}

enum LogType {
  info,
  debug,
  error;
}
