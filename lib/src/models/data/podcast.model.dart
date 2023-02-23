part of '../models.dart';

class PodcastModel {
  /// The url of the podcast ressource
  final String url;

  /// The title of the podcast ressource
  final String title;

  /// The description binded with the podcast ressource
  final String description;

  PodcastModel({
    required this.url,
    required this.title,
    required this.description,
  });

  factory PodcastModel.fromJson(Map<String, String> json) => PodcastModel(
        url: json['url']!,
        title: json['title']!,
        description: json['description']!,
      );

  Widget get view => StatefulBuilder(
      builder: (context, setState) => ListTile(
            title: Text(title),
            leading: Icon(
              Icons.play_circle_outline,
              color: AppColors.light().gold,
            ),
          ));
}
