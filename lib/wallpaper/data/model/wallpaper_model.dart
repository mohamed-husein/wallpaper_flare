import 'package:equatable/equatable.dart';

class WallpaperModel extends Equatable {
  final int id;
  final dynamic image;
  final String tags;
  final String user;
  final int imageWidth;
  final int imageHeight;
  final int downloads;

  const WallpaperModel({
    required this.image,
    required this.id,
    required this.tags,
    required this.user,
    required this.imageWidth,
    required this.imageHeight,
    required this.downloads,
  });

  @override
  List<Object?> get props =>
      [image, tags, user, imageHeight, imageWidth, downloads];

  factory WallpaperModel.fromJson(Map<String, dynamic> json) {
    return WallpaperModel(
      image: json['largeImageURL'],
      id: json['id'],
      tags: json['tags'],
      user: json['user'],
      imageWidth: json['previewWidth'],
      imageHeight: json['previewHeight'],
      downloads: json['downloads'],
    );
  }
}
