part of models;

class NewsletterModel extends DataModel {
  final List<String> images;
  final List<String> paragraphs;

  NewsletterModel._internal({
    required super.id,
    required super.title,
    required this.images,
    required this.paragraphs,
  });

  factory NewsletterModel.fromJson({required Map<String, dynamic> json}) =>
      NewsletterModel._internal(
          id: json['id'],
          title: json['title'],
          images: json['images'],
          paragraphs: json['paragraphs']);

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addEntries(
      [
        MapEntry('images', images),
        MapEntry('paragraphs', paragraphs),
      ],
    );

  @override
  DataType get dataType => DataType.newsletter;
  
  @override
  PageRouteInfo get pageRoute => NewsLetterDetailsRoute(newsletter:this);
}
