part of '../models.dart';
enum ResourceLocation{
  local, remote;
  String get path => 'assets/data/$name.json';
}
enum ResourceType{
  podcast, video;
}